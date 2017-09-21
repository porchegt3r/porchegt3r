package img; 

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import img.ImgDTO;
import utility.DBClose;
import utility.DBOpen;

public class ImgDAO { 
	
	public List imgRead(int imgno){
			List list = new ArrayList();
			Connection con = DBOpen.getConnection();
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" SELECT * FROM  ");
			sql.append("   (  ");
			sql.append("      select    ");
			sql.append("          lag(imgno,2)     over (order by imgno) pre_imgno2,    ");
			sql.append("          lag(imgno,1)     over (order by imgno ) pre_imgno1,   ");
			sql.append("          imgno,  ");
			sql.append("          lead(imgno,1)    over (order by imgno) nex_imgno1,    ");
			sql.append("          lead(imgno,2)    over (order by imgno) nex_imgno2,    ");
			sql.append("          lag(fname,2)  over (order by imgno) pre_file2,     ");
			sql.append("          lag(fname,1)  over (order by imgno ) pre_file1,  ");
			sql.append("          fname,   ");
			sql.append("          lead(fname,1) over (order by imgno) nex_file1,  ");
			sql.append("          lead(fname,2) over (order by imgno) nex_file2   ");
			sql.append("          from (  ");
			sql.append("               SELECT imgno, fname   ");
			sql.append("               FROM img ");
			sql.append("               ORDER BY imgno DESC  ");
			sql.append("          )  ");
			sql.append("   )  ");
			sql.append("   WHERE imgno = ? ");
			
			
			try {
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, imgno);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					int[] noArr = 
						   {
							rs.getInt("pre_imgno2"),
							rs.getInt("pre_imgno1"),
							rs.getInt("imgno"),
							rs.getInt("nex_imgno1"),
							rs.getInt("nex_imgno2")
						    };
					String[] files = 
						    {
							rs.getString("pre_file2"),
							rs.getString("pre_file1"),
							rs.getString("fname"),
							rs.getString("nex_file1"),
							rs.getString("nex_file2")
							};
					
					list.add(files);
					list.add(noArr);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBClose.close(pstmt, con);
			}
					
			return list;
		}	
	
	public boolean passwdCheck(Map map){
		boolean flag = false;
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count (imgno)");
		sql.append(" from img ");
		sql.append(" where imgno = ? and passwd = ? ");
		
		int imgno = (Integer)map.get("imgno");
		String passwd = (String)map.get("passwd");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
		
		return flag;
		
	}
	
	public boolean update(ImgDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update img ");
		sql.append(" SET wname=?, title=?, content=? ,passwd = ?");
		sql.append(" where imgno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getImgno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0){
				flag=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
		
	}
	
	public ImgDTO read(int imgno){
		ImgDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select * from img");
		sql.append(" where imgno = ?");	
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new ImgDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		return dto;
	}
	
	public List<ImgDTO> list(Map map){
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select imgno, wname, title, grpno, indent, ansnum, fname, r");
		sql.append(" 	from( ");
		sql.append(" 		select imgno, wname, title, grpno, indent, ansnum, fname, rownum as r ");
		sql.append(" 		from(");
		sql.append(" 			select imgno, wname, title, grpno, indent, ansnum, fname from img");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%'  ");
		sql.append(" 			order by grpno desc, ansnum asc ");
		sql.append(" )) ");
		sql.append(" where r>=? and r<=?");
		
		try {
			int i = 0;
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ImgDTO dto = new ImgDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
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

	public boolean getRefnum(int imgno){
		boolean flag = false;
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from img");
		sql.append(" where refnum = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			
			if(cnt>0)flag = true; //부모글
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		
		return flag;
	}
	
	public boolean create(ImgDTO dto) { // img등록메서드
		
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append("INSERT INTO img(imgno, wname, title, content, passwd, wdate,fname, grpno)   ");
		sql.append("VALUES((SELECT NVL(MAX(imgno), 0) + 1 as bbsno FROM img),  ");
		sql.append("?, ?, ?, ?, sysdate,?,   ");
		sql.append("(SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img))   ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFname());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public int total(Map map){
		int total = 0;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) ");
		sql.append(" from img ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			total=rs.getInt(1);
				
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs,pstmt,con);
		}
		
		return total;
	}
	
	public boolean delete(int imgno){
		boolean flag = false;
		List<ImgDTO> list = new ArrayList<ImgDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM img WHERE imgno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
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

	public void upAnsnum(Map map) {
		
		// DBOpen안에있는 getConnection메소드를 호출함(여기서 리턴한 값을 con에 담음)
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE img ");
		sql.append(" SET ansnum = ansnum + 1 "); // 최신글을 올리기위해 나머지 글들을 다 +1씩해서 최신글이 들어갈 자리를 만들어놓는다
		sql.append(" WHERE grpno = ? and ansnum > ? "); // 부모글보다 큰 ansnum이 있다면 다 +1씩 증가함
		
		// map으로 받아온 매개변수의 값을 get해서 꺼내서 형변환 후 grpno변수에 넣음
		int grpno = (Integer)map.get("grpno");
		// map으로 받아온 매개변수의 값을 get해서 꺼내서 형변환 후 ansnum변수에 넣음
		int ansnum = (Integer)map.get("ansnum");
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			// 부모글보다 큰게 있다면1, 없다면0이기때문에 오류가 안난다 
			int cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}

	public boolean replyCreate(ImgDTO dto){
	
	boolean flag = false;

	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	StringBuffer sql = new StringBuffer();

	sql.append(" INSERT INTO img(imgno, wname, title, content, passwd, wdate, grpno, indent, ansnum, refnum, fname) ");
	sql.append(" VALUES((SELECT NVL(MAX(imgno), 0) + 1 as bbsno FROM img), ");
	sql.append(" ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ? ) ");


	try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getWname());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getPasswd());
		pstmt.setInt(5, dto.getGrpno());
		pstmt.setInt(6, dto.getIndent()+1);
		pstmt.setInt(7, dto.getAnsnum()+1);
		pstmt.setInt(8, dto.getImgno());
		pstmt.setString(9, dto.getFname());
		
		int cnt = pstmt.executeUpdate();

		if (cnt > 0)
			flag = true;

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		DBClose.close(pstmt, con);
	}

	return flag;
}

	public ImgDTO replyRead(int imgno){

	ImgDTO dto = null;
	Connection con = DBOpen.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sql = new StringBuffer();

	sql.append(" select imgno, wname, grpno, indent, ansnum, content, passwd ");
	sql.append(" from img ");
	sql.append(" where imgno = ? ");

	try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, imgno);

		rs = pstmt.executeQuery();
		if (rs.next()) {
			dto = new ImgDTO();
			dto.setImgno(rs.getInt("imgno"));
			dto.setWname(rs.getString("wname"));
			dto.setGrpno(rs.getInt("grpno"));
			dto.setIndent(rs.getInt("indent"));
			dto.setAnsnum(rs.getInt("ansnum"));
			dto.setContent(rs.getString("content"));
			dto.setPasswd(rs.getString("passwd"));
		}
	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	} finally {
			DBClose.close(rs, pstmt, con);
	}

	return dto;
		
	}
	
	public boolean updateFile(Map map){
		boolean flag = false;
		
		String fname = (String)map.get("fname");
		int imgno = (Integer)map.get("imgno");
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update img ");
		sql.append(" set fname = ? ");
		sql.append(" where imgno = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, fname);
			pstmt.setInt(2, imgno);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		System.out.println(flag);
		return flag;
	}
}
