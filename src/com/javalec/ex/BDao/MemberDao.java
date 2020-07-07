package com.javalec.ex.BDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.ex.BDto.BDto;
import com.javalec.ex.BDto.BMemberDto;

public class MemberDao {
	public MemberDao(){
		try {
			context=new InitialContext();
			ds=(DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql;
	int check;
	DataSource ds=null;
	Context context=null;
	BMemberDto mdto=null;
	ArrayList<BMemberDto> list=null;
	
	String id,pw,name,email,addr_num,address1,address2,phone1,phone2,phone3,birthtype,gender,newsok,smsok,m_job,marry,h_computer,h_movie,h_music,h_shopping,h_game,h_art,h_baby,h_cook,h_interior,h_leisure,h_diet,h_fashion,m_level;
	Timestamp birth,m_date,u_date;
	int m_point;
	
	
	//로그인
	//id, pw체크 (로그인체크)
	public int login_check(String id,String pw) {
		check=0;
		sql="select id,pw from mvc_c_member where id=?";
				
				try {
					con=ds.getConnection();
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					//rs가 있으면..아이디가 있는것.. yes..
					if(rs.next()) {
						if(pw.equals(rs.getString("pw"))) {
							//비번일치
							check=1;
						}else {
							//비번불일치
							check=0;
						}
					}else {
						//아이디 미존재..
						check=-1;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs!=null)rs.close();
						if(pstmt!=null)pstmt.close();
						if(con!=null)con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
					
				}
				return check;
		}
	
	//id만 체크(회원가입)
	public int id_check(String id) {
		check=0;
		sql="select id from mvc_c_member where id=?";
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//rs가 있으면..아이디가 있는것.. yes..
			if(rs.next()) {
					check=1;
			}else {
					//아이디없음
					check=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			
		}
		return check;
	}
	
	
	//회원 1명조회 
		public BMemberDto getMember(String Id) {
			sql="select * from mvc_c_member where id=?";
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, Id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					id=rs.getString("id");
					pw=rs.getString("pw");
					name=rs.getString("name");
					email=rs.getString("email");
					addr_num=rs.getString("addr_num");
					address1=rs.getString("address1");
					address2=rs.getString("address2");
					phone1=rs.getString("phone1");
					phone2=rs.getString("phone2");
					phone3=rs.getString("phone3");
					birth=rs.getTimestamp("birth");
					birthtype=rs.getString("birthtype");
					gender=rs.getString("gender");
					newsok=rs.getString("newsok");
					smsok=rs.getString("smsok");
					m_job=rs.getString("m_job");
					marry=rs.getString("marry");
					h_computer=rs.getString("h_computer");
					h_movie=rs.getString("h_movie");
					h_music=rs.getString("h_music");
					h_shopping=rs.getString("h_shopping");
					h_game=rs.getString("h_game");
					h_art=rs.getString("h_art");
					h_baby=rs.getString("h_baby");
					h_cook=rs.getString("h_cook");
					h_interior=rs.getString("h_interior");
					h_leisure=rs.getString("h_leisure");
					h_diet=rs.getString("h_diet");
					h_fashion=rs.getString("h_fashion");
					m_level=rs.getString("m_level");
					m_date=rs.getTimestamp("m_date");
					u_date=rs.getTimestamp("u_date");
					m_point=rs.getInt("m_point");
					mdto=new BMemberDto(id, pw, name, email, addr_num, address1, address2, phone1, phone2, phone3, birth, birthtype, gender, newsok, smsok, m_job, marry, h_computer, h_movie, h_music, h_shopping, h_game, h_art, h_baby, h_cook, h_interior, h_leisure, h_diet, h_fashion, m_level, m_date, u_date, m_point);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			return mdto;
		}
		//멤버 여럿 출력
		public ArrayList<BMemberDto> getMembers(int page,int limit){
			
			list=new ArrayList<BMemberDto>();
			int startrow=(page-1)*limit+1;
			int endrow=startrow+limit-1;	
			
			sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_c_member ORDER BY m_date desc ) m )WHERE   R >= ? AND R <= ?";
			
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					id=rs.getString("id");
					pw=rs.getString("pw");
					name=rs.getString("name");
					email=rs.getString("email");
					addr_num=rs.getString("addr_num");
					address1=rs.getString("address1");
					address2=rs.getString("address2");
					phone1=rs.getString("phone1");
					phone2=rs.getString("phone2");
					phone3=rs.getString("phone3");
					birth=rs.getTimestamp("birth");
					birthtype=rs.getString("birthtype");
					gender=rs.getString("gender");
					newsok=rs.getString("newsok");
					smsok=rs.getString("smsok");
					m_job=rs.getString("m_job");
					marry=rs.getString("marry");
					h_computer=rs.getString("h_computer");
					h_movie=rs.getString("h_movie");
					h_music=rs.getString("h_music");
					h_shopping=rs.getString("h_shopping");
					h_game=rs.getString("h_game");
					h_art=rs.getString("h_art");
					h_baby=rs.getString("h_baby");
					h_cook=rs.getString("h_cook");
					h_interior=rs.getString("h_interior");
					h_leisure=rs.getString("h_leisure");
					h_diet=rs.getString("h_diet");
					h_fashion=rs.getString("h_fashion");
					m_level=rs.getString("m_level");
					m_date=rs.getTimestamp("m_date");
					u_date=rs.getTimestamp("u_date");
					m_point=rs.getInt("m_point");
					mdto=new BMemberDto(id, pw, name, email, addr_num, address1, address2, phone1, phone2, phone3, birth, birthtype, gender, newsok, smsok, m_job, marry, h_computer, h_movie, h_music, h_shopping, h_game, h_art, h_baby, h_cook, h_interior, h_leisure, h_diet, h_fashion, m_level, m_date, u_date, m_point);
					list.add(mdto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return list;
		}
		
		
		
		//회원가입
		public int inputMember(String id,String pw,String name,String email,String addr_num,String address1,String address2,String phone1,String phone2,String phone3,String birth,String birthtype,String gender,String newsok,String smsok,String m_job,String marry,String h_computer,String h_movie,String h_music,String h_shopping,String h_game,String h_art,String h_baby,String h_cook,String h_interior,String h_leisure,String h_diet,String h_fashion) {
			check=0;
			sql="insert into mvc_c_member values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,'1',sysdate,sysdate,0)";
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.setString(5, addr_num);
				pstmt.setString(6, address1);
				pstmt.setString(7, address2);
				pstmt.setString(8, phone1);
				pstmt.setString(9, phone2);
				pstmt.setString(10, phone3);
				pstmt.setString(11, birth);
				pstmt.setString(12, birthtype);
				pstmt.setString(13, gender);
				pstmt.setString(14, newsok);
				pstmt.setString(15, smsok);
				pstmt.setString(16, m_job);
				pstmt.setString(17, marry);
				pstmt.setString(18, h_computer);
				pstmt.setString(19, h_movie);
				pstmt.setString(20, h_music);
				pstmt.setString(21, h_shopping);
				pstmt.setString(22, h_game);
				pstmt.setString(23, h_art);
				pstmt.setString(24, h_baby);
				pstmt.setString(25, h_cook);
				pstmt.setString(26, h_interior);
				pstmt.setString(27, h_leisure);
				pstmt.setString(28, h_diet);
				pstmt.setString(29, h_fashion);
				check=pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
			
			return check;
		}
	////count(*)
			public int getlistCount() {
				int count=0;
				sql="select count(*) as cnt from mvc_c_member ";
				
				try {
					con=ds.getConnection();
					pstmt=con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						//별칭으로 받아온다.
						count=rs.getInt("cnt");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(rs!=null)rs.close();
						if(pstmt!=null)pstmt.close();
						if(con!=null)con.close();
					} catch (Exception e2) {
						e2.printStackTrace();
					}
				}
				
				return count;
			}//count(*)
}
