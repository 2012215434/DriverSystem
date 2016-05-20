package driverSystem.appointment.dao;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import driverSystem.appointment.entities.Appointment;

@Component
public class AppointmentDao {
	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public List<Appointment> showAppointmentList(Date appointDate){
		String hql="from Appointment a where a.appointDate=?";
		List<Appointment> list=hibernateTemplate.find(hql, appointDate);
		return list;
	}

	public void add(Appointment a) {
		hibernateTemplate.save(a);
	}
	
	public Appointment find(Appointment a){
		String hql="from Appointment a where a.appointDate=? and a.coachID=? and a.appointStartTime=? and a.appointEndTime=?";
		List<Appointment> list=hibernateTemplate.find(hql, a.getAppointDate(),a.getCoachID(),a.getAppointStartTime(),a.getAppointEndTime());
		if(list.size()==1){
			return list.get(0);
		}else{
			return null;
		}
	}
	
	public boolean delete(Appointment a){
		hibernateTemplate.delete(a);
		return true;
	}

	public List<Appointment> showAppointmentList(Date appointDate, int coachID) {
		String hql="from Appointment a where a.appointDate=? and a.coachID=?";
		List<Appointment> list=hibernateTemplate.find(hql, appointDate,coachID);
		return list;
	}
}
