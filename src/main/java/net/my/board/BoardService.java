package net.my.board;

import java.util.ArrayList;

public interface BoardService {
	
	public ArrayList<Notice> getNoticeList();
	
	public int insert(Notice notice);
	
	public void update (Notice notice);
	
	public void delete(int noticeNo);
}
