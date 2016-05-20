package driverSystem.car.service;

import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import driverSystem.car.dao.CarDao;
import driverSystem.car.po.Car;

@Component
public class CarService {
	@Resource
	private CarDao carDao=new CarDao();

	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}
	
	public boolean addCar(Car car){
		Car c = carDao.findCarBycarPlateNumber(car.getCarPlateNumber());
		if(c==null){
			carDao.addCar(car);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean updateCar(Car car){
		carDao.updateCar(car);
		return true;
	}
	
	public boolean deleteCar(Car car){
		Car c = carDao.findCarByID(car);
		if(c!=null){
			carDao.deleteCar(car);
			return true;
		}else{
			return false;
		}
	}
	
	public List<Car> findCar(){
		List<Car> list=carDao.findCar();
		return list;
	}
	
	public List<Car> findCarBycarPlateNumber(String carPlateNumber){
		Car c=carDao.findCarBycarPlateNumber(carPlateNumber);
		List<Car> list= new LinkedList<Car>();
		list.add(c);
		return list;
	}

	public Car getCar(int carID) {
		Car car=new Car();
		car.setCarID(carID);
		Car car2=carDao.findCarByID(car);
		return car2;
	}
}
