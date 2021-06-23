package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Tbl_RecPortal_RecruiterDailySubmissions")
public class RecruiterDailySubmissions implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tblpk")
	 private Integer tblpk;
	 @ManyToOne
	 @JoinColumn(name="jobid", referencedColumnName="jobdescid")
	 private Jobdescription jobdesc;
	 @Column(name="recId")
	 private Integer recId;
	 @Column(name="dowloaded")
	 private Integer dowloaded;
	 @Column(name="contacted")
	 private Integer contacted;
	 @Column(name="agreed")
	 private Integer  agreed;  
	 @Column(name="createdDate")
	 @Temporal(TemporalType.DATE)
	 private Date createdDate;
	 
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
	
	public Integer getRecId() {
		return recId;
	}
	public void setRecId(Integer recId) {
		this.recId = recId;
	}
	public Integer getDowloaded() {
		return dowloaded;
	}
	public void setDowloaded(Integer dowloaded) {
		this.dowloaded = dowloaded;
	}
	
	public Integer getContacted() {
		return contacted;
	}
	public void setContacted(Integer contacted) {
		this.contacted = contacted;
	}
	public Integer getAgreed() {
		return agreed;
	}
	public void setAgreed(Integer agreed) {
		this.agreed = agreed;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	 
	 
}
