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
                    <!-- A메뉴 -->
                    <li class="main"> 
                      	 <label class="main_label">
								A
                      	 </label>
                        <ul class="menuA">
                        <!-- 서브메뉴 -->

 

                        <!-- /서브메뉴 -->
                        </ul>
                    </li>
                    <!-- 메뉴 끝 -->
                    
                    <!-- B메뉴 -->
                    <li class="main"> 
                      	 <label class="main_label">
								B
                      	 </label>
                        <ul class="menuB">
                        <!-- 서브메뉴 -->


                        <!-- /서브메뉴 -->
                        </ul>
                    </li>
              
                    <!-- 메뉴 끝 -->
                    
                    <!-- C메뉴 -->
                    <li class="main"> 
                      	 <label class="main_label">
								C
                      	 </label>
                        <ul class="menuC">
                        <!-- 서브메뉴 -->


                        <!-- /서브메뉴 -->
                        </ul>
                    </li>
                    <!-- 메뉴 끝 -->
                    
                    <!-- D메뉴 -->
                    <li class="main"> 
                      	 <label class="main_label">
								D
                      	 </label>
                        <ul class="menuD">
                        <!-- 서브메뉴 -->


                        <!-- /서브메뉴 -->
                        </ul>
                    </li>
                    <!-- 메뉴 끝 -->
                    
                    <!-- E메뉴 -->
                    <li class="main"> 
                      	 <label class="main_label">
								E
                      	 </label>
                        <ul class="menuE">
                        <!-- 서브메뉴 -->


                        <!-- /서브메뉴 -->
                        </ul>
                    </li>
                    <!-- 메뉴 끝 -->                                                                                
                    
                    

                    <li class="main">
                        <label class="main_label">커뮤니티</label>
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
						<li class="main"><a href="${path }/Admin/OrderList">Admin</a></li>
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
           

                	$.ajax({				
                		url : "${path }/Category/list_json", // MemberJSONCtrl의 JSONObject 값을 가져옴
                		dataType : "json", // 데이터 타입을 json
                		contentType: 'application/x-www-form-urlencoded; charset=euc-kr', // UTF-8처리
                		cache : false, // true : 새로 고침 동작을 하지 않고, 저장된 캐시에서 불러오게됨, false:새로 불러옴 
                		success : function(data) {
                					var key = Object.keys(data["CateList"][0]); // 키값(항목명)을 가져옴		
                					//$(".main").empty();
                					$.each(data.CateList, function(index, CateList) { // 이치를 써서 모든 데이터들을 배열에 넣음												
                						var items = [];		
                						
                						//메인 메뉴 6개
                						if(CateList.code == 'A00'){
                						$('.main_label').eq(0).text(CateList.name);
                						}else if(CateList.code == 'B00'){
                    					$('.main_label').eq(1).text(CateList.name);
                    					}else if(CateList.code == 'C00'){
                    					$('.main_label').eq(2).text(CateList.name);
                    					}else if(CateList.code == 'D00'){
                    					$('.main_label').eq(3).text(CateList.name);
                    					}else if(CateList.code == 'E00'){
                    					$('.main_label').eq(4).text(CateList.name);
                    					}else if(CateList.code == 'F00'){
                    					$('.main_label').eq(5).text(CateList.name);
                    					}
                					
                						if((CateList.code).substr(0,2) == 'A1'){
                						$('.menuA').append("<li class='sub'><a href='${path }/Product/Menu?ccode="+CateList.code+"'>"+CateList.name+"</a></li>")
                						}else if((CateList.code).substr(0,2) == 'B1'){
                						$('.menuB').append("<li class='sub'><a href='${path }/Product/Menu?ccode="+CateList.code+"'>"+CateList.name+"</a></li>")
                						}else if((CateList.code).substr(0,2) == 'C1'){
                						$('.menuC').append("<li class='sub'><a href='${path }/Product/Menu?ccode="+CateList.code+"'>"+CateList.name+"</a></li>")
                						}else if((CateList.code).substr(0,2) == 'D1'){
                						$('.menuD').append("<li class='sub'><a href='${path }/Product/Menu?ccode="+CateList.code+"'>"+CateList.name+"</a></li>")
                						}else if((CateList.code).substr(0,2) == 'E1'){
                						$('.menuE').append("<li class='sub'><a href='${path }/Product/Menu?ccode="+CateList.code+"'>"+CateList.name+"</a></li>")
                						}
                						//alert(CateList.name);
                					});//each끝				
                				}			
                		});	
                		 
                	
                
                
                
                

                    //헤더 메뉴
                    
                    $('.main').click(function () {
                    	var box_width =
                    		$('.main').eq(1).outerWidth() +
                    		$('.main').eq(2).outerWidth() +
                    		$('.main').eq(3).outerWidth() +
                    		$('.main').eq(4).outerWidth() +
                    		$('.main').eq(5).outerWidth() +
                    		$('.main').eq(6).outerWidth() +
                    		270;
    						$('.sub_box').css('width',box_width);
                    	
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