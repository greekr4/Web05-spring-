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
    <link rel="stylesheet" href="${path }/resources/css/reset.css">
    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <style>
/* 로그인 */
#contents {
    clear: both;
    width: 100%;
    margin: 0 auto;
    overflow: hidden;
}

.login_wrap {
    margin: 50px auto;
}

.login_wrap h1 {
    text-align: center;
    font-size: 30px;
    font-weight: bold;
}

.login_form {
    border: 1px solid #777;
    width: 400px;
    margin: 50px auto;
    margin-bottom: 10px;
}

.login_wrap button {
    background: #222;
    border: 1px solid #222;
    color: #fff;
    font-weight: 500;
    cursor: pointer;
}

.login_wrap button:hover {
    background: #4e4f58;
    border: 1px solid #4e4f58;
}

.member_login_box {
    display: flex;
    flex-wrap: wrap;
    width: 400px;
    height: 150px;
}

.id_box {
    width: 200px;
    height: 100px;
}

.login_btn_box {
    width: 200px;
    height: 100px;
}

.login_btn_box button {
    display: block;
    margin: 20% auto;
    height: 55px;
    width: 180px;
}

.login_form h1 {
    text-align: left;
    font-size: 16px;
    font-weight: bold;
    margin: 10px;
}

.login_form input {
    display: block;
    margin: 10px;
}

.id_save_box {
    width: 100%;
    height: 30px;
}

.id_save_box input {
    display: inline;

}

.join_btn_wrap {
    border: 1px solid #777;
    width: 400px;
    height: 80px;
    margin: 10px auto;
}

.join_btn_box {
    margin: 5px;
}

.join_btn_wrap button {
    border: 1px solid #777;
    width: calc(376px/3);
    height: 70px;

}

/* /로그인 */
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
                <div class="login_wrap">
                <h1>로그인</h1>
                <form action="${path }/Customer/Login" method="POST">
                <div class="login_form">
                    <div class="member_login_box">
                        <div class="id_box">
                            <h1>회원로그인</h1>
                            <input type="text" placeholder="이메일" name="email">
                            <input type="password" placeholder="비밀번호" name="pw">
                        </div>
                        <div class="login_btn_box">
                            <button>Login</button>
                        </div>
                        <div class="id_save_box">
                            <fieldset>
                            <input type="checkbox">
                            <label for="">아이디저장</label>
                        </fieldset>
                        </div>
                    </div>
                </div>
            </form>
            <div class="join_btn_wrap">
                <div class="join_btn_box">
                <button>가입</button>
                <button>아이디찾기</button>
                <button>비밀번호찾기</button>
                </div>
            </div>
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