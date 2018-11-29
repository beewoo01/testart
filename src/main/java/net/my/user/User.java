package net.my.user;

public class User {
	 private String email;
	 private String passwd;
	 private String name;
	 private String url;
	
	public User() {}
	 
	 public User(String email, String passwd, String name, String url) {
	        this.email = email;
	        this.passwd = passwd;
	        this.name = name;
	        this.url = url;
	    }
	 
	    public String getEmail() {
	        return email;
	    }
	   
	    public void setEmail(String email) {
	        this.email = email;
	    }
	 
	    public String getPasswd() {
	        return passwd;
	    }
	   
	    public void setPasswd(String passwd) {
	        this.passwd = passwd;
	    }
	   
	    public String getName() {
	        return name;
	    }
	   
	    public void setName(String name) {
	        this.name = name;
	    }
	    
	    public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
	   
	   
}
