package net.my.main;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardReply {

	private int reply_no;
	private int board_no;
	private String name;
	private String profile_img;
	private String content;
	private String reply_dt;
	private int reply_order;
	private int depth;
	private int rereply_order;

	private String delete_yn;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		if(profile_img.trim().equals(""))
			profile_img = null;
		this.profile_img = profile_img;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply_dt() {
		return reply_dt;
	}

	public void setReply_dt(String reply_dt) {
		this.reply_dt = compareFormatTimeString(reply_dt);
	}

	public int getReply_order() {
		return reply_order;
	}

	public void setReply_order(int reply_order) {
		this.reply_order = reply_order;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getRereply_order() {
		return rereply_order;
	}

	public void setRereply_order(int rereply_order) {
		this.rereply_order = rereply_order;
	}

	public String getDelete_yn() {
		return delete_yn;
	}

	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
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
			} else if ((diffTime /= HOUR) < DAY) {//DAY
				msg = (diffTime) + "일 전";
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
