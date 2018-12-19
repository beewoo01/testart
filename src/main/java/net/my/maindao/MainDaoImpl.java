package net.my.maindao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.my.main.BoardList;
import net.my.user.User;

@Repository("mainDao")
public class MainDaoImpl implements MainDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<User> getNewMemberList(Map<String, Object> paramMap) {
		System.out.println("여기까지는 온다!!2222222222222222222222");
		return sqlSession.selectList("getNewMemberList", paramMap);
	}
	
	@Override
	public List<User> getHotMemberList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getHotMemberList", paramMap);
	}
	
	@Override
	public List<BoardList> getBoardList(Map<String, Object> paramMap) {
		return sqlSession.selectList("getBoardList", paramMap);
	}
	
	@Override
	public List<BoardList> getBoardListNext(Integer board_no) {
		return sqlSession.selectList("getBoardListNext", board_no);
	}
	
	
	
	@Override
	public List<BoardList> getBoardList_like() {
		return sqlSession.selectList("getBoardList_like");
	}
	
	@Override
	public List<BoardList> getBoardList_hits() {
		return sqlSession.selectList("getBoardList_hits");
	}
	
	@Override
	public List<BoardList> getBoardList_reply() {
		return sqlSession.selectList("getBoardList_reply");
	}
	
	//페이징
	@Override
	public int getBoardCnt(Map<String, Object> paramMap) {
		return sqlSession.selectOne("getBoardCnt", paramMap);
	}
}
