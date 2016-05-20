package driverSystem.coach.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;

import driverSystem.car.dao.CarDao;
import driverSystem.car.po.Car;
import driverSystem.coach.dao.CoachDao;
import driverSystem.coach.po.Coach;

@Component
public class CoachService {
	@Resource
	private CoachDao coachDao = new CoachDao();
	@Resource
	private CarDao carDao = new CarDao();
	
	public CarDao getCarDao() {
		return carDao;
	}
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}
	public CoachDao getCoachDao() {
		return coachDao;
	}
	public void setCoachDao(CoachDao coachDao) {
		this.coachDao = coachDao;
	}
	
	public boolean login(String loginName,String loginPassword){
		Coach c = coachDao.findCoachByLoginName(loginName);
		if(c!=null){
			if(c.getCoachLoginName().equals(loginName)&&c.getCoachLoginPassword().equals(loginPassword)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public boolean addCoach(Coach coach){
//		Coach c = coachDao.findCoachByLoginName(coach.getCoachLoginName());
//		if(c==null){
//			coachDao.addCoach(coach);
//			return true;
//		}else{
//			return false;
//		}
		Coach c = coachDao.findCoachByID(coach.getCoachID());
		Car car =carDao.findCarByID1(coach.getCarID());
		
		if(c!=null||car==null){
			return false;
		}else{
			coachDao.addCoach(coach);
			return true;
		}
	}
	
	public boolean updateCoach(Coach coach){
		coachDao.updateCoach(coach);
		return true;
	}
	
	public boolean deleteCoach(Coach coach){
		Coach c = coachDao.findCoachByID(coach.getCoachID());
		if(c!=null){
			coachDao.deleteCoach(coach);
			return true;
		}else{
			return false;
		}
	}
	
	public List<Coach> findCoach(){
		List<Coach> list=coachDao.findCoach();
		return list;
	}

	public List<Coach> getCoach(String coachName){
		Coach coach=new Coach();
		coach.setCoachName(coachName);
		List<Coach> list=coachDao.findCoachByName(coach);
		return list;
	}
}
