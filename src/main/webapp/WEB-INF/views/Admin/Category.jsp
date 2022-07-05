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
        /* 메뉴관리 - 카테고리 */
        .table tr td .btn_white{
            padding: 4px 6px 4px 6px;
        }
        .outcode{
            border: none;
            width: 80%;
            height: 4.2vh;
            text-align: center;
        }
        .outcode:focus{
            outline: none;
        }
        #incode_form{
            margin-top: 4%;
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
        #bt_confirm{
            clear: both;
            margin-top: 5%;
            width: 120px;
            position: absolute;
            top:100%;
            left: 39.5%;
        }
        #bt_confirm a{
            display: block;
            padding: 5px 0 5px 0;
            color: #fff;
            text-align: center;
        }
        /* /메뉴관리 - 카테고리 */
  /* 카테고리 등록 폼 */
   #incode_form{
      margin-bottom: 2%;
   }
   /* /카테고리 등록 폼 */
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
                      <!-- 메뉴관리 - 카테고리 관리 -->
                    <article class="page">
                        <div class="page_content">
                            <form action="${path }/Category/Add" method="post" name="incode_form" id="incode_form" onsubmit="return addsubmit();">
                                <table class="input_table" style="width: 50%;">
                                    <tbody>
                                        <tr>
                                            <td><input type="text" class="incode" name="orderby" id="orderby" placeholder="순서입력"></td>
                                            <td><input type="text" class="incode" name="code" id="code" placeholder="코드"></td>
                                            <td><input type="text" class="incode" name="name" id="name" placeholder="메뉴명"></td>
                                            <td><input type="submit" class="btn_black" value="입력"></td>
                                            <td><input type="reset" class="btn_clear" value="재입력"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        
                            
                                <table class="table" style="width: 50%;">
                                    <thead>
                                        <tr>
                                            <th style="width: 20%;">순서</th>
                                            <th style="width: 20%;">코드</th>
                                            <th style="width: 45%;">코드명</th>
                                            <th style="width: 15%;">버튼</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${List }" var="DTO" varStatus="status">
                                        <tr>
                                            <td><input type="text" class="outcode out_orderby" value="${DTO.orderby }"></td>
                                            <td><input type="text" class="outcode out_code" value="${DTO.code }"></td>
                                            <td><input type="text" class="outcode out_name" value="${DTO.name }"></td>
                                            <td>
                                            <input type="button" value="수정" class="btn_white" onclick="edit(${DTO.seq},${status.index})">
                                            <input type="button" value="삭제" class="btn_white" onclick="del(${DTO.seq},${status.index})">
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                           

                        </div>
                    </article>
                    <!-- /메뉴관리 - 카테고리관리 -->
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
$('.gnb_sub_menu').eq(4).find('a').css('font-weight','bold');




function edit(seq,index) {
	var orderby_val = $('.out_orderby').eq(index).val();
	var code_val = $('.out_code').eq(index).val();
	var name_val = $('.out_name').eq(index).val();
/* 
	alert(orderby_val);
	alert(code_val);
	alert(name_val);
*/

	window.open('${path}/Category/Edit?orderby='+orderby_val+'&code='+code_val+'&name='+name_val+'&seq='+seq,'hiddenf');

}


function del(seq,index) {
	
    if (!confirm("정말 삭제하시겠습니까?")) {
		return;
    } else {
    	window.open('${path}/Category/Del?seq='+seq,'hiddenf');
    }
}

function addsubmit() {
	var orderby_val = $('#orderby').val();
	var code_val = $('#code').val();
	var name_val = $('#name').val();
	
	
    if(orderby_val == ''){
        alert("순서를 입력해주세요.");
        $('#orderby').focus();
        return false;
    }
	
    if(code_val == ''){
        alert("코드를 입력해주세요.");
        $('#code').focus();
        return false;
    }
    
	
    if(name_val == ''){
        alert("메뉴명을 입력해주세요.");
        $('#name').focus();
        return false;
    }
	
    
  	//새창으로 서브밋 보내기
    var w = window.open('','hiddenf','scrollbars=yes, width=740, height=800');
	var Form = document.getElementById('incode_form');
	Form.target = 'hiddenf';
	Form.submit();
	
	
	
}


</script>
 </body>
</html>