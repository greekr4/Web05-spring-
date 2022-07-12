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
		
		
		        /* 오더 폼 */
        .OrderForm {
            width: 1200px;
            margin-top: 100px;
            margin-left: 200px;
            text-align: center;
        }
        .table {
            display:table;
            border-collapse: collapse;
            width: 100%;
            text-align: left;
            font-size: 1em;
        }
        .table tr{
            display: table-row;
        }
        .table tr th, .table tr td{
            display: table-cell;
            border-bottom: 1px solid #dcdcdc;
            padding: 12px 0 12px 25px;
        }
        .table tr th{
            background-color: #fbfbfb;
        }
        .table tr th:before{
            content: "*";
            color: red;
            margin-right: 4px;
        }
        .table tr td input:focus{
            outline: none;
        }
        .table tr:first-child{
            border-top: 1px solid #999999;
        }
        .table tr:nth-child(1) td input{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }        
        .table tr:nth-child(2) td input{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(3) td input{
            height: 32px;
            width: 25.5%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(4) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(5) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(6) td input[type=text]{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(7) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(8) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr td input[type=button]{
            width: 24%;
            padding: 5px 0 9px 0;
        }
        .btn {
            margin-top: 4%;
            width: 20%;
            padding: 5px 0 9px 0;
        }
        /* /오더 폼 */
		
		
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
	                    	<h1>주문확인</h1>   
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
							  </tr>
							<c:forEach items="${List }" var="DTO" varStatus="status">
							<tr>
								<td><img alt="상품이미지" src="${path }/resources/upload/${DTO.pcode }/${DTO.s_img_desc }">
								<input type="hidden" class="pcode" value="${DTO.pcode }">
								</td>
								<td class="detail">
							   	<p class="pname">${DTO.pname }</p>
							    <p class="psubname">${DTO.psubname }</p>
							    </td>
							    <td><fmt:formatNumber value="${DTO.price }" pattern="#,###" />원
							    <input type="hidden" id="origin_sum" class="origin_sum" value="${DTO.price }"></td>
							    <td>
							    <input type="text" id="qty" class="qty" value="${DTO.qty }" readonly="readonly">
							    </td>
							    <td>-</td>
							    <td class="gray_tit">기본배송</td>
							    <td>3,000원
							    <input type="hidden" class="delivery_sum" value="3000"> </td>
							    <td><span class="sum"><fmt:formatNumber value="${DTO.price*DTO.qty + 3000 }" pattern="#,###"/></span>원</td>
							</tr>
							</c:forEach>
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
	  							<span class="t_txt_sump t_txt2"><span class="tot_sum1">0</span>원</span>
	  							</li>
		  						<li>
		  						<span class="t_txt">배송비</span>
		  						<span class="t_txt_delp t_txt2"><span class="tot_sum2">0</span>원</span>
		  						</li>
		  						<li>
		  						<span class="t_txt">총 주문합계 금액</span>
								<span class="t_txt_sdp t_txt2"><span class="tot_sum3">0</span>원</span>
		  						</li>
	  						</ul>
	  						</div>
	                    	</div>
	                    </div>
	                    
	                    <!-- 오더 -->
                    <div class="OrderForm">
                         <form action="Join" method="post" name="OrderForm" onsubmit="return joinCheck()">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th><label for="name">받는 사람</label></th>
                                        <td><input class="delivery_cus" name="delivery_cus" id="delivery_cus" value="${sdto.name }"/></td>
                                    </tr>
                                    <tr>
                                        <th><label for="phonenum">핸드폰 번호</label></th>
                                        <td><input class="phonenum" value="${sdto.phonenum }"></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="3"><label for="zipcode">주소</label></th>
                                        <td>
                                            <input type="text" class="delivery_zipcode" name="delivery_zipcode" id="delivery_zipcode" value="${sdto.zipcode }"/>
                                            <input type="button" id="btn1" class="btn_white" onclick="findAddr()" value="우편번호 검색">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><input class="delivery_addr1" name="delivery_addr1" id="delivery_addr1" value="${sdto.addr1 }"/></td>
                                    </tr>
                                    <tr>
                                        <td><input class="delivery_addr2" name="delivery_addr2" id="delivery_addr2" value="${sdto.addr2 }"/></td>
                                    </tr>
                                    <tr>
                                        <th><label for="name">남기실 말씀</label></th>
                                        <td><input type="text" class="delivery_memo" id="delivery_memo" name="delivery_memo"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="button" class="btn_black btn" onclick="Order();" value="주문하기">
                            <input type="reset" class="btn_white btn" value="취소">
                        </form>
                    </div>
                    <!-- 오더 -->
	                    <script>
	    function findAddr() {
	           new daum.Postcode({
	                  oncomplete: function(data) {
	                      var addr = ''; // 주소 변수
	                      var extraAddr = ''; // 참고항목 변수
	                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                          addr = data.roadAddress;
	                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                          addr = data.jibunAddress;
	                      }
	                      if(data.userSelectedType === 'R'){
	                          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                              extraAddr += data.bname;
	                          }
	                          if(data.buildingName !== '' && data.apartment === 'Y'){
	                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                          }
	                          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                          if(extraAddr !== ''){
	                              extraAddr = ' (' + extraAddr + ')';
	                          }
	                          // 조합된 참고항목을 해당 필드에 넣는다.
	                      } else {
	                         
	                      }
	                      document.getElementById("zipcode").value = data.zonecode;   //우편번호
	                      document.getElementById("addr1").value = addr;            //주소1
	                      document.getElementById("addr2").focus();               //주소2(상세주소)
	                  }
	              }).open();
	    }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

                                  
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

function Order(){
var price = tot_sum();
var cus_seq = ${scus_seq};
/* var delivery_cus = $('#delivery_cus').val();
var delivery_addr1 = $('#delivery_addr1').val();
var delivery_addr2 = $('#delivery_addr2').val();
var delivery_zipcode = $('#delivery_zipcode').val();
var delivery_memo = $('#delivery_memo').val(); */

var data = $('Form[name=OrderForm').serialize();
data += "&price="+price+"&cus_seq="+cus_seq+"&pcode=";
for (var i = 0; i < $('.pcode').length; i++) {
	if (i != $('.pcode').length - 1 ){
	data += $('.pcode').eq(i).val()+",";	
	}else{
	data += $('.pcode').eq(i).val();
	}
		
}
	data += "&qty2=";
for (var i = 0; i < $('.qty').length; i++) {
	if (i != $('.qty').length -1 ){
	data += $('.qty').eq(i).val()+",";	
	}else{
	data += $('.qty').eq(i).val();
	}
}
$.ajax({
    url : '${path}/Customer/OrderAdd',
    data : data,
    type : 'POST',
    success : function(result) {
 	   alert(result);
 	   location.href='${path}/Customer/Myorder';
	}
    

});//end ajax

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
	return algo2;
	
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