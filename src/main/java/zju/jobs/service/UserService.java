package zju.jobs.service;

import java.util.List;

import zju.jobs.domain.User;


public interface UserService {
	public List<User> findUserList(User userQueryVo) throws Exception;
	
	public User findUser(User userQueryVo) throws Exception;
}
