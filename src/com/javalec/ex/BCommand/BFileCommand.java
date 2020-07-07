package com.javalec.ex.BCommand;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BDao.BDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BFileCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String path=request.getSession().getServletContext().getRealPath("/upload");
		int size=1024*1024*10;
		String bId,bName,bTitle,bContent,start_date,end_date,name1,name2="";
		String bType="";
		String bFile1="";
		String bFile2="";
		int f_ch=0;
		int check=0;
		try{
			//file
			MultipartRequest multi=new MultipartRequest(request,path,size,"utf-8",new DefaultFileRenamePolicy());
			Enumeration files=multi.getFileNames();
			bId=multi.getParameter("bId");
			bName=multi.getParameter("bName");
			bTitle=multi.getParameter("bTitle");
			bType=multi.getParameter("bType");
			bContent=multi.getParameter("bContent");
			start_date=multi.getParameter("start_date");
			end_date=multi.getParameter("end_date");
			f_ch=Integer.parseInt(multi.getParameter("f_ch"));
			
			switch(f_ch) {
			
			case 0:
				break;
			case 1:
				name1=(String)files.nextElement();
				bFile1=multi.getFilesystemName(name1);
				break;
			case 2:
				name2=(String)files.nextElement();
				bFile2=multi.getFilesystemName(name2);
				break;
			case 3:
				name2=(String)files.nextElement();
				bFile2=multi.getFilesystemName(name2);
				System.out.println(bFile1);
				name1=(String)files.nextElement();
				bFile1=multi.getFilesystemName(name1);
				System.out.println(bFile2);
				break;
			}
			
			if(bContent=="") bContent="emp";
			
			//db
			BDao bdao=new BDao();
			//bdto 데이터 추가메소드 호출
			check=bdao.insertBoard(bId, bName, bTitle, bType, bContent, bFile1, bFile2, start_date, end_date);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		if(bType.equals("basic")) {
			bType="notice";
		}
		
		request.setAttribute("bType", bType);
		request.setAttribute("check", check);
	}

}
