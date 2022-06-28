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
    <th>seq</th>
    <th>state</th>
    <th>grade</th>
    <th>email</th>
    <th>pw</th>
    <th>name</th>
    <th>phonenum</th>
    <th>addr1</th>
    <th>addr2</th>
    <th>zipcode</th>
    <th>login_cnt</th>
    <th>regdate</th>
    <th>login_date</th>
    <th>moddate</th>
    
  </tr>

 <c:forEach items="${list }" var="aa">
  <tr>
  	<td>${aa.seq }</td>
  	<td>${aa.state }</td>
  	<td>${aa.grade }</td>
    <td>${aa.email }</td>
    <td>${aa.pw }</td>
    <td>${aa.name }</td>
    <td>${aa.phonenum }</td>
    <td>${aa.addr1 }</td>
    <td>${aa.addr2 }</td>
    <td>${aa.zipcode }</td>
    <td>${aa.login_cnt }</td>
    <td>${aa.regdate }</td>
    <td>${aa.login_date }</td>
    <td>${aa.moddate }</td>
 
  </tr>


</c:forEach>
</table>



 </body>
</html>