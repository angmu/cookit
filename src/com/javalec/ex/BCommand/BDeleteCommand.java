package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.BDao;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		BDao dao=new BDao();
		String btype=request.getParameter("bType");
		System.out.println(btype);
		int bnum=Integer.parseInt(request.getParameter("bNum"));
		System.out.println(bnum);
		int check=dao.delete(bnum);
		request.setAttribute("check", check);
		request.setAttribute("bType", btype);
	}

}
