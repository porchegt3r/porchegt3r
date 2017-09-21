package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import member.MemberDTO;
import member.MemberDTO;
import utility.DBClose;
import utility.DBOpen;

public class MemberDAO {
	
	public String getGrade(String id){
		String grade = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select grade ");
		sql.append(" from member2 ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return grade;
	}
	
	public boolean loginCheck(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = (String)map.get("id");
		String passwd = (String)map.get("passwd");
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from member2 ");
		sql.append(" where id = ? ");
		sql.append(" and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		
		return flag;
	}
	
	public boolean updatePw(Map map){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String passwd = (String)map.get("passwd");
		String id = (String)map.get("id");
		StringBuffer sql = new StringBuffer();
		sql.append(" update member2 ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
		
	}
	
	
	public boolean updateFile(Map map){
		boolean flag = false;
		Connection con =DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String fname = (String)map.get("fname");
		String id = (String)map.get("id");
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update member2 ");
		sql.append(" set fname = ? ");
		sql.append(" where id = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
	}
	
	public boolean duplicateId(String id){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(id) as cnt ");
		sql.append(" from member2 ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
		
	}
	
	public boolean duplicateEmail(String email){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("  select count(email) as cnt ");
		sql.append("  from member2 ");
		sql.append("  where email = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if(cnt>0)flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		
		return flag;
	}
	
	
	
	
	public String getFname(String id){
		String fname = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname ");
		sql.append(" from member2 ");
		sql.append(" where id=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			rs = pstmt.executeQuery();
			if(rs.next()){
				fname = rs.getString("fname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		return fname;
	}
	
	public MemberDTO read(String id){
		MemberDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select * ");
		sql.append(" from member2 ");
		sql.append(" where id=? ");

		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setJob(rs.getString("job"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
	}

public List<MemberDTO> list(Map map){
	List<MemberDTO> list = new ArrayList<MemberDTO>();
	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String col = (String)map.get("col");
	String word = (String)map.get("word");
	int sno = (Integer)map.get("sno");
	int eno = (Integer)map.get("eno");
	StringBuffer sql = new StringBuffer();
	sql.append(" SELECT id,  mname, tel, email, job, mdate, fname, r");
	sql.append(" from(");
	sql.append(" 	SELECT id,  mname, tel, email, job, mdate, fname, rownum as r");
	sql.append(" 	from(");
	sql.append(" 		SELECT id,  mname, tel, email, job, mdate, fname");
	sql.append(" 		FROM member2  ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
	sql.append(" ORDER BY mdate DESC");
	sql.append(" ) ) where r>=? and r <= ? ");
	
	try {
		int i = 0;
		pstmt = con.prepareStatement(sql.toString());
		if(word.trim().length()>0)
			pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getString("id"));
			dto.setMname(rs.getString("mname"));
			dto.setTel(rs.getString("tel"));
			dto.setEmail(rs.getString("email"));
			dto.setJob(rs.getString("job"));
			dto.setMdate(rs.getString("mdate"));
			dto.setFname(rs.getString("fname"));
			
			list.add(dto);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(rs, pstmt, con);
	}
	
	return list;
}
public boolean create(MemberDTO dto){
	boolean flag = false;
	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	StringBuffer sql = new StringBuffer();
	sql.append(" INSERT INTO member2(id, passwd, mname, tel, email, zipcode,");
	sql.append(" address1,address2, job, mdate, fname, grade) ");
	sql.append(" VALUES(?, ?, ?, ?, ?,  ");
	sql.append(" ?, ?, ? , ?, sysdate, ?, 'H') ");
	
	try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getId());
		pstmt.setString(2, dto.getPasswd());
		pstmt.setString(3, dto.getMname());
		pstmt.setString(4, dto.getTel());
		pstmt.setString(5, dto.getEmail());
		pstmt.setString(6, dto.getZipcode());
		pstmt.setString(7, dto.getAddress1());
		pstmt.setString(8, dto.getAddress2());
		pstmt.setString(9, dto.getJob());
		pstmt.setString(10, dto.getFname());
		
		int cnt = pstmt.executeUpdate();
		if(cnt>0)flag=true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(pstmt, con);
	}
	
	return flag;
}

public boolean update(MemberDTO dto){
	boolean flag = false;
	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	StringBuffer sql = new StringBuffer();
	
	sql.append(" update member2 set ");
	sql.append(" tel = ? ");
	sql.append(" email = ?");
	sql.append(" zipcode = ?");
	sql.append(" address1 = ?");
	sql.append(" address2 = ?" );
	sql.append(" job = ? ");
	sql.append(" where id = ? ");
	
	try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getTel());
		pstmt.setString(2, dto.getEmail());
		pstmt.setString(3, dto.getZipcode());
		pstmt.setString(4, dto.getAddress1());
		pstmt.setString(5, dto.getAddress2());
		pstmt.setString(6, dto.getJob());
		pstmt.setString(7, dto.getId());
		
		int cnt =pstmt.executeUpdate();
		if(cnt>0)flag=true;
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(pstmt, con);
	}
	return flag;
}

public boolean delete(String id){
	boolean flag = false;
	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	StringBuffer sql = new StringBuffer();
	
	sql.append(" delete from memeber2 ");
	sql.append(" where id = ?");
	
	try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, id);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		DBClose.close(pstmt, con);
	}
	
	return flag;
}
}