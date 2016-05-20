package driverSystem.leave.action;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import driverSystem.leave.entities.Leave;
import driverSystem.leave.service.LeaveService;

@Controller
public class LeaveAction {
	@Resource
	private LeaveService leaveService= new LeaveService();

	public LeaveService getLeaveService() {
		return leaveService;
	}

	public void setLeaveService(LeaveService leaveService) {
		this.leaveService = leaveService;
	}
	
	@RequestMapping("/addLeave.do")
	public String addLeave(ModelMap mp, HttpServletRequest request){
		String coachLoginName = request.getParameter("coachLoginName");
		Date leaveDate =Date.valueOf(request.getParameter("leaveDate"));
		
		Leave leave= new Leave();
		leave.setCoachLoginName(coachLoginName);
		leave.setLeaveDate(leaveDate);
		
		if(leaveService.addLeave(leave)){
			return "success";
		}else{
			return "wrong";
		}
	}
	
	@RequestMapping("/findLeaveList.do")
	public String findLeaveList(ModelMap mp, HttpServletRequest request){
		List<Leave> list= leaveService.findLeave();
		mp.addAttribute("leaveList", list);
		return "leaveManage";
	}
	
	@RequestMapping("/updateLeave.do")
	public String updateLeave(HttpServletRequest request){
		int leaveID = Integer.parseInt(request.getParameter("leaveID"));
		String coachLoginName = request.getParameter("coachLoginName");
		Date leaveDate =Date.valueOf(request.getParameter("leaveDate"));
		
		Leave leave= new Leave();
		leave.setCoachLoginName(coachLoginName);
		leave.setLeaveDate(leaveDate);
		leave.setLeaveID(leaveID);
		if(leaveService.updateLeave(leave)){
			return "success";
		}else{
			return "wrong";
		}
	}
	
}
