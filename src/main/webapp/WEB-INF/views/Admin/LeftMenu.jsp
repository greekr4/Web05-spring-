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
                                <a href="">주문관리</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/OrderList">주문관리</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/CusList">실시간 상담</a></li>
                                </ul>
                            </li>
                            <li class="gnb_menu">
                                <a href="">회원관리</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/CusList">회원목록</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/CusDorList">휴면회원</a></li>
                                </ul>
                            </li>
                            <li class="gnb_menu">
                                <a href="">메뉴관리</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/Category">카테고리관리</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/ProductList">제품관리</a></li>
                                </ul>
                            </li>
                            <li class="gnb_menu">
                                <a href="">게시판관리</a>
                                <ul>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/NoticeList">공지사항</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/FAQList">FAQ</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/QNAList">Q&A</a></li>
                                    <li class="gnb_sub_menu"><a href="${path }/Admin/ReviewList">후기관리</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /왼쪽 메뉴 -->