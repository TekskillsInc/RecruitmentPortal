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
@Table(name="Tbl_RecPortal_jobstatus")
public class JobStatus implements Serializable{
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
	
	@Column(name="jobstatus")
	private String jdStatus;
	
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
	public String getJdStatus() {
		return jdStatus;
	}
	public void setJdStatus(String jdStatus) {
		this.jdStatus = jdStatus;
	}
	

}
