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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
            color: black;
        }

        ul {
            list-style: none;
        }
	
	
		        input, textarea{
        border: 1px solid #777;
        font-size: 0.9em;
        line-height: 2em;
        padding-left: 1em;
        padding-top: 5px;
        }
        
        .table_wrap{
        width: 1400px;
        margin: 150px auto;
        }
        .table_wrap table {
        width: 100%;
        margin: 0 auto;	
        table-layout: fixed;
        border-spacing: 0;
        }
        .table_wrap .top_info th{
        border-bottom: 1px solid #777;
        }
        .table_wrap .main_tit{
        border-bottom: 1px solid #777;
		line-height: 3em;
        }
        .table_wrap .main_con{
        text-align: left;
        vertical-align:top;
        min-width: 100%;
        height: 500px;
        line-height: 1.5em;
        padding-left: 2em;
        padding-top: 2em;
        }
        .table_wrap .main_btn{
        border-bottom: 1px solid #777;
        }
        .table_wrap button{
        height: 30px;
        width: 50px;
        margin-bottom: 10px;
        }
        .table_wrap .foot_btn td{
        text-align:right;
        padding-top: 10px;
        }
        .table_wrap .top_info{
        color: #999;
        }
        table.comment {
        margin-top: 100px;
         }
        .comment .comment_thumb{
        text-align: right;
        }
        .comment .comment_top td{
        border-bottom: 1px solid #777;
        padding-bottom: 10px;
        }
        .comment .comment_main_info{
        color: #777;
        }
        .comment .comment_main_info td{
        padding-top: 12px;
        }
        .comment .comment_main_con td{
        padding-top: 12px;
        height: 100px;
        vertical-align: top;
        }
        table.comment_form{
        margin-top: 50px;
        }
        .c_comment td {padding-left: 30px;}
 
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
  	        <section class="page1">
				<div class="table_wrap">
    <iframe width=0 height=0 name="hiddenframe1" style="display:none;"></iframe>
    <table>
    <thead>
    <tr class="top_type">
    <th colspan="3">
    
    <h3>공지사항</h3>
    
    
    
    </th>
    </tr>
    <tr class="top_info">
    <th>${DTO.email }</th>
    <th><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></th>
    <th>조회: ${DTO.cnt } 추천: ${DTO.rec }</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <th colspan="3" class="main_tit">
    <h1>${DTO.title }</h1>
    </th>
    </tr>
    <tr>
    <th colspan="3" class="main_con">
    ${DTO.content }
    </th>
    </tr>
    <tr>
    <th colspan="3" class="main_btn"><button class="btn_white" onclick="window.open('/myapp/board/thumbup?no=196','hiddenframe1')">추천</button></th>
    </tr>
    </tbody>
    <tfoot>
    <tr class="foot_btn">
    <td colspan="3">
    
    <button class="btn_white" class="btn_white" onclick="location.href = '/myapp/board/notice.html'">목록</button>
    
    
    
    
    
    <button class="btn_white" onclick="location.href = '/myapp/board/EditForm?no=196'">수정</button>
    <button class="btn_white" onclick="location.href = '/myapp/board/del?no=196&type=1'">삭제</button>
    
    </td>
    </tr>
    </tfoot>
    </table>
    <table class="comment">
    <thead>
    <tr class="comment_top">
    <td colspan="3" style="text-align: left;">댓글<span style="color: red;">(1)</span></td>
    </tr>
    </thead>
    <tbody>
    
    
    
    <tr class="comment_main_info">
    <td colspan="2" class="comment_winfo">
    admin2 | 2022-06-27
    
    <button class="btn_white" onclick="$('.cc_form').eq(0).css('display','block')">답글</button>
    
        
        <!-- 아이디가 같으면 -->
        <button class="btn_white" onclick="$('.c_con').eq(0).css('display','none');$('.cedit_form').eq(0).css('display','block')">수정</button>
        <button class="btn_white" onclick="window.open('/myapp/board/cdel?cno=27&no=196','hiddenframe1')">삭제</button>
        
        
        
    
    
    
    
    
    
    
    
    
    </td>
    <td class="comment_thumb">
    추천:2
    <button class="btn_white" onclick="window.open('/myapp/board/cthumbup?cno=27','hiddenframe1')">추천</button>
    </td>
    </tr>
    <tr class="comment_main_con">
    <td colspan="3">
    <span class="c_con">댓글입니다.</span>
    <form action="/myapp/board/cUpdate" class="cedit_form" method="POST" style="display: none;">
    <input type="hidden" name="cno" id="cno" value="27">
    <input type="text" name="con" id="con" class="input_con" value="댓글입니다.">
    <button class="btn_white" type="submit">수정</button>
    </form>
    </td>
    </tr>
    
    <tr class="cc_form" style="display:none;">
    <td>
    <form action="/myapp/board/ccWrite" method="POST">
    <input type="hidden" name="cno" value="27">
    <input type="hidden" name="writer" value="admin2">
    <input type="text" name="con">
    <button class="btn_white">작성</button>
    </form>
    </td>
    
    </tr>
    
    
    
     
         
         <tr class="c_comment">
         <td colspan="2"> ㄴ>&nbsp;&nbsp;&nbsp;admin2 | 2022-06-27
         
        
        <!-- 아이디가 같으면 -->
        <button class="btn_white" onclick="window.open('/myapp/board/ccdel?ccno=24','hiddenframe1')">삭제</button>
        
        
        
    
    
         
         
         </td>
         <td style="text-align: right;">추천:1
         <button class="btn_white" onclick="window.open('/myapp/board/ccthumbup?ccno=24','hiddenframe1')">추천</button>
         </td>
         </tr>
         <tr class="c_comment">
         <td style="height: 50px; vertical-align: top;">대댓글입니다.</td>
         </tr>
         
     
    
    
    
    
    
    </tbody>
    </table>
    
    <form action="/myapp/board/cWrite" id="comment_form" method="post">
    <input type="hidden" name="bno" value="196">
    <input type="hidden" name="writer" value="admin2">
    <table class="comment_form">
    <tbody>
    <tr>
    <td colspan="2" style="width:95%;"><input style="width: 100%;" type="text" name="con" id="con" class="con" placeholder="댓글을 작성해보세요" required></td>
    <td style="padding-top: 10px; text-align: right;"><button class="btn_white" type="submit">작성</button></td>
    </tr>
    </tbody>
    </table>
    </form>
    
     </div>
            </section>
            </div>
        </div>
<script type="text/javascript">

//네이게이션바
$('.location_select').eq(0).click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});

$('.location_select').eq(1).click(function () {
    if ($(this).find('ul').css('display') == 'none') {
        $(this).find('.location_tit').addClass('active');
        $(this).find('ul').slideDown('fast');
    } else {
        $(this).find('ul').slideUp('fast');
        $(this).find('.location_tit').removeClass('active');
    }
});

var ccode = '${ccode}';
var ccode_f = ccode.substr(0,1);


var code00_code_list = [];
var code00_name_list = [];
var A_code_list = [];
var A_name_list = [];
var B_code_list = [];
var B_name_list = [];
var C_code_list = [];
var C_name_list = [];
var D_code_list = [];
var D_name_list = [];
var E_code_list = [];
var E_name_list = [];
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
					
					if(ccode == CateList.code){
					$("#code2_span").text(CateList.name);
					}
				
					if ((CateList.code).substr(1,2) == '00'){
						//$('#code').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
						code00_code_list.push(CateList.code);
						code00_name_list.push(CateList.name);
					}
					if((CateList.code).substr(0,2) == 'A1'){
						//$('#code2').append("<option value='"+CateList.code+"'>"+ CateList.name +"</option>")
						A_code_list.push(CateList.code);
						A_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'B1'){
						B_code_list.push(CateList.code);
						B_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'C1'){
						C_code_list.push(CateList.code);
						C_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'D1'){
						D_code_list.push(CateList.code);
						D_name_list.push(CateList.name);
					}else if((CateList.code).substr(0,2) == 'E1'){
						E_code_list.push(CateList.code);
						E_name_list.push(CateList.name);
					}
					
					

					/*
					if(CateList.code == 'A00'){
					
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
					$('.menuA').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'B1'){
					$('.menuB').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'C1'){
					$('.menuC').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'D1'){
					$('.menuD').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					}else if((CateList.code).substr(0,2) == 'E1'){
					$('.menuE').append("<li class='sub'><a href='${path }/Product/Menu?code="+CateList.code+"'>"+CateList.name+"</a></li>")
					} */
					//alert(CateList.name);
				});//each끝		
				
			}			
	});	//end ajax

	window.onload = function(){
	if (ccode_f == 'A') {
		$("#code").text(code00_name_list[0]);
		$("#code1_span").text(code00_name_list[0]);
		for(i=0;i<A_code_list.length;i++){
		$('#code2').append("<li class='"+A_code_list[i]+"'><a href='${path}/Product/Products?ccode="+A_code_list[i]+"'>"+A_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+A_code_list[i]+"'><span>"+A_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'B') {
		$("#code").text(code00_name_list[1]);
		$("#code1_span").text(code00_name_list[1]);
		for(i=0;i<B_code_list.length;i++){
		$('#code2').append("<li class='"+B_code_list[i]+"'><a href='${path}/Product/Products?ccode="+B_code_list[i]+"'>"+B_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+B_code_list[i]+"'><span>"+B_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'C') {
		$("#code").text(code00_name_list[2]);
		$("#code1_span").text(code00_name_list[2]);
		for(i=0;i<C_code_list.length;i++){
		$('#code2').append("<li class='"+C_code_list[i]+"'><a href='${path}/Product/Products?ccode="+C_code_list[i]+"'>"+C_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+C_code_list[i]+"'><span>"+C_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'D') {
		$("#code").text(code00_name_list[3]);
		$("#code1_span").text(code00_name_list[3]);
		for(i=0;i<D_code_list.length;i++){
		$('#code2').append("<li class='"+D_code_list[i]+"'><a href='${path}/Product/Products?ccode="+D_code_list[i]+"'>"+D_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+D_code_list[i]+"'><span>"+D_name_list[i] +"</span></a></li>");
		}
	}else if (ccode_f == 'E') {
		$("#code").text(code00_name_list[4]);
		$("#code1_span").text(code00_name_list[4]);
		for(i=0;i<E_code_list.length;i++){
		$('#code2').append("<li class='"+E_code_list[i]+"'><a href='${path}/Product/Products?ccode="+E_code_list[i]+"'>"+E_name_list[i]+"</a></li>");
		$('#code2_ul').append("<li><a href='${path}/Product/Products?ccode="+E_code_list[i]+"'><span>"+E_name_list[i] +"</span></a></li>");
		}
	}
	for (var i = 0; i < code00_name_list.length; i++) {
		$('#code1_ul').append("<li><a href='${path}/Product/Products?ccode="+code00_code_list[i].substr(0,1)+ '11' +"'><span>"+code00_name_list[i] +"</span></a></li>");
	}
	$('#code2').find('.${ccode}').css('font-weight','bold');
	
	
	

}
	//$('#code').text();


</script>
        <footer id="ft">
            <div class="ft_wrap">
            <c:import url="../ft.jsp"/>
    </div>
    </footer>
    </div>


 


 </body>
</html>