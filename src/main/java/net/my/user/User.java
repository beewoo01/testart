package net.my.user;

public class User {
	 private String member_no;
	 private String email;
	 private String password;
	 private String name;
	 private String member_url;
	
	public User() {}
	 
	 public User(String member_no ,String email, String password, String name, String member_url) {
		 	this.member_no = member_no;
	        this.email = email;
	        this.password = password;
	        this.name = name;
	        this.member_url = member_url;
	    }
	 

	public String getMember_no() {
		System.out.println("이거슨 이것이다 : "+  member_no);
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getEmail() {
		System.out.println("이거슨 이것이다 : "+  email);
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		System.out.println("이거슨 이것이다 : "+  password);
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		System.out.println("이거슨 이것이다 : "+  name);
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMember_url() {
		System.out.println("이거슨 이것이다 : "+  member_url);
		return member_url;
	}

	public void setMember_url(String member_url) {
		this.member_url = member_url;
	}
	 
	    
	   
	   
}
