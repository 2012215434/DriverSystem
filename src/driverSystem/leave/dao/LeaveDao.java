package driverSystem.leave.dao;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.leave.entities.Leave;

@Component
public class LeaveDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	 
	public Leave findLeaveByleaveID(int leaveID){
		String hql="from Leave l where l.leaveID=?";
		List<Leave> list=hibernateTemplate.find(hql, leaveID);
		if(!list.isEmpty()){
			Leave leave = list.get(0);
			return leave;
		}else{
			return null;
		}
	}
	
	public List<Leave> findLeave(){
		String hql="from Leave l ";
		List<Leave> list=hibernateTemplate.find(hql);
		return list;
	}
	
	public Leave findLeaveByCoachLoginName(String coachLoginName){
		String hql="from Leave l where l.coachLoginName=?";
		List<Leave> list=hibernateTemplate.find(hql, coachLoginName);
		if(!list.isEmpty()){
			Leave leave = list.get(0);
			return leave;
		}else{
			return null;
		}
	}
	
	public Leave findLeave(Date leaveDate,String coachLoginName){
		String hql="from Leave l where l.coachLoginName=? and l.leaveDate=?";
		List<Leave> list= hibernateTemplate.find(hql, coachLoginName,leaveDate);
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	public boolean updateLeave(Leave leave){
		hibernateTemplate.update(leave);
		return true;
	}
	public boolean addLeave(Leave leave){
		hibernateTemplate.save(leave);
		return true;
	}
	
	public boolean  deleteLeave(Leave leave){
		hibernateTemplate.delete(leave);
		return true;
	}
}
