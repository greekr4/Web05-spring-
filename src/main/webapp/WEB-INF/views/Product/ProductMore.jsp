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
                                            <fmt:formatNumber value="${DTO.price }" pattern="#,###" /> <span style="font-size: 13px;">???</span></th>
                                    </tr>
                                    <tr style="border-top: solid 1px lightgray;">
                                        <th class="detail_first">????????????</th>
                                        <td class="detail_first_sub">${DTO.unit }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">??????/??????</th>
                                        <td class="detail_text_sub">${DTO.weight }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">??????</th>
                                        <td class="detail_text_sub">${DTO.invt }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">?????????</th>
                                        <td class="detail_text_sub">${DTO.origin }</td>
                                    </tr>
                                   <tr class="product_tr">
                                        <th class="detail_text">????????????</th>
                                        <td class="detail_text_sub">?????? 4??? ????????? ??????????????????.</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">????????????</th>
                                        <td class="detail_text_sub">${DTO.guidelines }</td>
                                    </tr>
                                    <tr class="product_tr">
                                        <th class="detail_text">????????????</th>
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
                                        <td class="detail_text_last">??? ????????????:</td>
                                        <td class="detail_text_sub_last" style="font-size: 25px; font-weight: 600;">
                                            <span class="sum"><fmt:formatNumber value="${DTO.price }" pattern="#,###" /></span><span style="font-size: 13px;">???</span>
                                            <input type="hidden" value="${DTO.price }" class="origin_sum">
                                            </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="btn_box">
                            				<button class="pickup_btn" onclick="OrderAdd();">??????????????????</button>
                                            <button class="pickup_btn" onclick="BasketAdd();">??????????????????</button>
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
                                    <h3>????????????</h3>
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
                                            <h4>????????? ???????????????</h4>
                                            <p class="view_whyBn2U_sub_tit">
							                                                ?????? ??? ????????? ?????? ??? ????????? ?????????<br>
							                                                ???????????? ?????? ????????? ?????? ????????????,<br>
							                                                ??????????????? ??????,???,????????? ??? ????????????<br>
							                                                ????????? ????????? ???????????? ???????????????.
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item" style="margin-right: 50px; margin-bottom: 50px;">
                                            <figure>
                                                <img src="${path}/resources/img/product/02_only.svg" alt="">
                                            </figure>
                                            <h4>???????????? Bn2U Only</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                ?????? ????????? ????????? ????????? ????????????<br>
                                                ?????? ???????????? ?????????,????????????<br>
                                                3?????? ?????? ?????? ???????????? ?????? ?????????, ?????????<br>
                                                Bn2U Only ????????? ?????? ???????????????.<br><br>
                                                <span>(????????? ??????/ ?????????, ?????? ??????)</span>
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item">
                                            <figure>
                                                <img src="${path}/resources/img/product/03_cold.svg" alt="">
                                            </figure>
                                            <h4>????????? ??????????????? ??????</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                ????????? ?????? ????????? ???????????? ??? ?????????<br>
                                                ??????,??????,?????? ????????? ?????? ?????? ???<br>
                                                ????????? ????????? ???????????? ?????? ?????? ?????????,<br>
                                                ????????????????????? ????????? ???????????? ??????????????????.<br><br>
                                                <span>(??????????????? ??????)</span>
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item" style="margin-right: 50px;">
                                            <figure>
                                                <img src="${path}/resources/img/product/04_price.svg" alt="">
                                            </figure>
                                            <h4>??????,???????????? ?????? ????????? ??????</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                ?????? ?????? ????????? ?????? ????????? ????????? ??????<br>
                                                ?????? ????????? ????????? ??????????????? ?????????<br>
                                                ???????????? ?????? ????????? ????????? ????????????,<br>
                                                ??????????????? ????????? ???????????? ????????????<br>
                                                ?????? ???????????????.
                                            </p>
                                        </div>
                                        <div class="whyBn2U_item">
                                            <figure>
                                                <img src="${path}/resources/img/product/05_eco.svg" alt="">
                                            </figure>
                                            <h4>????????? ???????????? ?????? ????????? ??????</h4>
                                            <p class="view_whyBn2U_sub_tit">
                                                ????????? ??????????????? ???????????? ????????????<br>
                                                ????????? ??? ?????? ????????? ??????????????????,<br>
                                                ?????? ????????? ????????? ???????????? ??????????????? ??????<br>
                                                ?????? ?????? ??????(?????????,????????????,??????)???<br>
                                                ??? ????????? ??? ????????? ???????????????.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="view_info" style="margin-top: 140px;">
                                <h3>??????????????????</h3>
                                <p class="view_info_sub">???????????? ????????? ????????? ????????? ????????? ?????? ????????????????<br>
                                    <span>????????? ?????? ????????? ???????????? ?????? ?????? ??? ????????? ???????????? ????????? ????????? ????????? ????????????????????????.</span>
                                </p>
                                <div class="view_info_detail">
                                    <div>
                                        <h4>???????????? 1644-1107</h4>
                                        <p>?????? 10???~??????6??? 20???(??????)</p>
                                    </div>
                                    <div style="margin-left: 60px;">
                                        <h4>???????????? ??????</h4>
                                        <p>
                                            ?????? 10???~??????6??? 20???(??????)<br><br>
                                            <span>??????????????????'greekr3'??? ?????? ???<br>
                                            ??????????????? ?????? ??? ???????????????<br>
                                            ???????????????.</span>
                                        </p>
                                    </div>
                                    <div style="margin-left: 60px;">
                                        <h4>???????????? ??????</h4>
                                        <p>
                                            24?????? ?????? ??????<br>????????? > ???????????? > 1:1 ??????<br><br>
                                            <span>???????????? ?????? ????????? ???????????????<br>
                                           	 ???????????????????????????.</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="review_board" style="margin-top: 140px;">
                                <div class="review_board_tit" style="height: 85px;">
                                    <h3>PRODUCT REVIEW</h3>
                                    <p>????????? ?????? ????????? ????????? ???????????????. ?????? ???????????? ????????? ?????? ?????? ???????????? ?????? ?????? ??????????????? ????????? ??? ????????????.</p>
                                    <p style="float: left;">????????????,??????(??????/??????/??????)?????? ?????? ??? ??????????????? Q&A ????????? ???????????????.</p>
                                    <!-- <p style="float: right;"><button class="btn_clear" style="width: 100px; height: 30px">?????? ??????</button></p> -->
                                </div>
                                <table class="review_board_detail">
                                    <colgroup>
                                        <col style="width:5%;">
                                        <col style="width:10%;">
                                        <col>
                                        <col style="width:10%;">
                                        <col style="width:10%;">
                                        <col style="width:5%;">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>??????</th>
                                            <th>??????</th>
                                            <th>??????</th>
                                            <th>?????????</th>
                                            <th>?????????</th>
                                            <th>??????</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    	<c:choose>
                                    	<c:when test="${fn:length(List) > 0 }">
                                    	<c:forEach items="${List }" var="DTO" varStatus="status">
                                        <tr class="dto">
                                            <th>${DTO.seq }</th>
                                            <th>
                                            <c:choose>
 											<c:when test="${DTO.star == 5 }">
 											???????????????
 											</c:when>
 											<c:when test="${DTO.star == 4 }">
 											???????????????
 											</c:when>
 											<c:when test="${DTO.star == 3 }">
 											???????????????
 											</c:when>
 											<c:when test="${DTO.star == 2 }">
 											???????????????
 											</c:when>
 											<c:when test="${DTO.star == 1 }">
 											???????????????
 											</c:when>
 											</c:choose>
                                            </th>
                                            <td class="review_read" style="text-align:left; padding-left: 70px; ">
                                            <a onclick="more(${DTO.seq },${status.index})">
                                            ${DTO.title }
                                            </a>                 
                                            </td>
                                            <td>${DTO.name }</td>
                                            <td><fmt:formatDate value="${DTO.regdate }" pattern="YYYY-MM-dd"/></td>
                                            <td>${DTO.rec }</td>
                                        </tr>
                                        </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                        <tr>
                                        	<th colspan="6">?????? ????????? ????????????~</th>
                                        </tr>
                                        </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
<script type="text/javascript">






function more(p_seq,index) {
	if( $('.more_box'+index).before().text() == '' ){
		
		$.ajax({				
			url : "${path }/Board/Review_json?seq="+p_seq, // MemberJSONCtrl??? JSONObject ?????? ?????????
			dataType : "json", // ????????? ????????? json
			contentType: 'application/x-www-form-urlencoded; charset=euc-kr', // UTF-8??????
			cache : false, // true : ?????? ?????? ????????? ?????? ??????, ????????? ???????????? ???????????????, false:?????? ????????? 
			success : function(data) {
			var REC_UP ="${path}/Board/REC_UP?seq="+data.DTO.seq
			$('.dto').eq(index).after("<tr class='more_box"+index+"'><td colspan='5' style='border-top'><button class='btn_white' style='width:9em;height:3em;' onclick=\"window.open('"+ REC_UP +"' ,'hiddenf')\">????????? ????????????</button></td></tr>");
			$('.dto').eq(index).after("<tr class='more_box"+index+"' style='height: 200px;'><td colspan='5'>"+data.DTO.content+"</td></tr>");
			}
		
			})//ajax???
	}else{
		$('.more_box'+index).remove();
	}
	


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
        alert("?????? ????????? 1??? ???????????????.")
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