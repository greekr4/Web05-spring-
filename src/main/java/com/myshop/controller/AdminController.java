package com.myshop.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.plexus.util.FileUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myshop.dto.CategoryDTO;
import com.myshop.dto.CustomerDTO;
import com.myshop.dto.OrderDTO;
import com.myshop.dto.OrderLineDTO;
import com.myshop.dto.ProductDTO;
import com.myshop.service.CategoryService;
import com.myshop.service.CustomerService;
import com.myshop.service.OrderService;
import com.myshop.service.ProductService;
import com.myshop.util.MailService;
import com.myshop.util.ScriptUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@Inject
	private CustomerService CustomerService;
	
	@Inject
	private CategoryService CategoryService;
	
	@Inject
	private ProductService ProductService;
	
	@Inject
	private OrderService OrderService;  
	
	@Inject
	private MailService mailservice;
	
	@Inject
	private HttpSession session;
	
	
	// JSP 연결
	
	//오더리스트
	@RequestMapping("OrderList")
	public String OrderList(Model model,@RequestParam int type) throws Exception{
		List<OrderDTO> List = null;
		List<OrderDTO> all = OrderService.OrderList();
		List<OrderDTO> pok = OrderService.OrderList_PayOk();
		List<OrderDTO> ok = OrderService.OrderList_Ok();
		int OrderCnt = all.size();
		int PayOkCnt = pok.size();
		int OkCnt = ok.size();
		switch (type) {
		case 1:
			//일반
			List = all;
			break;
			
		case 2:
			//입금확인
			List = pok;
			break;
			
		case 3:
			//처리완료
			List = ok;
			break;
		}
		
		model.addAttribute("OkCnt",OkCnt);
		model.addAttribute("OrderCnt",OrderCnt);
		model.addAttribute("PayOkCnt",PayOkCnt);
		model.addAttribute("List",List);
		return "/Admin/OrderList";
	}
	
	
	
	//오더라인 조회
	@ResponseBody
	@RequestMapping("OrderLine_json")
	public JSONObject OrderLine_json(Model model,@RequestParam int order_no) throws Exception{
		List<OrderLineDTO> List = OrderService.OrderLineList(order_no);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("OLList", List);
		JSONObject json = new JSONObject();
		json.putAll(map);
		return json; //리턴
	}
	
	//오더스텝 수정
	@RequestMapping("OrderStepEdit")
	public void OrderStepEdit(HttpServletResponse response, @RequestParam int seq, @RequestParam int order_step) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("order_step",order_step);
		OrderService.UpdateOrder(map);
		ScriptUtils.alertAndClose(response, "수정되었습니다.");
	}
	
	//오더리스트 검색
	@RequestMapping("OrderList_search")
	public String OrderList_search(Model model,OrderDTO DTO) throws Exception{
		List<OrderDTO> all = OrderService.OrderList();
		List<OrderDTO> pok = OrderService.OrderList_PayOk();
		List<OrderDTO> ok = OrderService.OrderList_Ok();
		int OrderCnt = all.size();
		int PayOkCnt = pok.size();
		int OkCnt = ok.size();
		
		List<OrderDTO> List = OrderService.OrderList_search(DTO);
		
		model.addAttribute("OkCnt",OkCnt);
		model.addAttribute("OrderCnt",OrderCnt);
		model.addAttribute("PayOkCnt",PayOkCnt);
		model.addAttribute("List",List);
		return "/Admin/OrderList";
	}
	
	//회원리스트
	@RequestMapping(value = "CusList", method = RequestMethod.GET)
	public String CusList(Locale locale,Model model) throws Exception{
		List<CustomerDTO> List = CustomerService.CustomerList();

		model.addAttribute("List",List);
		return "/Admin/CusList";
	}
	
	//휴먼회원리스트 
	//지금은 c:if로 나눴는데 추후에 DB에서 나눠야함
	@RequestMapping(value = "CusDorList", method = RequestMethod.GET)
	public String CusDorList(Locale locale,Model model) throws Exception{
		List<CustomerDTO> List = CustomerService.CustomerList();

		model.addAttribute("List",List);
		return "/Admin/CusDorList";
	}
	
	//회원리스트_검색
	@RequestMapping("CusList_Search")
	public String CusList_Search(Locale locale,Model model,@RequestParam int search_type,@RequestParam String search_val) throws Exception{
		List<CustomerDTO> List = new ArrayList<CustomerDTO>();
		
		switch (search_type) {
		case 1:
			String name = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_name(name);
			break;
		case 2:
			String email = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_email(email);
			break;
		case 3:
			String phonenum = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_phonenum(phonenum);
			break;
		}
		 
		
		model.addAttribute("List",List);
		return "/Admin/CusList";
	}
	
	//카테고리관리
	@RequestMapping(value = "Category", method = RequestMethod.GET)
	public String Category(Locale locale,Model model) throws Exception{
		List<CategoryDTO> List = CategoryService.CategoryList();
		model.addAttribute("List",List);
		return "/Admin/Category";
	}
	
	
	//제품관리
	@RequestMapping(value = "ProductList", method = RequestMethod.GET)
	public String ProductList(Locale locale,Model model) throws Exception{
		List<ProductDTO> List = ProductService.ProductList();
		model.addAttribute("List",List);
		return "/Admin/ProductList";
	}
	
	//제품등록폼
	@RequestMapping("ProductAddForm")
	public String ProductAddForm(Locale locale,Model model) throws Exception{
		String AutoPcode = null;
		int algo1 = ProductService.ProductPcodeOrder();
			if(algo1 < 9) {
			//p0001~p0009
			algo1++;
			AutoPcode = "p000" + algo1;
			}else if(algo1 < 99) {
			//p0010~p0099
			algo1++;
			AutoPcode = "p00" + algo1;
			}else if(algo1 < 999) {
			//p0100~p0999
			algo1++;
			AutoPcode = "p0" + algo1;
			}else if(algo1 < 9999) {
			//p1000~p9999
			algo1++;
			AutoPcode = "p" + algo1;
			}else {
				System.out.println("더이상 등록 할 수 없음");
			}
		
		
		model.addAttribute("AutoPcode",AutoPcode);
		return "/Admin/ProductAddForm";
	}
	
	//제품수정
	@RequestMapping("ProductEditForm")
	public String ProductEditForm(Model model,@RequestParam int seq) throws Exception{
		ProductDTO DTO = ProductService.ProductMore(seq);
		model.addAttribute("DTO",DTO);
		return "/Admin/ProductEditForm";
	}
	
	//제품등록
	@RequestMapping("ProductAdd")
	public void ProductAdd(ProductDTO DTO,HttpServletResponse response,@RequestParam String code2) throws Exception{
		DTO.setCcode(code2);
		ProductService.ProductAdd(DTO);
		ProductService.ProductAdd_add(DTO);
		ProductService.ProductAdd_cate(DTO);
		ScriptUtils.alertAndMovePage(response, "등록완료", "./ProductList");
	}
	
	//제품수정
	@RequestMapping("ProductEdit")
	public void ProductEdit(ProductDTO DTO,HttpServletResponse response,@RequestParam String code2) throws Exception{
		DTO.setCcode(code2);
		ProductService.ProductEdit(DTO);
		ProductService.ProductEdit_add(DTO);
		ProductService.ProductEdit_cate(DTO);
		ScriptUtils.alertAndMovePage(response, "수정완료", "./ProductList");
	}
	
	//제품삭제
	@RequestMapping("ProductDel")
	public void ProductEdit(HttpServletResponse response,@RequestParam String pcode) throws Exception{
		ProductService.ProductDel(pcode);
		ProductService.ProductDel_add(pcode);
		ProductService.ProductDel_cate(pcode);
		ProductService.ProductDel_basket(pcode);
		ProductService.ProductDel_order(pcode);
		ScriptUtils.alertAndClose(response, "삭제완료");
	}
	
	//PCODE체크
	@RequestMapping(value = "PCODECK", method = RequestMethod.GET)
	public void PCODECK(@RequestParam String pcode, HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		if(ProductService.ProductCodeCK(pcode) == null) {
			out.println("<script>"
					+ "opener.document.getElementById('idno').style.display = 'none';"
					+ "opener.document.getElementById('idok').style.display = 'block';"
					+ "</script>");	
		}else {
			out.println("<script>"
					+ "opener.document.getElementById('idok').style.display = 'none';"
					+ "opener.document.getElementById('idno').style.display = 'block';"
					+ "</script>");	
		}
		
		
	}
	
	
	//공지사항
	@RequestMapping(value = "NoticeList", method = RequestMethod.GET)
	public String NoticeList(Locale locale,Model model) throws Exception{
		return "/Admin/NoticeList";
	}
	
	//FAQList
	@RequestMapping(value = "FAQList", method = RequestMethod.GET)
	public String FAQList(Locale locale,Model model) throws Exception{
		return "/Admin/FAQList";
	}
	
	//QNAList
	@RequestMapping(value = "QNAList", method = RequestMethod.GET)
	public String QNAList(Locale locale,Model model) throws Exception{
		return "/Admin/QNAList";
	}
	
	//후기관리
	@RequestMapping(value = "ReviewList", method = RequestMethod.GET)
	public String ReviewList(Locale locale,Model model) throws Exception{
		return "/Admin/ReviewList";
	}
	
	 @RequestMapping(value="imageUpload", method = RequestMethod.POST)
	 public void imageUpload(HttpServletRequest request,HttpServletResponse response,
			 MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		 
			// 랜덤 문자 생성
	    	UUID uid = UUID.randomUUID();
	    	OutputStream out = null;
	    	PrintWriter printWriter = null;
	    	//인코딩
	    	response.setCharacterEncoding("utf-8");
	    	response.setContentType("text/html;charset=utf-8");
	    	try{
	    		//파일 이름 가져오기
	    		String fileName = upload.getOriginalFilename();
	    		byte[] bytes = upload.getBytes();
	    		
	    		//이미지 경로 생성
	    		String path = "D:\\Taek\\springpj\\web05\\src\\main\\webapp\\resources\\upload\\";	// 이미지 경로 설정(폴더 자동 생성)
	    		
	    		String ckUploadPath = path + uid + "_" + fileName;
	    		File folder = new File(path);
	    		System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
	    		//해당 디렉토리 확인
	    		if(!folder.exists()){
	    			try{
	    				folder.mkdirs(); // 폴더 생성
	    		}catch(Exception e){
	    			e.getStackTrace();
	    		}
	    	}
	    	
	    	out = new FileOutputStream(new File(ckUploadPath));
	    	out.write(bytes);
	    	out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
	    	
	    	String callback = request.getParameter("CKEditorFuncNum");
	    	printWriter = response.getWriter();
	    	String fileUrl = "/myapp/Admin/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면
	    	
	    	// 업로드시 메시지 출력
	    	printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
	    	printWriter.flush();
	    	
	    	}catch(IOException e){
	    		e.printStackTrace();
	    	} finally {
	    		try {
	    		if(out != null) { out.close(); }
	    		if(printWriter != null) { printWriter.close(); }
	    	} catch(IOException e) { e.printStackTrace(); }
	    	}
	    	return;
		 
	 }
	
	 // 서버로 전송된 이미지 뿌려주기
	    @RequestMapping(value="ckImgSubmit")
	    public void ckSubmit(@RequestParam(value="uid") String uid
	    		, @RequestParam(value="fileName") String fileName
	    		, HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException{

	        String rootPath = System.getProperty("user.dir");;
	        System.out.println("현재 프로젝트의 경로 : "+rootPath );
	    	
	    	
	    	String path = "D:\\Taek\\springpj\\web05\\src\\main\\webapp\\resources\\upload\\";	// 저장된 이미지 경로
	    	System.out.println("path:"+path);
	    	String sDirPath = path + uid + "_" + fileName;
	    	
	    	File imgFile = new File(sDirPath);
	    	
	    	//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
	    	if(imgFile.isFile()){
	    		byte[] buf = new byte[1024];
	    		int readByte = 0;
	    		int length = 0;
	    		byte[] imgBuf = null;
	    		
	    		FileInputStream fileInputStream = null;
	    		ByteArrayOutputStream outputStream = null;
	    		ServletOutputStream out = null;
	    		
	    		try{
	    			fileInputStream = new FileInputStream(imgFile);
	    			outputStream = new ByteArrayOutputStream();
	    			out = response.getOutputStream();
	    			
	    			while((readByte = fileInputStream.read(buf)) != -1){
	    				outputStream.write(buf, 0, readByte); 
	    			}
	    			
	    			imgBuf = outputStream.toByteArray();
	    			length = imgBuf.length;
	    			out.write(imgBuf, 0, length);
	    			out.flush();
	    			
	    		}catch(IOException e){
	    			e.printStackTrace();
	    		}finally {
	    			outputStream.close();
	    			fileInputStream.close();
	    			out.close();
	    			}
	    		}
	    }
	    
	    @PostMapping("/ajaxUpload")
	    public void ajaxUpload(MultipartFile[] uploadfile,@RequestParam String code_path,HttpServletResponse response) {
	    	String uploadFolder = "D:\\Taek\\springpj\\web05\\src\\main\\webapp\\resources\\upload\\"+code_path;
	    	
	    	
	    	File folder = new File(uploadFolder);

    		if(!folder.exists()){
    			try{
    				folder.mkdirs();	//생성
    		}catch(Exception e){
    			e.getStackTrace();
    		}
    		}
	    	for(MultipartFile multipartFile : uploadfile) {
	    		File savefile = new File(uploadFolder, multipartFile.getOriginalFilename());
	    		try {
	    			multipartFile.transferTo(savefile);
	    			ScriptUtils.alert(response, "업로드 성공!");
	    		} catch (Exception e) {
					System.out.println("파일 업로드 에러");
				}
	    	}
	    }
	
	    
	    @PostMapping("/ajaxDel")
	    public void ajaxDel(MultipartFile[] uploadfile,@RequestParam String code_path,HttpServletResponse response) {
	    	String uploadFolder = "D:\\Taek\\springpj\\web05\\src\\main\\webapp\\resources\\upload\\"+code_path;
	    	
	    	
	    	//업로드할 시 폴더 삭제 후 재생성
	    	File folder = new File(uploadFolder);
	    	
    		if(folder.exists()){
    			try{
    				System.out.println("폴더가 있습니다. path : " + folder);
    				FileUtils.deleteDirectory(folder);
    				System.out.println("삭제성공");
    			}catch(Exception e){
    			e.getStackTrace();
    			}
    		}
	    	
	    }

	    
	    //메일보내기
	    @RequestMapping("/noticeMail")
		public ModelAndView sendEmail(String id, String email) throws Exception {
			ModelAndView mv = new ModelAndView();
			
			String addr = "greekr419116112@gmail.com";
			String subject = "제목";
			String body = "내용";
			
			mailservice.sendEmail(email, addr, subject, body);
			mv.setViewName("/");
			return mv;
		}
	    

	
	    
	    
	    
	    /////////////////////////////////////
	    
	    
		@RequestMapping(value = "test", method = RequestMethod.GET)
		public String test(Locale locale,Model model) throws Exception{
			List<CustomerDTO> List = CustomerService.CustomerList();
			int cnt = List.size();
			model.addAttribute("cnt",cnt);
			model.addAttribute("sampleList",List);
			
			return "/test";
		}
}
