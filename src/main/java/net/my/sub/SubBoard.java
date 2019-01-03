package net.my.sub;

public class SubBoard {
	
	private int board_no;
	private String member_no;
	private String title;
	private String write_dt;
	private String cover_img;
	private String category;
	private String ccl;
	private int hits;
	private int like_count;
	private int reply_count;
	private boolean hidden_yn;
	private boolean delete_yn;
	
	
	public int getBoard_no() {
		
		return board_no;
	}
	public void setBoard_no(int board_no) {
		System.out.println("서브보드 넘버 : " + board_no);
		this.board_no = board_no;
	}
	public String getMember_no() {
		return member_no;
	}
	public void setMember_no(String member_no) {
		System.out.println("서브보드 맴버 넘버 : " + member_no);
		this.member_no = member_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		System.out.println("서브보드 제목 : " + title);
		this.title = title;
	}
	
	public String getWrite_dt() {
		return write_dt;
	}
	public void setWrite_dt(String write_dt) {
		System.out.println("서브보드 날짜 : " + write_dt);
		this.write_dt = write_dt;
	}
	public String getCover_img() {
		return cover_img;
	}
	public void setCover_img(String cover_img) {
		System.out.println("서브보드 커버 : " + cover_img);
		this.cover_img = cover_img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		System.out.println("서브보드 카테고리 : " + category);
		this.category = category;
	}
	public String getCcl() {
		return ccl;
	}
	public void setCcl(String ccl) {
		System.out.println("서브보드 CCL : " + ccl);
		this.ccl = ccl;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		System.out.println("서브보드 조회수 : " + hits);
		this.hits = hits;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		System.out.println("서브보드 좋아요 수 : " + like_count);
		this.like_count = like_count;
	}
	public int getReply_count() {
		return reply_count;
	}
	public void setReply_count(int reply_count) {
		System.out.println("서브보드 답글 수: " + reply_count);
		this.reply_count = reply_count;
	}
	public boolean isHidden_yn() {
		return hidden_yn;
	}
	public void setHidden_yn(boolean hidden_yn) {
		System.out.println("서브보드 비공개 여부: " + hidden_yn);
		this.hidden_yn = hidden_yn;
	}
	public boolean isDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(boolean delete_yn) {
		System.out.println("서브보드 삭제 여부: " + delete_yn);
		this.delete_yn = delete_yn;
	}
	
	

}
