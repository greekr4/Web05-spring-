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
<title>통합 테스트 페이지</title>
</head>
<body>
<h2>Controller -> Service -> DAO -> MyBatis -> DB And View <strong>Integration Test</strong></h2>
<p>회원수 : ${cnt }</p>

<table>
	<tr>
		<th>연번</th>
		<th>아이디</th>
		<th>성명</th>
		<th>가입일자</th>
	</tr>
	<c:forEach items="${sampleList }" var="sample" varStatus="status">
	<tr>
		<td>${status.count }</td>
		<td>${sample.email }</td>
		<td>${sample.name }</td>
		<td>${sample.regdate }</td>
	</tr>
	</c:forEach>
</table>

</body>
</html>