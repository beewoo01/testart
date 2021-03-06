package net.my.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.my.mybatis.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper userMapper;

	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public User login(String email, String password) {
		return userMapper.login(email, password);
	}

	@Override
	public int modify(User user) {
		return userMapper.modify(user);
	}

	@Override
	public void changePasswd(User user) {
		userMapper.changePasswd(user);
		
	}

	@Override
	public void byeMember(User user) {
		userMapper.byeMember(user);
	}
}
