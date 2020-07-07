<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입- 집밥을 특별하게, 쿡킷</title>
    <link type="text/css" rel="stylesheet" href="css/signup.css">
    <script type="text/javascript" src="js/signup.js"></script>
    <script type="text/javascript" src="js/input_page.js"></script>
    <script type="text/javascript" src="js/jquery-1.12.3.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="js/common.js" defer="defer"></script>
   
    <script>
   
    </script>
    
<head>
<body>
   	<c:if test="${authuser!=null }">
   		<script type="text/javascript">
		alert('이미 로그인되어있습니다. 로그아웃 후 이용해주세요');
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
    <div>
        <h1>소중한 추억을 드립니다.</h1>
    </div>
    <div id="container">
        <!-- 서브타이틀-->
        <div id="subtitle">
            <ul>
                <li>HOME</li>
                <li>회원가입</li>
                <li>회원정보입력</li>
            </ul>
        </div>
        <div id="sub-top">
            <h3>회원가입</h3>
        </div>
        <div id="loginContents">
            <h3>필수 정보 입력
                <span>(<span>*</span>
            항목은 필수 입력입니다.)</span></h3>

            <form name="form1" method="post" action="signinfo.do">
                <fieldset class="boardForm01">
                    <dl>
                        <dt class="blt">
                            <label for="name">이름</label>
                        </dt>
                        <dd>
                            <input type="text" id="name" name="name" >
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label for="id">아이디</label>
                        </dt>
                        <dd class="idCheck">
                            <input type="text" id="id" name="id" readonly>
                            <input type="button" value="중복확인" class="btn_member" onclick="idPopup()" name="idex">
                            <ul class="cmt">
                                <li>4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다.</li>
                                <li>첫 글자는 영문으로 입력해 주세요.</li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label for="pw">비밀번호</label>
                        </dt>
                        <dd>
                            <input type="password" id="pw" name="pw" >
                            <br>
                            <span class="cmt">
                                영문, 숫자, 특수문자 중 2종류 조합 시 10자리 이상 입력
                            </span>
                            <br>
                            <span class="cmt">
                                영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력
                            </span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label for="pw2">비밀번호 확인</label>
                        </dt>
                        <dd>
                            <input type="password" id="pw2" name="pw2">
                            <span class="cmt">비밀번호를 다시 한번 입력해 주세요.</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>이메일</label>
                        </dt>
                        <dd class="email">
                            <input type="text" id="email1" name="email1" style="width: 120px">
                            <span>@</span>
                            <input type="text" id="email2" name="email2" style="width: 150px">
                            <select name="lstMail" class="select01" style="width: 150px"
                                    onchange="document.form1.email2.focus();
                              document.form1.email2.value =document.form1.lstMail[document.form1.lstMail.selectedIndex].value;
                            ">
                                <option>직접입력</option>
                                <option value="gmail.com">지메일</option>
                                <option value="naver.com">네이버</option>
                                <option value="nate.com">네이트</option>
                                <option value="hotmail.com">핫메일</option>
                                <option value="paran.com">파란</option>
                                <option value="em.com">엠팔</option>
                                <option value="yahoo.com">야후</option>
                                <option value="dreamwiz.com">드림위즈</option>
                                <option value="hanmail.com">한메일(다음)</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label for="address">주소</label>
                        </dt>
                        <dd>
                            <p class="zipcode">
                                <input type="text" id="zip1" name="addr_num" readonly="readonly">
                                <a class="btn_member" onclick="post()">우편번호</a>
                            </p>
                            <input type="text" id="address" class="full" name="address1">
                            <input type="text" id="address2" class="full" name="address2">
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>휴대전화</label>
                        </dt>
                        <dd class="phone">
                            <input type="text" id="t_num1" name="phone1">
                            <span>-</span>
                            <input type="text" name="phone2">
                            <span>-</span>
                            <input type="text" name="phone3">

                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>생년월일</label>
                        </dt>
                        <dd class="birth">
                            <select name="byear" class="input">
                                <option disabled="disabled" hidden="">>선택</option>
                                <option value="1990">1990</option>
                                <option value="1991">1991</option>
                                <option value="1992">1992</option>
                                <option value="1993">1993</option>
                                <option value="1994">1994</option>
                                <option value="1995">1995</option>
                                <option value="1996">1996</option>
                                <option value="1997">1997</option>
                                <option value="1998">1998</option>
                                <option value="1999" selected>1999</option>
                                <option value="2000">2000</option>
                                <option value="2001">2001</option>
                                <option value="2002">2002</option>
                            </select>
                            <span>년</span>
                            <select name="bmonth" class="input">
                                <option disabled="disabled" hidden="">선택</option>
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                            <span>월</span>
                            <select name="bdate" class="input">
                                <option disabled="disabled" hidden="">선택</option>
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                            </select>
                            <span>일</span>
                            <p class="radio">
                                <input name="birthtype" type="radio" value="solar" checked>
                                <label>양력</label>
                                <input name="birthtype" type="radio" value="lunar">
                                <label>음력</label>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>성별</label>
                        </dt>
                        <dd>
                            <p>
                                <input type="radio" name="gender" value="M" checked>
                                <label>남성</label>
                                <input type="radio" name="gender" value="W">
                                <label>여성</label>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>뉴스레터 수신여부</label>
                        </dt>
                        <dd>
                            <p>
                                <span class="txtFr">이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
                                <input type="radio" name="newsok" value="y" checked>
                                <label>예</label>
                                <input type="radio" name="newsok" value="n">
                                <label>아니오</label>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt class="blt">
                            <label>SMS 수신여부</label>
                        </dt>
                        <dd>
                            <p>
                                <span class="txtFr">문자를 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
                                <input type="radio" name="smsok" value="y" checked>
                                <label>예</label>
                                <input type="radio" name="smsok" value="n">
                                <label>아니오</label>
                            </p>
                        </dd>
                    </dl>
                </fieldset>

                <h3>선택 입력 정보</h3>
                <fieldset class="boardForm01">
                    <dl>
                        <dt>
                            <label>직업</label>
                        </dt>
                        <dd class="job">
                            <select name="m_job">
                                <option selected disabled="disabled" hidden="">선택</option>
                                <option value="office">회사원</option>
                                <option value="self_emp">자영업</option>
                                <option value="free">프리랜서</option>
                                <option value="housewife">전업주부</option>
                                <option value="etc">기타</option>
                            </select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>결혼여부</label>
                        </dt>
                        <dd>
                            <p>
                                <input type="radio" name="marry" value="y">
                                <label>예</label>
                                <input type="radio" name="marry" value="n" checked="checked">
                                <label>아니오</label>
                            </p>
                        </dd>
                    </dl>
                    <dl>
                        <dt>
                            <label>관심사</label>
                        </dt>
                        <dd>
                            <ul class="hobby">
                                <li>
                                    <input type="checkbox" name="hobby" value="h_computer" >
                                    <label>컴퓨터/인터넷</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_movie" >
                                    <label>영화/비디오</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_music" >
                                    <label>음악</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_shopping">
                                    <label>쇼핑</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_game" >
                                    <label>게임</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_art" >
                                    <label>문화/예술</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_baby">
                                    <label>육아/아동</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_cook">
                                    <label>요리</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_interior">
                                    <label>인테리어</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_leisure">
                                    <label>레저/여가</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_diet" >
                                    <label>건강/다이어트</label>
                                </li>

                                <li>
                                    <input type="checkbox" name="hobby" value="h_fashion" >
                                    <label>패션/미용</label>
                                </li>

                            </ul>
                        </dd>
                    </dl>
                </fieldset>
                <ul class="btn_f" style="text-align: center">
                    <li>
                        <input type="button" onclick="javascript:history.back()" value="취소" class="btnType03"
                               style="width: 120px; height: 50px; cursor: pointer">
                    </li>
                    <li>
                        <input type="button" value="저장" class="btnType01" onclick="join_f_check()"
                               style="border: 0; width: 120px; height: 50px; cursor: pointer">
                    </li>
                </ul>
            </form>
        </div>

    </div>
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