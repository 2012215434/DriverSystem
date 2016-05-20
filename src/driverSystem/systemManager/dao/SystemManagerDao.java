package driverSystem.systemManager.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.systemManager.entities.SystemManager;
@Component
public class SystemManagerDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public SystemManager getSystemManager(String managerName){
		String hql="from SystemManager s where s.managerName=?";
		List<SystemManager> list=hibernateTemplate.find(hql, managerName);
		if(list.size()==1){
			SystemManager s= list.get(0);
			return s;
		}else{
			return null;
		}
		
	}
}
