package net.my.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import net.my.board.Notice;

public interface BoardMapper {
	
	public ArrayList<Notice> getNoticeList();
	public int insert(Notice notice);
	public void update (Notice notice);
	public void delete(int noticeNo);
	public void increaseHit(int notice_no);
	public Notice getNotice(int notice_no);
}
