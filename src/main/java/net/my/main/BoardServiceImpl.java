package net.my.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.my.maindao.BoardDao;

public class BoardServiceImpl implements BoardService{
	
	@Resource(name="BoardDao")
	private BoardDao boardDao;
	
	@Override
	public Board getBoardView(Map<String, Object> paramMap) {
		boardDao.updateHits(paramMap);
		return boardDao.getBoardView(paramMap);
	}
	
	@Override
	public List<BoardList> getOtherBoard(Map<String, Object> paramMap) {
		return boardDao.getOtherBoard(paramMap);
	}
	
	@Override
	public int updateHits(Map<String, Object> paramMap) {
		return boardDao.updateHits(paramMap);
	}
	
	@Override
	public List<BoardReply> getBoardReply(Map<String, Object> paramMap) {
		return boardDao.getBoardReply(paramMap);
	}
	
	@Override
	public List<BoardReply> getBoardReply(Integer board_no) {
		return boardDao.getBoardReply(board_no);
	}
	
	@Override
	public int deleteReply(Integer reply_no) {
		return boardDao.deleteReply(reply_no);
	}
	
	@Override
	public int writeReply(Map<String, Object> paramMap) {
		return boardDao.writeReply(paramMap);
	}
	
	@Override
	public int modifyReply(Map<String, Object> paramMap) {
		return boardDao.modifyReply(paramMap);
	}
	
	@Override
	public int writeReReply(Map<String, Object> paramMap) {
		return boardDao.writeReReply(paramMap);
	}
}
