package driverSystem.appointment.controller;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import driverSystem.appointment.entities.AppointDate;
import driverSystem.appointment.entities.Appointment;
import driverSystem.appointment.entities.AppointmentVO;
import driverSystem.appointment.entities.CoachVO;
import driverSystem.appointment.service.AppointmentService;
import driverSystem.car.service.CarService;
import driverSystem.coach.po.Coach;
import driverSystem.coach.service.CoachService;
import driverSystem.leave.entities.Leave;
import driverSystem.leave.service.LeaveService;

@Controller
public class AppointmentController {
	@Resource
	private AppointmentService appointmentService=new AppointmentService();
	@Resource
	private CoachService coachService = new CoachService();
	@Resource
	private CarService carService = new  CarService();
	@Resource
	private LeaveService leaveService = new LeaveService();

	
	public CoachService getCoachService() {
		return coachService;
	}

	public void setCoachService(CoachService coachService) {
		this.coachService = coachService;
	}

	public CarService getCarService() {
		return carService;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	public LeaveService getLeaveService() {
		return leaveService;
	}

	public void setLeaveService(LeaveService leaveService) {
		this.leaveService = leaveService;
	}

	public AppointmentService getAppointmentService() {
		return appointmentService;
	}

	public void setAppointmentService(AppointmentService appointmentService) {
		this.appointmentService = appointmentService;
	}
	
	@RequestMapping("/showAppointmentTable.do")
	public String showAppointmentTable(ModelMap mp,@RequestParam("date")String strDate){
		java.sql.Date date=java.sql.Date.valueOf(strDate);
		List<AppointmentVO> list=appointmentService.showAppointmentList(date);
		
		List<Coach> list2=coachService.findCoach();
		List<CoachVO> list3=new LinkedList<CoachVO>();
		
		Iterator<Coach> itr= list2.iterator();
		while(itr.hasNext()){
			Coach c=itr.next();
			CoachVO co= new CoachVO();
			co.setCarID(c.getCarID());
			String carPlateNumber=carService.getCar(c.getCarID()).getCarPlateNumber();
			co.setCarPlateNumber(carPlateNumber);
			co.setCoachID(c.getCoachID());
			co.setCoachName(c.getCoachName());
			 Leave l=leaveService.findLeave(date, c.getCoachLoginName());
			if(l!=null){
				co.setState(1);
			}else{
				co.setState(0);
			}
			list3.add(co);
		}
		AppointDate ad = new AppointDate();
		ad.setAppointDate(date);
		List<AppointDate> list4=new LinkedList<AppointDate>();
		list4.add(ad);
		
		mp.addAttribute("coachList", list3);
		mp.addAttribute("appointmentList", list);
		mp.addAttribute("date", list4);
		return "main";
	}
	
	@RequestMapping("/addAppointment.do")
	public String addAppointment(ModelMap mp,@RequestParam("date")String strDate,
			@RequestParam("userID")String userID,@RequestParam("coachID")String coachID,
			@RequestParam("appointStartTime")String appointStartTime,
			@RequestParam("appointEndTime")String appointEndTime){
		Appointment a=new Appointment();
		a.setAppointDate(java.sql.Date.valueOf(strDate));
		a.setCoachID(Integer.valueOf(coachID));
		a.setAppointEndTime(java.sql.Time.valueOf(appointEndTime));
		a.setAppointStartTime(java.sql.Time.valueOf(appointStartTime));
		if(appointmentService.find(a)==null){
			a.setUserID(Integer.valueOf(userID));
			appointmentService.addAppointment(a);
			//添加成功；
			return "skipToMain1";
		}else{
			//添加失败；
			return  "wrong";
		}
	}
	
	@RequestMapping("/cancelAppointment.do")
	public String cancelAppointment(@RequestParam("date")String strDate,
			@RequestParam("userID")String userID,@RequestParam("coachID")String coachID,
			@RequestParam("appointStartTime")String appointStartTime,
			@RequestParam("appointEndTime")String appointEndTime){
		Appointment a=new Appointment();
		a.setAppointDate(java.sql.Date.valueOf(strDate));
		a.setCoachID(Integer.valueOf(coachID));
		a.setAppointEndTime(java.sql.Time.valueOf(appointEndTime));
		a.setAppointStartTime(java.sql.Time.valueOf(appointStartTime));
		a.setUserID(Integer.valueOf(userID));
		if(appointmentService.find(a)==null){
			//取消失败；
			return "wrong" ;
		}else{
			appointmentService.deleteAppointment(a);
			//取消成功；
			return "skipToMain1";
		}
	}
	
	@RequestMapping("/showAppointmentList.do")
	public String showAppointmentList(ModelMap mp,@RequestParam("date")String strDate,@RequestParam("coachLoginName")String coachLoginName){
		java.sql.Date date=java.sql.Date.valueOf(strDate);
		List<AppointmentVO> list=appointmentService.showAppointmentListByCoach(date,coachLoginName);
		mp.addAttribute("appointmentList", list);
		return "leaveCoach";
	}
}
