<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인</title>
    <link rel="stylesheet" href="css/admin_main.css">
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

<section id="admin_con">
    <h1 id="container_title">관리자메인</h1>
    <div id="left_side">
        <ul class="side_ul">
            <li>
                <button class="side_btn1" onclick="location.href='Memberlist.do'"></button>
            </li>
            <li>
                <button class="side_btn2" onclick="location.href='boardlist.do?bType=notice'"></button>
            </li>
            <li>
                <button class="side_btn3"></button>
            </li>
            <li>
                <button class="side_btn4"></button>
            </li>
            <li>
                <button class="side_btn5"></button>
            </li>
            <li>
                <button class="side_btn6"></button>
            </li>
        </ul>
    </div>
    <div id="real_contents">
        <article>
            <h2>신규가입회원 목록</h2>
            <div class="local_desc">총회원수 2,221명 중 차단 0명, 탈퇴 : 34명</div>
            <div class="tbl_n1">
                <table>
                    <thead>
                    <tr>
                        <th>회원아이디</th>
                        <th>이름</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>포인트</th>
                        <th>뉴스레터</th>
                        <th>SMS수신</th>
                        <th>권한</th>
                    </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="mdtos" items="${mlist }" begin="0" end="4">
                    	<tr>
                    		 <td class="td_id">${mdtos.id }</td>
                       		 <td class="td-name">${mdtos.name }</td>
                        	 <td class="td_nick">[${mdtos.addr_num}] ${mdtos.address1 } ${mdtos.address2 }</td>
                        	 <td class="td_nick">${mdtos.phone1}-${mdtos.phone2 }-${mdtos.phone3}</td>
                      		 <td class="td_point"><fmt:formatNumber value="${mdtos.m_point }" pattern="#,###" /></td>
                       		 <td class="td_bool">${mdtos.newsok }</td>
                   		     <td class="td_bool">${mdtos.smsok }</td>
                     		 <td class="td_bool">${mdtos.m_level }</td>
                  	 	 </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="btn_list">
                <a href="#">회원 전체보기</a>
            </div>
        </article>

        <article>
            <h2>최근게시물</h2>
            <div class="tbl_n1">
                <table>
                    <thead>
                    <tr>
                        <th>분류</th>
                        <th>게시판</th>
                        <th>제목</th>
                        <th>이름</th>
                        <th>일시</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dtos" items="${list }" begin="0" end="4">
                    	<tr>
                    		<c:choose>
                    			<c:when test="${dtos.bType=='event' }">
                    				 <td>이벤트</td>
                    				 <td>이벤트게시판</td>
                    			</c:when>
                    			<c:when test="${dtos.bType=='notice' }">
                    				<td>공지</td>
                    				<td>공지사항게시판</td>
                    			</c:when>
                    			<c:when test="${dtos.bType=='basic' }">
                    				<td>일반글</td>
                    				<td>공지사항게시판</td>
                    			</c:when>
                    		</c:choose>
	                        <td>${dtos.bTitle }</td>
	                        <td>${dtos.bName }</td>
	                        <td><fmt:formatDate value="${dtos.bDate }" pattern="yyyy-MM-dd" /></td>
                  	 	 </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="btn_list">
                <a href="#">최근게시물 더보기</a>
            </div>
        </article>

        <article>
            <h2>최근포인트 발생내역(미구현)</h2>
            <div class="local_desc">전체 8,772건 중 5건 목록</div>
            <div class="tbl_n1">
                <table>
                    <thead>
                    <tr>
                        <th>회원아이디</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>일시</th>
                        <th>포인트 내용</th>
                        <th>적립포인트</th>
                        <th>보유포인트</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="td_id">Honggildong123</td>
                        <td class="td-name">홍길동</td>
                        <td class="td_nick"><img src="https://demo.sir.kr/gnuboard5/data/member/na/naver_92e40906.gif"
                                                 style="vertical-align: middle; margin-right: 2px">길동이짱123
                        </td>
                        <td class="td_date_time">2020-03-19 12:19:00</td>
                        <td>회원가입 포인트</td>
                        <td class="td_point">200</td>
                        <td class="td_point">1,000</td>


                    </tr>
                    <tr>
                        <td class="td_id">lildong123</td>
                        <td class="td-name">이순신</td>
                        <td class="td_nick">이순신123</td>
                        <td class="td_date_time">2020-03-19 12:19:00</td>
                        <td>구매 적립 포인트</td>
                        <td class="td_point">100</td>
                        <td class="td_point">1,700</td>

                    </tr>
                    <tr>
                        <td class="td_id">ggigang123</td>
                        <td class="td-name">가나다</td>
                        <td class="td_nick">gana123</td>
                        <td class="td_date_time">2020-03-19 12:19:00</td>
                        <td>구매 적립 포인트</td>
                        <td class="td_point">100</td>
                        <td class="td_point">1,500</td>


                    </tr>
                    <tr>
                        <td class="td_id">Honggildong123</td>
                        <td class="td-name">홍길동</td>
                        <td class="td_nick"><img src="https://demo.sir.kr/gnuboard5/data/member/na/naver_92e40906.gif"
                                                 style="vertical-align: middle; margin-right: 2px">길동이짱123
                        </td>
                        <td class="td_date_time">2020-03-19 12:19:00</td>
                        <td>구매 적립 포인트</td>
                        <td class="td_point">100</td>
                        <td class="td_point">1,000</td>


                    </tr>
                    <tr>
                        <td class="td_id">Honggildong123</td>
                        <td class="td_name">홍길동</td>
                        <td class="td_nick">길동이짱123</td>
                        <td class="td_date_time">2020-03-19 12:19:00</td>
                        <td>구매 적립 포인트</td>
                        <td class="td_point">100</td>
                        <td class="td_point">1,100</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_list">
                <a href="#">포인트내역 전체보기</a>
            </div>
        </article>
        <article id="foot">
            <p>© COOKIT ALL RIGHTS RESERVED</p>
        </article>
    </div>
</section>
</body>
</html>