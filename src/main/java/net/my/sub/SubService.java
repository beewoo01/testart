package net.my.sub;

public interface SubService {
	
	public int insert(SubBoard subboard);
	
	public void delete(int board_no);
	
	public void increaseHit(int board_no);
	
	public SubBoard getsubboard(int board_no);
	
	public int Uinsert(SubUpload subupload);	
}
