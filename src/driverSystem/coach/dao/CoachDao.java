package driverSystem.coach.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.coach.po.Coach;

@Component
public class CoachDao {
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public boolean updateCoach(Coach coach){
		hibernateTemplate.update(coach);
		return true;
	}
	public boolean addCoach(Coach coach){
		hibernateTemplate.save(coach);
		return true;
	}
	
	public boolean  deleteCoach(Coach coach){
		hibernateTemplate.delete(coach);
		return true;
	}
	
	public List<Coach> findCoach(){
		String hql="from Coach c";
		List<Coach> list= hibernateTemplate.find(hql);
		return list;
	}
	
	public Coach findCoachByLoginName(String loginName){
		String hql="from Coach c where c.coachLoginName=?";
		List<Coach> list= hibernateTemplate.find(hql,loginName);
		if(!list.isEmpty()){
			Coach c=list.get(0);
			return c ;
		}else{
			return null;
		}
	}
	
	public Coach findCoachByID(int coachID){
		String hql="from Coach c where c.coachID=?";
		List<Coach> list= hibernateTemplate.find(hql,coachID);
		if(!list.isEmpty()){
			Coach c=list.get(0);
			return c ;
		}else{
			return null;
		}
	}
	public List<Coach> findCoachByName(Coach c) 
	{
		String hql="from Coach c where c.coachName=?";
		List<Coach> list=hibernateTemplate.find(hql,c.getCoachName());
		if(list.isEmpty())
		{
			return null;
		}
		else
		{
			return list;
		}
	}
}
