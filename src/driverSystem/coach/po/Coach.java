package driverSystem.coach.po;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema="driverSystem" , name="driverCoach")
public class Coach {
	@Id
	private int coachID;
	private int carID;
	private String coachName;
	private String coachLoginName;
	private String coachLoginPassword;
	private String notes;
	
	public int getCoachID() {
		return coachID;
	}
	public void setCoachID(int coachID) {
		this.coachID = coachID;
	}
	public int getCarID() {
		return carID;
	}
	public void setCarID(int carID) {
		this.carID = carID;
	}
	public String getCoachName() {
		return coachName;
	}
	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	public String getCoachLoginName() {
		return coachLoginName;
	}
	public void setCoachLoginName(String coachLoginName) {
		this.coachLoginName = coachLoginName;
	}
	public String getCoachLoginPassword() {
		return coachLoginPassword;
	}
	public void setCoachLoginPassword(String coachLoginPassword) {
		this.coachLoginPassword = coachLoginPassword;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
}
