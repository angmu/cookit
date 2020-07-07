package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.MemberDao;

public class BIdcheckcommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		MemberDao mdao= new MemberDao();
		String id=request.getParameter("ch_id");
		System.out.println(id);
		int check=mdao.id_check(id);
		
		request.setAttribute("check", check);
		if(check==0) {
		request.setAttribute("id_ch", id);
		}
	}

}
