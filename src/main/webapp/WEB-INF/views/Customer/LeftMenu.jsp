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
                 <!-- 왼쪽 메뉴 -->
                    <div id="left_gnb">
                        <ul>
                            <li class="gnb_menu">
                                <a href="">마이페이지</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="${path }/Customer/Mypage">나의정보</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Customer/Mybasket">장바구니</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Customer/Myorder">주문정보</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /왼쪽 메뉴 -->