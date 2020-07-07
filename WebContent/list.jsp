<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
		<link type="text/css" rel="stylesheet" href="css/style.css">
    	<link rel="stylesheet" type="text/css" href="css/list_style.css">
		<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="js/common.js" defer="defer"></script>
    <title>집밥을 특별하게, 쿡킷</title>
</head>
<body>
	<header>
			<div id="nav_up">
				<ul>
					<c:choose>
						<c:when test="${authuser!=null }">
							<li><a href="#">${bName }님</a></li>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="join.jsp">회원가입</a></li>
							<li><a href="login.jsp">로그인</a></li>
						</c:otherwise>
					</c:choose>
					<li><a href="list.do">공지사항</a></li>
					<li><a href="#">배송지역검색</a></li>
					<li><a href="#">기프트카드 등록</a></li>
					<c:if test="${authuser=='admin' }">
						<li><a href="admin_main.do">관리자페이지</a></li>
					</c:if>
				</ul>
			</div>
			<nav>
				<h1><a href="main.html"></a></h1>
				<ul class="nav_2nd">
					<li><a href="#">COOKIT소개</a></li>
					<li><a href="#">COOKIT메뉴</a><span>.</span></li>
					<li><a href="list.do?bType=notice">공지사항</a></li>
					<li><a href="event_list.do?bType=event">이벤트</a></li>
					<li><a href="#">MY쿡킷</a></li>
				</ul>
				<ul>
					<li><a href="#"><span>장바구니</span></a></li>
					<li><a href="#"><span>메뉴찾기</span></a></li>
				</ul>
			</nav>
		</header>
		<section>
		
		<div id="content">
				<div>
					<h1>고객행복센터</h1>
					<div>
						<ul>
							<li><a href="#"><span>FAQ</span></a></li>
							<li><a href="list.html"><span>공지사항</span></a></li>
							<li><a href="#"><span>새벽배송/이용안내</span></a></li>
						</ul>
					</div>
				</div>
		</div>		
		<div class="cont">	
		<form action="list.do?bType=${bType }" name="board_search" method="post">
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
		</div>
        <article id="art_table">
            <table border-top="3">
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
							<td><a href="event_view.do?bNum=${dtos.bNum }&bTypetext=${bTypetext}">
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
							<div class="page_box board_page">
						    <ul class="page-num">
						     	<a href="list.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=1"> <li class="first"></li></a>
						      <!-- 이전페이지 이동버튼 -->
						      <c:if test="${page<=1 }">
						      	<li class="prev"></li>
						      </c:if>
						      <c:if test="${page>1 }">
						      	<a href="list.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${page-1 }"><li class="prev"></li></a>
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
								        <a href="list.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${a }"><div>${a }</div></a>
								      </li>
							      </c:when>
							      </c:choose>
						      </c:forEach>
						      
						      <!-- 다음페이지 이동버튼 -->
						      <c:if test="${page>=maxpage }">
						      <li class="next"></li>
						      </c:if>
						       <c:if test="${page<maxpage }">
						        <a href="list.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${page+1 }"><li class="next"></li></a>
						      </c:if>
						      
						      <!-- 마지막페이지 이동버튼 -->
						      <a href="list.do?bType=${bType }&?searchflag=${searchflag }&opt=${opt }&search=${search }&page=${maxpage}">
						      	<li class="last"></li>
						      </a>
						    </ul>
						    </div>
					    </c:when>
					    <c:otherwise>
					    	  <!-- flag가 없을경우 -->
								<!-- 1번페이지 이동버튼 -->
							 <div class="page_box board_page">
							    <ul class="page-num">
							     	<a href="list.do?bType=${bType }&?page=1"> <li class="first"></li></a>
							      <!-- 이전페이지 이동버튼 -->
							      <c:if test="${page<=1 }">
							      	<li class="prev"></li>
							      </c:if>
							      <c:if test="${page>1 }">
							      	<a href="list.do?bType=${bType }&?page=${page-1 }"><li class="prev"></li></a>
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
									        <a href="list.do?bType=${bType }&?page=${a }"><div>${a }</div></a>
									      </li>
								      </c:when>
								      </c:choose>
							      </c:forEach>
							      
							      <!-- 다음페이지 이동버튼 -->
							      <c:if test="${page>=maxpage }">
							      <li class="next"></li>
							      </c:if>
							       <c:if test="${page<maxpage }">
							        <a href="list.do?bType=${bType }&?page=${page+1 }"><li class="next"></li></a>
							      </c:if>
							      
							      <!-- 마지막페이지 이동버튼 -->
							      <a href="list.do?bType=${bType }&?page=${maxpage}">
							      	<li class="last"></li>
							      </a>
							    </ul>
							    </div>
					    </c:otherwise>
				    </c:choose>
				  
						 
						 					
			<div class="clear"></div>
        </article>
</section>
		<footer>
			<div id="footer">
			<div>
				<h1>
					<a href="#"></a>
				</h1>
				<p>© COOKIT ALL RIGHTS RESERVED</p>
			</div>
			<div>
				<ul>
					<li><a href="#">이용약관</a></li>
					<li class="lime"><a href="#">개인정보처리 방침</a></li>
					<li><a href="#">법적고지</a></li>
					<li><a href="#">사업자정보 확인</a></li>
				</ul>
				<p>씨제이제일제당(주)</p>
				<p>대표이사 : 손경식,강신호,신현재</p>
				<p class="right_n">사업자등록번호 : 104-86-09535</p>
				<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p>
				<p>통신판매업신고 중구 제 07767호</p>
				<p class="right_n">개인정보보호책임자 : 조영민</p>
				<p>이메일 : cjon@cj.net</p>
				<p class="right_n">호스팅제공자 : CJ올리브네트웍스㈜</p>
				<p class="right_n">
					고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다.<a
						href="#">가입 사실 확인</a>
				</p>
			</div>
			<div>
				<p id="f_menubtn">
					CJ그룹계열사 바로가기 <span class="entypo-down-open"></span>
				</p>
				<div id="hide_menu">
					<ul>
						<li>CJ그룹
							<ul>
								<li><a href="#">CJ주식회사</a></li>
							</ul>
						</li>
						<li>식품&amp;식품서비스
							<ul>
								<li><a href="#">CJ제일제당(식품)</a></li>
								<li><a href="#">CJ푸드빌</a></li>
								<li><a href="#">CJ프레시웨이</a></li>
								<li><a href="#">CJ엠디원</a></li>
							</ul>
						</li>
						<li>생명공학
							<ul>
								<li><a href="#">CJ제일제당(바이오)</a></li>
							</ul>
						</li>
						<li>신유통
							<ul>
								<li><a href="#">CJ ENM(오쇼핑)</a></li>
								<li><a href="#">CJ대한통운</a></li>
								<li><a href="#">CJ텔레닉스</a></li>
								<li><a href="#">CJ올리브영</a></li>
							</ul>
						</li>
						<li>엔터테인먼트&amp;미디어
							<ul>
								<li><a href="#">CJ ENM(E&amp;M)</a></li>
								<li><a href="#">CJ CGV</a></li>
								<li><a href="#">CJ파워캐스트</a></li>
							</ul>
						</li>
						<li>인프라
							<ul>
								<li><a href="#">CJ대한통운(건설)</a></li>
								<li><a href="#">CJ올리브네트웍스</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<p>고객행복센터</p>
				<p>1668-1920</p>
				<div id="f_btn">1:1문의</div>
			</div>
		</div>
		</footer>
</body>
</html>