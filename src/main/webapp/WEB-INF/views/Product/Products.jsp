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

        .goods_list {
            width: 1400px;
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            border-bottom: solid 1px lightgrey;
            margin-bottom: 100px;
        }

        span.price {
            display: block;
            line-height: 45px;
            font-size: 17px;
        }

        span.desc {
            font-size: 13px;
            color: gray;
        }

        .goods>img {
        	display:block;
            width: 313px;
            height: 400px;
        }

        .item {
            margin: 50px 15px 50px 15px;
            float: left;
            width: 320px;
    		height: 540px;
        }

        .info {
            font-size: 15px;
            line-height: 45px;
            font-weight: 600;
        }

        .list_line {
            clear: both;
            height: 55px;
            border-top: solid 2px #000;
            border-bottom: solid 1px lightgray;
        }

        .pick_list>li {
            float: right;
            display: flex;
            margin-top: 15px;
            margin-right: 5px;
        }

        .pick_list>li>a {
            font-weight: 400;
            font-size: 15px;
            margin-right: 10px;
            letter-spacing: -2px;
            color: gray;
        }

        .list_line .pick_list .sub_navi {
            float: left;
        }

        .pick_list_num {}

        .pick_list_num::after {
            margin-left: 15px;
            content: "｜";
        }

        .select_num {
            margin-left: 15px;
            color: gray;
            border: none;
            border-bottom: solid 1px lightgray;
        }

        .select_num:focus {
            outline: none;
        }



        /* ------------- 페이지 위치 ------------- */
        .location_wrap {
            position: relative;
            width: 100%;
            /*background:#f9f9f9;*/
        }

        .location_wrap .location_cont {
            width: 1200px;
            margin: 18px auto 0;
        }

        .location_wrap .location_cont:after {
            display: block;
            clear: both;
            content: "";
        }

        .location_cont em {
            font-size: 0;
        }

        .location_cont em img {
            position: relative;
            margin: 0;
            top: -4px;
        }

        .location_cont img {
            display: inline-block;
            vertical-align: middle;
            margin: 0 8px 2px;
        }

        .location_cont a img {
            margin-left: 0;
        }

        .location_cont .local_home {
            color: #777777;
        }

        .location_cont .local_home:hover {
            text-decoration: underline;
        }

        /* 페이지 셀렉트 레이어 */
        .sub_content .location_wrap {
            margin: 0;
            border-bottom: none 0;
        }

        .location_cont em+.location_select {
            margin-left: 5px;
        }

        .location_select {
            display: inline-block;
            position: relative;
            min-width: 130px;
            border: none;
            border-bottom: 1px solid #ddd;
            background: #ffffff;
            z-index: 50;
            padding: 0;
        }

        .location_select .location_tit {
            background: url("${path}/resources/img/product/select_arrow.png") no-repeat right 3px center;
        }

        .location_select .location_tit.actvie {
            background: url("${path}/resources/img/product/select_arrow.png") no-repeat right 3px center;
        }


        .location_select .location_tit span {
        	display: inline-block;
        	cursor:pointer;
            padding: 6px 32px 6px 2px;
            font-size: 13px;
            color: #888;
        }

        .location_select ul {
            display: block;
            position: absolute;
            top: 30px;
            left: 0px;
            width: 100%;
            padding: 6px 0 6px 0;
            font-size: 0;
            background: #ffffff;
            border: 1px solid #ddd;
        }

        .location_select ul li {}

        .location_select ul li a {
            display: block;
            font-size: 13px;
            color: #888;
            font-family: 'Poppins', "Noto Sans KR", sans-serif;
            padding: 4px 8px;
        }

        .location_select ul li a span {
            display: inline-block;
        }

        .location_select ul li a:hover {
            color: #ffffff;
            text-decoration: none;
            background: #222222;
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
  	        <section class="page1">
                    <div class="visual">
                        <div class="tit_box">
                            <h3>Bn2U</h3>
                            <p>EVERYDAY BESTBUY</p>
                        </div>
                    </div>
                    <div class="location_wrap">
                        <div class="location_cont">
                            <em><a href="#" class="local_home"><img src="${path}/resources/img/product/home_icon.png" alt="홈"></a></em>
                            <span><img src="${path}/resources/img/product/arrow_icon.png" alt=""></span>
                            <div class="location_select">
                                <div class="location_tit"><span id="code1_span">카테고리</span></div>
                                <ul style="display: none;" id="code1_ul">

                                </ul>
                            </div>
                            
                            <span><img src="${path}/resources/img/product/arrow_icon.png" alt=""></span>
                            
                            <div class="location_select">
                                <div class="location_tit"><span id="code2_span">카테고리2</span></div>
                                <ul style="display: none;" id="code2_ul">

                                </ul>
                            </div>
                            
                        </div>
                    </div>
                    <div class="content_warp">
                        <div class="page_tit">
                            <h2 id="code">카테고리</h2>
                        </div>
                        <div class="sub_tit">
                            <ul id=code2>

                            </ul>
                        </div>
                        <div class="list_line">
                            <ul class="pick_list">
                                <li class="sub_navi">
                                    <span class="pick_list_num" style="color: gray;">Total. <strong
                                            style="color: black;">${pcnt }</strong></span>
                                    <select name="" id="" class="select_num">
                                        <option value="" selected>20개씩보기</option>
                                        <option value="">10개씩보기</option>
                                        <option value="">30개씩보기</option>
                                        <option value="">40개씩보기</option>
                                        <option value="">50개씩보기</option>
                                    </select>
                                </li>
                                <li>
                                    <a href="">등록일순</a>
                                </li>
                                <li>
                                    <a href="">상품평순</a>
                                </li>
                                <li>
                                    <a href="">높은가격순</a>
                                </li>
                                <li>
                                    <a href="">낮은가격순</a>
                                </li>
                                <li>
                                    <a href="">판매인기순</a>
                                </li>
                                <li>
                                    <a href="" style="color: #000;">추천순</a>
                                </li>
                            </ul>
                        </div>
                        <div class="goods_list">
                        	<c:choose>
                        	<c:when test="${fn:length(List) eq 0 }">
                        	<h2 style="text-align: center; width: 100%; margin: 50px 0;">상품 준비중입니다.</h2>
                        	</c:when>
                        	<c:otherwise>
                        	<c:forEach items="${List }" var="DTO">
                            <div class="item" onclick="location.href = '${path}/Product/ProductMore?seq=${DTO.seq }'" style="cursor: pointer;">
                                <div class="goods">
                                        <img src="${path}/resources/upload/${DTO.pcode }/${DTO.s_img_desc}" alt="Product_img">
                                </div>
                                <div class="info">
                                    <span class="name">${DTO.pname }</span>
                                    <span class="price"><fmt:formatNumber value="${DTO.price }" pattern="#,###"/>원</span>
                                    <span class="desc">${DTO.psubname }</span>
                                    <span class="tag"></span>
                                </div>
                            </div>
                            </c:forEach>
                        	</c:otherwise>
                        	</c:choose>

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