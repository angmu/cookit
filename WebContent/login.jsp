<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>집밥을 특별하게, 쿡킷</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<link type="text/css" rel="stylesheet" href="css/login.css">
		<script type="text/javascript" src="js/jquery-1.12.3.js"></script>
		<script type="text/javascript" src="js/login_ch.js"></script>
		<script type="text/javascript" src="js/common.js"></script>
	</head>
	<body>
	<c:if test="${authuser!=null }">
	<script type="text/javascript">
		alert('이미 로그인 되어있습니다.');
		window.location.href='index.jsp';
	</script>
	</c:if>
	
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
			<article>
				<h1>로그인</h1>
			</article>
			<article>
				<form name="login_form" method="post" action="login.do">
					<ul>
						<li><input type="radio" name="log_menu" id="m_log"><label for="m_log" class="btn1">회원로그인</label></li>
						<li><input type="radio" name="log_menu" id="m_log2"><label for="m_log2" class="btn2">비회원 주문조회</label></li>
					</ul>
					<div id="m_login"  class="btn1_div">
						<input type="text" name="id" placeholder="CJ ONE 통합아이디 6~20자" min="6" max="20" alt="아이디를 입력해주세요" required="required">
						<input type="password" name="pw" placeholder="비밀번호 영문,특수문자,숫자혼합 8~12자" min="8" max="12" alt="비밀번호를 입력해주세요" required="required">
						<div>
							<input type="checkbox" name="save_id" id="save_id"><label for="save_id"><span class="ok_sign"></span><span class="s_text">아이디저장</span></label>
							<ul>
								<li><a href="#">아이디 찾기</a></li>
								<li><a href="#">비밀번호 찾기</a></li>
							</ul>	
						</div>
						<input type="submit" class="log_btn" value="로그인">
						<ul class="else_login">
							<li><a href="#"></a></li>
							<li><a href="#"></a></li>
							<li><a href="#"></a></li>
							<li><a href="#"></a></li>
						</ul>
						<ul class="log_t_box">
							<li><strong>CJ ONE 통합회원이 아니신가요?</strong></li>
							<li>CJ ONE 통합회원으로 가입하시면 CJ제일제당의 다양한 서비스(COOKIT, CJ THE MARKET, CJ제일제당 홈페이지)를 이용하실 수 있습니다.</li>
							<li><span><a href="join.jsp">CJ ONE 통합회원 신규가입하기</a></span></li>
						</ul>
					</div>
				</form>
				<form name="login_form2" method="post" action="main.html">		
					<div id="m_login2"  class="btn2_div">
						<input type="text" placeholder="주문번호 입력"  alt="주문번호를 입력해주세요" name="sail_number">
						<input type="password" placeholder="주문 비밀번호 입력"  alt="비밀번호를 입력해주세요" name="sail_pw">
						<input type="button" class="log_btn" onclick="no_member()" value="주문/배송 조회">
						<ul class="log_t_box">
							<li>주문 시 입력한 주문비밀번호와 문자로 발송된 주문번호를 입력하시면 주문내역/배송현황을 조회할 수 있습니다.</li>
							<li>비회원으로 구매 시 쿠폰 및 포인트적립 혜택을 받으실 수 없습니다.</li>
							<li>주문번호 및 주문비밀번호를 잊어버리셨다면 COOKIT 고객행복센터 1668-1920로  문의해주세요.</li>
						</ul>
					</div>
				</form>
			</article>
		</section>
		<footer>
			<div id="footer"> 
			<div>
				<h1><a href="#"></a></h1>
				<p>© COOKIT ALL RIGHTS RESERVED</p>
			</div>
			<div>
				<ul>
					<li><a href="#">이용약관</a></li>
					<li class="lime"><a href="#">개인정보처리 방침</a></li>
					<li><a href="#">법적고지</a></li>
					<li><a href="#">사업자정보 확인</a></li>
				</ul>
				<p>씨제이제일제당(주)</p><p>대표이사 : 손경식,강신호,신현재</p><p class="right_n">사업자등록번호 : 104-86-09535</p>
				<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p><p>통신판매업신고 중구 제 07767호  </p><p class="right_n">개인정보보호책임자 : 조영민</p>
				<p>이메일 : cjon@cj.net</p><p class="right_n">호스팅제공자 : CJ올리브네트웍스㈜</p>
				<p class="right_n">고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다.<a href="#">가입 사실 확인</a></p>
			</div>
			<div>
				<p id="f_menubtn">CJ그룹계열사 바로가기 <span class="entypo-down-open"></span></p>
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
				<p>고객행복센터</p><p>1668-1920</p>
				<div id="f_btn">1:1문의</div>
				</div>
			</div>
		</footer>
	</body>
</html>