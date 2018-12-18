package net.my.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.my.maindao.MainDao;
import net.my.user.User;

@Service("mainService")
public class MainServiceImpl implements MainService{
	@Resource(name="mainDao")
	private MainDao mainDao;
	
	@Override
	public List<User> getNewMemberList(Map<String, Object> paramMap) {
		return mainDao.getNewMemberList(paramMap);
	}
	
	@Override
	public List<User> getHotMemberList(Map<String, Object> paramMap) {
		return mainDao.getHotMemberList(paramMap);
	}

	@Override
	public List<BoardList> getBoardList(Map<String, Object> paramMap) {
		return mainDao.getBoardList(paramMap);
	}
	
	@Override
	public List<BoardList> getBoardListNext(Integer board_no) {
		return mainDao.getBoardListNext(board_no);
	}
	
	
	
	@Override
	public List<BoardList> getBoardList_like() {
		return mainDao.getBoardList_like();
	}
	
	@Override
	public List<BoardList> getBoardList_hits() {
		return mainDao.getBoardList_hits();
	}
	
	@Override
	public List<BoardList> getBoardList_reply() {
		return mainDao.getBoardList_reply();
	}
	
	
	
	//페이징
	@Override
	public int getBoardCnt(Map<String, Object> paramMap) {
		return mainDao.getBoardCnt(paramMap);
	}
}
