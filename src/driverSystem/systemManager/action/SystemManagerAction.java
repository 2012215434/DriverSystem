package driverSystem.systemManager.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import driverSystem.systemManager.entities.SystemManager;
import driverSystem.systemManager.service.SystemManagerService;

@Controller
public class SystemManagerAction {
	@Resource
	private SystemManagerService systemManagerService=new SystemManagerService();

	public SystemManagerService getSystemManagerService() {
		return systemManagerService;
	}

	public void setSystemManagerService(SystemManagerService systemManagerService) {
		this.systemManagerService = systemManagerService;
	}
	@RequestMapping("/SystemManagerLogin.do")
	public String login(HttpServletRequest request){
		String userName=request.getParameter("userName");
		String password= request.getParameter("password");
		SystemManager m= new SystemManager();
		m.setManagerName(userName);
		m.setPassword(password);
		
		if(systemManagerService.login(m)){
			return "management";
		}else{
			return "loginAdmin";
		}
		
	}
	
}
