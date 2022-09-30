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
        /* 게시판관리 - 공지사항 */
        .btn_group{
            display: block;
            position: absolute;
            right: 0;
            top: 0;
        }
        .btn_group input[type="button"]{
            padding: 7px 20px 8px 20px;
            font-size: 14px;
        }
        /* 게시판관리 - 공지사항 */
        
        .page_move{
            display: flex;
            justify-content: center;
        }
        .page_move a{
            text-align: center;
            border: 1px solid lightgray;
            width: 30px;
            height: 30px;
            margin-bottom: 100px;
        }
        .first_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-first.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
            
        }
        .prev_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-prev.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
        }
        .next_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-next.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
        }
        .last_btn{
            background-image: url("${path}/resources/img/product/icon-pagination-last.png");
            background-repeat: no-repeat;
            background-position: 50% 50%
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
	       <section class="main_wrap">
					<jsp:include page="./LeftMenu.jsp"/>
                     <!-- 게시판관리 - 공지사항 -->
                    <article class="page">
                        <div class="page_content">
                            <!-- 검색 -->
                            <div class="search_box">
                                <form action="/myapp/board/news_search" method="POST">
                                    <select name="search_type">
                                        <option value="1">제목</option>
                                        <option value="2">내용</option>
                                    </select>
                                    <input type="hidden" id="type" name="type" value="2">
                                    <input type="text" id="search" name="search">
                                    <button type="submit" class="btn_clear">검색</button>
                                  <select onchange="CPP();" id="cpp">
                                    <option <c:if test="${vo.cntPerPage eq 10 }"> selected </c:if> value="10">10개씩 보기</option>
                                    <option <c:if test="${vo.cntPerPage eq 15 }"> selected </c:if> value="15">15개씩 보기</option>
                                    <option <c:if test="${vo.cntPerPage eq 20 }"> selected </c:if> value="20">20개씩 보기</option>
                                  </select>
                                </form>
                                
                            </div>
                            <!-- /검색 -->
                            <!-- 제품 목록 -->
                            <table class="table">
                                <colgroup>
		                            <col style="width:10%;">
		                            <col>
		                            <col style="width:10%;">
		                            <col style="width:10%;">
		                            <col style="width:10%;">
		                            <col style="width:10%;">
                                </colgroup>
                                <thead>

                                    <tr>
		                                <th>번호</th>
		                                <th>제목</th>
		                                <th>글쓴이</th>
		                                <th>조회</th>
		                                <th>추천</th>
		                                <th>날짜</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                	<c:when test="${fn:length(List) eq 0 }">
                                	<td colspan="6">게시글이 없습니다.</td>
                                	</c:when>
                                	<c:otherwise>
									<c:forEach items="${List }" var="DTO" varStatus="status">
									<tr>
										<td>${DTO.seq }</td>
										<td style="text-align: left;"><a href="${path }/Board/More?seq=${DTO.seq}">${DTO.title }</a></td>
										<td>${DTO.name }</td>
										<td>${DTO.cnt }</td>
										<td>${DTO.rec }</td>
										<td><fmt:formatDate value="${DTO.regdate }" pattern="YY-MM-dd"/></td>
									</tr>
									</c:forEach>  
									</c:otherwise>
								</c:choose>                         
                                </tbody>
                            </table>
                                      <div class="page_move" style="margin-top: 50px;">
                                    <a href="${path }/Admin/NoticeList?nowPage=1&cntPerPage=${vo.cntPerPage}" class="first_btn"></a>
                                    <c:if test="${vo.startPage != 1 }">
										<a href="${path }/Admin/NoticeList?nowPage=${vo.startPage - 1 }&cntPerPage=${vo.cntPerPage}" class="prev_btn"></a>
									</c:if>
                                    
									<c:forEach begin="${vo.startPage }" end="${vo.endPage }" var="p">
										<c:choose>
											<c:when test="${p == vo.nowPage }">
												<a href="" style="font-weight: bold;">${p }</a>
											</c:when>
											<c:when test="${p != vo.nowPage }">
												<a href="${path }/Admin/NoticeList?nowPage=${p}&cntPerPage=${vo.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${vo.endPage != vo.lastPage}">
										<a href="${path }/Admin/NoticeList?nowPage=${vo.endPage+1 }&cntPerPage=${vo.cntPerPage}" class="next_btn"></a>
									</c:if>
                                    
                                    <a href="${path }/Admin/NoticeList?nowPage=${vo.lastPage }&cntPerPage=${vo.cntPerPage}" class="last_btn"></a>
                    			</div>
                            <!-- /제품 목록 -->
                            <div class="btn_group">
                                <input type="button" class="btn_black" value="등록" onclick="location.href='${path}/Board/AddForm?type=2'">
                            </div>
                        </div>
                    </article>
                    <!-- /게시판관리 - 공지사항 -->
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
$('.gnb_sub_menu').eq(8).find('a').css('font-weight','bold');


function CPP() {
	var opval = $('#cpp').val();
	location.href='${path}/Admin/NoticeList?nowPage=${vo.nowPage}&cntPerPage='+opval;
	
}

</script>
 </body>
</html>