package driverSystem.car.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.car.po.Car;

@Component
public class CarDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public Car findCarByID(Car c){
		String hql="from Car c where c.carID=?";
		List<Car> list = hibernateTemplate.find(hql,c.getCarID() );
		if(!list.isEmpty()){
			return  list.get(0);
		}else{
			return null;
		}
	}
	

	
	public List<Car> findCar(){
		String hql="from Car c ";
		List<Car> list=hibernateTemplate.find(hql);
		return list;
	}
	
	public Car findCarBycarPlateNumber(String carPlateNumber){
		String hql="from Car c where c.carPlateNumber=?";
		List<Car> list = hibernateTemplate.find(hql, carPlateNumber);
		if(!list.isEmpty()){
			Car car=list.get(0);
			return car;
		}else{
			return null;
		}
	}
	
	public boolean updateCar(Car car){
		hibernateTemplate.update(car);
		return true;
	}
	public boolean addCar(Car car){
		hibernateTemplate.save(car);
		return true;
	}
	
	public boolean  deleteCar(Car car){
		hibernateTemplate.delete(car);
		return true;
	}

	public Car findCarByID1(int carID){
		String hql="from Car c where c.carID=?";
		List<Car> list = hibernateTemplate.find(hql,carID);
		if(!list.isEmpty()){
			Car car=list.get(0);
			return car;
		}else{
			return null;
		}
	}

}
