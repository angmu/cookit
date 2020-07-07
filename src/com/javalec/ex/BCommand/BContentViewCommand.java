package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.ex.BDao.BDao;
import com.javalec.ex.BDto.BDto;

public class BContentViewCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int bnum=Integer.parseInt(request.getParameter("bNum"));
		BDao dao=new BDao();
		int Hit_ch=0;
		
		HttpSession session=request.getSession();
		String bid=(String)session.getAttribute("authuser");
		if(bid==null)bid="";
		if(!(bid.equals("admin"))) {
			Hit_ch=dao.hitplus(bnum);
			request.setAttribute("Hit_ch", Hit_ch);
		}
		
		BDto dto=dao.getBoard(bnum);
		String bTypetext=request.getParameter("bTypetext");
		
		request.setAttribute("bTypetext", bTypetext);
		request.setAttribute("dto", dto);
	}
}


