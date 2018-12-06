package net.my.user;

public class User {
	 private String email;
	 private String password;
	 private String name;
	 private String member_url;
	
	public User() {}
	 
	 public User(String email, String password, String name, String member_url) {
	        this.email = email;
	        this.password = password;
	        this.name = name;
	        this.member_url = member_url;
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
