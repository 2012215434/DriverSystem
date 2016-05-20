package driverSystem.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import driverSystem.user.dao.UserDao;
import driverSystem.user.entitie.User;


@Component
public class UserService {
	@Resource
	private UserDao userDao=new UserDao();

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public boolean updateUser(User u){
		if(userDao.updateUser(u)){
			return true;
		}else{
			return false;
		}
	}
	public boolean login(User u){
		User result=userDao.findUser(u);
		if(result!=null&&result.getUserName().equals(u.getUserName())&&
				result.getPassword().equals(u.getPassword())){
			return true;
		}else{
			return false;
		}
	}

	public User getUser(int userID) {
		User user=new User();
		user.setUserID(userID);
		User u=userDao.findUserByID(user);
		return u;
	}
	public List<User> getUser(String userName){
		User user=new User();
		user.setUserName(userName);
		List<User> list=userDao.findUserByName(user);
		return list;
	}

	public boolean addUser(User u) {
		User u1=userDao.findUser(u);
		if(u1==null){
			userDao.addUser(u);
			return true;
		}else{
			return false;
		}
	}

	public boolean delete(User u) {
		User u1=userDao.findUserByID(u);
		if(u1==null){
			return false;
		}else{
			userDao.delete(u);
			return true;
		}
	}
	
	public List<User> find(){
		List<User> list=userDao.findUser();
		return list;
	}
}
