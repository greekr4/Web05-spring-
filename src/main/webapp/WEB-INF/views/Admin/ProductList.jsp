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
        /* 메뉴관리 - 제품관리 */
        .btn_group{
            display: block;
            position: absolute;
            right: 0;
            top: 0;
        }
        .btn_group input[type="button"]{
            padding: 7px 14px 8px 14px;
            font-size: 14px;
        }
        /* /메뉴관리 - 제품관리 */
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
                    <!-- 주문관리 - 주문관리 -->
                             <!-- 메뉴관리 - 제품관리 -->
                    <article class="page">
                        <div class="page_content">
                            <!-- 검색 -->
                            <div class="search_box">
                                <form action="/myapp/board/news_search" method="POST">
                                    <select name="search_type">
                                        <option value="1">이름</option>
                                        <option value="2">ㅁㅁ</option>
                                    </select>
                                    <input type="hidden" id="type" name="type" value="2">
                                    <input type="text" id="search" name="search">
                                    <button type="submit" class="btn_clear">검색</button>
                                </form>
                            </div>
                            <!-- /검색 -->
                            <!-- 제품 목록 -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>no</th>
                                        <th>품목코드</th>
                                        <th>품목명</th>
                                        <th>노출여부</th>
                                        <th>단가</th>
                                        <th>재고</th>
                                        <th>할당재고</th>
                                        <th>할인율</th>
                                        <th>등록일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>3</td>
                                        <td>p0003</td>
                                        <td><a href="/myapp/board/more2.html">동협상추</a></td>
                                        <td>노출</td>
                                        <td>1000원</td>
                                        <td>200</td>
                                        <td>10</td>
                                        <td>0</td>
                                        <td>2022-06-30</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>p0002</td>
                                        <td><a href="/myapp/board/more2.html">재영이 브론즈 뱃지</a></td>
                                        <td>노출안함</td>
                                        <td>400원</td>
                                        <td>200</td>
                                        <td>1</td>
                                        <td>80%</td>
                                        <td>2022-06-30</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>p0001</td>
                                        <td><a href="/myapp/board/more2.html">성피리 양파</a></td>
                                        <td>노출</td>
                                        <td>5,900원</td>
                                        <td>200</td>
                                        <td>55</td>
                                        <td>0</td>
                                        <td>2022-06-30</td>
                                    </tr>                                    
                                </tbody>
                            </table>
                            <!-- /제품 목록 -->
                            <div class="btn_group">
                                <input type="button" class="btn_black" value="제품등록">
                            </div>
                        </div>
                    </article>
                    <!-- /메뉴관리 - 제품관리 -->
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
$('.gnb_sub_menu').eq(5).find('a').css('font-weight','bold');
</script>
 </body>
</html>