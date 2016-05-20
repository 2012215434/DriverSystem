package driverSystem.leave.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(schema="driverSystem", name="leave")
public class Leave {
	@Id
	private int leaveID;
	private String coachLoginName;
	private Date leaveDate;
	public int getLeaveID() {
		return leaveID;
	}
	public void setLeaveID(int leaveID) {
		this.leaveID = leaveID;
	}
	public String getCoachLoginName() {
		return coachLoginName;
	}
	public void setCoachLoginName(String coachLoginName) {
		this.coachLoginName = coachLoginName;
	}
	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	
	
}
