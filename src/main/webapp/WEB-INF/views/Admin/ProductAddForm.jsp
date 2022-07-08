<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
//파일 기본경로
String defaultPath = request.getSession().getServletContext().getRealPath("/");
//파일 기본경로, 상세경로
String filePath = defaultPath + "ckEimg" + File.separator;
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="${path }/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
   <style>
        /* 초기화 */
        #container{clear: both; width: 100%;}
        .container_wrap{clear: both; width: 100%;}
        .main_wrap{
            clear: both;
            width: 1400px;
            margin: 0 auto;
            margin-top: 2%;
        }
        /* /초기화 */
        /* 왼쪽 메뉴 */
        #left_gnb{
            float: left;
            width: 13%;
            /* min-width: 180px; */
        }
        #left_gnb>ul>.gnb_menu>a{
            display: block;
            font-size: 16px;
            padding: 15px 10px 15px 16px;
            background-color: #222;
            color: #e2e2e2;
        }
        #left_gnb>ul>.gnb_menu>a:first-child{
            border-top: 1px solid #515151;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu>a{
            display: block;
            border-bottom: 1px solid #515151;
            border-left: 1px solid #515151;
            border-right: 1px solid #515151;
            font-size: 14px;
            padding: 15px 10px 15px 16px;
            background-color: #ffffff;
            color: #222;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu:hover a{
            background-color: #dbdbdb;
            color: #222;
        }
        /* /왼쪽 메뉴 */
        /* 제품등록 폼 */
        .content{
            float: left;
            margin-left: 2%;
        }
        .content_wrap{
            width: 100%;
        }
        .proTable{
            display: table;
            border-collapse: collapse;
            text-align: left;
            width: 100%;
        }

        .proTable tr{
            display: table-row;
            border-top: 1px solid #dddddd;
        }

        .proTable tr th{
            display: table-cell;
            padding: 15px 25px 15px 25px;
            background-color: #f1f1f1;
            border-bottom: 1px solid #dddddd;
            border-left: 1px solid #dddddd;
            font-size: 0.8em;
        }

        .proTable tr td{
            display: table-cell;
            padding-left: 20%;
            border-bottom: 1px solid #dddddd;
            border-right: 1px solid #dddddd;
            padding: 0 25px 0 25px;
        }

        .proTable tr td input {
            padding: 5px 0 5px 0;
            width: 80%;
            border: 1px solid #bebebe;
        }
        .proTable tr td select{
            padding: 5px 0 5px 0;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(1) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(5) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(6) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(7) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(8) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr:nth-child(9) td input {
            padding: 5px 0 5px 0;
            width: 30%;
            border: 1px solid #bebebe;
        }
        .proTable tr td input:focus{
            outline: none;
        }
        .proTable tr td textarea{
            border: 1px solid #bebebe;
            margin-top: 4px;
            resize: none;
        }
        .proTable tr td textarea:focus{
            outline: none;
        }
        .proTable tr td input[type=file]{
            /* display: none; */
            border: 0;
        }
        .btn_clear{
            text-align: center;
            font-size: 0.8em;
            padding: 4px 8px 4px 8px;
            margin-right: 10px;
        }
        
        .btn_wrap{
        margin-top: 2%;
        }
		.btn_wrap .btn{
		width: 110px;
		height: 30px;
		}
        .upload_btn{
        width: 80px;
        height: 30px;
        }

        /* /제품등록 폼 */
        
        
        .msgbox_wrap{
        position: relative;
        }
        .msgbox{
	    position: absolute;
	    left: 320px;
	    top: 15px;
        }
        
        .msgbox_wrap2{
        position: relative;
        }
        .msgbox2{
	    position: absolute;
	    left: 460px;
	    top: -34px;
        }

    </style>
</head>
<body>
   <div id="wrap">
        <header id="hd">
            <div class="hd_wrap">
           	
             	<jsp:include page="../hd.jsp"/>
            </div>
        </header>


        <div id="container">
            <div id="container_wrap">
	       <section class="main_wrap">
					<jsp:include page="./LeftMenu.jsp"/>
                    <!-- 주문관리 - 주문관리 -->
                   <!-- 제품등록 폼 -->
                    <div class="content">
                             <iframe name="hiddenf" style="display: none;"></iframe>
                        <div class="content_wrap">
                             	<div class="msgbox_wrap">
	 								<div class="msgbox">
	                                <label id="idok" style="font-size: 14px; color: blue; display: none;">사용 가능</label>
	                                <label id="idno" style="font-size: 14px; color: red; display: none;">사용 불가능</label>
	                                </div>
                                </div>
                            <form action="ProductAdd" method="post" name="addForm" id="addForm" onsubmit="return paddCheck()">
                                <table class="proTable">
                                    <tbody>
                                        <tr>
                                            <th>품목코드</th>
                                            <td>
                                                <input type="text" name="pcode" id="pcode" value="${AutoPcode }" required onchange="pcodeCheck();">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>노출여부</th>
                                            <td>
                                                <select name="state" id="state"  required>
                                                    <option value="1" selected>노출</option>
                                                    <option value="3">노출안함</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>카테고리</th>
                                            <td>
                                                <select name="code" id="code" onchange="cateChange();" required>

                                                </select>
                                                <select name="code2" id="code2"  required>

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>제품명</th>
                                            <td>
                                                <input type="text" name="pname" id="pname" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>서브제목</th>
                                            <td>
                                                <input type="text" name="psubname" id="subname" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>단가</th>
                                            <td>
                                                <input type="text" name="price" id="price" pattern="^[0-9]+$" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>재고</th>
                                            <td>
                                                <input type="text" name="invt" id="invt" pattern="^[0-9]+$" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>판매단위</th>
                                            <td>
                                                <input type="text" name="unit" id="unit" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>원산지</th>
                                            <td>
                                                <input type="text" name="origin" id="origin" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>용량/중량</th>
                                            <td>
                                                <input type="text" name="weight" id="weight" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>안내사항</th>
                                            <td>
                                                <input type="text" name="guidelines" id="guidelines" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>상품설명</th>
                                            <td>
                                                <textarea name="pdetail" id="editor" cols="100" rows="10" required></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>목록이미지</th>
                                            <td>
                                                <input type="file" name="uploadfile" id="uploadfile" class="uploadfile">
                                                <input type="hidden" name="s_img_desc" id="s_img"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>상세이미지</th>
                                            <td>
                                                <input type="file" name="uploadfile" id="uploadfile" class="uploadfile">
                                                <input type="hidden" name="ds_img_desc" id="ds_img"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>제품상설명</th>
                                            <td>
                                                <!-- <label for="img_dm" class="btn_clear">파일찾기</label> -->
                                                <!-- <input class="img_dm_name" placeholder="선택된 파일 없음"> -->
                                                <input type="file" name="uploadfile" id="uploadfile" class="uploadfile">
                                                <input type="hidden" name="dm_img_desc" id="dm_img"/>
                                                <button type="button" class="btn_white upload_btn" onclick="img_upload();">업로드</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
								<div class="msgbox_wrap2">
	 								<div class="msgbox2">
	                                <label id="uploadOK" style="font-size: 14px; color: red; display: block;">업로드 해주세요!</label>
	                                </div>
                                </div>
                                <div class="btn_wrap">
                                <input type="submit" class="btn_black btn" value="입력">
                                <input type="reset" class="btn_white btn" value="취소">
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /제품등록 폼 -->
                </section>

            </div>
        </div>

        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>



<script type="text/javascript">
$('.gnb_sub_menu').eq(5).find('a').css('font-weight','bold');



function paddCheck() {
	
	var upload_ok = $('#uploadOK').css('color');
	
	if (upload_ok == 'rgb(255, 0, 0)'){
		alert('사진을 업로드해주세요!');
		return false;
	}
}


function pcodeCheck() {
    var pcode_val = $('#pcode').val();
    if(pcode_val==""){
        alert("품목코드를 입력해주세요.");
        return false;
    } else {
    	window.open('${path}/Admin/PCODECK?pcode='+pcode_val,'hiddenf');
    }
}


function img_upload() {

	
	
	var code_path = $('#pcode').val();
	
	if(code_path == ''){
		alert('품목코드를 먼저 입력해주세요!')
		return;
	}
	
	for(var i=0;i<3;i++){
	if ($('.uploadfile').eq(i).val() == ''){
		alert((i+1)+'번째 파일을 선택해주세요!');
		return;
	}
	}
	//값 넣어주기
	var s_img = $('.uploadfile').eq(0).val().split('fakepath\\',2);
	var ds_img = $('.uploadfile').eq(1).val().split('fakepath\\',2);
	var dm_img = $('.uploadfile').eq(2).val().split('fakepath\\',2);
	
	$('#s_img').val(s_img[1]);
	$('#ds_img').val(ds_img[1]);
	$('#dm_img').val(dm_img[1]);

	
	var inputFile = $("input[name='uploadfile']");
	
	var formData = new FormData();
	
	var files = inputFile[0].files;
	var files2 = inputFile[1].files;
	var files3 = inputFile[2].files;
	
	for(var i=0;i<files.length;i++){
		formData.append("uploadfile",files[i]);	
	}
	for(var i=0;i<files2.length;i++){
		formData.append("uploadfile",files2[i]);	
	}
	for(var i=0;i<files3.length;i++){
		formData.append("uploadfile",files3[i]);	
	}
	   $.ajax({
           url : '${path}/Admin/ajaxUpload?code_path='+code_path,
           processData : false,
           contentType : false,
           data : formData,
           type : 'POST',
           success : function(result) {
        	   alert("업로드 성공!");
			   $('#uploadOK').text('업로드 성공!');
			   $('#uploadOK').css('color','blue');
		}
           

       });//end ajax
}


window.onload = function(){
    ck = CKEDITOR.replace('editor',{filebrowserUploadUrl:'${path}/Admin/imageUpload'});
    pcodeCheck();
 };


var A_code_list = [];
var A_name_list = [];
var B_code_list = [];
var B_name_list = [];
var C_code_list = [];
var C_name_list = [];
var D_code_list = [];
var D_name_list = [];
var E_code_list = [];
var E_name_list = [];
$.ajax({				
	url : "${path }/Category/list_json", // MemberJSONCtrl의 JSONObject 값을 가져옴
	dataType : "json", // 데이터 타입을 json
	contentType: 'application/x-www-form-urlencoded; charset=euc-kr', // UTF-8처리
	cache : false, // true : 새로 고침 동작을 하지 않고, 저장된 캐시에서 불러오게됨, false:새로 불러옴 
	success : function(data) {
				
				var key = Object.keys(data["CateList"][0]); // 키값(항목명)을 가져옴		
				//$(".main").empty();
				$.each(data.CateList, function(index, CateList) { // 이치를 써서 모든 데이터들을 배열에 넣음												
					var items = [];		
					
					if ((CateList.code).substr(1,2) == '00'){
						$('#code').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
					}
					if((CateList.code).substr(0,2) == 'A1'){
						$('#code2').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
						A_code_list.push(CateList.code);
						A_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'B1'){
						B_code_list.push(CateList.code);
						B_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'C1'){
						C_code_list.push(CateList.code);
						C_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'D1'){
						D_code_list.push(CateList.code);
						D_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'E1'){
						E_code_list.push(CateList.code);
						E_name_list.push(CateList.name);
					}

					/*
					if(CateList.code == 'A00'){
					
 					}else if(CateList.code == 'B00'){
					$('.main_label').eq(1).text(CateList.name);
					}else if(CateList.code == 'C00'){
					$('.main_label').eq(2).text(CateList.name);
					}else if(CateList.code == 'D00'){
					$('.main_label').eq(3).text(CateList.name);
					}else if(CateList.code == 'E00'){
					$('.main_label').eq(4).text(CateList.name);
					}else if(CateList.code == 'F00'){
					$('.main_label').eq(5).text(CateList.name);
					}
				
					if((CateList.code).substr(0,2) == 'A1'){
					$('.menuA').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'B1'){
					$('.menuB').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'C1'){
					$('.menuC').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'D1'){
					$('.menuD').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'E1'){
					$('.menuE').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					} */
					//alert(CateList.name);
				});//each끝		
				
			}			
	});	//end ajax


function cateChange() {
	var c_val = $('#code').val();
	if(c_val == 'A00'){
		$('#code2').empty();
		for(i=0;i<A_code_list.length;i++){
		$('#code2').append("<option value='"+A_code_list[i]+"'>"+A_name_list[i]+"</option>");
		}
	}else if(c_val == 'B00'){
		$('#code2').empty();
		for(i=0;i<B_code_list.length;i++){
		$('#code2').append("<option value='"+B_code_list[i]+"'>"+B_name_list[i]+"</option>");
		}
	}else if(c_val == 'C00'){
		$('#code2').empty();
		for(i=0;i<C_code_list.length;i++){
		$('#code2').append("<option value='"+C_code_list[i]+"'>"+C_name_list[i]+"</option>");
		}
	}else if(c_val == 'D00'){
		$('#code2').empty();
		for(i=0;i<D_code_list.length;i++){
		$('#code2').append("<option value='"+D_code_list[i]+"'>"+D_name_list[i]+"</option>");
		}
	}else if(c_val == 'E00'){
		$('#code2').empty();
		for(i=0;i<E_code_list.length;i++){
		$('#code2').append("<option value='"+E_code_list[i]+"'>"+E_name_list[i]+"</option>");
		}
	}
	
}




</script>
 </body>
</html>