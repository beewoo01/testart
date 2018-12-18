package net.my.maindao;

import java.util.List;
import java.util.Map;

import net.my.main.BoardList;
import net.my.user.User;

public interface MainDao {
	
	List<User> getNewMemberList(Map<String, Object> paramMap);
	
	List<User> getHotMemberList(Map<String, Object> paramMap);
	
	List<BoardList> getBoardList(Map<String, Object> paramMap);
	
	List<BoardList> getBoardListNext(Integer board_no);
	
	
	//추천수(좋아요수)로 정렬
	List<BoardList> getBoardList_like();
	//조회수로 정렬
	List<BoardList> getBoardList_hits();
	//댓글 순으로 정렬
	List<BoardList> getBoardList_reply();
	
	
	
	//페이징 테스트
	int getBoardCnt(Map<String, Object> paramMap);
}
