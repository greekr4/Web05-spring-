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
        .container_wrap{clear: both; width: 100%;}
        .main_wrap{clear: both; margin-top: 4%; margin-bottom: 4%;}
        /* /초기화 */
        /* 페이지 제목 */
        .main_title{
            text-align: center;
        }
        .main_title h2{
            margin-bottom: 2%;
        }
        .main_title p{
            font-size: 1.1em;
        }
        /* /페이지 제목 */
        /* 회원가입 완료 */
        .main_content{
            display: block;
            width: 600px;
            margin: 0 auto;
            margin-top: 4%;
            border: 1px solid #dcdcdc;
            text-align: center;
            padding-top: 2%;
            padding-bottom: 2%;
        }
        .main_content .join_title{
            margin-bottom: 8%;
        }
        .main_content .join_con p{
            margin-bottom: 2%;
        }
        .main_content .btn_group{
            margin-top: 10%;
        }
        .btn {
            margin-top: 2%;
            width: 20%;
            padding: 5px 0 9px 0;
        }
        /* /회원가입 완료 */
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
                    <div class="main">
                        <!-- 가입완료 타이틀 -->
                        <div class="main_title">
                            <h2>회원가입</h2>
                            <p>01 약관동의 > 02 정보입력 > <strong>03 가입완료</strong></p>
                        </div>
                        <!-- /가입완료 타이틀 -->
                        <!-- 가입완료 본문 -->
                        <div class="main_content">
                            <div class="joinok">
                                <div class="join_title">
                                    <h3>회원 가입을 진심으로 축하드립니다.</h3>
                                </div>
                                <div class="join_con">
                                    <p>회원 가입 절차가 완료 되었습니다.</p>
                                    <p>다양한 혜택과 상품을 만나보세요</p>
                                </div>
                                <div class="btn_group">
                                    <input type="button" class="btn_black btn" value="로그인" onclick="location.href='${path}/Customer/LoginForm'">
                                </div>
                            </div>
                        </div>
                        <!-- /가입완료 본문 -->
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


 </body>
</html>