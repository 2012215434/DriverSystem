package driverSystem.appointment.entities;

import java.sql.Date;
import java.sql.Time;

public class AppointmentVO {

	private String userName;
	private int userID;
	private int coachID;
	private String coachName;
	private Date appointDate;
	private Time appointStartTime;
	private Time appointEndTime;
	private String carPlateNumber;
	private boolean coachState;
	
	
	public boolean isCoachState() {
		return coachState;
	}
	public void setCoachState(boolean coachState) {
		this.coachState = coachState;
	}
	public String getCarPlateNumber() {
		return carPlateNumber;
	}
	public void setCarPlateNumber(String carPlateNumber) {
		this.carPlateNumber = carPlateNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public int getCoachID() {
		return coachID;
	}
	public void setCoachID(int coachID) {
		this.coachID = coachID;
	}
	public String getCoachName() {
		return coachName;
	}
	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}
	public Date getAppointDate() {
		return appointDate;
	}
	public void setAppointDate(Date appointDate) {
		this.appointDate = appointDate;
	}
	public Time getAppointStartTime() {
		return appointStartTime;
	}
	public void setAppointStartTime(Time appointStartTime) {
		this.appointStartTime = appointStartTime;
	}
	public Time getAppointEndTime() {
		return appointEndTime;
	}
	public void setAppointEndTime(Time appointEndTime) {
		this.appointEndTime = appointEndTime;
	}
	
}
