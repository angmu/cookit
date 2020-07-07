package com.javalec.ex.BCommand;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.BDao;
import com.javalec.ex.BDao.MemberDao;
import com.javalec.ex.BDto.BDto;
import com.javalec.ex.BDto.BMemberDto;

public class AdminListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//검색변수
				int page=1;//최초기본 1페이지 세팅
				int limit=10;//1페이지=게시글 10개
				String opt="";
				String search="";
				//들어온 보드타입
				String btype="all";
				
				//게시글출력
				BDao dao=new BDao();
				ArrayList<BDto> list=new ArrayList<BDto>();
				
				//멤버출력
				MemberDao mdao=new MemberDao();
				ArrayList<BMemberDto> mlist=new ArrayList<BMemberDto>();
				mlist=mdao.getMembers(page, limit);
				int mlistcount=mdao.getlistCount();
				
				//검색을 위해 변수 2개 추가, 페이지를 위해 3개 추가
				list=dao.printEvent(btype,page,limit,opt,search);
				//전체 게시글 count(*) //검색창 추가로 변수 2개 추가
				int listcount=dao.getlistCount(opt,search,btype);

				request.setAttribute("mlist", mlist);
				request.setAttribute("mlistcount", mlistcount);
				
				
				request.setAttribute("list", list);
				request.setAttribute("listcount", listcount);
				
	}

}
