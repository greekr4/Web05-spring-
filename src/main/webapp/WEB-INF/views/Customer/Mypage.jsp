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
    <link rel="stylesheet" href="${path }/resources/css/reset.css">
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <style>
   /* 초기화 */
        * { margin: 0; padding: 0;}
        ul { list-style: none; } 
        a { text-decoration: none; color: #222; }
        html, body { height: 100%;}
        #container{clear: both; width: 100%;}
        .container_wrap{clear: both; width: 100%; }
        .main_wrap{clear: both; width: 1400px; margin: 0 auto; }
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
        
        .btn_black { width: 80px; height: 30px;}

        /* 마이페이지 메인 */
        .mypage_box { display: block; width: 1100px; padding-top: 30px; padding-left: 40px; float: left; }
        .mypage_tb { display: table; border-collapse: collapse; width: 500px; margin-left: 30px; margin-top: 45px; }
        .mypage_tb tr { display: table-row; height: 60px; }
        .mypage_tb tr td { display: table-cell; width: 25%; font-size: 16px; font-weight: lighter;  border-bottom: 1px solid #aaaaaa; }
        .mypage_td_btn { text-align: right; }
        .mypage_tb_td1 { text-align: center; }
        .mypage_tb_tdright, .mypage_tb_td2_1  { text-align: right; padding-right: 15px; }
        .mypage_tb_tdright.tdright1 { border: 1px solid #aaaaaa; border-left: 0;}
        
        /* 최근 본 상품 */
        .lately_look { display: block; }
        .lately_tit { display: block; width: 180px; font-size: 18px; }
        .lately_detail { height: auto;}
        .lately_detail div { float: left; line-height: 0;  }
        .lately_detail div:nth-child(4) { clear: both; }
        .lately_detail div button { width: 130px; height: 140px; border: 0; }
        .lately_detail button img { width: 100%; height: 100%; }


        .square_box_top { margin: 50px 15px 15px 100px; }
        .square_box_top ul li { float: left; padding: 20px 60px 20px 60px; text-align: center; border: 1px solid #dbdbdb;
            line-height: 2em;  }
        .square_box_top ul li h3 { width: 100px; font-size: 16px; }
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

                    <!-- 오른쪽 메뉴 -->
                    <div class="mypage_box">
                        <h2 class="tit">마이페이지</h2>
                        
                        <section class="mypage_section1">
                            <table class="mypage_tb">
                                <tbody>
                                    <tr>
                                        <td class="mypage_tb_td1">이메일</td>
                                        <td colspan="2" class="mypage_tb_td2">123456@naver.com</td>
                                        <td class="mypage_td_btn">
                                            <input type="button" class="btn_black" value="정보수정">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mypage_tb_td1">휴대전화</td>
                                        <td colspan="3" class="mypage_tb_td2">010-1234-5678</td>
                                    </tr>
                                    <tr>
                                        <td class="mypage_tb_td1 mypage_tb_td1_td2">회원등급</td>
                                        <td colspan="3" class="mypage_tb_td2_1">7</td>
                                    </tr>
                                    <tr>
                                        <td class="mypage_tb_td1 mypage_tb_td1_td2">적립금</td>
                                        <td colspan="3" class="mypage_tb_td2_1">1000P</td>
                                    </tr>
                                    <tr class="last">
                                        <td class="mypage_tb_td1">Q&A</td>
                                        <td class="mypage_tb_tdright tdright1">></td>
                                        <td class="mypage_tb_td1">1:1 상담문의</td>
                                        <td class="mypage_tb_tdright tdright2">></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="lately_look">
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
                            </div>
                        
                            <!-- <div class="order_info">
                                <h2>주문 정보</h2>
                                <div class="square_box_top">
                                    <ul class="">
                                        <a href="">
                                            <li class="square_box_bgi1">
                                                <img src="${path }/resources/img/mypage/orderlist.png">
                                                <h3 class="">입금/결제</h3>
                                                n건
                                            </li>
                                        </a>
                                        <a href="">
                                            <li class="square_box_bgi2">
                                                <img src="${path }/resources/img/mypage/delivery_wait.png">
                                                <h3 class="">배송준비중</h3>
                                                n건
                                            </li>
                                        </a>
                                        <a href="">
                                            <li class="square_box_bgi3">
                                                <img src="${path }/resources/img/mypage/delivery_ing.png">
                                                <h3 class="">배송중</h3>
                                                n건
                                            </li>
                                        </a>
                                        <a href="">
                                            <li class="square_box_bgi4">
                                                <img src="${path }/resources/img/mypage/delivery_fin.png">
                                                <h3 class="">배송완료</h3>
                                                n건
                                            </li>
                                        </a>
                                    </ul>
                                </div>
                            </div> -->

                        </section>
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