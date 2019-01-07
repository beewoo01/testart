package net.my.subdao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.my.sub.SubBoard;

@Repository
public class SubBoardDAOImpl implements SubBoardDAO{

	@Inject
    private SqlSession sqlSession;
	
	private static String namespace = "net.my.mybatis.SubBoardMapper"; // 수정 하셈

	@Override
	public void insert(SubBoard vo) throws Exception {
		sqlSession.insert(namespace+".insertBoard", vo);
	}
	

}
