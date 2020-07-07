package com.javalec.ex.BFront;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.ex.BCommand.AdminListCommand;
import com.javalec.ex.BCommand.BCommand;
import com.javalec.ex.BCommand.BContentViewCommand;
import com.javalec.ex.BCommand.BDeleteCommand;
import com.javalec.ex.BCommand.BFileCommand;
import com.javalec.ex.BCommand.BIdcheckcommand;
import com.javalec.ex.BCommand.BJoincommand;
import com.javalec.ex.BCommand.BLoginCommand;
import com.javalec.ex.BCommand.BLogoutCommand;
import com.javalec.ex.BCommand.BModifyCommand;
import com.javalec.ex.BCommand.BoardListCommand;

/**
 * Servlet implementation class BFront
 */
@WebServlet("*.do")
public class BFront extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFront() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri=request.getRequestURI();
		String comPath=request.getContextPath();
		String com=uri.substring(comPath.length());
		BCommand bcom=null;
		String viewPage=null;
		//로그인
		if(com.equals("/login.do")) {
			bcom=new BLoginCommand();
			bcom.execute(request, response);
			viewPage="login_ok.jsp";
		}
		//글쓰기
		else if(com.equals("/fileInput.do")) {
			bcom=new BFileCommand();
			bcom.execute(request, response);
			viewPage="input_ok.jsp";
		}//이벤트리스트
		else if(com.equals("/event_list.do")) {
			bcom=new BoardListCommand();
			bcom.execute(request, response);
			viewPage="event_list.jsp";
		}
		//공지사항리스트
		else if(com.equals("/list.do")) {
		bcom=new BoardListCommand();
		bcom.execute(request, response);
		viewPage="list.jsp";
		}
		
		//이벤트뷰 상세
		else if(com.equals("/event_view.do")) {
			bcom=new BContentViewCommand();
			bcom.execute(request, response);
			viewPage="event_view.jsp";
		}
		//글수정(보드불러오기)
		else if(com.equals("/modifyview.do")) {
			bcom=new BContentViewCommand();
			bcom.execute(request, response);
			viewPage="admin_modify.jsp";
		}
		//글수정(업데이트)
		else if(com.equals("/modify.do")) {
			bcom=new BModifyCommand();
			bcom.execute(request, response);
			viewPage="modify_ok.jsp";
		}
		//글삭제
		else if(com.equals("/delete.do")) {
			viewPage="delete_ok.jsp";
		}//글삭제
		else if(com.equals("/delete_ok.do")) {
			bcom=new BDeleteCommand();
			bcom.execute(request, response);
			viewPage="deletego.jsp";
		}
		//로그아웃
		else if(com.equals("/logout.do")) {
			bcom=new BLogoutCommand();
			bcom.execute(request, response);
			viewPage="logout.jsp";
		}
		//관리자 게시판 리스트
		else if(com.equals("/boardlist.do")) {
			bcom=new BoardListCommand();
			bcom.execute(request, response);
			viewPage="admin_board.jsp";
		}
		//관리자 게시판 리스트상세
			else if(com.equals("/boardView.do")) {
			bcom=new BContentViewCommand();
			bcom.execute(request, response);
			viewPage="admin_board_view.jsp";
		}
		
		//회원가입 아이디체크
		else if(com.equals("/id_check.do")) {
			bcom=new BIdcheckcommand();
			bcom.execute(request, response);
			viewPage="signpop.jsp";
		}
		//회원가입 
		else if(com.equals("/signinfo.do")) {
		bcom=new BJoincommand();
		bcom.execute(request, response);
		viewPage="join_ok.jsp";
		}
		//어드민 메인가기.
		else if(com.equals("/admin_main.do")) {
		bcom=new AdminListCommand();
		bcom.execute(request, response);
		viewPage="admin_main.jsp";
		}
		
		RequestDispatcher dispatcher=request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
