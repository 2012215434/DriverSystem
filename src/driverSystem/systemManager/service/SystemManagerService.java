package driverSystem.systemManager.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import driverSystem.systemManager.dao.SystemManagerDao;
import driverSystem.systemManager.entities.SystemManager;
@Component
public class SystemManagerService {
	@Resource
	private SystemManagerDao systemManagerDao = new SystemManagerDao();

	public SystemManagerDao getSystemManagerDao() {
		return systemManagerDao;
	}

	public void setSystemManagerDao(SystemManagerDao systemManagerDao) {
		this.systemManagerDao = systemManagerDao;
	}
	
	public boolean login(SystemManager m){
		SystemManager s=systemManagerDao.getSystemManager(m.getManagerName());
		if(s!=null&&s.getPassword().equals(m.getPassword())){
			return true;
		}else{
			return false;
		}
	}
}
