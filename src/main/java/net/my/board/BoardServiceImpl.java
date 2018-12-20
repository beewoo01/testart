package net.my.board;

import java.util.ArrayList;
import java.util.HashMap;

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
		return boardMapper.getNoticeList();
	}

	@Override
	public void increaseHit(int notice_no) {
		boardMapper.increaseHit(notice_no);
	}

	@Override
	public Notice getNotice(int notice_no) {
		return boardMapper.getNotice(notice_no);
	}

	@Override
	public int Cinsert(Contact contact) {
		return boardMapper.Cinsert(contact);
	}

	
	
	
}
