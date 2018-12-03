package net.my.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.my.mybatis.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public int insert(Notice notice) {
		return boardMapper.insert(notice);
	}

	@Override
	public void update(Notice notice) {
		boardMapper.update(notice);
	}

	@Override
	public void delete(int noticeNo) {
		boardMapper.delete(noticeNo);
	}

	@Override
	public ArrayList<Notice> getNoticeList() {
		System.out.println("코딩을 끝내러 왔다 :" + Notice.ntitle);
		return boardMapper.getArticleList();
	}
	
	
}