<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>집밥을 특별하게, 쿡킷</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<link type="text/css" rel="stylesheet" href="css/event_view.css">
		<link type="text/css" rel="stylesheet" href="css/event_pro2.css">
		<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="js/common.js" defer="defer"></script>
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
			<div class="view">
				<div>
					<c:choose>
						<c:when test="${dto.bType=='event' }">
							<h1>이벤트</h1>
						</c:when>
						<c:otherwise>
							<div class="noti_box">
								<h1>고객행복센터</h1>
								<div>
									<ul>
										<li><a href="#"><span>FAQ</span></a></li>
										<li><a href="list.html"><span>공지사항</span></a></li>
										<li><a href="#"><span>새벽배송/이용안내</span></a></li>
									</ul>
								</div>
								<div class="clear"></div>
							</div>
						</c:otherwise>
					</c:choose>
					<div>
						<div>
							<h2>${dto.bTitle }
								<span><fmt:formatDate value="${dto.start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${dto.end_date }" pattern="yyyy-MM-dd"/></span>
							</h2>
							<div>
								<a href="#" role="button">
								<span>공유</span>
								</a>
							</div>
						</div>
						<div>
							<div>
								<c:if test="${dto.bFile2!=null }">
									<img src="upload/${dto.bFile2 }">
								</c:if>
								<c:if test="${dto.bContent!=null }">
								<c:choose>
									<c:when test="${dto.bType=='event' }">
										<div class="gray_box">
												${dto.bContent }
										</div>	
									</c:when>
									<c:otherwise>
										<div class="gray_box white_back">
												${dto.bContent }
										</div>
									</c:otherwise>
								</c:choose>
								</c:if>
							</div>
						</div>
							<ul>
							<c:if test="${fn:contains(dto.bTitle,'돌밥돌밥')}">
								<li>
									<p><em>10,000</em>원</p>
									<p>[쿡킷] 3월 돌밥돌밥 해결사 1만원 쿠폰</p>
									<p>40,000원 이상 구매 시 <br>
									   (발급일로부터 7일 이내)</p>
									<a href="#">
										<span>다운로드</span>
									</a>
								</li>
							</c:if>
							</ul>
							<div class="green_btn_box">
								<c:if test="${authuser=='admin' }">
								<a href="modifyview.do?bNum=${dto.bNum }" role="button">수정</a>
								</c:if>
								<c:choose>
								<c:when test="${dto.bType=='event' }">
									<a href="event_list.do?bType=${dto.bType }" role="button">목록</a>
								</c:when>
								<c:otherwise>
									<a href="list.do?bType=${dto.bType }" role="button">목록</a>
								</c:otherwise>
								</c:choose>
							</div>
					</div>
				</div>
			</div>
			<c:if test="${fn:contains(dto.bTitle,'돌밥돌밥')}">
			<div class="food_pro">
				<form action="" name="ev_pro_add" method="get">
				<ul>
					<li><a href="#">
						<img src="images/food01.jpg"/>
						<ul class="food_info">
							<li>3인분</li>
							<li>조리 10분</li>
							<li>약간 매운맛<span class="spicy"></span></li>
						</ul>
					<span class="food_title">감바스알아히요</span><span class="food_price">20,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
					<li><a href="#">
					<img src="images/food02.jpg"/>
						<ul class="food_info">
							<li>2인분</li>
							<li>조리 10분</li>
						</ul>
					<span class="food_title">부채살 찹스테이크</span><span class="food_price">20,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
					<li><a href="#">
					<img src="images/food03.jpg"/>
						<ul class="food_info">
							<li>3인분</li>
							<li>조리 20분</li>
							<li>약간 매운맛<span class="spicy"></span></li>
						</ul>
					<span class="food_title">소고기 두부전골</span><span class="food_price">24,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
					<li><a href="#">
					<img src="images/food04.png"/>
						<ul class="food_info">
							<li>3인분</li>
							<li>조리 20분</li>
						</ul>
					<span class="food_title">스키야키</span><span class="food_price">24,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
					<li><a href="#">
					<img src="images/food05.jpg"/>
						<ul class="food_info">
							<li>2인분</li>
							<li>조리 25분</li>
						</ul>
					<span class="food_title">빠네크림파스타</span><span class="food_price">20,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
					<li><a href="#">
					<img src="images/food06.jpg"/>
					<span class="flag_new">NEW</span>
						<ul class="food_info">
							<li>3인분</li>
							<li>조리 15분</li>
							<li>약간매운맛<span class="spicy"></span></li>
						</ul>
					<span class="food_title">황태콩나물해장국</span><span class="food_price">16,800원</span>
					</a>
					<button class="interest"></button>
					<button class="cart"></button>
					</li>
				</ul>
				<div class="page_num">
					<strong>1</strong>
				</div>
				</form>
			</div>
			</c:if>
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