package net.my.board;

public class Contact {
	private int contact_no;
	private String type;
	private String name;
	private String email;
	private String phone;
	private String content;
	private String contact_dt;
	private String answer;
	private String answer_dt;
	private String complete_yn;
	
	
	public int getContact_no() {
		System.out.println("재미있는 코딩 시간 :" + contact_no);
		return contact_no;
	}
	public void setContact_no(int contact_no) {
		this.contact_no = contact_no;
	}
	public String getType() {
		System.out.println("재미있는 코딩 시간 type :" + type);
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		System.out.println("재미있는 코딩 시간 name :" + name);
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		System.out.println("재미있는 코딩 시간 email :" + email);
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		System.out.println("재미있는 코딩 시간 phone :" + phone);
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getContent() {
		System.out.println("재미있는 코딩 시간 content :" + content);
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContact_dt() {
		return contact_dt;
	}
	public void setContact_dt(String contact_dt) {
		this.contact_dt = contact_dt;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAnswer_dt() {
		return answer_dt;
	}
	public void setAnswer_dt(String answer_dt) {
		this.answer_dt = answer_dt;
	}
	public String getComplete_yn() {
		return complete_yn;
	}
	public void setComplete_yn(String complete_yn) {
		this.complete_yn = complete_yn;
	}
	
}
