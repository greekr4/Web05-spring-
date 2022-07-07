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
		width: 1000px;
		margin: 0 auto;
		}
		.basket_wrap h1{
		text-align: center;
		}
		.table_wrap{
		width:1200px;
		margin-left: 200px;
		}
		.table_wrap table{
		width:100%;
		margin: 0 auto;
		margin-top: 50px;
		border-collapse: collapse;
		}
		.table_wrap table th{
		border-bottom: 1px solid #222;
		height: 2.5em;
		line-height: 2.5em;
		}
		.table_wrap table td{
		text-align: center;
		border-bottom: 1px solid #dbdbdb;
		}
		.table_wrap table td.detail{
		text-align: left;
		}
		.table_wrap table th{
		width: 8%;
		}
		.table_wrap table th:nth-child(1){
		width: 20%;
		}
		.table_wrap table th:nth-child(2){
		width: 20%;
		}
		.table_wrap table button{
		width: 100px;
    	height: 40px;
		}
		.table_wrap table button.up_btn, .table_wrap table button.down_btn{
		width: 20px;
		height: 20px;
		}
		.table_wrap table img{
		display: block;
	    width: 100px;
	    height: 100px;
	    margin: 10px auto;
		}
		.table_wrap table p.pname{
		font-weight: bold;
		
		}
		.table_wrap table td{
		font-weight: bold;
		}
		.table_wrap table td.gray_tit{
		font-weight: 0;
		color: gray;
		}
		.table_wrap table p.psubname{
		font-size:0.8em;
		color: gray;
		}
		.table_wrap table input{
		border: 0;
		width: 35px;
    	text-align: center;
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
                    <div class="basket_wrap">
	                    <div class="basket_tit_box">
	                    	<h1>Admin님의 장바구니</h1>   
	                    </div>
	                    
	                    <div class="table_wrap">
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
							  <tr>
							    <td><img alt="상품이미지" src="${path }/resources/upload/p1112/info1.jpg"></td>
							    <td class="detail">
							    	<p class="pname">동협이</p>
							    	<p class="psubname">100g당 만원</p>
							    </td>
							    <td>12,900원
							    <input type="hidden" id="origin_sum" class="origin_sum" value="12900"></td>
							    <td>
							    <button class="down_btn" onclick="down_btn(0);">-</button>
							    <input type="text" id="qty" class="qty" value="1">
							    <button class="up_btn" onclick="up_btn(0);">+</button>
							    </td>
							    <td>-</td>
							    <td class="gray_tit">기본배송</td>
							    <td>3,000원
							    <input type="hidden" class="delivery_sum" value="3000"> </td>
							    <td><span class="sum">15,900</span>원</td>
							    <td><button class="btn_black">주문하기</button></td>
							</tr>
							
							
							<tr>
							    <td><img alt="상품이미지" src="${path }/resources/upload/p1112/info1.jpg"></td>
							    <td class="detail">
							    	<p class="pname">동협이</p>
							    	<p class="psubname">100g당 만원</p>
							    </td>
							    <td>1,000원
							    <input type="hidden" id="origin_sum" class="origin_sum" value="1000"></td>
							    <td>
							    <button class="down_btn" onclick="down_btn(1);">-</button>
							    <input type="text" id="qty" class="qty" value="1">
							    <button class="up_btn" onclick="up_btn(1);">+</button>
							    </td>
							    <td>-</td>
							    <td class="gray_tit">기본배송</td>
							    <td>3,000원
							    <input type="hidden" class="delivery_sum" value="3000"> </td>
							    <td><span class="sum">15,900</span>원</td>
							    <td><button class="btn_black">주문하기</button></td>
							</tr>
							
							</table>

	                    
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

function AmountCommas(val) {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var origin_sum_val = [];
var delivery_sum = [];

for (var i = 0; i < $('.origin_sum').length; i++) {
	origin_sum_val.push(parseInt($('.origin_sum').eq(i).val()));
	delivery_sum.push(parseInt($('.delivery_sum').eq(i).val()));
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
}

 function down_btn(index) {
	    var qty_val = $('.qty').eq(index).val();
	    if (qty_val > 1) {
	        qty_val--;
	        $('.qty').eq(index).val(qty_val);
	        var sum_val = origin_sum_val[index] * qty_val + delivery_sum[index];
	        $('.sum').eq(index).text(AmountCommas(sum_val));
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