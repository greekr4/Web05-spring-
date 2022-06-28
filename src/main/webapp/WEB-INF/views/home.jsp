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
</head>
<body>
<h1>
	Hello world!  	
</h1>

<P>  The time on the server is ${serverTime}. </P>

<table>
  <tr>
    <th>아이디</th>
    <th>비밀번호</th>
  </tr>

 <c:forEach items="${list }" var="aa">
  <tr>
    <td>${aa.email }</td>
    <td>${aa.pw }</td>
  </tr>


</c:forEach>
</table>



 </body>
</html>