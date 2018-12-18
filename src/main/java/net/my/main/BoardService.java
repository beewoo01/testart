package net.my.main;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	Board getBoardView(Map<String, Object> paramMap);
	
	List<BoardList> getOtherBoard(Map<String, Object> paramMap);
	
	int updateHits(Map<String, Object> paramMap);
	
	List<BoardReply> getBoardReply(Map<String, Object> paramMap);
	
	List<BoardReply> getBoardReply(Integer borad_no);
	
	int deleteReply(Integer reply_no);
	
	int writeReply(Map<String, Object> paramMap);
	
	int modifyReply(Map<String, Object> paramMap);
	
	int writeReReply(Map<String, Object> paramMap);
}
