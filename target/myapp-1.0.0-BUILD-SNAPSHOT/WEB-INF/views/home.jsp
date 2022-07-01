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
</head>
<body>
   <div id="wrap">
        <header id="hd">
            <div class="hd_wrap">
             <c:import url="./hd.jsp"/>
            </div>
        </header>


        <div id="container">
            <div id="container_wrap">
                <!-- 본문  -->

                <div class="slider">
                    <div class="slider_hider">
                        <div class="slider_item1 slider_item">
                            <div style="width: 100%; height: 400px; margin: 100px auto;">
                            <img src="${path}/resources/img/main/main_slider1.webp" alt="슬라이더이미지1">
                        </div>
                        </div>
                        <div class="slider_item2 slider_item">
                            <div style="width: 100%; height: 400px; margin: 100px auto;">
                            <img src="${path}/resources/img/main/main_slider2.jpg"  alt="슬라이더이미지2">
                        </div>
                        </div>
                        <div class="slider_item3 slider_item">
                            <div style="width: 100%; height: 400px; margin: 100px auto;">
                            <img src="${path}/resources/img/main/main_slider3.webp"  alt="슬라이더이미지3">
                        </div>
                        </div>
                    </div>
                </div>
                <div class="slider_btn_box">
                    <div class="slider_left_btn_box">
                        <div class="slider_left_btn">
                            
                        </div>
                    </div>
                    <div class="slider_right_btn_box">
                        <div class="slider_right_btn"></div>
                    </div>

                </div>

                <div class="intro_wrap">
                    <div class="intro01">
                        <div class="intro01_tit01">
                            <h1 style="text-align: center;">Bn2U</h1>
                        </div>
                        <div class="intro01_visual">
                            <h1>전통주</h1>
                            <img src="${path}/resources/img/main/main_intro01.jpg" alt="dd">
                            <h2>오산양조 하얀까마귀</h2>
                            <h3>새콤달콤한<br>풍미의 쌀 막걸리</h3>
                        </div>
                    </div>
                    <div class="intro02">
                        <div class="intro02_visual">
                            <h1>더벨로</h1>
                            <img src="${path}/resources/img/main//main_intro02.jpg" alt="dd">
                            <h2>치즈 바게트</h2>
                            <h3>롤치즈가<br>콕콕 박힌</h3>
                        </div>
                        <div class="intro02_visual02">
                            <h1>태우한우</h1>
                            <img src="${path}/resources/img/main//main_intro03.jpg" alt="dd">
                            <h2>한우 티본 스테이크</h2>
                            <h3>가정에서 만나는<br>고급 스테이크</h3>
                        </div>

                    </div>

                </div>

                <div class="best_wrap">
                    <div class="best">
                        <div class="best_tit">
                            <h1>BEST PRODUCTS</h1>
                        </div>
                        <div class="best_slider_box">
                            <!-- 아이템은 무조건 *3배수가 있어야함 -->
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best01.jpg" alt="1">
                                <h2>돼지와 달걀1</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best02.jpg" alt="2">
                                <h2>돼지와 달걀2</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best03.jpg" alt="3">
                                <h2>돼지와 달걀3</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best02.jpg" alt="4">
                                <h2>돼지와 달걀4</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best01.jpg" alt="5">
                                <h2>돼지와 달걀5</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best03.jpg" alt="6">
                                <h2>돼지와 달걀6</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best03.jpg" alt="7">
                                <h2>돼지와 달걀7</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best02.jpg" alt="8">
                                <h2>돼지와 달걀8</h2>
                                <h3>39,000원</h3>
                            </div>
                            <div class="best_item">
                                <img src="${path}/resources/img/main/main_best01.jpg" alt="9">
                                <h2>돼지와 달걀9</h2>
                                <h3>39,000원</h3>
                            </div>

                        </div>
                        <div class="best_btn_wrap">
                            <div class="best_left_btn_box">
                                <div class="best_left_btn"></div>
                            </div>
                            <div class="best_right_btn_box">
                                <div class="best_right_btn"></div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="event_wrap">
                    <div class="event">
                        <a href="#">
                        <div class="sale_prod">
                            <div class="event_txt">
                            <h1>sale products</h1>
                            <h2>#특가&nbsp&nbsp#세일&nbsp&nbsp#재영이&nbsp&nbsp#동협이</h2>
                            </div>
                            <div class="event_btn">
                                <div class="arrow">
                                    →
                                </div>
                            </div>
                        </div>
                        </a>
                        <a href="#">
                        <div class="new_prod">
                            <div class="event_txt">
                            <h1>new products</h1>
                            <h2>#신상품&nbsp&nbsp#누구보다빠르게&nbsp&nbsp#남들보다&nbsp&nbsp#조재영</h2>
                            </div>
                            <div class="event_btn">
                                <div class="arrow">
                                    →
                                </div>
                            </div>
                        </div>
                        </a>

                    </div>


                </div>
            </div>
        </div>
        <script>



       



            //BEST PRODUCTS BTN
            var best_eq = 1;
            var best_max = $('.best_item').length / 3;
            $('.best_left_btn').click(function () {
                if (best_eq > 1){
                $('.best_item').animate({ left: "+=100%" }, 500);
                best_eq--;
                
                }
            });
            $('.best_right_btn').click(function () {
                if (best_eq < best_max){
                $('.best_item').animate({ left: "-=100%" }, 500);

                best_eq++;
                }
            });


            //SLIDER BTN
            var slider_eq = 1;
            var slider_max = $('.slider_item').length;
            $('.slider_left_btn').click(function(){
                slider_left();
            });

            $('.slider_right_btn').click(function(){
                slider_right();
            });


            function slider_left() {
                if (slider_eq > 1){
                $('.slider_item').animate({ left: "+=33.33%" }, 500);
                slider_eq--;    
                } else if (slider_eq == 1){
                    $('.slider_item').animate({ left: "-=66.66%" }, 500);
                    slider_eq = slider_max;
                }
            }

            function slider_right(){
                if (slider_eq < slider_max){
                $('.slider_item').animate({ left: "-=33.33%" }, 500);
                slider_eq++;    
                }else if(slider_eq == slider_max){
                $('.slider_item').animate({ left: "+=66.66%" }, 500);
                slider_eq = 1; 
                }
            }


            setInterval(() => {
                slider_right();
            }, 3000);

        </script>
        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="./ft.jsp"/>
    </div>
    </footer>
    </div>



 </body>
</html>