package net.my.main;

import java.util.List;
import java.util.Map;

import net.my.user.User;

public interface MainService {

	List<User> getNewMemberList(Map<String, Object> paramMap);
	
	List<User> getHotMemberList(Map<String, Object> paramMap);
	
	List<BoardList> getBoardList(Map<String, Object> paramMap);
	
	List<BoardList> getBoardListNext(Integer board_no);
	
	List<BoardList> getBoardList_like();
	
	List<BoardList> getBoardList_hits();
	
	List<BoardList> getBoardList_reply();
	
	//페이징 테스트
	int getBoardCnt(Map<String, Object> paramMap);
}
