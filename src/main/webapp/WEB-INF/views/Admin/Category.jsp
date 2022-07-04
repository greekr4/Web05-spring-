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
        /* 메뉴관리 - 카테고리 */
        .table tr td .btn_white{
            padding: 4px 6px 4px 6px;
        }
        .outcode{
            border: none;
            width: 80%;
            height: 4.2vh;
            text-align: center;
        }
        .outcode:focus{
            outline: none;
        }
        #incode_form{
            margin-top: 4%;
        }
        #incode_form .incode{
            border-top: none;
            border-right: none;
            border-bottom: 1px solid rgb(190, 190, 190);
            border-left: none;

            width: 80%;
            height: 4.2vh;
            text-align: center;
        }
        #incode_form .incode:focus{
            outline: none;
        }
        #incode_form .btn_black{
            padding: 3px 0 3px 0;
            width: 60px;
            margin-right: 5px;
        }
        #incode_form .btn_clear{
            padding: 4px 0 3px 0;
            width: 60px;
        }
        #bt_confirm{
            clear: both;
            margin-top: 5%;
            width: 120px;
            position: absolute;
            top:100%;
            left: 39.5%;
        }
        #bt_confirm a{
            display: block;
            padding: 5px 0 5px 0;
            color: #fff;
            text-align: center;
        }
        /* /메뉴관리 - 카테고리 */
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
                      <!-- 메뉴관리 - 카테고리 관리 -->
                    <article class="page">
                        <div class="page_content">
                            <form action="" method="post" name="outcode_form" id="code_form">
                                <table class="table" style="width: 50%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%;">순서</th>
                                            <th style="width: 20%;">코드</th>
                                            <th style="width: 45%;">코드명</th>
                                            <th style="width: 15%;">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="outcode" name="orderby" id="orderby" value="0"></td>
                                            <td><input type="text" class="outcode" name="code" id="code" value="a00"></td>
                                            <td><input type="text" class="outcode" name="desc" id="desc" value="정육 · 계란"></td>
                                            <td><input type="button" value="삭제" class="btn_white" onclick="delContent(code)"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="outcode" name="orderby" id="orderby" value="1"></td>
                                            <td><input type="text" class="outcode" name="code" id="code" value="a11"></td>
                                            <td><input type="text" class="outcode" name="desc" id="desc" value="소고기"></td>
                                            <td><input type="button" value="삭제" class="btn_white" onclick="delContent(code)"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" class="outcode" name="orderby" id="orderby" value="2"></td>
                                            <td><input type="text" class="outcode" name="code" id="code" value="a12"></td>
                                            <td><input type="text" class="outcode" name="desc" id="desc" value="돼지고기"></td>
                                            <td><input type="button" value="삭제" class="btn_white" onclick="delContent(code)"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                            <form action="" method="post" name="incode_form" id="incode_form">
                                <table class="input_table" style="width: 50%;">
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="incode" placeholder="순서입력"></td>
                                            <td><input type="text" class="incode" placeholder="코드"></td>
                                            <td><input type="text" class="incode" placeholder="메뉴명"></td>
                                            <td><input type="submit" class="btn_black" value="입력"></td>
                                            <td><input type="reset" class="btn_clear" value="재입력"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </article>
                    <!-- /메뉴관리 - 카테고리관리 -->
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
$('.gnb_sub_menu').eq(4).find('a').css('font-weight','bold');
</script>
 </body>
</html>