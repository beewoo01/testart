package net.my.sub;


public class SubUpload {
	private int upload_no;
	private int member_no;
	private int board_no;
	private String file;
	private String tagname;
	

	public void setUpload_no(int upload_no) {
		this.upload_no = upload_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		System.out.println("서브보드 넘버 2222!!!!: " + board_no);
		this.board_no = board_no;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getTagname() {
		return tagname;
	}
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	public SubUpload(int member_no, int board_no, String file) {
		this.member_no = member_no;
		this.board_no = board_no;
		this.file = file;
	}
	public SubUpload() {
	}

	
	

}
