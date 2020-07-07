<%@page import="java.util.ArrayList"%>
<%@page import="com.javalec.ex.BDto.BDto"%>
<%@page import="com.javalec.ex.BDao.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%BDao dao=new BDao();
String btype="notice";
int page1=1;
int limit=10;
String opt="",search="";
ArrayList<BDto> list=dao.printEvent(btype, page1, limit, opt, search);
request.setAttribute("list", list);%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>집밥을 특별하게, 쿡킷</title>
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<link type="text/css" rel="stylesheet" href="css/main.css">
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
			<!-- 메인상세 -->
			<div id="top_img">
	 			<div>
	 				<a href="#">
		 				<span>NEW</span>
		 				<span>3/16 신메뉴 출시</span>
		 				<span>따끈한 소울푸드<br>황태콩나물 해장국</span>
			 			<span><span></span>3인분</span>
			 			<span><span></span>조리 15분</span>
	 				</a>
	 				<span>16,800원 <a href="#"></a></span>
	 				<div>
	 					<a href="#"></a>
			 			<span>1/5</span>
			 			<a href="#"></a>
	 				</div>
	 			</div>
	 		</div>
	 		<div id="recomend">
	 			<div>
	 				<div>
		 				<span>얼큰한맛 <a href="#">▼</a></span>
		 				<span>메뉴<br>추천드려요</span>
		 				<span><a href="#">로그인</a>하시면 고객님의 구매내역과<br> 맛취향에 따라 딱맞는 맛있는 메뉴를 추천드려요</span>
		 			</div>
		 			<div></div>
		 			<img alt="우거지탕" src="images/recomand_tang.png">
		 			<div>
		 				<a href="#">얼큰소고기우거지탕</a>
		 				<div>
			 				<span>18,800원</span>
			 				<span>/3인분<a href="#"></a></span>
		 				</div>
	 				</div>
	 			</div>
	 		</div>
	 		<a href="#" id="event_banner"></a>
	 		<div id="best">
	 			<h2>실시간 베스트</h2>
	 			<ul>
	 				<li>
	 					<a href="#">
		 					<img alt="참스테이크" src="images/best01.jpg">
		 					<span id="best_top">BEST<br>01</span>
	 					</a>
	 					<a href="#">
		 					<span>부채살 찹스테이크</span>
		 					<span>
		 						20,800원
		 						<span>/2인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				  </li>
	 				<li>
	 					<a href="#">
		 					<img alt="감바스 알아히오" src="images/best02.jpg">
		 					<span>02</span>
	 					</a>
	 					<a href="#">
		 					<span>감바스 알아히오</span>
		 					<span>
		 						20,800원
		 						<span>/3인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				</li>
	 				<li>
	 					<a href="#">
		 					<img alt="소고기 두부전골" src="images/best03.jpg">
		 					<span>03</span>
	 					</a>
	 					<a href="#">
		 					<span>소고기 두부전골</span>
		 					<span>
		 						24,800원
		 						<span>/3인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				</li>
	 				<li>
	 					<a href="#">
		 					<img alt="스키야키" src="images/best04.jpg">
		 					<span>04</span>
	 					</a>
	 					<a href="#">
		 					<span>스키야키</span>
		 					<span>
		 						24,800원
		 						<span>/3인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				</li>
	 				<li>
	 					<a href="#">
		 					<img alt="빠네크림 파스타" src="images/best05.jpg">
		 					<span>05</span>
	 					</a>
	 					<a href="#">
		 					<span>빠네크림 파스타</span>
		 					<span>
		 						20,800원
		 						<span>/2인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				</li>
	 				<li>
	 					<a href="#">
		 					<img alt="부추가득 오리불고기" src="images/best06.jpg">
		 					<span>06</span>
	 					</a>
	 					<a href="#">
		 					<span>부추가득 오리불고기</span>
		 					<span>
		 						24,800원
		 						<span>/3인분</span>
		 					</span>
	 					</a>
	 					<a href="#"></a>
	 				</li>
	 			</ul>
	 		</div>
	 		<div id="review">
	 			<h2>생생한 리뷰</h2>
	 			<div>
	 				<span></span>
	 				<span>속초식 코다리찜</span>
	 				<span>
						재료가 워낙 좋으니 생선이라도 비린내 걱정
						<br>없이 맛있었어요.나가서 사먹는것보다
						<br>내 집에서 믿고먹는 맛집, 쿡킷입니다!
					</span>
					<span></span>
	 				<span>by.for********</span>
	 				<div>
	 					<a href="#"></a>
			 			<span>1/5</span>
			 			<a href="#"></a>
	 				</div>
	 			</div>
	 			<img alt="코다리찜1" src="images/review01.jpg">
	 			<img alt="코다리찜2" src="images/review02.png">
	 			<span></span>
	 		</div>
			<div id="menu">
				<div>
					<img alt="메뉴상단01" src="images/menu_top01.jpg">
					<h2>쿡킷 메뉴보기<br>
					Premium Mealkit</h2>
					<span>
					장보기, 재료손질, 레시피검색 <strong>번거로움 OUT!</strong><br>
					초간편함은 물론, 완벽한 맛 쿡킷이 다~ 했네
					</span>
					<ul>
						<li>
							<a href="#">
								<span>
									<img alt="황태콩나물해장국" src="images/menu01.png">
								</span>
								<span>황태콩나물해장국</span>
								<span>16,800원<span>/3인분</span></span>
								<span class="new_menu">NEW</span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="군산식 아귀찜" src="images/menu02.png">
								</span>
								<span>군산식 아귀찜</span>
								<span>29,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="해물짬뽕전골" src="images/menu03.png">
								</span>
								<span>해물짬뽕전골</span>
								<span>22,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="스키야키" src="images/menu04.png">
								</span>
								<span>스키야키</span>
								<span>24,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="우삼겹쌀국수" src="images/menu05.png">
								</span>
								<span>우삼겹쌀국수</span>
								<span>24,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="빠네크림파스타" src="images/menu06.png">
								</span>
								<span>빠네크림파스타</span>
								<span>20,800원<span>/2인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="감바스알아히요" src="images/menu07.png">
								</span>
								<span>감바스알아히요</span>
								<span>20,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="대만식 우육탕면" src="images/menu08.png">
								</span>
								<span>대만식 우육탕면</span>
								<span>23,800원<span>/2인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="얼큰소고기우거지탕" src="images/menu09.png">
								</span>
								<span>얼큰소고기우거지탕</span>
								<span>18,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="두툼 갈치조림" src="images/menu10.png">
								</span>
								<span>두툼 갈치조림</span>
								<span>17,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="부추가득 오리불고기" src="images/menu11.png">
								</span>
								<span>부추가득 오리불고기</span>
								<span>24,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="버섯소불고기" src="images/menu12.png">
								</span>
								<span>버섯소불고기</span>
								<span>23,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="속초식 코다리찜" src="images/menu13.png">
								</span>
								<span>속초식 코다리찜</span>
								<span>24,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="사천식 깐풍새우" src="images/menu14.png">
								</span>
								<span>사천식 깐풍새우</span>
								<span>25,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="애호박돼지고기짜글이" src="images/menu15.png">
								</span>
								<span>애호박돼지고기짜글이</span>
								<span>22,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="칠리&크림 반반새우" src="images/menu16.png">
								</span>
								<span>칠리&크림 반반새우</span>
								<span>26,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="쿵팟퐁커리" src="images/menu17.png">
								</span>
								<span>쿵팟퐁커리</span>
								<span>20,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="소고기두부전골" src="images/menu18.png">
								</span>
								<span>소고기두부전골</span>
								<span>24,800원<span>/3인분</span></span>
							</a>
							<a href="#"></a>
						</li>
						<li>
							<a href="#">
								<span>
									<img alt="부채살 찹스테이크" src="images/menu19.png">
								</span>
								<span>부채살 찹스테이크</span>
								<span>20,800원<span>/2인분</span></span>
							</a>
							<a href="#"></a>
						</li>
					</ul>
				</div>
				<div>
					<img alt="핫딜" src="images/menu_hotdeal.jpg">
					<h2>놓칠 수 없는 기회 <br>
					오픈 한정 핫딜</h2>
					<span>파격적인 가격으로<br>
					쿡킷을 경험할 수 있는 기회를 잡으세요.</span>
					<a href="#">
						<img alt="쿡킷소개" src="images/menu_cj_intro.jpg">
						<h2>프리미엄 밀키트<br>COOKIT을 소개합니다.</h2>
						<span>COOKIT은 장보기, 재료손질, 계량 등 복잡한 과정 없이도<br>
						누구나 간편하게 특별한 집밥을 만들 수 있도록 도와드립니다.</span>
					</a>
				</div>
			</div>
			<div id="main_notice">
					<c:forEach var="dtos" items="${list }" begin="0" end="1">
					<dl>
						<dt><a href="list.html">공지사항</a></dt>
						<dd><a href="event_view.do?bNum=${dtos.bNum }">${dtos.bTitle }</a></dd>
					</dl>
					</c:forEach>
			</div>	 		
			<!-- 메인상세 끝 -->
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