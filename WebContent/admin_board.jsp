<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판 관리</title>
    <link type="text/css" rel="stylesheet" href="css/manage_main.css">
    <link rel="stylesheet" href="css/admin_main.css">
    <link rel="stylesheet" href="css/admin_board.css">
	<link rel="stylesheet" href="css/admin_header.css">
	<link rel="stylesheet" href="css/main_notice.css">
	<script src="js/jquery-1.12.3.js"></script>
	<script src="js/admin_left_nav_function.js"></script>
</head>
<body>
	<c:if test="${authuser!='admin' }">
	<script type="text/javascript">
		alert('관리자 권한이 필요합니다. 로그인해주세요');
		window.location.href='index.jsp';
	</script>
	</c:if>
	<!-- 관리자 헤더 입니다------------------------------------------------------------------------>
	<header id="topfix">
    <div id="header">
        <div class="logo_txt">
            <span>+++++</span> <a href="admin_main.do">관리자 페이지</a> <span>+++++</span>
        </div>
        <ul class="top_menu">
            <li>
                <table class="table0">
                    <tbody>
                    <tr>
                        <td>
                            <a href="logout.do"><span class="float_right">
                            <img alt="자물쇠" src="images/admin_main/logout.png">
                            <span class="float_right">로그아웃</span>
                            </span></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </li>
        </ul>
    </div>
    <nav id="gnb">
        <ul class="gnb_navi">
            <p>&nbsp;</p>
            <li>
                <a href="boardlist.do?bType=notice">
                    <span class="menuIcon0">공지사항</span>
                </a>
            </li>
            <li>
                <a href="bannerlist.do">
                    <span class="menuIcon1">배너설정</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuIcon2">회원관리</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuIcon3">주문관리</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="menuIcon4">상품관리</span>
                </a>
            </li>
            <li>
                <a href="boardlist.do?bType=event">
                    <span class="menuIcon5">이벤트관리</span>
                </a>
            </li>
            <li>
                <a href="index.jsp">
                    <span class="menuIcon6">홈페이지</span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- 여기까지 관리자 헤더 입니다------------------------------------------------------------------------>
	<div id="wrap">
	    <div id="manage_main">
	        <div>
			<!---------- 좌측메뉴 ---------->
					<div id="leftArea">
						<div>
							<h2><em></em>&nbsp;관리자 게시판</h2>
							<ul class="menu">
								<li class="on">
									<a href="#" onclick="Submenu_OC('1'); return false;"> 게시판 관리
										<span id="icon-plus-minus1" class="icon-list-minus">ListIcon</span>
									</a>
								</li>
								<div class="submenu" id="LeftMenuID1">
									<li class="on"><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;공지사항</a></li>
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;묻고답하기(Q&A)</a></li>
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;쪽지함</a></li>
								</div>
								<li>
									<a href="#"	onclick="Submenu_OC('2'); return false;">서비스 사용 현황
										<span id="icon-plus-minus2" class="icon-list-minus">ListIcon</span>
									</a>
								</li>
								<div class="submenu" id="LeftMenuID2">
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;사용자(계약자) 정보</a></li>
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;서비스 결제 정보</a></li>
								</div>
								<div>
									<li>
										<span>
											<a href="#" onclick="menufavorite_pop();">
												<img src="images/manage/icon_setting03.png" title="설정" alt="설정">
											</a>
											즐겨찾기&nbsp;메뉴
										</span>
									</li>
									<div></div>
								</div>
							</ul>
						</div>
					</div>
					<!--------- 좌측메뉴 ---------->
				</div>
			</div>
		</div>
			
<!-- 관리자 게시판 content 입니다------------------------------------------>


<!-- 관리자 게시판 입니다------------------------------------------------------------------------>

		<div id="contentArea">
		    <div class="sub_title_bar">
		        <ul class="ptit">
		            <li>
		          	      ${bTypetext }
		                <div class="float_r">
		                    <a href="#"><p class="listed"></p></a>
		                </div>
		                <div class="float_r">
		                    <a href="#"><p class="favorite"></p></a>
		                </div>
		                <div></div>
		            </li>
		        </ul>
		    </div>
			<div class="sub_content_area">
			<div id="wrap">
				<div>
					<div class="cont">
						<form action="boardlist.do?bType=${bType }" name="board_search" method="post">
						<table id="board_search">
							<tr>
								<td>
									<select id="search_cat" name="opt">
										<option value="all" selected="selected">전체
										<option value="tit">제목
										<option value="con">내용
									</select>
									<input type="text" id="search_box" name="search">
									<input type="submit" id="search_button" value="">
								</td>
							</tr>
						</table>
						</form>
						<table class="list_table">
						<colgroup>
							<col width="60px;">
							<col width>
							<col width="80px;">
							<col width="80px;">
							<col width="50px;">
						</colgroup>
							<thead>
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>날짜</th>
									<th>작성자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="b" value="${startpage-1 }" />
								<c:forEach var="dtos" items="${list }" >
										<tr>
											<td><c:out value="${b=b+1}" /> </td>
											<td><a href="boardView.do?bNum=${dtos.bNum }&bTypetext=${bTypetext}" class="doors">
											<c:if test="${dtos.bType=='notice' }">
											<span>[공지]</span>
											</c:if>
											<c:if test="${dtos.bType=='event' }">
											<span>[이벤트]</span>
											</c:if>
											${dtos.bTitle }</a></td>
											<td><fmt:formatDate value="${dtos.bDate }" pattern="yyyy-MM-dd"/></td>
											<td>${dtos.bName }</td>
											<td class="view_count">${dtos.bHit }</td>
										</tr>
								</c:forEach>								
							</tbody>
						</table>
						
						<div class="clear"></div>
						
						 
						<c:choose>
				    	<c:when test="${searchflag!=null }">
						    <!-- flag가 있을경우 -->
							<!-- 1번페이지 이동버튼 -->
							<div class="page_box admin_page">
						    <ul class="page-num">
						     	<a href="boardlist.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=1"> <li class="first"></li></a>
						      <!-- 이전페이지 이동버튼 -->
						      <c:if test="${page<=1 }">
						      	<li class="prev"></li>
						      </c:if>
						      <c:if test="${page>1 }">
						      	<a href="boardlist.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${page-1 }"><li class="prev"></li></a>
						      </c:if>
						      
						      <!-- 순차출력 -->
						      <c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
						      	<c:choose>
							      <c:when test="${a==page }">
								      <li class="num">
								        <div>${a }</div>
								      </li>
							      </c:when>
							      <c:when test="${a!=page }">
								      <li class="num">
								        <a href="boardlist.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${a }"><div>${a }</div></a>
								      </li>
							      </c:when>
							      </c:choose>
						      </c:forEach>
						      
						      <!-- 다음페이지 이동버튼 -->
						      <c:if test="${page>=maxpage }">
						      <li class="next"></li>
						      </c:if>
						       <c:if test="${page<maxpage }">
						        <a href="boardlist.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${page+1 }"><li class="next"></li></a>
						      </c:if>
						      
						      <!-- 마지막페이지 이동버튼 -->
						      <a href="boardlist.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${maxpage}">
						      	<li class="last"></li>
						      </a>
						    </ul>
						    </div>
					    </c:when>
					    <c:otherwise>
					    	  <!-- flag가 없을경우 -->
								<!-- 1번페이지 이동버튼 -->
							 <div class="page_box admin_page">
							    <ul class="page-num">
							     	<a href="boardlist.do?bType=${bType }&?page=1"> <li class="first"></li></a>
							      <!-- 이전페이지 이동버튼 -->
							      <c:if test="${page<=1 }">
							      	<li class="prev"></li>
							      </c:if>
							      <c:if test="${page>1 }">
							      	<a href="boardlist.do?bType=${bType }&?page=${page-1 }"><li class="prev"></li></a>
							      </c:if>
							      
							      <!-- 순차출력 -->
							      <c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
							      	<c:choose>
								      <c:when test="${a==page }">
									      <li class="num">
									        <div>${a }</div>
									      </li>
								      </c:when>
								      <c:when test="${a!=page }">
									      <li class="num">
									        <a href="boardlist.do?bType=${bType }&?page=${a }"><div>${a }</div></a>
									      </li>
								      </c:when>
								      </c:choose>
							      </c:forEach>
							      
							      <!-- 다음페이지 이동버튼 -->
							      <c:if test="${page>=maxpage }">
							      <li class="next"></li>
							      </c:if>
							       <c:if test="${page<maxpage }">
							        <a href="boardlist.do?bType=${bType }&?page=${page+1 }"><li class="next"></li></a>
							      </c:if>
							      
							      <!-- 마지막페이지 이동버튼 -->
							      <a href="boardlist.do?bType=${bType }&?page=${maxpage}">
							      	<li class="last"></li>
							      </a>
							    </ul>
							    </div>
					    </c:otherwise>
				    </c:choose>
				  
						 
						 
						<div class="clear"></div>
						
						
						<div class="border_btn">
							<p class="float_r">
								<button class="btnIcon" onclick="location.href='admin_input.jsp'">글쓰기</button>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
       <article id="foot">
           <p>© COOKIT ALL RIGHTS RESERVED</p>
       </article>
    </div>
<!-- 여기까지 content 입니다------------------------------------------------>
</body>
</html>