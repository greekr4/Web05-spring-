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
<title>Bn2U</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <style>
        /* 초기화 */
        * { margin: 0; padding: 0;}
        ul { list-style: none; } 
        a { text-decoration: none; color: #222; }
        html, body { height: 100%;}
        #container{clear: both; width: 100%;}
        .container_wrap{clear: both; width: 100%; }
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
      	.basket_wrap{
      	width: 100%;
      	}
		.basket_tit_box{
		width: 1200px;
		margin-left: 200px;
		}
		.basket_wrap h1{
		text-align: center;
		}
		.basket_indi_wrap{
		width:1200px;
		margin-left: 200px;
		}
		.basket_total_wrap{
		clear:both;
		margin-top:50px;
		width:1200px;
		height:90px;
		margin-left: 200px;
		background-color: #666;
		color: #fff;
		
		}
		.basket_indi_wrap table{
		width:100%;
		margin: 0 auto;
		margin-top: 50px;
		border-collapse: collapse;
		}
		.basket_total_wrap table{
		width:100%;
		margin: 0 auto;
		margin-top: 50px;
		border-collapse: collapse;
		}
		.basket_indi_wrap table th{
		border-bottom: 1px solid #222;
		height: 2.5em;
		line-height: 2.5em;
		}
		.basket_indi_wrap table td{
		text-align: center;
		border-bottom: 1px solid #dbdbdb;
		}
		.basket_indi_wrap table td.detail{
		text-align: left;
		}
		.basket_indi_wrap table th{
		width: 8%;
		}
		.basket_indi_wrap table th:nth-child(1){
		width: 20%;
		}
		.basket_indi_wrap table th:nth-child(2){
		width: 20%;
		}
		.basket_indi_wrap table button{
		width: 100px;
    	height: 40px;
		}
		.basket_indi_wrap table button.up_btn, .basket_indi_wrap table button.down_btn{
		width: 20px;
		height: 20px;
		}
		.basket_indi_wrap table img{
		display: block;
	    width: 100px;
	    height: 100px;
	    margin: 10px auto;
		}
		.basket_indi_wrap table p.pname{
		font-weight: bold;
		line-height: 2.5em;
		
		}
		.basket_indi_wrap table td{
		font-weight: bold;
		}
		.basket_indi_wrap table td.gray_tit{
		font-weight: 0;
		color: gray;
		}
		.basket_indi_wrap table p.psubname{
		font-size:0.8em;
		color: gray;
		}
		.basket_indi_wrap table input{
		border: 0;
		width: 35px;
    	text-align: center;
		}
		.total_ptxt{
		font-size: 11px;
		margin-top: 7px;
		line-height: 1.5em;
		}

		.basket_total{
		margin: 40px;
		}
		.basket_total h2{
		margin-top: 15px;
		}
		
		.t_txt{
		margin-right: 4em;
	 	width: 200px;
   		display: inline-block;
   		text-align: right;
		}
		.t_txt2{
		display:inline-block;
		text-align: right;
		width: 100px;
		}
		
		.total_price_box{
		float: right;
		margin-top: 15px;
		}
		.t_txt_sdp{
		font-size:14px;
		font-weight:bold;
		color: orange;
		
		}
		
		.total_btn_wrap{
		clear:both;
		width: 100%;
		
		}
	    .total_btn_box{
	    display: inline-block;
	    float: right;
	    margin-top: 10px;
	    }
	    .total_btn_box button{
	         width: 100px;
    		height: 40px;
	    
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
              
                <section class="main_wrap">

				<jsp:include page="./LeftMenu.jsp"/>
                    <div class="basket_wrap">
	                    <div class="basket_tit_box">
	                    	<h1>${sid }님의 장바구니</h1>   
	                    </div>
	                    
	                    <div class="basket_indi_wrap">
	                    <table>
							  <tr>
							    <th>상품이미지</th>
							    <th>상품정보</th>
							    <th>판매가</th>
							    <th>수량</th>
							    <th>적립금</th>
							    <th>배송구분</th>
							    <th>배송비</th>
							    <th>합계</th>
							    <th>선택</th>
							  </tr>
						<c:choose>
						<c:when test="${fn:length(List) != 0 }">
							<c:forEach items="${List }" var="DTO" varStatus="status">
							<tr>
								<td><img alt="상품이미지" src="${path }/resources/upload/${DTO.pcode }/${DTO.s_img_desc }"></td>
								<td class="detail">
							   	<p class="pname">${DTO.pname }</p>
							    <p class="psubname">${DTO.psubname }</p>
							    <input type="hidden" class="pseq" value="${DTO.pseq }">
							    </td>
							    <td><fmt:formatNumber value="${DTO.price }" pattern="#,###" />원
							    <input type="hidden" id="origin_sum" class="origin_sum" value="${DTO.price }"></td>
							    <td>
							    <button class="down_btn" onclick="down_btn(${status.index});">-</button>
							    <input type="text" id="qty" class="qty" value="${DTO.qty }">
							    <button class="up_btn" onclick="up_btn(${status.index});">+</button>
							    </td>
							    <td>-</td>
							    <td class="gray_tit">기본배송</td>
							    <td>3,000원
							    <input type="hidden" class="delivery_sum" value="3000"> </td>
							    <td><span class="sum"><fmt:formatNumber value="${DTO.price*DTO.qty + 3000 }" pattern="#,###"/></span>원</td>
							    <td>
							    <button class="btn_black" onclick="GOF(${DTO.pseq},${status.index });">주문하기</button>
							    <button class="btn_white" style="margin-top: 10px;" onclick="window.open('${path}/Product/BasketDel?cus_seq=${scus_seq }&pcode=${DTO.pcode }','hiddenf')">삭제하기</button>
							    </td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="9" style="height: 100px;">장바구니에 추가하신 상품이 없습니다.</td>
								</tr>						
							</c:otherwise>
						</c:choose>
							</table>

	                    
	                    </div>
	                    <div class="basket_total_wrap">
	                     <div class="basket_total">
	                    	<div style="float: left;">
	  						<h2>합계</h2>
	  						<p style="clear: both;">고객님의 총 주문 합계 금액 입니다.</p>
	  						</div>
	  						
	  						
	  						

	  						<div class="total_price_box" style="float: right;">
	  						<ul class="total_ptxt">
	  							<li>
	  							<span class="t_txt">상품 합계금액</span>
	  							<span class="t_txt_sump t_txt2"><span class="tot_sum1">1,200</span>원</span>
	  							</li>
		  						<li>
		  						<span class="t_txt">배송비</span>
		  						<span class="t_txt_delp t_txt2"><span class="tot_sum2">3,000</span>원</span>
		  						</li>
		  						<li>
		  						<span class="t_txt">총 주문합계 금액</span>
								<span class="t_txt_sdp t_txt2"><span class="tot_sum3">4,200</span>원</span>
		  						</li>
	  						</ul>
	  						</div>
	                    	</div>
	                    </div>
	                    <div class="total_btn_wrap">
	                    	<div class="total_btn_box">
	                    	<button class="btn_black" onclick="AGOF();">주문하기</button>
	                    	<button class="btn_white">삭제하기</button>
	                    	</div>
	                    
	                    
	                    
	                    </div>
	                    
	                    
                    
                                  
                    </div>
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

$('.gnb_sub_menu').eq(1).find('a').css('font-weight','bold');

function AGOF() {
	var seq = [];
	var qty = [];
	var obj = [];
	for (var i = 0; i < $('.qty').length; i++) {
		obj.push($('.pseq').eq(i).val());
		obj.push($('.qty').eq(i).val());
	}
	location.href='${path}/Customer/OrderForm?obj='+obj;
	
}

function GOF(seq,index) {
	var qty = $('.qty').eq(index).val();
	location.href='${path}/Customer/OrderForm?obj='+seq+","+qty;
	
}




function AmountCommas(val) {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var origin_sum_val = [];
var delivery_sum = [];

for (var i = 0; i < $('.origin_sum').length; i++) {
	origin_sum_val.push(parseInt($('.origin_sum').eq(i).val()));
	delivery_sum.push(parseInt($('.delivery_sum').eq(i).val()));
}

tot_sum();
function tot_sum() {
	var algo = [];
	var algo2 = 0;
	var algo3 = 0;
	var algo4 = 3000*origin_sum_val.length
	for (var i = 0; i < origin_sum_val.length; i++) {
		algo[i] = origin_sum_val[i] * $('.qty').eq(i).val();
		algo2 += algo[i];
	}
	algo3 = algo2;
	algo2 += origin_sum_val.length * 3000;
	$('.tot_sum1').text(AmountCommas(algo3));
	$('.tot_sum2').text(AmountCommas(algo4));
	$('.tot_sum3').text(AmountCommas(algo2));
	
	
}

/* $('.up_btn').click(function () {
    var qty_val = $('.qty').val();
    qty_val++;
    $('.qty').val(qty_val);
    var sum_val = origin_sum_val * qty_val + delivery_sum;
    $('.sum').text(AmountCommas(sum_val));
});
 */

function up_btn(index) {
    var qty_val = $('.qty').eq(index).val();
    qty_val++;
    $('.qty').eq(index).val(qty_val);
    var sum_val = origin_sum_val[index] * qty_val + delivery_sum[index];
    $('.sum').eq(index).text(AmountCommas(sum_val));
    tot_sum();
}

 function down_btn(index) {
	    var qty_val = $('.qty').eq(index).val();
	    if (qty_val > 1) {
	        qty_val--;
	        $('.qty').eq(index).val(qty_val);
	        var sum_val = origin_sum_val[index] * qty_val + delivery_sum[index];
	        $('.sum').eq(index).text(AmountCommas(sum_val));
	        tot_sum();
	    } else {
	        alert("최소 수량은 1개 이상입니다.")
	    }
}
/* $('.down_btn').click(function () {
    var qty_val = $('.qty').val();
    if (qty_val > 1) {
        qty_val--;
        $('.qty').val(qty_val);
        var sum_val = origin_sum_val * qty_val + delivery_sum;
        $('.sum').text(AmountCommas(sum_val));
    } else {
        alert("최소 수량은 1개 이상입니다.")
    }
}); */


</script>

 </body>
</html>