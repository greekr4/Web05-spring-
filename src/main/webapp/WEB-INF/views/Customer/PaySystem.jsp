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
<title>Bn2U</title>
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="${path }/resources/css/common.css">
    <link rel="stylesheet" href="${path }/resources/css/main.css">
    <link rel="stylesheet" href="${path }/resources/css/style.css">
    <style>
        /* 초기화 */
        * { margin: 0; padding: 0;}
        ul { list-style: none; } 
        a { text-decoration: none; color: #222; }
        html, body { height: 100%;}
        #container{clear: both; width: 100%;}
        .container_wrap{clear: both; width: 100%; }
        .main_wrap{
            clear: both;
            width: 1400px;
            margin: 0 auto;
            margin-top: 2%;
        }
        /* /초기화 */
        /* 왼쪽 메뉴 */
        #left_gnb{
            float: left;
            width: 13%;
            /* min-width: 180px; */
        }
        #left_gnb>ul>.gnb_menu>a{
            display: block;
            font-size: 16px;
            padding: 15px 10px 15px 16px;
            background-color: #222;
            color: #e2e2e2;
        }
        #left_gnb>ul>.gnb_menu>a:first-child{
            border-top: 1px solid #515151;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu>a{
            display: block;
            border-bottom: 1px solid #515151;
            border-left: 1px solid #515151;
            border-right: 1px solid #515151;
            font-size: 14px;
            padding: 15px 10px 15px 16px;
            background-color: #ffffff;
            color: #222;
        }
        #left_gnb>ul>.gnb_menu>ul>.gnb_sub_menu:hover a{
            background-color: #dbdbdb;
            color: #222;
        }
        /* /왼쪽 메뉴 */
      	.paysys_wrap{
      	width: 100%;
      	}
		.paysys_tit_box{
		width: 1200px;
		margin-left: 200px;
		}
		.paysys_wrap h1{
		text-align: center;
		}
		.paybox_wrap{
		width: 500px;
		height:500px;
		margin-top: 100px;
		margin-left:550px;
		border: 1px solid #777;
		}
		.paybox_wrap button{
		width: 300px;
		height: 50px;
		margin: 0 auto;
		}
		.pay_top{
		padding-left:2em;
		padding-top:2em;
		padding-bottom:2em;
		background-color: rgb(253,216,53);
		}
		.pay_top .txt1{
		font-size: 22px;
		margin-bottom: 1em;
		font-weight: bold;
		}
		.paybox_wrap table{
		margin: 0 auto;
		width: 80%;
		}
		.paybox_wrap table th{
		text-align: left;
		width: 80%;
		}
		.paybox_wrap input {
		width: 100%;
		height: 30px;
		margin-bottom: 30px;
		border: 0;
		border-bottom: 1px solid #cbcbcb;
		}
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
          <iframe name="hiddenf" style="display: none;"></iframe>
            <div id="container_wrap">
              
                <section class="main_wrap">

				<jsp:include page="./LeftMenu.jsp"/>
                    <div class="paysys_wrap">
	                    <div class="paysys_tit_box">
	                    	<h1>${sid }님의 결제화면</h1>   
	                    </div>
	                    
		                <div class="paybox_wrap">
		                	<div class="pay_top">
		                	<p class="txt1">Bn2U 카드 간편결제</p>
		                	<p class="txt2">Bn2U 카드 간편 결제에 가입된<br>
		                	휴대폰 번호와 생년월일 6자리를 입력해주세요.
		                	</p>
		                	</div>
						<table>
							<tr>
							<th style="text-align: center; line-height: 5em;">결제금액 : <fmt:formatNumber value="${price }" pattern="#,###"/>원</th>
							</tr>
						  <tr>
						    <th>휴대폰 번호</th>
						  </tr>
						  <tr>
						    <td><input type="text" placeholder="01012345678"></td>
						  </tr>
						  <tr>
						  <th>생년월일</th>
						  </tr>
						  <tr>
						    <td><input type="text" placeholder="예) 960811"></td>
						  </tr>
						  <tr>
						  <td style="text-align: center;">
						  <button class="btn_white" onclick="location.href='${path}/Customer/PaySystemUpdate?seq=${seq }&price=${price }'">결제요청</button>
						  </td> 
						  	
						  </tr>
						</table>

		                
		                </div>

	                    
                    
                                  
                    </div>
                </section>

            
           
            </div>
        </div>

        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>

<script type="text/javascript">
$('.gnb_sub_menu').eq(2).find('a').css('font-weight','bold');
</script>

 </body>
</html>