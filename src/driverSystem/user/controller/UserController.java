package driverSystem.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import driverSystem.user.entitie.User;
import driverSystem.user.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/getUserInfoByName.do")
	public String getUserInfoByName(ModelMap mp,HttpServletRequest request){
		String userName=request.getParameter("userName");
		List<User> list=userService.getUser(userName);
		mp.addAttribute("user", list);
		return "manageUser";
	}

	
	@RequestMapping("/login.do")
	//@RequestParam("userName")String userName,
	//@RequestParam("password")String password
	public String login(ModelMap mp,HttpServletRequest request){
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		User u= new User();
		u.setUserName(userName);
		u.setPassword(password);
		if(userService.login(u)){
			List<User> list=userService.getUser(userName);
			mp.addAttribute("user", list);
			return "skipToMain";
		}else{
			return "loginUser";
		}
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(ModelMap mp,HttpServletRequest request){
		String password=request.getParameter("password");
		String userName=request.getParameter("userName");
		String userID=request.getParameter("userID");
		User u= new User();
		u.setPassword(password);
		u.setUserID(Integer.parseInt(userID));
		u.setUserName(userName);
		if(userService.updateUser(u)){
			mp.addAttribute("state", true);
			return "skipToManageUser";
		}else{
			mp.addAttribute("state", false);
			return "wrong";
		}
		
	}
	
	@RequestMapping("/getUserInfo.do")
	public String getUserInfo(ModelMap mp,HttpServletRequest request){
		String userID=request.getParameter("userID");
		User u=userService.getUser(Integer.parseInt(userID));
		mp.addAttribute("user", u);
		return "userInfo";
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(ModelMap mp,HttpServletRequest request){
		int userID =Integer.parseInt(request.getParameter("userID"));
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User u=new User();
		u.setPassword(password);
		u.setUserName(userName);
		u.setUserID(userID);
		if(userService.addUser(u)){
			mp.addAttribute("state", true);
		}else{
			mp.addAttribute("state", false);
		}
		return "skipToManageUser";
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(ModelMap mp,HttpServletRequest request){
		int userID =Integer.parseInt(request.getParameter("userID"));
		User u=new User();
		u.setUserID(userID);
		if(userService.delete(u)){
			mp.addAttribute("state", true);
		}else{
			mp.addAttribute("state", false);
		}
		return "skipToManageUser";
	}
	
	@RequestMapping("/findUser.do")
	public String findUser(ModelMap mp, HttpServletRequest request){
		List<User> list= userService.find();
		mp.addAttribute("user", list);
		return "manageUser";
	}
}
