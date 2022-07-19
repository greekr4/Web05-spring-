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
      	.order_wrap{
      	width: 100%;
      	}
		.order_tit_box{
		width: 1200px;
		margin-left: 200px;
		}
		.order_wrap h1{
		text-align: center;
		}
		.order_indi_wrap{
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
		.order_indi_wrap table{
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
		.order_indi_wrap table th{
		border-bottom: 1px solid #222;
		height: 2.5em;
		line-height: 2.5em;
		}
		.order_indi_wrap table td{
		text-align: center;
		border-bottom: 1px solid #dbdbdb;
		}
		.order_indi_wrap table button{
		width: 100px;
    	height: 40px;
    	margin: 4px 0;
		}
		.order_indi_wrap table button.up_btn, .order_indi_wrap table button.down_btn{
		width: 20px;
		height: 20px;
		}
		.order_indi_wrap table img{
		display: block;
	    width: 200px;
	    height: 200px;
	    margin: 10px auto;
		}
		.order_indi_wrap table p.pname{
		font-weight: bold;
		line-height: 2.5em;
		
		}
		.order_indi_wrap table td{
		font-weight: bold;
		}
		.order_indi_wrap table td.gray_tit{
		font-weight: 0;
		color: gray;
		}
		.order_indi_wrap table p.psubname{
		font-size:0.8em;
		color: gray;
		}
		.order_indi_wrap table input{
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
		.more{
		color: #999;
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
                    <div class="order_wrap">
	                    <div class="order_tit_box">
	                    	<h1>${sid }님의 주문목록</h1>   
	                    </div>
	                    
	                    <div class="order_indi_wrap">
	                    <table class="table">
							<tr>
							    <th style="width: 15%;">날짜</th>
							    <th>상품정보</th>
							    <th style="width: 15%;">주문금액</th>
							    <th style="width: 15%;">상태</th>
							    <th style="width: 15%;">버튼</th>
							</tr>
							
							<c:forEach items="${List }" var="DTO" varStatus="status">
							<tr class="listline">
								<td><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
								<td>
								<p style="color: #aaa; font-size: 0.8em">주문번호 : ${DTO.seq }</p>
								<a style="cursor: pointer; color: blue;" onclick="LineView(${status.index},${DTO.seq });">자세히보기</a>
								</td>
								<td><fmt:formatNumber value="${DTO.price }" pattern="#,###" />원</td>
								<td>
								<c:choose>
									<c:when test="${DTO.payment_status eq 1 }">
									<img style="width: 100px; height: 100px;" alt="입금대기" src="${path }/resources/img/mypage/orderlist.png">
									<p style="margin-bottom: 10px;">입금대기</p>
									</c:when>
									
									<c:when test="${DTO.payment_status eq 3 && DTO.order_step eq 1 }">
									<img style="width: 100px; height: 100px;" alt="배송준비중" src="${path }/resources/img/mypage/delivery_wait.png">
									<p style="margin-bottom: 10px;">배송준비중</p>
									</c:when>	
										
									<c:when test="${DTO.payment_status eq 3 && DTO.order_step eq 3 }">
									<img style="width: 100px; height: 100px;" alt="배송중" src="${path }/resources/img/mypage/delivery_ing.png">
									<p style="margin-bottom: 10px;">배송중</p>
									</c:when>
									
									<c:when test="${DTO.payment_status eq 3 && DTO.order_step eq 5 }">
									<img style="width: 100px; height: 100px;" alt="배송완료" src="${path }/resources/img/mypage/delivery_fin.png">
									<p style="margin-bottom: 10px;">배송완료</p>
									</c:when>										
								</c:choose>
								</td>
								<td>
								
								<c:choose>
								<c:when test="${DTO.payment_status eq 1 }">
								<button class="btn_black" onclick="location.href='${path}/Customer/PaySystem?price=${DTO.price }&seq=${DTO.seq }'">결제하기</button>
								<button class="btn_white">주문취소</button>
								</c:when>
								<c:when test="${DTO.payment_status eq 3 and DTO.order_step eq 1 }">
								<button class="btn_white">주문취소</button>
								</c:when>
								<c:when test="${DTO.payment_status eq 3 and DTO.order_step eq 3 }">
								<button class="btn_white">배송확인</button>
								</c:when>
								<c:otherwise>
								<button class="btn_white" onclick="LineView(${status.index},${DTO.seq });">후기작성</button>
								</c:otherwise>
								</c:choose>
								</td>
							</tr>
							</c:forEach>
							
					
							</table>
<%-- 						    	<c:forEach items="${List }" var="DTO" varStatus="status">
                                    <tr>
                                        <td><a style="color: blue; cursor: pointer;" onclick="LineView(${status.index},${DTO.seq });">${DTO.seq }</a></td>
                                        <td>${DTO.order_val }</td>
                                        <td>${DTO.payment_val }</td>
                                        <td><fmt:formatNumber value="${DTO.price }" pattern="#,###" /></td>
                                        <td>${DTO.delivery_cus }</td>
                                        <td><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
                                    </tr>
                                   </c:forEach> --%>
	                    
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

function LineView(eqindex,order_no) {
	if($('.line'+eqindex).text() == ''){
		
	
		
		$('.line'+eqindex).remove();
		$.ajax({
			url : '${path}/Admin/OrderLine_json?order_no='+ order_no,
			dataType : 'json',
			success : function(data) {
				$.each(data.OLList, function(index,OLList){
				$('.listline').eq(eqindex).after("<tr class='more line"+eqindex+"'>"
				+"<td><img alt='썸네일' src='${path }/resources/upload/"+OLList.pcode+"/"+OLList.s_img_desc+"'></td>"
				+"<td>"+OLList.pname+"</td>"
				+"<td>"+AmountCommas(OLList.price)+"원</td>"
				+"<td>"+OLList.qty+"개</td>"
				+"<td><button class='btn_black' onclick=\"location.href='${path}/Board/AddForm_Review?p_seq="+OLList.p_seq+ "'\">후기작성</button></td>"
				+"</tr>"
				);	
				})//end each
				$('.listline').eq(eqindex).after("<tr class='more line"+eqindex+"'>"
						+"<td>상품이미지</td>"
						+"<td>상품명</td>"
						+"<td>상품가격</td>"
					    +"<td>주문수량</td>"
					    +"<td></td>"
						+"</tr>");
			}
	
	})//end ajax
	}else{
		$('.line'+eqindex).remove();
	}

}

</script>

 </body>
</html>