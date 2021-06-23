package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_RecPortal_jobmandatoryskills")
public class JobMandatorySkills implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tblpk")
	 private Integer tblpk;
	@ManyToOne
	@JoinColumn(name = "jobid")
	private Jobdescription jobdesc;
	
	@Column(name="reqskill")
	private String reqskill;
	
	public Integer getTblpk() {
		return tblpk;
	}
	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}
	
	public Jobdescription getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(Jobdescription jobdesc) {
		this.jobdesc = jobdesc;
	}
	public String getReqskill() {
		return reqskill;
	}
	public void setReqskill(String reqskill) {
		this.reqskill = reqskill;
	}
	


}
