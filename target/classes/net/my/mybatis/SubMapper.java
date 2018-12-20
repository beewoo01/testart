package net.my.mybatis;

import net.my.sub.SubBoard;
import net.my.sub.SubUpload;

public interface SubMapper {
	
	public int insert(SubBoard subboard);
	
	public void delete(int board_no);
	
	public void increaseHit(int board_no);
	
	public SubBoard getsubboard(int board_no);
	
	public int Uinsert(SubUpload subupload);	
}
