package net.my.maindao;

import java.util.List;
import java.util.Map;

import net.my.main.Board;
import net.my.main.BoardList;
import net.my.main.BoardReply;

public interface BoardDao {
		//해당작품의 상세정보 가져오기
		Board getBoardView(Map<String, Object> paramMap);
		
		//해당작가의 다른 작품 리스트 가져오기
		List<BoardList> getOtherBoard(Map<String, Object> paramMap);
		
		//조회수 증가
		int updateHits(Map<String, Object> paramMap);
		
		List<BoardReply> getBoardReply(Map<String, Object> paramMap);
		
		//해당 게시글에 달린 댓글,답글 모두 가져오기
		List<BoardReply> getBoardReply(Integer board_no);
			
		//댓(답)글 삭제하기
		int deleteReply(Integer reply_no);
		
		//댓글 입력하기
		int writeReply(Map<String, Object> paramMap);
		
		//댓(답)글 수정하기
		int modifyReply(Map<String, Object> paramMap);
		
		//댓글 입력하기
		int writeReReply(Map<String, Object> paramMap);
		
		
}
