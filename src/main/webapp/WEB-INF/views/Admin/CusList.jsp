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
        /* 오른쪽 컨텐츠 초기화 */
        .page{
            float: left;
            width: 85%;
            margin-left: 2%;
        }
        .page_content{
            position: relative;
            clear: both;
            width: 100%;
        }
        /* /오른쪽 컨텐츠 초기화 */
        /* 검색 */
        .search_box{
            clear: both;
            display: block;
            margin-bottom: 1%;
        }
        .search_box>form>select{
            padding: 8px 0 8px 0;
            text-align: center;
            width: 100px;
            border-color: #222;
            font-size: 14px;
        }
        .search_box>form>input{
            padding: 9px 0 8px 0;
            border: 1px solid #222;
            font-size: 14px;
        }
        .search_box>form>button{
            padding: 7px 0 8px 0;
            width: 70px;
            font-size: 14px;
        }
        /* /검색 */
        /* 페이지 공통 - 리스트 테이블 */
        .table {
            display: table;
            width: 100%;
            border-collapse: collapse;
        }
        .table tr{
            display: table-row;
        }
        .table tr th, .table tr td{
            display: table-cell;
            padding: 12px 0 12px 0;
        }
        .table tr th{
            border-top: 2px solid #000;
            border-bottom: 1px solid #777;
            background-color: #ededed;
            text-align: center;
        }
        .table tr td{
            border-bottom: 1px solid #777;
            text-align: center;
        }
        /* /페이지 공통 - 리스트 테이블 */
        /* 추가폼 */
        #incode_form{
            margin-bottom: 2%;
        }
        #incode_form .incode{
            border-top: none;
            border-right: none;
            border-bottom: 1px solid rgb(190, 190, 190);
            border-left: none;

            width: 80%;
            height: 4.2vh;
            text-align: center;
        }
        #incode_form .incode:focus{
            outline: none;
        }
        #incode_form .btn_black{
            padding: 3px 0 3px 0;
            width: 60px;
            margin-right: 5px;
        }
        #incode_form .btn_clear{
            padding: 4px 0 3px 0;
            width: 60px;
        }
        #incode_form select {
		border-top: none;
	    border-right: none;
	    border-bottom: 1px solid rgb(190, 190, 190);
	    border-left: none;
	    height: 4.2vh;
	    text-align: center;
	    margin-right: 30px;
		}
        /* /추가폼 */
        
        /* 투명인풋 */
        .outcode{
         border: none;
   		 width: 80%;
    	height: 2.2vh;
    	text-align: center;
        }
        .outcode:focus {
         outline: none;
		}
        /* /투명인풋 */
        .msgbox{
	    position: absolute;
	    left: 160px;
	    bottom: -20px;
        }
        #incode_form{
        position: relative;
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
                    <!-- 주문관리 - 주문관리 -->
                     <!-- 회원관리 - 휴면회원 -->
                     
                     
                    <article class="page" id="page4">
                   
                        <div class="page_content">
                        <!--  전송중 div -->
                        <div id="sending_wrap" style="position: relative;" >
                        <div id="sending" style="display: none; position: absolute; width: 100%; height: 115px; background-color: #fff; z-index: 990;">
                        <h1 style="text-align: center; margin: 30px; ">전송중입니다.</h1>
                        </div>
                        </div>
                        <!--  /전송중 div -->
                            <!-- 검색 -->
                            <div class="search_box">
                                <form action="${path }/Admin/CusList_Search" method="POST">
                                    <select name="search_type">
                                        <option value="1">이름</option>
                                        <option value="2">이메일</option>
                                        <option value="3">핸드폰번호</option>
                                    </select>
                                    <input type="text" id="search_val" name="search_val">
                                    <button type="submit" class="btn_clear">검색</button>
                                </form>
                            </div>
                            <!-- /검색 -->
                            <!-- 회원 목록 -->
                            <!-- 회원추가 -->
                            <form action="${path }/Customer/Join" method="post" name="incode_form" id="incode_form" onsubmit="return addsubmit();">
                                <table class="input_table" style="width: 100%;">
                                    <tbody>
                                        <tr>
                                            <td><input type="text" id="name" name="name" class="incode" placeholder="이름"></td>
                                            <td>
                                            <input type="text" id="email" name="email" class="incode" placeholder="이메일" onchange="emailCheck();">
                                            </td>
                                            <td><input type="text" id="pw" name="pw" class="incode" placeholder="비밀번호"></td>
                                            <td><input type="text" id="phonenum" name="phonenum" class="incode" placeholder="핸드폰번호"></td>
                                            <td><input type="text" id="addr1" name="addr1" class="incode" placeholder="주소"></td>
                                            <td><input type="text" id="addr2" name="addr2" class="incode" placeholder="상세주소"></td>
                                            <td><input type="text" id="zipcode" name="zipcode" class="incode" placeholder="우편번호"></td>
                                            <td>
											<select name="grade">
											<option value="1">일반</option>
											<option value="3">브론즈</option>
											<option value="5">실버</option>
											<option value="7">골드</option>
											<option value="9">플레티넘</option>
											<option value="11">다이아</option>
											<option value="15">관리자</option>
											</select>
											</td>
                                            <td><input type="submit" class="btn_black" value="생성"></td>
                                            <td><input type="reset" class="btn_clear" value="재입력"></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="msgbox_wrap">
	 								<div class="msgbox">
	                                <label id="idok" style="font-size: 14px; color: blue; display: none;">사용 가능</label>
	                                <label id="idno" style="font-size: 14px; color: red; display: none;">사용 불가능</label>
	                                </div>
                                </div>
                            </form>
                               
                           


                            <!-- /회원추가 -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>no</th>
                                        <th style="width: 10%;">이름</th>
                                        <th>등급</th>
                                        <th>이메일주소</th>
                                        <th style="width: 10%;">비밀번호</th>
                                        <th style="width: 10%;">핸드폰번호</th>
                                        <th style="width: 20%;">주소</th>
                                        <th>CNT</th>
                                        <th>가입일</th>
                                        <th>최종접속일</th>
                                        <th>버튼</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${List }" var="DTO" varStatus="status">
                                	<c:if test="${DTO.state != 3}">
                                    <tr>
                                        <td><a href="">${DTO.seq }</a></td>
                                        <td><input type="text" id="name" class="outcode out_name" value="${DTO.name }"></td>
                                        <td>
                                        	<c:choose>
                                        	<c:when test="${DTO.grade == 1 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5">실버</option>
													<option value="7">골드</option>
													<option value="9">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	<c:when test="${DTO.grade == 3 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3" selected="selected">브론즈</option>
													<option value="5">실버</option>
													<option value="7">골드</option>
													<option value="9">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	
                                        	<c:when test="${DTO.grade == 5 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5" selected="selected">실버</option>
													<option value="7">골드</option>
													<option value="9">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	<c:when test="${DTO.grade == 7 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5">실버</option>
													<option value="7" selected="selected">골드</option>
													<option value="9">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	<c:when test="${DTO.grade == 9 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5">실버</option>
													<option value="7">골드</option>
													<option value="9" selected="selected">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	<c:when test="${DTO.grade == 11 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5">실버</option>
													<option value="7">골드</option>
													<option value="9">플레티넘</option>
													<option value="11" selected="selected">다이아</option>
													<option value="15">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	<c:when test="${DTO.grade == 15 }">
		                                        	<select id="grade" class="out_grade">
													<option value="1">일반</option>
													<option value="3">브론즈</option>
													<option value="5">실버</option>
													<option value="7">골드</option>
													<option value="9">플레티넘</option>
													<option value="11">다이아</option>
													<option value="15" selected="selected">관리자</option>
                                        			</select>
                                        	</c:when>
                                        	
                                        	</c:choose>

                                        </td>
                                        <td><input type="text" id="email" class="outcode out_email" value="${DTO.email }" readonly="readonly"></td>
                                        <td>
                                        <input type="text" id="pw" class="outcode out_pw" value="" placeholder="변경시 입력">
                                        <input type="hidden" id="out_hpw" class="out_hpw" value="${DTO.pw }">
                                        </td>
                                        <td><input type="text" id="phonenum" class="outcode out_phonenum" value="${DTO.phonenum }"></td>
                                        <td>
                                        <input type="text" id="addr1" class="outcode out_addr1" value="${DTO.addr1 }">
                                        <input style="width: 40%; text-align: center;" type="text" id="addr2" class="outcode out_addr2" value="${DTO.addr2 }">
                                        <input style="width: 40%; text-align: left;" type="text" id="zipcode" class="outcode out_zipcode" value="(${DTO.zipcode })">
                                        </td>
                                        <td>${DTO.cnt }</td>
                                        <td><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
                                        <td><fmt:formatDate value="${DTO.login_date }" pattern="MM-dd HH:mm" timeZone="Seoul Asia"/></td>
                                        <td>
                                        <input style="padding: 4px 6px 4px 6px;" type="button" class="btn_white" value="수정" onclick="edit(${DTO.seq},${status.index})">
                                        <input style="padding: 4px 6px 4px 6px;" type="button" class="btn_white" value="삭제" onclick="del(${DTO.seq},${status.index})">
                                        </td>
                                    </tr>
                                    </c:if>
                                     </c:forEach>

                                </tbody>
                            </table>
                            <!-- /회원 목록 -->
	
                        </div>
                    </article>
                        <!-- /회원관리 - 휴면회원 -->
                        
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


function emailCheck() {
    var email_val = $('#email').val();
    if(email==""){
        alert("이메일 주소를 입력하여 주시기 바랍니다.");
        return false;
    } else {
    	window.open('${path}/Customer/IDCK?email='+email_val,'hiddenf');
    }
}


function edit(seq,index) {
	var out_name_val = $('.out_name').eq(index).val();
	var out_grade_val = $('.out_grade').eq(index).val();
	var out_email_val = $('.out_email').eq(index).val();
	var out_phonenum_val = $('.out_phonenum').eq(index).val();
	var out_addr1_val = $('.out_addr1').eq(index).val();
	var out_addr2_val = $('.out_addr2').eq(index).val();
	var out_zipcode_val = $('.out_zipcode').eq(index).val();
	out_zipcode_val = out_zipcode_val.substring(1).slice(0,-1);
	if ($('.out_pw').eq(index).val() == ''){
		var out_pw_val = $('.out_hpw').eq(index).val();
	}else{
		var out_pw_val = $('.out_pw').eq(index).val();
	}
/* 	alert(out_name_val);
	alert(out_grade_val);
	alert(out_email_val);
	alert(out_pw_val);
	alert(out_phonenum_val);
	alert(out_addr1_val);
	alert(out_addr2_val);
	alert(out_zipcode_val); */
	
	window.open('${path}/Customer/Edit?name='+out_name_val+'&grade='+out_grade_val+"&phonenum="+out_phonenum_val+"&addr1="+out_addr1_val+"&addr2="+out_addr2_val+"&zipcode="+out_zipcode_val+"&pw="+out_pw_val+"&seq="+seq,'hiddenf');
	
	
}

function del(seq,index) {
	
    if (!confirm("정말 삭제하시겠습니까?")) {
		return;
    } else {
    	window.open('${path}/Customer/Del?seq='+seq,'hiddenf');
    }
}

function addsubmit() {
	var email_val = $('#email').val();
	var pw_val = $('#pw').val();
	var name_val = $('#name').val();
	var phonenum_val = $('#phonenum').val();
	var addr1_val = $('#addr1').val();
	var addr2_val = $('#addr2').val();
	var zipcode_val = $('#zipcode').val();
	
	
    if(name_val == ''){
        alert("이름을 입력해주세요.");
        $('#name').focus();
        return false;
    }
	
    if(email_val == ''){
        alert("아이디를 입력해주세요.");
        $('#email').focus();
        return false;
    }
    
	
    if(pw_val == ''){
        alert("비밀번호를 입력해주세요.");
        $('#pw').focus();
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

	
    
  	//새창으로 서브밋 보내기
    var w = window.open('','hiddenf','scrollbars=yes, width=740, height=800');
	var Form = document.getElementById('incode_form');
	Form.target = 'hiddenf';
	Form.submit();
	$('#sending').slideDown('slow');
	setTimeout(function(){
		alert('전송완료');
		location.href = location.href;
	},1000);
	
	
	
}

</script>
 </body>
</html>