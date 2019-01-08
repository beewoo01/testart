package net.my.subdao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import net.my.sub.SubBoard;
import net.my.sub.SubUpload;
@Repository
public class SubDAOImp implements SubDAO{

	@Inject
    private SqlSession sqlSession;
	
	private static String namespace = "net.my.mybatis.SubMapper";

	@Override
	public void create(SubUpload vo) throws Exception {
		sqlSession.insert(namespace+".insert", vo);
		
	}

	@Override
	public void taginsert(SubUpload vo) throws Exception {
		sqlSession.insert(namespace+".taginsert", vo);
		
	}


	

}
