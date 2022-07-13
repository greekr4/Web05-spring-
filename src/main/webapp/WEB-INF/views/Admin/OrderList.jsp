<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        /* 오른쪽 컨텐츠 초기화 */
        .page{
            float: left;
            width: 85%;
            margin-left: 2%;
        }
        .page_content{
            position: relative;
            clear: both;
            width: 100%;
        }
        /* /오른쪽 컨텐츠 초기화 */
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
        /* 페이지 공통 - 리스트 테이블 */
        .table {
            display: table;
            width: 100%;
            border-collapse: collapse;
        }
        .table tr{
            display: table-row;
        }
        .table tr th, .table tr td{
            display: table-cell;
            padding: 12px 0 12px 0;
        }
        .table tr th{
            border-top: 2px solid #000;
            border-bottom: 1px solid #777;
            background-color: #ededed;
            text-align: center;
        }
        .table tr td{
            border-bottom: 1px solid #777;
            text-align: center;
        }
        /* /페이지 공통 - 리스트 테이블 */
        .table img{
        width: 155px;
        height: 155px;
        }
        .more>th, .more>td{
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
                    <!-- 주문관리 - 주문관리 -->
                    <article class="page">
                        <div class="page_content">
                             <!-- 검색 -->
                            <div class="search_box">
                                <form action="/myapp/board/news_search" method="POST">
                                    <select name="search_type">
                                        <option value="1">이름</option>
                                        <option value="2">주문번호</option>
                                    </select>
                                    <input type="hidden" id="type" name="type" value="2">
                                    <input type="text" id="search" name="search">
                                    <button type="submit" class="btn_clear">검색</button>
                                    <button type="button" class="btn_clear" style="float: right; width: 100px; margin-right: 3%;" onclick="location.href='${path}/Admin/OrderList_OK';">처리완료 (${OkCnt })</button>
                                    <button type="button" class="btn_clear" style="float: right; width: 100px; margin-right: 1%;" onclick="location.href='${path}/Admin/OrderList_PayOK';">입금확인 (${PayOkCnt })</button>
                                    <button type="button" class="btn_clear" style="float: right; width: 100px; margin-right: 1%;" onclick="location.href='${path}/Admin/OrderList';">전체보기 (${OrderCnt })</button>
                                </form>
                            </div>
                            <!-- /검색 -->
                            <!-- 주문서 테이블 -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>주문번호</th>
                                        <th>주문상태</th>
                                        <th>입금상태</th>
                                        <th>총 금액</th>
                                        <th>이름</th>
                                        <th>주문일자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${List }" var="DTO" varStatus="status">
                                    <tr>
                                        <td><a style="color: blue; cursor: pointer;" onclick="LineView(${status.index},${DTO.seq });">${DTO.seq }</a></td>
                                        <td>
                                        
                                        <c:choose>
                                        <c:when test="${DTO.order_step eq 1 }">
                                        <select class="order_step">
                                        <option value="1" selected>접수중</option>
                                        <option value="3">배송중</option>
                                        <option value="5">배송완료</option>
                                        </select>
                                        </c:when>
                                        <c:when test="${DTO.order_step eq 3 }">
                                        <select class="order_step">
                                        <option value="1">접수중</option>
                                        <option value="3" selected>배송중</option>
                                        <option value="5">배송완료</option>
                                        </select>
                                        </c:when>
                                        <c:when test="${DTO.order_step eq 5 }">
                                        <select class="order_step">
                                        <option value="1">접수중</option>
                                        <option value="3">배송중</option>
                                        <option value="5" selected>배송완료</option>
                                        </select>
                                        </c:when>
                                        </c:choose>
                                        
                                        
                                        &nbsp;<button class="btn_white" onclick="EditOS(${DTO.seq },${status.index});">처리</button>
                                        </td>
                                        <td>
                                        <c:choose>
                                        <c:when test="${DTO.payment_status eq 1 }">
                                        <select class="payment_status">
                                        <option value="1" selected>입금대기</option>
                                        <option value="3">입금확인</option>
                                        </select>
                                        </c:when>
                                        
                                        <c:when test="${DTO.payment_status eq 3 }">
                                        <div style="position: relative;">
                                        <div style="position: absolute; color: red; left: 55px;">*</div>
                                        <select class="payment_status">
                                        <option value="1">입금대기</option>
                                        <option value="3" selected>입금확인</option>
                                        </select>
                                        </div>
                                        </c:when>
                                        
                                        
                                        </c:choose>
                                        </td>
                                        <td><fmt:formatNumber value="${DTO.price }" pattern="#,###" /></td>
                                        <td>${DTO.delivery_cus }</td>
                                        <td><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
                                    </tr>
                                   </c:forEach>
                                </tbody>
                                
                            </table>
                            <!-- 주문서 테이블 -->
                        </div>
                    </article>
                   <!-- /주문관리 - 주문관리 -->
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
$('.gnb_sub_menu').eq(0).find('a').css('font-weight','bold');


function EditOS(seq,index) {
	var order_step = $('.order_step').eq(index).val();
	var href = "${path}/Admin/OrderStepEdit?seq="+seq+"&order_step="+order_step;
	window.open(href,'hiddenf');
	
}

function AmountCommas(val) {
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


function LineView(eqindex,order_no) {
	if($('.line').text() == ''){
		
	
		
		$('.line').remove();
		$.ajax({
			url : '${path}/Admin/OrderLine_json?order_no='+ order_no,
			dataType : 'json',
			success : function(data) {
				$.each(data.OLList, function(index,OLList){
				$('.table > tbody > tr').eq(eqindex).after("<tr class='more line'>"
				+"<td colspan='2'><img alt='썸네일' src='${path }/resources/upload/"+OLList.pcode+"/"+OLList.s_img_desc+"'></td>"
				+"<td>"+OLList.pname+"</td>"
				+"<td>"+AmountCommas(OLList.price)+"원</td>"
				+"<td>"+OLList.qty+"개</td>"
				+"<td></td>"
				+"</tr>"
				);	
				})//end each
				$('.table > tbody > tr').eq(eqindex).after("<tr class='more line'>"
						+"<td colspan='2'>상품이미지</td>"
						+"<td>상품명</td>"
						+"<td>상품가격</td>"
					    +"<td>주문수량</td>"
					    +"<td></td>"
						+"</tr>");
			}
	
	})//end ajax
	}else{
		$('.line').remove();
	}

}

</script>
 </body>
</html>