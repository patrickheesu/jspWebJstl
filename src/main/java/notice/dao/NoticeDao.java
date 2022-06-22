package notice.dao;

import java.sql.*;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {
	public Notice getNotice(String seq) throws Exception {
		Connection conn = DBCon.getConnection();
		String sql = "select * from notices where seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		//db에 select 결과를 Notice파일에 저장
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return n;
	}
	public int update(Notice notice) throws Exception {
		Connection conn = DBCon.getConnection();
		String sql = "update notices set title=?,content=? where seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());
		int cnt = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return cnt; 
	}
	public int delete(Notice n) throws Exception{
		
		Connection conn = DBCon.getConnection();
		String sql = "delete from notices where seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, n.getSeq());

		int af = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		return af;
	}
	public int insert(Notice n) throws Exception{
		Connection conn = DBCon.getConnection();
		String sql = "insert into notices(seq,title,writer,content,regdate,hit)"
				+" values((select max(to_number(seq))+1 from notices),?,'hong',?,sysdate,0)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());
		
		int cnt = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return cnt;
	}
	
}
