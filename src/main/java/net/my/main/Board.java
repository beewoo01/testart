package net.my.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Board {
	
	private int board_no;
	private String profile_img;
	private String name;
	private String title;
	private String content;
	private String write_dt;
	private String cover_img;
	private String category1;
	private String category2;
	private String ccl;
	private int hits;
	private int like_count;
	private int reply_count;
	
	private String profile_category1;
	private String profile_category2;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_dt() {
		return write_dt;
	}
	public void setWrite_dt(String write_dt) {
		this.write_dt = compareFormatTimeString(write_dt);
	}
	public String getCover_img() {
		return cover_img;
	}
	public void setCover_img(String cover_img) {
		this.cover_img = cover_img;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		switch(category1) {
			case "1" : this.category1 = "편집디자인"; break;
			case "2" : this.category1 = "일러스트"; break;
			case "3" : this.category1 = "포토그래피"; break;
			case "4" : this.category1 = "타이포그래피"; break;
			case "5" : this.category1 = "산업디자인"; break;
			case "6" : this.category1 = "UI/UX"; break;
		}
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		switch(category2) {
			case "0" : this.category2 = "-"; break;
			case "1" : this.category2 = "편집디자인"; break;
			case "2" : this.category2 = "일러스트"; break;
			case "3" : this.category2 = "포토그래피"; break;
			case "4" : this.category2 = "타이포그래피"; break;
			case "5" : this.category2 = "산업디자인"; break;
			case "6" : this.category2 = "UI/UX"; break;
		}
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
	
	public String getProfile_category1() {
		return profile_category1;
	}
	public void setProfile_category1(String profile_category1) {
		switch(profile_category1) {
		case "1" : this.profile_category1 = "편집디자인"; break;
		case "2" : this.profile_category1 = "일러스트"; break;
		case "3" : this.profile_category1 = "포토그래피"; break;
		case "4" : this.profile_category1 = "타이포그래피"; break;
		case "5" : this.profile_category1 = "산업디자인"; break;
		case "6" : this.profile_category1 = "UI/UX"; break;
		}
	}
	public String getProfile_category2() {
		return profile_category2;
	}
	public void setProfile_category2(String profile_category2) {
		switch(profile_category2) {
		case "0" : this.profile_category2 = "-"; break;
		case "1" : this.profile_category2 = "편집디자인"; break;
		case "2" : this.profile_category2 = "일러스트"; break;
		case "3" : this.profile_category2 = "포토그래피"; break;
		case "4" : this.profile_category2 = "타이포그래피"; break;
		case "5" : this.profile_category2 = "산업디자인"; break;
		case "6" : this.profile_category2 = "UI/UX"; break;
		}
	}
	
	
	public String compareFormatTimeString(String nowdate_str) {

		final int SEC = 60;
		final int MIN = 60;
		final int HOUR = 24;
		final int DAY = 30;
		final int MONTH = 12;
		String msg = null;
		try {

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date nowdate = null;
			nowdate = format.parse(nowdate_str);

			long curTime = System.currentTimeMillis();
			long regTime = nowdate.getTime();

			long diffTime = (curTime - regTime) / 1000;

			if (diffTime < SEC) { //SEC
				msg = "방금 전";
			} else if ((diffTime /= SEC) < MIN) {//MIN
				msg = diffTime + "분 전";
			} else if ((diffTime /= MIN) < HOUR) {//HOUR
				msg = (diffTime) + "시간 전";
//			} else if ((diffTime /= HOUR) < DAY) {//DAY
//				msg = (diffTime) + "일 전";
//		    } else if ((diffTime /= DAY) < MONTH) {//MONTH
//		        msg = (diffTime) + "달 전";
			} else {
				//msg = (diffTime) + "년 전";
				msg = format.format(nowdate);
			}


		} catch (ParseException e) {
			e.printStackTrace();
		}
		return msg;

	}
	

}
