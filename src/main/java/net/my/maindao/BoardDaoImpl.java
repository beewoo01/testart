package net.my.maindao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.my.main.Board;
import net.my.main.BoardList;
import net.my.main.BoardReply;

@Repository("BoardDao")
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Board getBoardView(Map<String, Object> paramMap) {
		return sqlSession.selectOne("getBoardView", paramMap);
	}

	@Override
	public List<BoardList> getOtherBoard(Map<String, Object> paramMap) {
		return sqlSession.selectList("getOtherBoard", paramMap);
	}
	
	@Override
	public int updateHits(Map<String, Object> paramMap) {
		return sqlSession.update("updateHits", paramMap);
	}

	@Override
	public List<BoardReply> getBoardReply(Map<String, Object> paramMap) {
		return sqlSession.selectList("getBoardReply", paramMap);
	}
	
	@Override
	public List<BoardReply> getBoardReply(Integer board_no) {
		return sqlSession.selectList("getBoardReply", board_no);
	}
	
	@Override
	public int deleteReply(Integer reply_no) {
		return sqlSession.update("deleteReply", reply_no);
	}
	
	//Integer board_no, String name, String profile_img, String content
	@Override
	public int writeReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertReply", paramMap);
	}
	
	@Override
	public int modifyReply(Map<String, Object> paramMap) {
		return sqlSession.insert("updateReply", paramMap);
	}
	
	@Override
	public int writeReReply(Map<String, Object> paramMap) {
		return sqlSession.insert("insertReReply", paramMap);
	}
}
