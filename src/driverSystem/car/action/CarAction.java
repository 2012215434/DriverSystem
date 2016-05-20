package driverSystem.car.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import driverSystem.car.po.Car;
import driverSystem.car.service.CarService;

@Controller
public class CarAction {
	@Resource
	private CarService carService = new CarService();

	public CarService getCarService() {
		return carService;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	@RequestMapping("/addCar.do")
	public String addCar(HttpServletRequest request){
		int carID=Integer.parseInt(request.getParameter("carID"));
		String model=request.getParameter("model");
		String carPlateNumber=request.getParameter("carPlateNumber");
		int usedYears=Integer.parseInt(request.getParameter("usedYears"));
		
		Car c = new Car();
		c.setCarID(carID);
		c.setCarPlateNumber(carPlateNumber);
		c.setModel(model);
		c.setUsedYears(usedYears);
		carService.addCar(c);
		
		return"skipToManageCar";
	}
	
	@RequestMapping("/deleteCar.do")
	public String deleteCar(ModelMap mp,HttpServletRequest request){
		int carID=Integer.parseInt(request.getParameter("carID"));
//		String model=request.getParameter("model");
//		String carPlateNumber=request.getParameter("carPlateNumber");
//		int usedYears=Integer.parseInt(request.getParameter("usedYears"));
		
		Car c = new Car();
		c.setCarID(carID);
//		c.setCarPlateNumber(carPlateNumber);
//		c.setModel(model);
//		c.setUsedYears(usedYears);
//		carService.deleteCar(c);
		if(carService.deleteCar(c)){
			mp.addAttribute("state", true);
		}else{
			mp.addAttribute("state", false);
		}
		
		return"skipToManageCar";
	}
	

	@RequestMapping("/updateCar.do")
	public String updateCar(HttpServletRequest request){
		int carID=Integer.parseInt(request.getParameter("carID"));
		String model=request.getParameter("model");
		String carPlateNumber=request.getParameter("carPlateNumber");
		int usedYears=Integer.parseInt(request.getParameter("usedYears"));
		
		Car c = new Car();
		c.setCarID(carID);
		c.setCarPlateNumber(carPlateNumber);
		c.setModel(model);
		c.setUsedYears(usedYears);
		carService.updateCar(c);
		
		return"skipToManageCar";
	}
	
	@RequestMapping("/findCar.do")
	public String findCar(ModelMap mp,HttpServletRequest request){
		List<Car> list= carService.findCar();
		mp.addAttribute("car", list);
		return "manageCar";
	}
	
	

	@RequestMapping("/searchCarByCarPlateNumber.do")
	public String searchCarByCarPlateNumber(ModelMap mp,HttpServletRequest request){
		String carPlateNumber=request.getParameter("carPlateNumber");
		List<Car> list=carService.findCarBycarPlateNumber(carPlateNumber);
		mp.addAttribute("car", list);
		return "manageCar";
	}
}
