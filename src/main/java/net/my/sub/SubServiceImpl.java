package net.my.sub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.my.mybatis.BoardMapper;
import net.my.mybatis.SubMapper;
@Service
public class SubServiceImpl implements SubService{

	
	@Autowired
	private SubMapper submapper;
	
	@Override
	public int insert(SubBoard subboard) {
		return submapper.insert(subboard);
	}

	@Override
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
	}

}
