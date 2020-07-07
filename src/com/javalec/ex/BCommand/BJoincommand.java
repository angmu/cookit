package com.javalec.ex.BCommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.MemberDao;

public class BJoincommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email="";
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		email=email1+"@"+email2;
		String addr_num=request.getParameter("addr_num");
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String birth="";
		String byear=request.getParameter("byear");
		String bmonth=request.getParameter("bmonth");
		String bdate=request.getParameter("bdate");
		birth=byear+"-"+bmonth+"-"+bdate;
		String birthtype=request.getParameter("birthtype");
		String gender=request.getParameter("gender");
		String newsok=request.getParameter("newsok");
		String smsok=request.getParameter("smsok");
		String m_job=request.getParameter("m_job");
		String marry=request.getParameter("marry");
		String[] hobby1=request.getParameterValues("hobby");
		String hobby="";
		
		String [] hobby_ch= {"h_computer","h_movie","h_music","h_music","h_shopping","h_game","h_art","h_baby","h_cook","h_interior","h_leisure","h_diet","h_fashion"};
		
		for(int i=0;i<hobby1.length;i++) {
			hobby+=" "+hobby1[i];
		}
		System.out.println(hobby);
		for(int i=0;i<hobby_ch.length;i++) {
			if(hobby.contains(hobby_ch[i])) {
				hobby_ch[i]="y";
			}else {
				hobby_ch[i]="n";
			}
		}
		
		MemberDao mdao=new MemberDao();
		int check=mdao.inputMember(id, pw, name, email, addr_num, address1, address2, phone1, phone2, phone3, birth, birthtype, gender, newsok, smsok, m_job, marry, hobby_ch[0], hobby_ch[1], hobby_ch[2], hobby_ch[3], hobby_ch[4], hobby_ch[5], hobby_ch[6], hobby_ch[7], hobby_ch[8], hobby_ch[9], hobby_ch[10], hobby_ch[11]);

		request.setAttribute("check", check);
	}

}
