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
        /* 오른쪽 페이지 초기화 */
        .page{width: 100%; position: relative;}
        /* /오른쪽 초기화 */
        /* 마이페이지 */
        .art1 {float: left; margin-left: 5%;}
        .my_title{margin-left: 3.5%; font-size: 1.2em;}
        .table{display: table; border-collapse: collapse; width: 500px;}
        .table tr{display: table-row; height: 70px;}
        .table tr td{display: table-cell; border-bottom: 1px solid #aaaaaa;}
        .table tr td:first-child{padding-left: 20px;}
        .table tr:nth-child(1) td{border: none;}
        .table tr:nth-child(1) td:last-child{text-align: right;}
        .table tr:nth-child(2) td:last-child{text-align: center;}
        .table tr:nth-child(3) td:last-child{text-align: right;}
        .table tr:nth-child(3) td:last-child::after{
            content: ">";
            padding-left: 10px;
            color: #4285f4;
            font-weight: 600;
        }
        .table tr:nth-child(4) td:last-child{text-align: right;}
        .table tr:nth-child(4) td:last-child::after{
            content: ">";
            padding-left: 10px;
            color: #4285f4;
            font-weight: 600;
        }
        .table tr:nth-child(5) td{border-right:  1px solid #aaaaaa;}
        .table tr:nth-child(5) td:first-child::after{
            content: ">";
            padding-left: 70%;
            color: #4285f4;
            font-weight: 600;
        }
        .table tr:nth-child(5) td:last-child{
            border-right: none;
            padding-left: 20px;
        }
        .table tr:nth-child(5) td:last-child::after{
            content: ">";
            padding-left: 67%;
            color: #4285f4;
            font-weight: 600;
        }
        .table .btn_black{
            padding: 6px 20px 6px 20px;
        }
        /* /마이페이지 */
        /* 최근 본 상품 */
        .lately_look {display: block; float: left; margin-left: 10%;}
        .lately_tit {display: block; width: 180px; font-size: 18px; margin-bottom: 5%;}
        .lately_detail div { line-height: 0; float: left;}
        .lately_detail div:nth-child(4){clear: both; float: left;}
        .lately_detail div button { width: 130px; height: 140px; border: 0; }
        .lately_detail button img { width: 100%; height: 100%; }
        /* /최근 본 상품 */
        /* 입금/결제 */
        .order_info{float: left; margin-left: 18%; margin-top: 5%; width: 82%;}
        .info-title{font-size: 1.2em; margin-bottom: 2%;}
        .order_info ul li{float: left; width: 10%; height: auto; margin-right: 20%; position: relative;}
        .order_info ul li:last-child{margin-right: 0;}
        .order_info ul li img{width: 100%; height: auto;}
        /* /입금/결제 */

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

                    <!-- 왼쪽 메뉴 -->
                    <div id="left_gnb">
                        <ul>
                            <li class="gnb_menu">
                                <a href="">마이페이지</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="my_info.html">나의정보</a></li>
                                    <li class="gnb_sub_menu"><a href="order_info.html">주문정보</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /왼쪽 메뉴 -->
                    
                    <div class="page" id="page1">
                        <!-- 마이페이지 -->
                        <article class="art1">
                            <div class="mypage_wrap">
                            <h4 class="my_title">마이페이지</h4>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>이메일</td>
                                        <td colspan="2">${DTO.email }</td>
                                        <td><input type="button" value="정보수정" class="btn_black"></td>
                                    </tr>
                                    <tr>
                                        <td>휴대전화</td>
                                        <td colspan="3">${DTO.phonenum }</td>
                                    </tr>
                                    <tr>
                                        <td>회원등급</td>
                                        <td colspan="3">${DTO.grade_val }</td>
                                    </tr>
                                    <tr>
                                        <td>적립금</td>
                                        <td colspan="3">1000</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><a href="">Q&A</a></td>
                                        <td colspan="2"><a href="">1:1문의</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </article>
                        <!-- /마이페이지 -->
                        <article class="lately_look">
                            <h4 class="lately_tit">최근 본 상품</h4>
                            <div class="lately_detail">
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample1.jpg" alt="sample1">
                                    </button>
                                </div>
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample2.jpg" alt="sample2">
                                    </button>
                                </div>
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample3.jpg" alt="sample3">
                                    </button>
                                </div>
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample4.jpg" alt="sample4">
                                    </button>
                                </div>
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample5.jpg" alt="sample5">
                                    </button>
                                </div>
                                <div class="lately_detail">
                                    <button>
                                        <img src="${path }/resources/img/mypage/sample6.jpg" alt="sample6">
                                    </button>
                                </div>
                            </div>
                        </article>

                        <article class="order_info">
                            <h4 class="info-title">주문 정보</h4>
                            <ul>
                                <li>
                                    <a href="">
                                        <img src="${path }/resources/img/mypage/orderlist.png" alt="img1">
                                        <p>입금/결제</p>n건
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="${path }/resources/img/mypage/delivery_wait.png" alt="img2">
                                        <p>배송준비중</p>n건
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="${path }/resources/img/mypage/delivery_ing.png" alt="img3">
                                        <p>배송중</p>n건
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <img src="${path }/resources/img/mypage/delivery_fin.png" alt="img4">
                                        <p>배송완료</p>n건
                                    </a>
                                </li>
                            </ul>
                        </article>

                        <article>
                            <h4>장바구니</h4>
                        </article>

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

</div>

 </body>
</html>