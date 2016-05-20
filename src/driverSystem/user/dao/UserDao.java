package driverSystem.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.user.entitie.User;



@Component
public class UserDao {
	@Resource
	private HibernateTemplate hibernateTemplate ;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public User findUser(User u){
		String hql="from User u where u.userName=?";
		if(hibernateTemplate.find(hql,u.getUserName()).isEmpty()){
			return null;
		}
		return (User) hibernateTemplate.find(hql,u.getUserName()).get(0);
	}
	
	public User findUserByID(User u){
		String hql="from User u where u.userID=?";
		if(hibernateTemplate.find(hql,u.getUserID()).isEmpty()){
			return null;
		}
		return (User) hibernateTemplate.find(hql,u.getUserID()).get(0);
	}

	public void addUser(User u) {
		hibernateTemplate.save(u);
	}

	public void delete(User u) {
		hibernateTemplate.delete(u);
	}
	
	public List<User> findUser(){
		String hql="from User u";
		List<User> list= hibernateTemplate.find(hql);
		return list;
	}

	public List<User> findUserByName(User u) {
		String hql="from User u where u.userName=?";
		List<User> list=hibernateTemplate.find(hql,u.getUserName());
		if(list.isEmpty()){
			return null;
		}
		return list;
	}
	
	public boolean updateUser(User u){
		if(findUserByID(u)!=null){
			hibernateTemplate.update(u);
			return true;
		}else{
			return false;
		}
		
	}
}
