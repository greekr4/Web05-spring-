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
        .container_wrap{clear: both; width: 100%;}
        .main_wrap{clear: both; margin-top: 4%;}
        /* /초기화 */
        /* 페이지 제목 */
        .main_title{
            text-align: center;
        }
        .main_title h2{
            margin-bottom: 2%;
        }
        .main_title p{
            font-size: 1.1em;
        }
        .main_title p:nth-child(3){
            font-size: 14px;
            margin-top: 3%;
            margin-bottom: 0;
            margin-left: 24%;
        }
        .main_title p:nth-child(3)::before{
            content: "*";
            color: red;
            margin-right: 4px;
        }
        /* /페이지 제목 */
        /* 회원가입 폼 */
        .joinForm {
            width: 750px;
            margin-top: 1vh;
            margin-right: auto;
            margin-bottom: 5vh;
            margin-left: auto;
            text-align: center;
        }
        .table {
            display:table;
            border-collapse: collapse;
            width: 100%;
            text-align: left;
            font-size: 1em;
        }
        .table tr{
            display: table-row;
        }
        .table tr th, .table tr td{
            display: table-cell;
            border-bottom: 1px solid #dcdcdc;
            padding: 12px 0 12px 25px;
        }
        .table tr th{
            background-color: #fbfbfb;
        }
        .table tr th:before{
            content: "*";
            color: red;
            margin-right: 4px;
        }
        .table tr td input:focus{
            outline: none;
        }
        .table tr:first-child{
            border-top: 1px solid #999999;
        }
        .table tr:nth-child(6) td{
            border-bottom: none;
            padding-bottom: 0;
        }
        .table tr:nth-child(7) td{
            border-bottom: none;
            padding-bottom: 0;
        }
        .table tr:nth-child(1) td input{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }        
        .table tr:nth-child(2) td input{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(3) td input{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(4) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(5) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(6) td input[type=text]{
            height: 32px;
            width: 50%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(7) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr:nth-child(8) td input{
            height: 32px;
            width: 80%;
            border: 1px solid #c1c1c1;
        }
        .table tr td input[type=button]{
            width: 24%;
            padding: 5px 0 9px 0;
        }
        .btn {
            margin-top: 4%;
            width: 20%;
            padding: 5px 0 9px 0;
        }
        /* /회원가입 폼 */
        
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
               
    <section class="main_wrap">
                    <div class="main_title">
                        <h2>회원가입</h2>
                        <p>01 약관동의 > <strong>02 정보입력</strong> > 03 가입완료</p>
                        <p>표시는 반드시 입력하셔야 하는 항목입니다.</p>
                    </div>
                    <!-- 회원가입 -->
                    <div class="joinForm">
                         <form:form modelAttribute="CustomerDTO" action="Join" method="post" name="join_form" onsubmit="return joinCheck()">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th><form:label path="email">이메일</form:label></th>
                                        <td>
                                        <form:input path="email" name="email" id="email" onchange="emailCheck()" />
                                        <label id="idok" style="font-size: 14px; color: blue; display: none;">사용 가능하신 아이디입니다.</label>
                                        <label id="idno" style="font-size: 14px; color: red; display: none;">사용 불가능하신 아이디입니다.</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><form:label path="pw">비밀번호</form:label></th>
                                        <td><form:input type="password" path="pw" name="pw" id="pw1"/></td>
                                    </tr>
                                    <tr>
                                        <th><label for="pw2">비밀번호 확인</label></th>
                                        <td><input type="password" id="pw2"></td>
                                    </tr >
                                    <tr>
                                        <th><form:label path="name">이름</form:label></th>
                                        <td><form:input path="name" name="name" id="name"/></td>
                                    </tr>
                                    <tr>
                                        <th><form:label path="phonenum">핸드폰 번호</form:label></th>
                                        <td><form:input path="phonenum"/></td>
                                    </tr>
                                    <tr>
                                        <th rowspan="3"><form:label path="zipcode">주소</form:label></th>
                                        <td>
                                            <form:input path="zipcode" name="zipcode" id="zipcode"/>
                                            <input type="button" id="btn1" class="btn_white" onclick="findAddr()" value="우편번호 검색">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><form:input path="addr1" name="addr1" id="addr1"/></td>
                                    </tr>
                                    <tr>
                                        <td><form:input path="addr2" name="addr2" id="addr2"/></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" class="btn_black btn" value="가입하기">
                            <input type="button" class="btn_white btn" value="취소" onclick="location.href='${path }'">
                        </form:form>
                    </div>
                    <iframe name="hiddenf" style="display: none;"></iframe>
                    <!-- 회원가입 -->
                </section>
            
           
            </div>
        </div>

        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>


 <script>
	    function findAddr() {
	           new daum.Postcode({
	                  oncomplete: function(data) {
	                      var addr = ''; // 주소 변수
	                      var extraAddr = ''; // 참고항목 변수
	                      if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                          addr = data.roadAddress;
	                      } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                          addr = data.jibunAddress;
	                      }
	                      if(data.userSelectedType === 'R'){
	                          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                              extraAddr += data.bname;
	                          }
	                          if(data.buildingName !== '' && data.apartment === 'Y'){
	                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                          }
	                          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                          if(extraAddr !== ''){
	                              extraAddr = ' (' + extraAddr + ')';
	                          }
	                          // 조합된 참고항목을 해당 필드에 넣는다.
	                      } else {
	                         
	                      }
	                      document.getElementById("zipcode").value = data.zonecode;   //우편번호
	                      document.getElementById("addr1").value = addr;            //주소1
	                      document.getElementById("addr2").focus();               //주소2(상세주소)
	                  }
	              }).open();
	    }
    </script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function emailCheck() {
            var email_val = document.join_form.email.value;
            if(email==""){
                alert("이메일 주소를 입력하여 주시기 바랍니다.");
                return false;
            } else {
            	window.open('${path}/Customer/IDCK?email='+email_val,'hiddenf');
            }
        }
    </script>
    <script>
        function joinCheck() {
        	var email_val = $('#email').val();
        	var pw_val = $('#pw1').val();
        	var pw2_val = $('#pw2').val();
        	var name_val = $('#name').val();
        	var phonenum_val = $('#phonenum').val();
        	var addr1_val = $('#addr1').val();
        	var addr2_val = $('#addr2').val();
        	var zipcode_val = $('#zipcode').val();
        	var idok_val = $('#idok').css('display');
        	
        	
            if(email_val == ''){
                alert("아이디를 입력해주세요.");
                $('#email').focus();
                return false;
            }
            
        	
            if(pw_val == ''){
                alert("비밀번호를 입력해주세요.");
                $('#pw1').focus();
                return false;
            }
            
            if(name_val == ''){
                alert("이름을 입력해주세요.");
                $('#name').focus();
                return false;
            }
            
            if(phonenum_val == ''){
                alert("핸드폰 번호를 입력해주세요.");
                $('#phonenum').focus();
                return false;
            }
            
            if(addr1_val == ''){
                alert("주소를 입력해주세요.");
                $('#addr1').focus();
                return false;
            }
            
            if(addr2_val == ''){
                alert("상세 주소를 입력해주세요.");
                $('#addr2').focus();
                return false;
            }
            
            if(zipcode_val == ''){
                alert("우편번호를 입력해주세요.");
                $('#zipcode').focus();
                return false;
            }
            
            if(pw_val != pw2_val){
                alert("비밀번호가 일치하지 않습니다.");
                $('#pw2').focus();
                return false;
            }
        	
        	
            if(idok_val == 'none'){
                alert("아이디 중복 확인이 필요합니다.");
                $('#email').focus();
                return false;
            }


        }		
    </script>


 </body>
</html>