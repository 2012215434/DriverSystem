package driverSystem.car.po;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema="driverSystem",name="car")
public class Car {
	@Id
	private int carID;
	private String model;
	private String carPlateNumber;
	private int usedYears;
	public int getCarID() {
		return carID;
	}
	public void setCarID(int carID) {
		this.carID = carID;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getCarPlateNumber() {
		return carPlateNumber;
	}
	public void setCarPlateNumber(String carPlateNumber) {
		this.carPlateNumber = carPlateNumber;
	}
	public int getUsedYears() {
		return usedYears;
	}
	public void setUsedYears(int usedYears) {
		this.usedYears = usedYears;
	}
	
}
