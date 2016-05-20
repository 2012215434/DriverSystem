package driverSystem.coach.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import driverSystem.coach.po.Coach;
import driverSystem.coach.service.CoachService;

@Controller
public class CoachAction {
	@Resource
	private CoachService coachService= new CoachService();

	public CoachService getCoachService() {
		return coachService;
	}

	public void setCoachService(CoachService coachService) {
		this.coachService = coachService;
	}
	
	@RequestMapping("/coachLogin.do")
	public String coachLogin(HttpServletRequest request){
		String coachloginName = request.getParameter("loginName");
		String coachLoginPassword=request.getParameter("coachLoginPassword");
		if(coachService.login(coachloginName, coachLoginPassword)){
			return "leaveCoach";
		}else{
			return "loginCoach";
		}
	}
	
	@RequestMapping("/getCoachInfoByName.do")
	public String getCoachInfoByName(ModelMap mp,HttpServletRequest request)
	{
		String coachName=request.getParameter("coachName");
		List<Coach> list=coachService.getCoach(coachName);
		mp.addAttribute("coach", list);
		return "manageCoach";
	}
	
	@RequestMapping("/addCoach.do")
	public String addCoach(HttpServletRequest request){
		int coachID=Integer.parseInt(request.getParameter("coachID"));
		int carID=Integer.parseInt(request.getParameter("carID"));
		String coachName=request.getParameter("coachName");
		String coachLoginName=request.getParameter("coachLoginName");
		String coachLoginPassword=request.getParameter("coachLoginPassword");
		
		Coach c = new Coach();
		c.setCarID(carID);
		c.setCoachID(coachID);
		c.setCoachLoginName(coachLoginName);
		c.setCoachLoginPassword(coachLoginPassword);
		c.setCoachName(coachName);
		coachService.addCoach(c);
		return "skipToManageCoach";
	}
	
	@RequestMapping("/deleteCoach.do")
	public String deleteCoach(ModelMap mp,HttpServletRequest request){
		int coachID=Integer.parseInt(request.getParameter("coachID"));
//		int carID=Integer.parseInt(request.getParameter("carID"));
//		String coachName=request.getParameter("coachName");
//		String coachLoginName=request.getParameter("coachLoginName");
//		String coachLoginPassword=request.getParameter("coachLoginPassword");
		
		Coach c = new Coach();
		c.setCoachID(coachID);
//		c.setCarID(carID);
//		c.setCoachLoginName(coachLoginName);
//		c.setCoachLoginPassword(coachLoginPassword);
//		c.setCoachName(coachName);
		if(coachService.deleteCoach(c))
		{
			mp.addAttribute("state",true);
		}
		else
		{
			mp.addAttribute("state",false);
		}
		return "skipToManageCoach";
	}
	

	@RequestMapping("/updateCoach.do")
	public String updateCoach(HttpServletRequest request){
		int coachID=Integer.parseInt(request.getParameter("coachID"));
		int carID=Integer.parseInt(request.getParameter("carID"));
		String coachName=request.getParameter("coachName");
		String coachLoginName=request.getParameter("coachLoginName");
		String coachLoginPassword=request.getParameter("coachLoginPassword");
		
		Coach c = new Coach();
		c.setCarID(carID);
		c.setCoachID(coachID);
		c.setCoachLoginName(coachLoginName);
		c.setCoachLoginPassword(coachLoginPassword);
		c.setCoachName(coachName);
		
		coachService.updateCoach(c);
		
		return "skipToManageCoach";
	}
	
	@RequestMapping("/findCoach.do")
	public String findCoach(ModelMap mp,HttpServletRequest request){
		List<Coach> list= coachService.findCoach();
		mp.addAttribute("coach", list);
		return "manageCoach";
	}
}
