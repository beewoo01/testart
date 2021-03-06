package net.my.sub;

public class SubBoard {
	//
	private int board_no;
	private int member_no;
	private String title;
	//
	private String write_dt;
	private String cover_img;
	private String category;
	private String ccl;
	//
	private int hits;
	//
	private int like_count;
	//
	private int reply_count;
	private String hidden_yn;
	//
	private String delete_yn;
	
	
	
	/**
	 * @param board_no
	 * @param member_no
	 * @param title
	 * @param cover_img
	 * @param category
	 * @param ccl
	 * @param hidden_yn
	 */
	public SubBoard(int member_no, String title, String cover_img, String category, String ccl,
			String hidden_yn) {
		super();
		this.member_no = member_no;
		this.title = title;
		this.cover_img = cover_img;
		this.category = category;
		this.ccl = ccl;
		this.hidden_yn = hidden_yn;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getWrite_dt() {
		return write_dt;
	}
	public void setWrite_dt(String write_dt) {
		this.write_dt = write_dt;
	}
	public String getCover_img() {
		return cover_img;
	}
	public void setCover_img(String cover_img) {
		this.cover_img = cover_img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCcl() {
		return ccl;
	}
	public void setCcl(String ccl) {
		this.ccl = ccl;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}
	public String isHidden_yn() {
		return hidden_yn;
	}
	public void setHidden_yn(String hidden_yn) {
		this.hidden_yn = hidden_yn;
	}
	public String isDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	
	

}
