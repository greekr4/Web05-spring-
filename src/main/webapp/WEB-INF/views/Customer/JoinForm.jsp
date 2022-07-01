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
    width: 300px;
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
    flex-wrap: wrap;
    width: 400px;
}

.id_box {
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
    width: 300px;
    height: 80px;
    margin: 10px auto;
}

.join_btn_box {
    margin: 5px;
}

.join_btn_wrap button {
    border: 1px solid #777;
    width: calc(282px/2);
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
                <h1>회원가입</h1>
         <form:form modelAttribute="CustomerDTO" action="${path }/Customer/Join">
                <div class="login_form">
                    <div class="member_login_box">
                        <div class="id_box">
                            
                           <!-- 실험 -->
            				<iframe name="hiddenf" style="display: none;"></iframe>
                            <table>
                            <!-- (email,pw,name,phonenum,addr1,addr2,zipcode,regdate) -->
                            <tr>
                            <td><form:input path="email" placeholder="email"/></td>
                            <td>
                            <button style="width: 100px;" type="button" id="IDCK">중복확인</button>
                            <script type="text/javascript">
                            $('#IDCK').click(function(){
                            	var email_val = $('#email').val();
                            	window.open('${path}/Customer/IDCK?email='+email_val,'hiddenf');
							});
                            </script>
                            </td>
                            </tr>
                            
                            <tr>
                            <td>
                            <form:input path="pw" placeholder="pw"/>
                            </td>
                            <td></td>
                            </tr>
                            
                            <tr>
                            <td>
                            <input type="text" placeholder="pw 확인">
                            </td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>
                            <form:input path="name" placeholder="name"/>
                            </td>
                            <td></td>
                            </tr>
                            <tr>
                            <td>
                            <form:input path="phonenum" placeholder="phonenum"/>
                            </td>
                            <td></td>
                            </tr>
                            <tr>
                            <td><form:input path="addr1" placeholder="addr1"/></td>
                            <td><form:input path="zipcode" placeholder="zipcode" cssStyle="width:100px; margin:0;"/></td>
                            </tr>
                            <tr>
                            <td><form:input path="addr2" placeholder="addr2"/></td>
                            <td></td>
                            </tr>
                            
                            
                            </table>
                            


                        </div>

                    </div>
                </div>
            <div class="join_btn_wrap">
                <div class="join_btn_box">
                <form:button>회원가입</form:button>
                <button type="reset">취소</button>
                </div>
                                           
            </div>
        </form:form>
            
           
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