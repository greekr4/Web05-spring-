<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
			  <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
            color: black;
        }

        ul {
            list-style: none;
        }

        #container {
            width: 100%;
            clear: both;
        }

        .container_wrap {
            clear: both;
        }

        .visual {
            width: 100%;
            display: block;
            height: 430px;
	        background:url(${path}/resources/img/product/menu_subtop.png);
	        background-repeat: no-repeat;
	        background-size: cover;

        }

        .content_warp {
            width: 1400px;
            margin: 0 auto;
        }

        .tit_box {
            padding-top: 150px;
            font-weight: 300;
            color: #222;
            text-align: center;
            margin: 0 auto;
            font-size: 20px;
        }

        .tit_box>h3 {
            font-weight: 500;
            padding-bottom: 25px;
            font-size: 60px;
        }

        .page_tit {
            margin-top: 50px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 25px;
            font-weight: bolder;
        }

        .sub_tit {
            margin-right: 30px;
            font-size: 15px;
            letter-spacing: -2px;
            margin-bottom: 50px;
        }

        .sub_tit ul {
            list-style: none;
            text-align: center;
        }

        .sub_tit li {
            margin-left: 25px;
            display: inline-block;
            text-transform: uppercase;
        }

        .sub_tit li:after {
            display: block;
            content: '';
            border-bottom: solid 2px #000;
            transform: scaleX(0);
            transition: transform 250ms ease-in-out;
        }

        .sub_tit li:hover:after {
            transform: scaleX(1);
        }
        img {
            display: block;
        }

        .page {
            clear: both;
            min-height: 100vh;
            display: none;
            width: 100%;
        }

        ul {
            list-style: none;
        }

        .page:target {
            display: block;
        }

        .grid_wrap {
            width: 1440px;
            margin: 0 auto;
        }

        .grid_box {
            display: grid;
            grid-template-columns: 50% 50%;
        }

        .img_box {
            width: 100%;
            overflow: hidden;
        }

        .grid_box .txt_box {
            display: inline-block;
            width: 100%;
            vertical-align: top;
            font-size: 20px;
            font-weight: 300;
            line-height: 1.5em;
        }

        .color_blue {
            color: blue;
        }

        .list {
            width: 1600px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;


        }

        .list>div {
            display: inline-block;
            width: 46%;
            margin: 0 2% 0.5rem;
            vertical-align: top;
        }

        .list>div figure img {
            display: block;
            width: 100%;
        }

        .list>div .txt_box {
            margin-top: 0.35rem;
            text-align: center;
        }

        .list>div .txt_box .tit {
            color: #000;
            font-size: 30px;
            font-weight: 400;
            margin-top: 30px;
        }

        .list>div .txt_box .txt {
            margin-top: 0.2rem;
            color: #363636;
        }

        .html#page2 .ct_wrap>h3 {
            text-align: center;
            font-size: 60px;
            font-weight: 250;
            padding-top: 25px;
        }

        .list1 {
            width: 1600px;
            margin: 0 auto;

        }

        .hgroup {
            text-align: center;
            font-size: 30px;
            font-weight: 300;
        }

        .hgroup h3 {
            margin: 20px auto;
        }

        em {
            margin-left: 760px;
            display: flex;
            width: 35px;
            text-align: center;
            background-color: blue;
            color: #fff;
            font-family: none;
        }

        .list_wrap {
            margin-top: 100px;
        }

        .ct_wrap {
            margin-top: 100px;
            margin-bottom: 100px;
        }

        .color_tit {
            color: #777;
        }

        .heal_wrap {
            clear: both;
            background-color: #1c2638;
            margin: 50px 0;
            min-height: 1000px;
        }

        .heal_tit_box {
            width: 1400px;
            margin: 0 auto;
            font-size: 48px;
            padding-top: 20px;
            color: #fff;
        }

        .heal_menu_box {
            width: 1400px;
            margin: 0 auto;
        }

        .heal_menu_btn,
        .heal_menu_btn2 {
            color: #fff;
            float: left;
            margin: 0 1px;
            /*  background-color: #347eb5; */
            border: 1px solid #347eb5;
            padding: 20px;
            font-size: 24px;
            width: 430px;
            text-align: center;
            transition: 0.5s;
            cursor: pointer;
        }

        .heal_menu_btn:hover,
        .heal_menu_btn2:hover {
            background-color: #347eb5;
        }

        .heal_img_box,
        .heal_img_box2 {
            clear: both;
            width: 1400px;
            margin: 120px auto;
            transition: 0.5s;
        }

        .heal_img_box {
            display: none;
        }

        .heal_item1 {
            display: block;
        }


        .ct_wrap2 {
            clear: both;
            width: 100%;
            overflow: hidden;
        }



        .board {

            text-align: left;
            width: 1440px;
            margin: 100px auto;
        }

        .board .page_tit {
            margin-top: 50px;
            font-weight: 300;
            font-size: 1.5em;
            text-decoration: underline;
        }

        .board table {
            margin: 0 auto;
            width: 100%;
            border-spacing: 0;
        }

        .board .txt_box {
            margin-top: 50px;
            margin-bottom: 50px;
            font-size: 1.2em;
        }

        .table_top th {
            border-top: 2px solid #000;
            border-bottom: 1px solid #777;
            background-color: #ededed;
            line-height: 3em;
            font-size: 20px;
            text-align: center;
        }

        td {
            line-height: 3em;
            border-bottom: 1px solid #777;
        }

        td {
            text-align: center;

        }

        .td_subject {
            text-align: left;
        }

        tr:nth-child(2n) {
            background-color: #ededed;
        }

        tr:hover td:first-child {
            border-left: 2px solid #253dbe;
        }

        tr td:first-child {
            border-left: 2px solid #fff;
        }

        tr:hover a {
            text-decoration: underline;
        }







   /* 검색 */
        .search_box{
            clear: both;
            display: block;
            margin-bottom: 1%;
        }
        .search_box>form>select{
            padding: 8px 0 8px 0;
            text-align: center;
            width: 100px;
            border-color: #222;
            font-size: 14px;
        }
        .search_box>form>input{
            padding: 9px 0 8px 0;
            border: 1px solid #222;
            font-size: 14px;
        }
        .search_box>form>button{
            padding: 7px 0 8px 0;
            width: 70px;
            font-size: 14px;
        }
        /* /검색 */
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
  	        <section class="page1">
                    <div class="visual">
                        <div class="tit_box">
                            <h3>Bn2U</h3>
                            <c:choose>
                            <c:when test="${type eq 1 }">
                            <p>NOTICE BOARD</p>
                            </c:when>
                            <c:when test="${type eq 3 }">
                            <p>FAQ BOARD</p>
                            </c:when>
                            <c:when test="${type eq 5 }">
                            <p>QNA BOARD</p>
                            </c:when>
                            <c:otherwise>
                            <p>잘못된 접근</p>
                            </c:otherwise>                                                        
                            </c:choose>
                            
                        </div>
                    </div>
                    <div class="board">
                <div class="table_warp">
                            <!-- 검색 -->
                            <div class="search_box">
                                <form action="/myapp/board/news_search" method="POST">
                                    <select name="search_type">
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                    </select>
                                    <input type="hidden" id="type" name="type" value="2">
                                    <input type="text" id="search" name="search">
                                    <button type="submit" class="btn_clear">검색</button>
                                    <button type="button" style="float: right;" onclick="location.href='${path}/Board/AddForm'" class="btn_clear">글쓰기</button>
                                </form>
                            </div>
                            <!-- /검색 -->
                    <table>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                            <col style="width:10%;">
                            <col style="width:10%;">
                            <col style="width:10%;">
                        </colgroup>
                        <thead>
                            <tr class="table_top">
                                <th>번호</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>조회</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${List }" var="DTO">
                        <tr class="even">
                                <td class="td_num2">${DTO.seq }</td>
                                <td class="td_subject" style="padding-left:0px">
                                    <div class="bo_tit">
                                        <a href="${path }/Board/More?seq=${DTO.seq}">${DTO.title }

                                            (<span style="color: red;">1</span>)

                                        </a>
                                    </div>
                                </td>
                                <td class="td_name sv_use"><span class="sv_member">${DTO.email }</span></td>
                                <td class="td_num">${DTO.cnt }</td>
                                <td class="td_datetime"><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
                        </tr>
                        </c:forEach>
                            

                        </tbody>
                    </table>
                </div>
                </div>
                </section>
            </div>
        </div>
<script type="text/javascript">

//네이게이션바
$('.location_select').eq(0).click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});

$('.location_select').eq(1).click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});

var ccode = '${ccode}';
var ccode_f = ccode.substr(0,1);


var code00_code_list = [];
var code00_name_list = [];
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
					
					if(ccode == CateList.code){
					$("#code2_span").text(CateList.name);
					}
				
					if ((CateList.code).substr(1,2) == '00'){
						//$('#code').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
						code00_code_list.push(CateList.code);
						code00_name_list.push(CateList.name);
					}
					if((CateList.code).substr(0,2) == 'A1'){
						//$('#code2').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
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

	window.onload = function(){
	if (ccode_f == 'A') {
		$("#code").text(code00_name_list[0]);
		$("#code1_span").text(code00_name_list[0]);
		for(i=0;i<A_code_list.length;i++){
		$('#code2').append("<li class='"+A_code_list[i]+"'><a href='${path}/Product/Products?ccode="+A_code_list[i]+"'>"+A_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+A_code_list[i]+"'><span>"+A_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'B') {
		$("#code").text(code00_name_list[1]);
		$("#code1_span").text(code00_name_list[1]);
		for(i=0;i<B_code_list.length;i++){
		$('#code2').append("<li class='"+B_code_list[i]+"'><a href='${path}/Product/Products?ccode="+B_code_list[i]+"'>"+B_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+B_code_list[i]+"'><span>"+B_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'C') {
		$("#code").text(code00_name_list[2]);
		$("#code1_span").text(code00_name_list[2]);
		for(i=0;i<C_code_list.length;i++){
		$('#code2').append("<li class='"+C_code_list[i]+"'><a href='${path}/Product/Products?ccode="+C_code_list[i]+"'>"+C_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+C_code_list[i]+"'><span>"+C_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'D') {
		$("#code").text(code00_name_list[3]);
		$("#code1_span").text(code00_name_list[3]);
		for(i=0;i<D_code_list.length;i++){
		$('#code2').append("<li class='"+D_code_list[i]+"'><a href='${path}/Product/Products?ccode="+D_code_list[i]+"'>"+D_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+D_code_list[i]+"'><span>"+D_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'E') {
		$("#code").text(code00_name_list[4]);
		$("#code1_span").text(code00_name_list[4]);
		for(i=0;i<E_code_list.length;i++){
		$('#code2').append("<li class='"+E_code_list[i]+"'><a href='${path}/Product/Products?ccode="+E_code_list[i]+"'>"+E_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+E_code_list[i]+"'><span>"+E_name_list[i] +"</span></a></li>");
		}
	}
	for (var i = 0; i < code00_name_list.length; i++) {
		$('#code1_ul').append("<li><a href='${path}/Product/Products?ccode="+code00_code_list[i].substr(0,1)+ '11' +"'><span>"+code00_name_list[i] +"</span></a></li>");
	}
	$('#code2').find('.${ccode}').css('font-weight','bold');
	
	
	

}
	//$('#code').text();


</script>
        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>


 


 </body>
</html>