package driverSystem.appointment.service;

import java.sql.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import driverSystem.appointment.dao.AppointmentDao;
import driverSystem.appointment.entities.Appointment;
import driverSystem.appointment.entities.AppointmentVO;
import driverSystem.car.dao.CarDao;
import driverSystem.car.po.Car;
import driverSystem.coach.dao.CoachDao;
import driverSystem.coach.po.Coach;
import driverSystem.leave.dao.LeaveDao;
import driverSystem.leave.entities.Leave;
import driverSystem.user.dao.UserDao;
import driverSystem.user.entitie.User;

@Component
public class AppointmentService {
	@Resource
	private AppointmentDao appointmentDao= new AppointmentDao();
	@Resource
	private UserDao userDao = new UserDao();
	@Resource
	private CoachDao coachDao=new CoachDao();
	@Resource
	private CarDao carDao = new CarDao();
	@Resource
	private LeaveDao leaveDao = new LeaveDao();
	
	public LeaveDao getLeaveDao() {
		return leaveDao;
	}
	public void setLeaveDao(LeaveDao leaveDao) {
		this.leaveDao = leaveDao;
	}
	public AppointmentDao getAppointmentDao() {
		return appointmentDao;
	}
	public void setAppointmentDao(AppointmentDao appointmentDao) {
		this.appointmentDao = appointmentDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public CoachDao getCoachDao() {
		return coachDao;
	}
	public void setCoachDao(CoachDao coachDao) {
		this.coachDao = coachDao;
	}
	public CarDao getCarDao() {
		return carDao;
	}
	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}
	
	public List<AppointmentVO> showAppointmentList(Date appointDate){
		List<Appointment> list1= appointmentDao.showAppointmentList(appointDate);
		Iterator<Appointment> itr =list1.iterator();
		
		List<AppointmentVO> list2=new LinkedList<AppointmentVO>();
		while(itr.hasNext()){
			Appointment appointment=itr.next();
			AppointmentVO appointmentVO=new AppointmentVO();
			
			appointmentVO.setAppointDate(appointment.getAppointDate());
			appointmentVO.setAppointEndTime(appointment.getAppointEndTime());
			appointmentVO.setAppointStartTime(appointment.getAppointStartTime());
			
			Coach coach= coachDao.findCoachByID(appointment.getCoachID());
			appointmentVO.setCoachID(coach.getCoachID());
			appointmentVO.setCoachName(coach.getCoachName());
			
			User u= new User();
			u.setUserID(appointment.getUserID());
			User user = userDao.findUserByID(u);
			appointmentVO.setUserName(user.getUserName());
			appointmentVO.setUserID(user.getUserID());
			
			Car c=carDao.findCarByID1(coach.getCarID());
			appointmentVO.setCarPlateNumber(c.getCarPlateNumber());
			
			Leave l= leaveDao.findLeave(appointDate, coach.getCoachLoginName());
			if(l!=null){
				appointmentVO.setCoachState(false);
			}else{
				appointmentVO.setCoachState(true);
			}
			list2.add(appointmentVO);
		}
		return list2;
	}
	
	public boolean addAppointment(Appointment a){
		appointmentDao.add(a);
		return true;
	}
	
	public Appointment find(Appointment a){
		Appointment a1=appointmentDao.find(a);
		return a1 ;
	}
	
	public void deleteAppointment(Appointment a) {
		Appointment a1=appointmentDao.find(a);
		appointmentDao.delete(a1);
		
	}
	public List<AppointmentVO> showAppointmentListByCoach(Date appointDate, String coachLoginName) {
		
		Coach coach= coachDao.findCoachByLoginName(coachLoginName);
		Car c=carDao.findCarByID1(coach.getCarID());
		List<Appointment> list1= appointmentDao.showAppointmentList(appointDate,coach.getCoachID());
		Iterator<Appointment> itr =list1.iterator();
		
		List<AppointmentVO> list2=new LinkedList<AppointmentVO>();
		while(itr.hasNext()){
			Appointment appointment=itr.next();
			AppointmentVO appointmentVO=new AppointmentVO();
			
			appointmentVO.setAppointDate(appointment.getAppointDate());
			appointmentVO.setAppointEndTime(appointment.getAppointEndTime());
			appointmentVO.setAppointStartTime(appointment.getAppointStartTime());
			
			appointmentVO.setCoachID(coach.getCoachID());
			appointmentVO.setCoachName(coach.getCoachName());
			
			User u= new User();
			u.setUserID(appointment.getUserID());
			User user = userDao.findUserByID(u);
			appointmentVO.setUserName(user.getUserName());
			appointmentVO.setUserID(user.getUserID());
			
			
			appointmentVO.setCarPlateNumber(c.getCarPlateNumber());
			
			list2.add(appointmentVO);
		}
		return list2;
	}
}
