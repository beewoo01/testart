package net.my.mybatis;

import java.util.ArrayList;
import java.util.HashMap;

import net.my.board.Notice;

public interface BoardMapper {
	
	public ArrayList<Notice> getArticleList();
	public int insert(Notice notice);
	public void update (Notice notice);
	public void delete(int noticeNo);
}