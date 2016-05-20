package driverSystem.leave.service;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import driverSystem.leave.dao.LeaveDao;
import driverSystem.leave.entities.Leave;

@Component
public class LeaveService {
	@Resource
	private LeaveDao leaveDao = new LeaveDao();

	public LeaveDao getLeaveDao() {
		return leaveDao;
	}

	public void setLeaveDao(LeaveDao leaveDao) {
		this.leaveDao = leaveDao;
	}
	
	public List<Leave> findLeave(){
		List<Leave> list=leaveDao.findLeave();
		return list;
	}
	
	public Leave findLeave(Date leaveDate,String coachLoginName){
		Leave l=leaveDao.findLeave(leaveDate, coachLoginName);
		return l;
	}
	public boolean addLeave(Leave leave){
		Leave c = leaveDao.findLeave(leave.getLeaveDate(),leave.getCoachLoginName());
		if(c==null){
			leaveDao.addLeave(leave);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean updateLeave(Leave leave){
		leaveDao.updateLeave(leave);
		return true;
	}
	
	public boolean deleteLeave(Leave leave){
		Leave c = leaveDao.findLeaveByleaveID(leave.getLeaveID());
		if(c!=null){
			leaveDao.deleteLeave(leave);
			return true;
		}else{
			return false;
		}
	}
}
