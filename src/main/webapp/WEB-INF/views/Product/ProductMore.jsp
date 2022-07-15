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

        th,
        td {
            vertical-align: middle;
        }

        #container {
            width: 100%;
            clear: both;
        }

        .container_wrap {
            clear: both;
        }

        section {
            width: 1400px;
            margin: 0 auto;
        }

        .product_warp {
            display: flex;
            justify-content: center;
            margin-top: 100px;
            border-bottom: 1px solid gray;
            padding-bottom: 100px;
        }

        .product_img>img {
            display: block;
            width: 470px;
            height: 600px;
        }

        .detail_table {
            width: 600px;
            line-height: 3em;
            font-size: 16px;
            text-align: left;
            margin-left: 100px;
            
        }

        .product_tr {
            border-bottom: solid 1px lightgray;
        }

        .product_tr>th {
            width: 130px;
        }

        .detail_tit,
        .detail_price {
            font-size: 20px;
        }

        .detail_first>th,
        .detail_text>th {
            width: 150px;
        }

        .down_btn {
            padding: 7px;
            border: 1px solid #777;
            background-image: url("${path}/resources/img/product/down_btn.svg");
            background-repeat: no-repeat;
            background-size: cover;
            width: 25px;
            height: 25px;
        }

        .up_btn {
            padding: 7px;
            border: 1px solid #777;
            background-image: url("${path}/resources/img/product/up_btn.svg");
            background-repeat: no-repeat;
            background-size: cover;
            width: 25px;
            height: 25px;
        }
        .like_btn{
            background-image: url("${path}/resources/img/product/like_btn.svg");
            width: 45px;
            height: 45px;
            background-repeat: no-repeat;
            background-size: cover;
            border: none;
            border: 1px solid gray;
            margin-right: 10px;
        }
        .alarm_btn{
            background-image: url("${path}/resources/img/product/alarm_btn.svg");
            width: 45px;
            height: 45px;
            background-repeat: no-repeat;
            background-size: cover;
            border: 1px solid gray; 
            margin-right: 10px;
        }
        .pickup_btn{
            background: #4e4f58;
            border: 1px solid #4e4f58;
            color: #fff;
            font-weight: 500;
            cursor: pointer;
            width: 125px;
            line-height: 10px;
            margin-right: 1em;
        }
        .pickup_btn:hover{
            background: #222;
            border: 1px solid #222;
            transition-duration: 0.5s;
        }
        .product_view_warp{
            width: 1200px;  
            margin-left: 112px;
        }
        .product_tab>ul{
            display: flex;
            justify-content: center;
            margin-right: 3px;
        }
        .product_tab>ul>li{
            border: solid 1px gray;
            line-height: 65px;
            width: 300px;
            text-align: center;
            font-size: 20px;
            font-weight: 500;
        }
        .text_last{
            margin-top: 100px;
        }
        .text_last>h3{
            font-size: 30px;
            color: gray;
            font-weight: 700;
            line-height: 1.5em;
            border-bottom: 1px solid gray;
            text-align: center;
        }
        .text_last>p{
            margin-top: 30px;
            font-size: 20px;
            line-height: 1.3em;
            color: gray;
        }
        .view_detail>h3{
            font-size: 30px;
            color: gray;
            font-weight: 700;
            line-height: 1.5em;
            text-align: center;
            border-bottom: 1px solid gray;
            margin-bottom: 30px;
        }
        .view_review>h3{
            font-size: 30px;
            color: gray;
            font-weight: 700;
            line-height: 1.5em;
            text-align: center;
            border-bottom: 1px solid gray;
            margin-bottom: 100px;
        }
        .words .sub_tit{
            font-size: 30px;
            font-weight: 700;
            line-height: 1.5em;
        }
        .words{
            font-size: 20px;
            line-height: 1.3em;
            margin-bottom: 100px;
        }
        .words>b{
            font-weight: 700;
            font-size: 20px;
            line-height: 1.3em;
            margin-bottom: 100px;
        }
        .view_inquiry>h3{
            font-size: 30px;
            color: gray;
            font-weight: 700;
            line-height: 1.5em;
            text-align: center;
            border-bottom: 1px solid gray;
            margin-bottom: 100px;
        }
        .detail_law{
        width: 1200px;
        line-height: 20px;
        font-size: 11px;
        }
        .detail_law_th{
            background-color: lightgray;
            text-align: left;
            width: 200px;
            padding-left: 1em;
        }
        .detail_law_td{
            width: 480px;
            height: 80px;
            line-height: 1.3em;
            padding-left: 2em;
        }
        .view_whyBn2U_tit{
            text-align: center;
            margin-bottom: 100px;
            border-top: 1px solid gray;
            padding-top: 140px;
        }
        .view_whyBn2U_tit h3{
            font-size: 30px;
            color: purple;
            font-weight: 600;
            margin-bottom: 70px;
        }
        .view_whyBn2U_tit h4{
            color: purple;
            font-weight: 600;
            margin-bottom: 30px;
        }
        .view_whyBn2U_img{
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            justify-content: center;
            line-height: 1.1em;
        }
        .view_whyBn2U_tit p{
            font-weight: 100;
            line-height: 1.5em;
            
        }
        .view_whyBn2U_tit p span{
            font-weight: 100;
            font-size: 12px;
            color: gray;
        }
        .view_info{
            margin-top: 100px;
            border-top: 1px solid gray;
            padding-top: 100px;
        }
        .view_info h3{
            font-size: 30px;
            color: gray;
            font-weight: 600;
            margin-bottom: 45px;
        }
        .view_info_sub{
            font-size: 20px;
            color: gray;
            font-weight: 550;
            margin-bottom: 45px;
        }
        .view_info_sub span{
            font-weight: 200;
        }
        .view_info_detail{
            display: flex;
            justify-content: center;
            font-size: 22px;
        }
        .view_info_detail h4{
            border-left: 3px solid purple;
            padding-left: 10px;
            color: purple;
            font-weight: 600;
            line-height: 20px;
            
        }
        .view_info_detail p{
            padding-top: 9px;
            font-size: 18px;
            line-height: 25px;
        }
        .view_info_detail p span{
            color: gray;
        }
        .review_board_tit{
            border-bottom: 2px solid purple;
            padding-bottom: 15px;
        }
        .review_board_tit h3{
            font-weight: 600;
        }
        .review_board_tit p{
            font-weight: 100;
            font-size: 14px;
            line-height: 1.2em;
        }
        .review_board{
            font-size: 15px;
            line-height: 2em;
        }
        .review_board_detail{
            width: 1200px;
            margin: 0 auto;
            text-align: center;
            font-weight: 600;
            border-collapse: collapse;
        }
        .review_board_detail tbody{
            font-weight: 100;
        }
        .review_board_detail td{
            vertical-align: middle;
        }
        .review_board_detail th,.review_board_detail td{
            border-bottom: 1px solid gray;
            line-height: 4em;
        }
        .btn_review{
            width: 120px;
            height: 30px;
            border: solid 1px purple;
            background-color: blueviolet;
            color: #fff;
            font-weight: 500;
        }
        .page_move{
            display: flex;
            justify-content: center;
        }
        .page_move a{
            text-align: center;
            border: 1px solid lightgray;
            width: 30px;
            height: 30px;
            margin-bottom: 100px;
        }
        .first_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-first.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
            
        }
        .prev_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-prev.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
        }
        .next_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-next.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
        }
        .last_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-last.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
        }
        .text_detail{
        	margin-top: 2%;
    		padding-left: 2em;
    		min-height: 200px;
        }
        .whyBn2U_item{
        margin-left: 25px;
        margin-right: 25px;
        margin-bottom: 100px;
        width: 300px;
        }
        .btn_box{
        display:flex;
        margin-left: 100px;
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
         <iframe name="hiddenf" style="display: none;"></iframe>
            <div id="container_wrap">
  	        <section class="page1" id="1">
                    <div class="product_warp">
                        <div class="product_img">
                            <img src="${path }/resources/upload/${DTO.pcode}/${DTO.ds_img_desc}" alt="ds_img">
                        </div>
                        
                        <div class="product_detail">
                            <table class="detail_table">
                                <tbody>
                                    <tr>
                                        <th colspan="2" style="font-size: 25px; font-weight: 500;">${DTO.pname }</th>
                                    </tr>
                                    <tr>
                                        <th class="detail_price" colspan="2" style="font-size: 25px; font-weight: 600;">
                                            <fmt:formatNumber value="${DTO.price }" pattern="#,###" /> <span style="font-size: 13px;">원</span></th>
                                    </tr>
                                    <tr style="border-top: solid 1px lightgray;">
                                        <th class="detail_first">판매단위</th>
                                        <td class="detail_first_sub">${DTO.unit }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">중량/용량</th>
                                        <td class="detail_text_sub">${DTO.weight }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">재고</th>
                                        <td class="detail_text_sub">${DTO.invt }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">원산지</th>
                                        <td class="detail_text_sub">${DTO.origin }</td>
                                    </tr>
                                   <tr class="product_tr">
                                        <th class="detail_text">유통기한</th>
                                        <td class="detail_text_sub">최대 4일 이내로 보내드립니다.</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">안내사항</th>
                                        <td class="detail_text_sub">${DTO.guidelines }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">구매수량</th>
                                        <td class="detail_text_sub">
                                            <div class="test">
                                                <button class="down_btn"></button>
                                                <input class="qty" type="text" value="1"
                                                    style="text-align: center; height: 25px; width: 25px; border: none;">
                                                <button class="up_btn"></button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="detail_text_last">총 상품금액:</td>
                                        <td class="detail_text_sub_last" style="font-size: 25px; font-weight: 600;">
                                            <span class="sum"><fmt:formatNumber value="${DTO.price }" pattern="#,###" /></span><span style="font-size: 13px;">원</span>
                                            <input type="hidden" value="${DTO.price }" class="origin_sum">
                                            </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="btn_box">
                            				<button class="pickup_btn" onclick="OrderAdd();">바로구매하기</button>
                                            <button class="pickup_btn" onclick="BasketAdd();">장바구니담기</button>
                                            <button class="like_btn"></button>
                            </div>
                        </div>
                    </div>
                    <div class="product_view_warp">
                        <div class="product_view">
                            <div class="view_item" style="margin-top: 100px;">
                                <figure style="margin: 0 auto; width: 1000px;">
                                    <img style="display: block; width: 1000px; height: 700px;" src="${path}/resources/upload/${DTO.pcode }/${DTO.dm_img_desc}" alt="dm_img">
                                </figure>
                                <div class="text_last">
                                    <h3>상품설명</h3>
                                    <div class="text_detail">
                                    ${DTO.pdetail }
                                    </div>
                                </div>
                            </div>
                         
                            <div class="view_whyBn2U" style="margin-top: 140px;">
                                <div class="view_whyBn2U_tit">
                                    <h3>WHY Bn2U</h3>
                                    <div class="view_whyBn2U_img">
                                        <div class="whyBn2U_item" style="margin-right: 50px;">
                                            <figure>
                                                <img src="${path}/resources/img/product/01_check.svg" alt="">
                                            </figure>
                                            <h4>깐깐한 상품위원회</h4>
                                            <p class="view_whyBn2U_sub_tit">
							                                                나와 내 가족이 먹고 쓸 상품을 고르는<br>
							                                                마음으로 매주 상품을 직접 먹어보고,<br>
							                                                경험해보고 성분,맛,안정성 등 다각도의<br>
							                                                기분을 통과한 상품만을 판매합니다.
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item" style="margin-right: 50px; margin-bottom: 50px;">
                                            <figure>
                                                <img src="${path}/resources/img/product/02_only.svg" alt="">
                                            </figure>
                                            <h4>차별화된 Bn2U Only</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                전국 각지와 해외의 훌륭한 생산자가<br>
                                                믿고 선택하는 파트너,비엔투유<br>
                                                3천여 개가 넘는 비엔투유 단독 브랜드, 스펙의<br>
                                                Bn2U Only 상품을 믿고 만나보세요.<br><br>
                                                <span>(온라인 기준/ 자사몰, 직구 제외)</span>
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item">
                                            <figure>
                                                <img src="${path}/resources/img/product/03_cold.svg" alt="">
                                            </figure>
                                            <h4>신선한 풀콜드체인 배송</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                온라인 업계 최초로 산지에서 문 앞까지<br>
                                                상온,냉장,냉동 상품을 분리 포장 후<br>
                                                최적의 온도를 유지하는 냉장 배송 시스템,<br>
                                                풀콜드체인으로 상품을 신선하게 전해드립니다.<br><br>
                                                <span>(샛별배송에 한함)</span>
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item" style="margin-right: 50px;">
                                            <figure>
                                                <img src="${path}/resources/img/product/04_price.svg" alt="">
                                            </figure>
                                            <h4>고객,생산자를 위한 최선의 가격</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                매주 대형 마트와 주요 온라인 마트의 가격<br>
                                                반동 상황을 확인해 신선식품은 품질을<br>
                                                타협하지 않은 선에서 최선의 가격으로,<br>
                                                가공식품은 언제나 합리적인 가격으로<br>
                                                정기 조정합니다.
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item">
                                            <figure>
                                                <img src="${path}/resources/img/product/05_eco.svg" alt="">
                                            </figure>
                                            <h4>환경을 생각하는 지속 가능한 유통</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                친환경 포장재부터 생산자가 상품에만<br>
                                                집중할 수 있는 직매입 유통구조까지,<br>
                                                지속 가능한 유통을 고민하여 비엔투유를 있게<br>
                                                하는 모든 환경(생산자,커뮤니티,직원)이<br>
                                                더 나아질 수 있도록 노력합니다.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="view_info" style="margin-top: 140px;">
                                <h3>고객행복센터</h3>
                                <p class="view_info_sub">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?<br>
                                    <span>문제가 되는 부분을 사진으로 찍어 아래 중 편하신 방법으로 접수해 주시면 빠르게 도와드리겠습니다.</span>
                                </p>
                                <div class="view_info_detail">
                                    <div>
                                        <h4>전화문의 1644-1107</h4>
                                        <p>오전 10시~오후6시 20분(평일)</p>
                                    </div>
                                    <div style="margin-left: 60px;">
                                        <h4>카카오톡 문의</h4>
                                        <p>
                                            오전 10시~오후6시 20분(평일)<br><br>
                                            <span>카카오톡에서'greekr3'를 검색 후<br>
                                            대화창에서 문의 및 불편사항을<br>
                                            남겨주세요.</span>
                                        </p>
                                    </div>
                                    <div style="margin-left: 60px;">
                                        <h4>홈페이지 문의</h4>
                                        <p>
                                            24시간 접수 가능<br>로그인 > 커뮤니티 > 1:1 문의<br><br>
                                            <span>고객센터 운영 시간에 순차적으로<br>
                                            답변해드리겠습니다.</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="review_board" style="margin-top: 140px;">
                                <div class="review_board_tit">
                                    <h3>PRODUCT REVIEW</h3>
                                    <p>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p>
                                    <p>배송관련,주문(취소/교환/환불)관련 문의 및 요청사항은 Q&A 문의에 남겨주세요.</p>
                                </div>
                                <table class="review_board_detail">
                                    <colgroup>
                                        <col style="width:5%;">
                                        <col>
                                        <col style="width:10%;">
                                        <col style="width:10%;">
                                        <col style="width:10%;">
                                        <col style="width:5%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>추천</th>
                                            <th>조회</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
                                    	<c:when test="${fn:length(List) > 0 }">
                                    	<c:forEach items="${List }" var="DTO">
                                        <tr class="dto">
                                            <th>${DTO.seq }</th>
                                            <td class="review_read" style="text-align:left; padding-left: 70px; ">${DTO.title }</td>
                                            <td>${DTO.name }</td>
                                            <td><fmt:formatDate value="${DTO.regdate }" pattern="YYYY-MM-dd"/></td>
                                            <td>${DTO.rec }</td>
                                            <td>${DTO.cnt }</td>
                                        </tr>
                                        </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                        <tr>
                                        	<th colspan="6">아직 리뷰가 없습니다~</th>
                                        </tr>
                                        </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
<!--                                 <div class="page_move" style="margin-top: 50px;">
                                    <a href="" class="first_btn"></a>
                                    <a href="" class="prev_btn"></a>
                                    <a href="">1</a>
                                    <a href="">2</a>
                                    <a href="">3</a>
                                    <a href="">4</a>
                                    <a href="">5</a>
                                    <a href="">6</a>
                                    <a href="">7</a>
                                    <a href="">8</a>
                                    <a href="">9</a>
                                    <a href="">10</a>
                                    <a href="" class="next_btn"></a>
                                    <a href="" class="last_btn"></a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
<script type="text/javascript">


more();
function more() {
	$.ajax({				
		url : "${path }/Board/Review_json?seq=32", // MemberJSONCtrl의 JSONObject 값을 가져옴
		dataType : "json", // 데이터 타입을 json
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr', // UTF-8처리
		cache : false, // true : 새로 고침 동작을 하지 않고, 저장된 캐시에서 불러오게됨, false:새로 불러옴 
		success : function(data) {
		$('.dto').after("<tr style='height: 200px;'><td colspan='6'>"+data.DTO.content+"</td></tr>");
		}
	
		})//ajax끝
}


function OrderAdd() {
	var seq = '${DTO.seq}';
	var qty = $('.qty').val();
	var href = "${path}/Customer/OrderForm?obj="+seq+","+qty;
	location.href = href;
}

function BasketAdd() {
	var cus_seq = ${scus_seq}; 
	var pcode = '${DTO.pcode}';
	var qty = $('.qty').val();
	var href = "${path}/Product/BasketAdd?cus_seq="+cus_seq+"&pcode="+pcode+"&qty="+qty;
	window.open(href,'hiddenf');
	
	
}

$('.location_select').click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});


function AmountCommas(val) {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var origin_sum_val = parseInt($('.origin_sum').val());
$('.up_btn').click(function () {
    var qty_val = $('.qty').val();
    qty_val++;
    $('.qty').val(qty_val);
    var sum_val = origin_sum_val * qty_val;
    $('.sum').text(AmountCommas(sum_val));
});

$('.down_btn').click(function () {
    var qty_val = $('.qty').val();
    if (qty_val > 1) {
        qty_val--;
        $('.qty').val(qty_val);
        var sum_val = origin_sum_val * qty_val;
        $('.sum').text(AmountCommas(sum_val));
    } else {
        alert("최소 수량은 1개 이상입니다.")
    }
});


</script>
        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>


 


 </body>
</html>