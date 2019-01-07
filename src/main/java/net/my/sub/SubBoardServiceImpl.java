package net.my.sub;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.my.subdao.SubBoardDAO;
import net.my.subdao.SubDAO;
@Service
public class SubBoardServiceImpl implements SubBoardService{
	
	@Inject
	private SubBoardDAO subBoardDAO;

	@Override
	public void insert(SubBoard vo) throws Exception {
		subBoardDAO.insert(vo);
	}

}
