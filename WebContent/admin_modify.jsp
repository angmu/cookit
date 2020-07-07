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
	<link rel="stylesheet" href="css/admin_main.css">
	<link rel="stylesheet" href="css/admin_header.css">
	<link rel="stylesheet" href="css/main_notice.css">
	<link rel="stylesheet" href="css/admin_input.css">
<title>관리페이지</title>

<script type="text/javascript" src="js/admin_input.js"></script>


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
		<div id="manage_main" class="modi">
			<div>
				<!---------- 좌측메뉴 ---------->
				<div id="leftArea">
						<div>
							<h2><em></em>&nbsp;관리자 게시판</h2>
							<ul class="menu">
								<li class="on">
								<a href="#"> 게시판 관리
									<span id="icon-plus-minus1" class="icon-list-minus">ListIcon</span>
									<span id="icon-plus-minus1" class="icon-list-plus">ListIcon</span>
								</a>
							</li>
							<div class="submenu" id="LeftMenuID1">
									<li class="on"><a href="admin_board.html"><img src="images/manage/icon_title_left.png">&nbsp;공지사항</a></li>
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;묻고답하기(Q&A)</a></li>
									<li><a href="#"><img src="images/manage/icon_title_left.png">&nbsp;쪽지함</a></li>
							</div>
							<li>
								<a href="#">서비스 사용 현황
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
			         		 공지사항
			                <div class="float_r">
			                    <a><p class="listed"></p></a>
			                </div>
			                <div class="float_r">
			                    <a><p class="favorite"></p></a>
			                </div>
			                <div></div>
			            </li>
			        </ul>
			    </div>
   				<div class="sub_content_area">
				<form action="modify.do" method="post" name="input_form_ad" enctype="multipart/form-data">
					<table>
						<colgroup>
						<col width="130px">
						<col width="870px">
						</colgroup>
						<!-- 유형~제목 -->
						<thead>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">유형</th>
							<td><select name="bType">
							
							<c:choose>
								<c:when test="${dto.bType=='basic' }">
									<option value="basic" selected="selected">일반글 작성</option>
									<option value="notice">공지글 작성</option>
									<option value="event">이벤트글 작성</option>
								</c:when>
								<c:when test="${dto.bType=='notice' }">
									<option value="basic">일반글 작성</option>
									<option value="notice" selected="selected">공지글 작성</option>
									<option value="event">이벤트글 작성</option>
								</c:when>
								<c:when test="${dto.bType=='event' }">
									<option value="basic">일반글 작성</option>
									<option value="notice">공지글 작성</option>
									<option value="event" selected="selected">이벤트글 작성</option>
								</c:when>
							</c:choose>
							</select><input type="text" hidden="" name="bNum" value="${dto.bNum }"></td>
						</tr>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">작성자</th>
							<td><input type="text" readonly="readonly" value="${dto.bName}" name="bName"> </td>
						</tr>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">제목</th>
							<td><input type="text" name="bTitle" value="${dto.bTitle }"></td>
						</tr>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">이벤트기간</th>
							<td>시작일: <input type="date" name="start_date" value="<fmt:formatDate value="${dto.start_date }" pattern="yyyy-MM-dd"/>"> ~ 종료일: <input type="date" name="end_date" value="<fmt:formatDate value="${dto.end_date }" pattern="yyyy-MM-dd"/>"></td>
						</tr>
						</thead>
						<tbody>
						<!-- textarea존 -->
							<tr>
								<td colspan="2">
								<textarea rows="10" cols="100" name="bContent">${dto.bContent }</textarea>
								</td>
							</tr>
						</tbody>
						<!-- 첨부파일~자동등록방지 -->
						<tfoot>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">첨부파일1<span><img src="images/admin_input/icon_help.png" alt="이미지 혹은 문서파일만 첨부가능" class="file_ico">
							<input type="text" hidden="" name="f_ch"></span></th>
							<td class="filebox"><input type="file" name="bFile1" id="bFile1">이벤트등록시에만 업로드 (가로 380*세로 232)
							<c:if test="${dto.bFile1!=null }">
							<br> *이전파일<input type="text" name="old_bFile1" readonly="readonly" value="${dto.bFile1 }" class="old_file"><img alt="" src="upload/${dto.bFile1 }">
							</c:if>
							</td>
						</tr>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">첨부파일2<span><img src="images/admin_input/icon_help.png" alt="이미지 혹은 문서파일만 첨부가능" class="file_ico"></span></th>
							<td class="filebox"><input type="file" name="bFile2" id="bFile2">글내용에 들어갈 파일입니다.
							<c:if test="${dto.bFile2!=null  }">
							<br> *이전파일<input type="text" name="old_bFile2" readonly="readonly" value="${dto.bFile2 }" class="old_file"><img alt="" src="upload/${dto.bFile2 }">
							</c:if>
							</td>
						</tr>
						<tr>
							<th><img src="images/admin_input/t_icon.png" alt="" class="th_con">자동등록<br>&nbsp;&nbsp;방지코드</th>
							<td><img src="images/admin_input/3j8yws.jpg" alt="자동입력방지문자"><div class="auto_no_box"><input type="text" name="auto_dis"><br><p>*좌측의 코드를 입력해주세요</p></div></td>
						</tr>
						</tfoot>
					</table>
					<div class="btn_area">
						<input type="button" value="수정" onclick="check()">
						<input type="button" value="취소" onclick="history.back()">
					</div>
				</form>
				
			</div>
			<article id="foot">
		       <p>© COOKIT ALL RIGHTS RESERVED</p>
		    </article>
			</div>
		</div>
	</div>
</body>
</html>