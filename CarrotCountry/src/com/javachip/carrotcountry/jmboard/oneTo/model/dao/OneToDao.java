package com.javachip.carrotcountry.jmboard.oneTo.model.dao;

import static com.javachip.carrotcountry.common.JDBCtemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.javachip.carrotcountry.jmboard.notice.model.dao.NoticeDao;
import com.javachip.carrotcountry.jmboard.notice.model.vo.PageInfo;
import com.javachip.carrotcountry.jmboard.oneTo.model.vo.OneTo;

public class OneToDao {

	private Properties prop = new Properties();
	
	public OneToDao() {
		
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/sql/jmboard/oneTo-mapper.xml").getPath()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("LISTCOUNT");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return listCount;
	}
	
	
	
	public ArrayList<OneTo> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<OneTo> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getNoticeLimit() + 1;
			int endRow = startRow + pi.getNoticeLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new OneTo(rset.getInt("ONETO_NO"),
									rset.getString("MEM_NAME"),
									rset.getString("ONETO_TYPE"),
									rset.getString("ONETO_NAME"),
									rset.getDate("ANSWER_DATE"),
									rset.getString("ANSWER_STATE")));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return list;
	}

	public int insertOneTo(Connection conn, OneTo o) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertOneTo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,Integer.parseInt(o.getWriterNo()));
			pstmt.setString(2,o.getOneToType());
			pstmt.setString(3,o.getOneToName());
			pstmt.setString(4,o.getOneToContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

	public int answer(Connection conn, OneTo o) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("answer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o.getAnswererNo());
			pstmt.setString(2, o.getAnswerContent());
			pstmt.setInt(3, o.getOneToNo());
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		
		return result;
	}

	public int userModify(Connection conn, OneTo o) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("userModify");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, o.getOneToType());
			
			pstmt.setString(2, o.getOneToName());
			
			pstmt.setString(3, o.getOneToContent());
			
			pstmt.setInt(4, o.getOneToNo());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
			
		
		return result;
	}
	
	
	
	
	
	
	
	
	

	public OneTo selectOneTo(Connection conn, int ono) {
		
		OneTo o = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneTo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ono);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new OneTo(rset.getInt("ONETO_NO"),
							  rset.getString("WRITER"),
							  rset.getString("ANSWERER"),
							  rset.getString("FAQ_CATEGORY_NAME"),
							  rset.getString("ONETO_NAME"),
							  rset.getString("ONETO_CONTENT"),
							  rset.getString("ANSWER_CONTENT"),
							  rset.getDate("ANSWER_DATE"),
							  rset.getString("ANSWER_STATE"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return o;
	}

	
	
	
}
