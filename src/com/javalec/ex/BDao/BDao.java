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

public class BDao {
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql;
	int check;
	DataSource ds=null;
	Context context=null;
	BDto dto=null;
	String bId,bName,bTitle,bType,bContent,bFile1,bFile2;
	Timestamp bDate,uDate,start_date,end_date;
	int bHit,bGroup,bIndent,bStep,bNum;
	ArrayList<BDto> list=null;
	
	
	//커넥션 풀
	public BDao() {
		try {
			context=new InitialContext();
			ds=(DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	//글 등록
	public int insertBoard(String bId,String bName,String bTitle,String bType,String bContent,String bFile1,String bFile2,String start_date,String end_date) {
		check=0;
		sql="insert into mvc_adminTab values(?,?,?,?,?,?,?,sysdate,sysdate,?,?,0,0,0,0,admintab_seq.nextval)";
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bId);
			pstmt.setString(2, bName);
			pstmt.setString(3, bTitle);
			pstmt.setString(4, bType);
			pstmt.setString(5, bContent);
			pstmt.setString(6, bFile1);
			pstmt.setString(7, bFile2);
			pstmt.setString(8, start_date);
			pstmt.setString(9, end_date);
			check=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return check;
	} 
	
	//이벤트 리스트 출력
	public ArrayList<BDto> printEvent(String btype,int page,int limit,String opt,String search){
		list=new ArrayList<BDto>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;		
		if(btype.equals("all")) {
			switch(opt) {
			case "":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "all":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where ( btitle like '%' || ? || '%' or bcontent like '%' || ? || '%' )  ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "tit":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where btitle like '%' || ? || '%' ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "con":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where bcontent like '%' || ? || '%' ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			}
		}else if(btype.equals("notice")){
			switch(opt) {
			case "":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where btype=?  or btype='basic' ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "all":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where ( btitle like '%' || ? || '%' or bcontent like '%' || ? || '%' ) and (btype=?  or btype='basic') ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "tit":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where  btitle like '%' || ? || '%'  and (btype=?  or btype='basic')ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			case "con":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where bcontent like '%' || ? || '%' and (btype=?  or btype='basic') ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m )WHERE   R >= ? AND R <= ?";
				break;
			}
		}else {
			switch(opt) {
			case "":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where btype=? ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m ) WHERE   R >= ? AND R <= ?";
				break;
			case "all":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where (btitle like '%' || ? || '%' or bcontent like '%' || ? || '%' ) and btype=?  ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m ) WHERE   R >= ? AND R <= ?";
				break;
			case "tit":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where btitle like '%' || ? || '%'  and btype=?  ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m ) WHERE   R >= ? AND R <= ?";
				break;
			case "con":
				sql="SELECT  * FROM   (SELECT ROWNUM R,m.* FROM (select * from mvc_adminTab  where bcontent like '%' || ? || '%' and btype=?  ORDER BY start_date desc,bdate desc, bgroup DESC,bstep DESC, bNum asc ) m ) WHERE   R >= ? AND R <= ?";
				break;
			}
		}
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			if(btype.equals("all")) {
				switch(opt) {
				case "":
					pstmt.setInt(1, startrow);
					pstmt.setInt(2, endrow);
					break;
				case "all":
					pstmt.setString(1, search);
					pstmt.setString(2, search);
					pstmt.setInt(3, startrow);
					pstmt.setInt(4, endrow);
					break;
				case "tit":
					pstmt.setString(1, search);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					break;
				case "con":
					pstmt.setString(1, search);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					break;
				}
			}else {
				switch(opt) {
				case "":
					pstmt.setString(1, btype);
					pstmt.setInt(2, startrow);
					pstmt.setInt(3, endrow);
					break;
				case "all":
					pstmt.setString(1, search);
					pstmt.setString(2, search);
					pstmt.setString(3, btype);
					pstmt.setInt(4, startrow);
					pstmt.setInt(5, endrow);
					break;
				case "tit":
					pstmt.setString(1, search);
					pstmt.setString(2, btype);
					pstmt.setInt(3, startrow);
					pstmt.setInt(4, endrow);
					break;
				case "con":
					pstmt.setString(1, search);
					pstmt.setString(2, btype);
					pstmt.setInt(3, startrow);
					pstmt.setInt(4, endrow);
					break;
				}
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bId=rs.getString("bId");
				bName=rs.getString("bName");
				bTitle=rs.getString("bTitle");
				bType=rs.getString("bType");
				bContent=rs.getString("bContent");
				bFile1=rs.getString("bFile1");
				bFile2=rs.getString("bFile2");
				bDate=rs.getTimestamp("bDate");
				uDate=rs.getTimestamp("uDate");
				start_date=rs.getTimestamp("start_date");
				end_date=rs.getTimestamp("end_date");
				bHit=rs.getInt("bHit");
				bGroup=rs.getInt("bGroup");
				bStep=rs.getInt("bStep");
				bIndent=rs.getInt("bIndent");
				bNum=rs.getInt("bNum");
				dto=new BDto(bId, bName, bTitle, bType, bContent, bFile1, bFile2, bDate, uDate, start_date, end_date, bHit, bGroup, bStep, bIndent, bNum);
				list.add(dto);
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
	
	//뷰 출력
		public BDto getBoard(int bnum){
			
			sql="select * from mvc_adminTab where bNum= ? ";
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				System.out.println(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					bId=rs.getString("bId");
					bName=rs.getString("bName");
					bTitle=rs.getString("bTitle");
					bType=rs.getString("bType");
					bContent=rs.getString("bContent");
					bFile1=rs.getString("bFile1");
					bFile2=rs.getString("bFile2");
					bDate=rs.getTimestamp("bDate");
					uDate=rs.getTimestamp("uDate");
					start_date=rs.getTimestamp("start_date");
					end_date=rs.getTimestamp("end_date");
					bHit=rs.getInt("bHit");
					bGroup=rs.getInt("bGroup");
					bStep=rs.getInt("bStep");
					bIndent=rs.getInt("bIndent");
					bNum=rs.getInt("bNum");
					dto=new BDto(bId, bName, bTitle, bType, bContent, bFile1, bFile2, bDate, uDate, start_date, end_date, bHit, bGroup, bStep, bIndent, bNum);
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
			
			return dto;
		}
		//조회수 증가
		public int hitplus(int bnum) {
			check=0;
			
			sql="update mvc_adminTab set bhit=bhit+1 where bnum=?";
			
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				check=pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			return check;
		}
		
		
		////count(*)
		public int getlistCount(String opt,String search,String btype) {
			int count=0;
			//검색해서 들어온건지 아니면 그냥 바로 들어왓는지 확인해서 쿼리문이 바뀌어야함.
			
			if(btype.equals("all")) {
				switch(opt) {
				case "":
					sql="select count(*) as cnt from mvc_adminTab ";
					break;
				case "all":
					sql="select count(*) as cnt from mvc_adminTab  where btitle like '%' || ? || '%' or bcontent like '%' || ? || '%'   ";
					break;
				case "tit":
					sql="select count(*) as cnt from mvc_adminTab  where btitle like '%' || ? || '%' ";
					break;
				case "con":
					sql="select count(*) as cnt from mvc_adminTab  where bcontent like '%' || ? || '%' ";
					break;
				}
			}else if(btype.equals("notice")){
				switch(opt) {
				case "":
					sql="select count(*) as cnt from mvc_adminTab  where btype=?  or btype='basic'";
					break;
				case "all":
					sql="select count(*) as cnt from mvc_adminTab  where ( btitle like '%' || ? || '%' or bcontent like '%' || ? || '%' ) and (btype=?  or btype='basic')";
					break;
				case "tit":
					sql="select count(*) as cnt from mvc_adminTab  where btitle like '%' || ? || '%'  and (btype=?  or btype='basic')";
					break;
				case "con":
					sql="select count(*) as cnt from mvc_adminTab  where bcontent like '%' || ? || '%' and (btype=?  or btype='basic')";
					break;
				}
			}else {
				switch(opt) {
				case "":
					sql="select count(*) as cnt from mvc_adminTab  where btype=? ";
					break;
				case "all":
					sql="select count(*) as cnt from mvc_adminTab  where (btitle like '%' || ? || '%' or bcontent like '%' || ? || '%' ) and btype=?  ";
					break;
				case "tit":
					sql="select count(*) as cnt from mvc_adminTab  where btitle like '%' || ? || '%'  and btype=?  ";
					break;
				case "con":
					sql="select count(*) as cnt from mvc_adminTab  where bcontent like '%' || ? || '%' and btype=?  ";
					break;
				}
			}
			
			
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1,opt);
				if(btype.equals("all")) {
					switch(opt) {
					case "":
						break;
					case "all":
						pstmt.setString(1, search);
						pstmt.setString(2, search);
						break;
					case "tit":
						pstmt.setString(1, search);
						break;
					case "con":
						pstmt.setString(1, search);
						break;
					}
				}else {
					switch(opt) {
					case "":
						pstmt.setString(1, btype);
						break;
					case "all":
						pstmt.setString(1, search);
						pstmt.setString(2, search);
						pstmt.setString(3, btype);
						break;
					case "tit":
						pstmt.setString(1, search);
						pstmt.setString(2, btype);
						break;
					case "con":
						pstmt.setString(1, search);
						pstmt.setString(2, btype);
						break;
					}
				}
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
		
		
		//삭제
		public int delete(int bnum) {
			check=0;
			sql="delete from mvc_adminTab where bNum=?";
			
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, bnum);
				check=pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return check;
		}
		
		//수정
		public int modify(String btitle,String btype,String bcontent,String bfile1,String bfile2,String start_date,String end_date,int bnum) {
			check=0;
			sql="update mvc_adminTab set btitle=?,btype=?,bcontent=?,bfile1=?,bfile2=?,udate=sysdate,start_date=?,end_date=? where bnum=?";
			
			try {
				con=ds.getConnection();
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, btitle);
				pstmt.setString(2, btype);
				pstmt.setString(3, bcontent);
				pstmt.setString(4, bfile1);
				pstmt.setString(5, bfile2);
				pstmt.setString(6, start_date);
				pstmt.setString(7, end_date);
				pstmt.setInt(8, bnum);
				check=pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt!=null)pstmt.close();
					if(con!=null)con.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
			return check;
		}
		
}
