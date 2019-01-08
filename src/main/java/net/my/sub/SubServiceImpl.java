package net.my.sub;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.my.mybatis.BoardMapper;
import net.my.subdao.SubDAO;
@Service
public class SubServiceImpl implements SubService{

	
	@Inject
	private SubDAO subdao;

	@Override
	public void create(SubUpload vo) throws Exception {
		subdao.create(vo);
	}

	@Override
	public void taginsert(SubUpload vo) throws Exception {
		subdao.taginsert(vo);
	}
	
	

	/*@Override
	public void delete(int board_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void increaseHit(int board_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SubBoard getsubboard(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int Uinsert(SubUpload subupload) {
		// TODO Auto-generated method stub
		return 0;
	}*/

}
