<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
                <!-- 헤더 -->
                <ul class="">
                    <li class="logo">
                        <a href="${path }/"><img src="${path }/resources/img/common/logo.png" alt="로고"></a>
                    </li>
                </ul>
                <ul class="gnb">
                    <li class="main">
                        <ul>
                            <li class="sb"><div class="sub_box"></div></li>
                        </ul>
                    </li>
                    <li class="main">
                        정육·계란
                        <ul>
                            <li class="sub"><a href="${path }/Product/Menu">소고기</a></li>                 
                            <li class="sub"><a href="">돼지고기</a></li>
                            <li class="sub"><a href="">계란류</a></li>
                        </ul>
                    </li>
                    <li class="main">
                        국·반찬·메인요리
                        <ul>
                            <li class="sub"><a href="">국·탕·찌개</a></li>
                            <li class="sub"><a href="">밀키트·메인요리</a></li>
                            <li class="sub"><a href="">밑반찬</a></li>
                            <li class="sub"><a href="">김치·젓갈·장류</a></li>
                        </ul>
                    </li>
                    <li class="main">
                        샐러드·간편식
                        <ul>
                            <li class="sub"><a href="">샐러드·닭가슴살</a></li>
                            <li class="sub"><a href="">도시락·밥류</a></li>
                            <li class="sub"><a href="">떡볶이·튀김·순대</a></li>
                        </ul>
                    </li>
                    <li class="main">
                        면·양념·오일
                        <ul>
                            <li class="sub"><a href="">파스타·면류</a></li>
                            <li class="sub"><a href="">식초·소스·드레싱</a></li>
                            <li class="sub"><a href="">식용유·참기름·오일</a></li>
                        </ul>
                    </li>
                    <li class="main">
                        빵·치즈·델리
                        <ul>
                            <li class="sub"><a href="">식빵·빵류</a></li>
                            <li class="sub"><a href="">잼·버터·스프레드</a></li>
                            <li class="sub"><a href="">치즈</a></li>
                            <li class="sub"><a href="">델리</a></li>
                        </ul>
                    </li>
                    <li class="main">
                        커뮤니티
                        <ul>
                            <li class="sub"><a href="">공지사항</a></li>
                            <li class="sub"><a href="">문의게시판</a></li>
                            <li class="sub"><a href="">동협게시판</a></li>
                            <li class="sub"><a href="">재영게시판</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- 오른쪽 정렬이라 순서 반대-->

                <div class="user_bar">
                    <ul class="user_menu">
                    	<c:if test="${empty sid }">
                        <li class="main"><a href="${path }/Customer/LoginForm">Login</a></li>
                        <li class="main"><a href="${path }/Customer/Agreement">Join</a></li>
                        </c:if>
                        <c:if test="${!empty sid }">

						<c:if test="${fn:contains(sid,'admin') }">
						<li class="main"><a href="${path }/Admin/OrderList">관리자메뉴</a></li>
						</c:if>
                        
                        <li class="main2">
                            <ul>
                                <li class="sb"><div class="sub_box2"></div></li>
                            </ul>
                        </li>
                        <li class="main2">Mypage
                            <ul>
                                <li class="sub"><a href="${path }/Customer/Mypage">나의정보</a></li>
                                <li class="sub"><a href="">주문정보</a></li>
                            </ul>
                        </li>
                        <li class="main"><a href="${path }/Customer/Logout">Logout</a></li>
                        </c:if>
                    </ul>
                </div>
                <!-- 헤더끝 -->

                <script>



                    //헤더 메뉴
                    
                    $('.main').click(function () {
                        //$(this).find('ul').css('display','block');
                        $('.main').find('ul').slideUp('fast');
                        $('.main2').find('ul').slideUp('fast');
                        if ($(this).find('ul').css('display') == 'none') {
                            $('.sub_box').slideDown('fast');
                            $('.main').children('ul').slideDown('fast');
                            $(this).find('ul').slideDown('fast');
                            
                        }
                    });
        
                    $('.main2').click(function () {
                        //$(this).find('ul').css('display','block');
                        $('.main2').find('ul').slideUp('fast');
                        $('.main').find('ul').slideUp('fast');
                        if ($(this).find('ul').css('display') == 'none') {
                            $('.sub_box2').slideDown('fast');
                            $('.main2').children('ul').slideDown('fast');
                            $(this).find('ul').slideDown('fast');
                            
                        }
                    });

                </script>