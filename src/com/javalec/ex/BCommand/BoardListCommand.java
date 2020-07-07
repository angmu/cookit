package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.BDao;
import com.javalec.ex.BDto.BDto;

public class BoardListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		//검색변수
		int page=1;//최초기본 1페이지 세팅
		int limit=10;//1페이지=게시글 10개
		String searchflag=request.getParameter("searchflag");
		String opt=request.getParameter("opt");//전체 제목 내용
		String search=request.getParameter("search");//검색어
				
		if(opt==null) opt="";
		if(search==null) search="";
				
		//들어온 보드타입
		String btype="all";
		String bTypetext="";
				
		//page가 넘어온게 있을경우..ex)4..
		if(request.getParameter("page")!=null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(request.getParameter("bType")!=null) {
			btype=request.getParameter("bType");
		};
		if(btype.equals("notice")) {
			bTypetext="공지사항";
		}else if(btype.equals("event")) {
			bTypetext="이벤트";
			limit=12;
		}else if(btype.equals("basic")) {
			bTypetext="공지사항";
			btype="notice";
		}
		//검색시 보드에서 넘어온 texttype
		if(request.getParameter("bTypetext")!=null) {
			bTypetext=request.getParameter("bTypetext");
			if(bTypetext.equals("공지사항")) {
				btype="notice";
			}else if(bTypetext.equals("이벤트")) {
				btype="event";
				limit=12;
			}
		}
		
		//출력
		BDao dao=new BDao();
		ArrayList<BDto> list=new ArrayList<BDto>();
		//검색을 위해 변수 2개 추가, 페이지를 위해 3개 추가
		list=dao.printEvent(btype,page,limit,opt,search);
		System.out.println(btype+" "+page+" "+opt+" "+search+" "+limit);
		//전체 게시글 count(*) //검색창 추가로 변수 2개 추가
		int listcount=dao.getlistCount(opt,search,btype);
		//최대 페이지 수
		int maxpage=(int)((double)listcount/limit+0.95);
		//처음페이지
		int startpage=(((int)((double)page/limit+0.95))-1)*limit+1;
		//마지막페이지
		int endpage=maxpage; // 총 페이지 개수가 1~10까지는 maxpage가 endpage가 됨.
		//11페이지 이후 endpage
		if(endpage>startpage+limit-1) endpage=startpage+limit-1;
		
		request.setAttribute("list", list);
		
		//게시판상단의 글자
		request.setAttribute("bTypetext", bTypetext);
		
		//하단 페이지 번호를 위한 5개의 변수
		request.setAttribute("listcount", listcount);
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("bType", btype);
		
		System.out.println();
		//search를 사용하면 넘어가는 것
		if(search!="") {
			searchflag="1";
			request.setAttribute("searchflag", searchflag);
			request.setAttribute("opt", opt);
			request.setAttribute("search", search);
		}
		
	}

}
