package driverSystem.appointment.entities;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema="driverSystem",name="appointment")
public class Appointment {
	@Id
	private int appointmentID;
	private int userID;
	private int coachID;
	private Date appointDate;
	private Time appointStartTime;
	private Time appointEndTime;
	private String notes;
	public int getAppointmentID() {
		return appointmentID;
	}
	public void setAppointmentID(int appointmentID) {
		this.appointmentID = appointmentID;
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
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
}
