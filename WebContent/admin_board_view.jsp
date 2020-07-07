<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link type="text/css" rel="stylesheet" href="css/manage_main.css">
    <link rel="stylesheet" href="css/admin_header.css">
    <link rel="stylesheet" href="css/main_notice.css">
    <title>관리페이지</title>
    <script src="js/jquery-1.12.3.js"></script>
    <script src="js/board_context.js"></script>
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
                                <span id="icon-plus-minus1" class="icon-list-plus">ListIcon</span>
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
                                <span id="icon-plus-minus2" class="icon-list-plus">ListIcon</span>
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
                <div id="notice_content">
                    <table class="table_content">
                        <colgroup>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th><img src="images/notice_header/t_icon.png" class="dotted">작성자</th>
                            <td id="writeID">${dto.bName }</td>
                            <th><img src="images/notice_header/t_icon.png" class="dotted">작성일</th>
                            <td id="writeDate"><fmt:formatDate value="${dto.bDate }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        </tr>
                        <tr>
                            <th><img src="images/notice_header/t_icon.png" class="dotted">시작일</th>
                            <td><fmt:formatDate value="${dto.start_date }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                            <th><img src="images/notice_header/t_icon.png" class="dotted">종료일</th>
                            <td><fmt:formatDate value="${dto.end_date }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th><img src="images/notice_header/t_icon.png" class="dotted">제목</th>
                            <td colspan="3" id="writeSubject">${dto.bTitle }</td>
                        </tr>
                        <tr>
<!--                            실제 글 내용-->
                            <td colspan="4" id="writeContext">
                            <div style="font-size: 12px; min-height: 50px" class="b_content">
								<c:if test="${dto.bFile2!=null }">
								<img src="upload/${dto.bFile2 }">
								</c:if>
								<c:if test="${dto.bContent!=null }">
									${dto.bContent }<br>
								</c:if>
                            </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="clear"></div>
                    <div class="border_btn">
                        <p class="float_r">
                            <button class="btnIcon" onclick="location.href='modifyview.do?bNum=${dto.bNum}'">수정</button>
                            <button class="btnIcon" onclick="location.href='delete.do?bNum=${dto.bNum}&bType=${dto.bType }'">삭제</button>
                            <button class="btnIcon" onclick="location.href='boardlist.do?bType=${dto.bType }'">리스트</button>
                        </p>
                    </div>
                </div>
    <article id="foot">
        <p>© COOKIT ALL RIGHTS RESERVED</p>
    </article>
            </div>
        </div>
    </div>
</div>
</body>
</html>