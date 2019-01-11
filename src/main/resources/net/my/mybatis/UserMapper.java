package net.my.mybatis;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import net.my.user.User;

@Mapper
public interface UserMapper {
	
	public int insert(User user);
	
	public User login(@Param("email") String email, @Param("password") String password);
	
	public int modify(User user);
	
	public void changePasswd(User user);
	
	public void byeMember(User user);
	
	
}
