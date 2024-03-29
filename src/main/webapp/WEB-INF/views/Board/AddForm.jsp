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
    <script src="${path }/ckeditor/ckeditor.js"></script>
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
	
	
		 input,textarea {
            font-size: 12px;
            line-height: 2em;
            padding-left: 1em;
            margin-bottom: 5px;
            width: 850px;
            
        }
        #container_wrap {
            clear: both;
            width: 1000px;
            margin: 100px auto;
        }
        button {
            width: 150px;
            height: 30px;
            margin: 5px 0;
        }        
        select {
        	margin-bottom: 5px;
            
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
            <div id="container_wrap">
  	        <section class="page1">
  	        	
				<form 
				<c:choose>
				<c:when test="${type eq 5}">
				action="${path }/Board/AddQNA"
				</c:when>
				<c:otherwise>
				action="${path }/Board/Add"
				</c:otherwise>
				</c:choose>
				method="post" >
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            	<tr>
                            		<th><label for="type">카테고리</label>
                            		<td>
                            		<select name="type" id="type">
                            			<c:choose>
                            			<c:when test="${type eq 5 }">
                            			<option value="5">QNA</option>
                            			</c:when>
                            			<c:otherwise>
                            			<option value="1">공지사항</option>
                            			<option value="3">FAQ</option>
                            			</c:otherwise>
                            			</c:choose>

                            		</select>
                            		<input type="hidden" name="cus_seq" value="${scus_seq }">
                            		<c:if test="${type eq 5 }">
                            		<input type="hidden" name="qna_code" value="1" />
                            		</c:if>
                            		</td>
                            	</tr>
                            
								<!--
                                 <tr>
                                    <th><label for="writer">작성자</label></th>
                                    <td><input type="text" name="writer" id="writer" size="100" class="single100"
                                            placeholder="작성자 입력" value=""> </td>
                                </tr> 
                                -->
                                <tr>
                                    <th><label for="dtitle">제목</label></th>
                                    <td><input type="text" name="title" id="title" size="100" class="single100"
                                            placeholder="글 제목 입력" required></td>
                                    
                                </tr>
                                <tr>
                                    <th><label for="editor">내용</label></th>
                                    <td><textarea name="content" id="editor" cols="100" rows="8"
                                            class="multi100" placeholder="글 내용 입력" required></textarea></td>
                                </tr>                                
                                <tr>
                                    <th></th>
                                    <td>
                                        <button class="btn_white" type="submit">등록</button>
                                        <button class="btn_white" type="reset">취소</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </section>
            </div>
        </div>
<script type="text/javascript">

ck = CKEDITOR.replace('editor',{filebrowserUploadUrl:'${path}/Admin/imageUpload'});

var type = ${type};
switch (type) {
case 3:
	$('#type').val(3).prop("selected",true);
	break;
}


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