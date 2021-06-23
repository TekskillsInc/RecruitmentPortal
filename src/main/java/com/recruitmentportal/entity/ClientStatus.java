 package com.recruitmentportal.entity;
 
 import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.recruitmentportal.entity.Jobdescription;
 
 @javax.persistence.Entity
 @javax.persistence.Table(name="Tbl_RecPortal_Clientstatus")
 public class ClientStatus implements Serializable
 {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
   @GeneratedValue
   @Column(name="tblPk")
   private int tblPk;
   
   @ManyToOne
   @JoinColumn(name="jobdescid", referencedColumnName="jobdescid")
   private Jobdescription Jobdesc;
   
   @ManyToOne
   @JoinColumn(name="candidateid", referencedColumnName="candidateid")
   private CandidateInformation CandidateInform;
   
   @ManyToOne
   @JoinColumn(name="cmpny_id", referencedColumnName="cmpny_id")
   private CompanyDescription company;
   
   @Column(name="bdmEmpNo")
   private Integer bdmEmpNo;
   
   @Column(name="profile_status")
   private String profile_status;
   
   @Column(name="Comments")
   private String Comments;
   
   @Column(name="flag")
   private int flag;
   
   @Temporal(TemporalType.DATE)
   @Column(name="submit_date")
   private Date submit_date;

public int getTblPk() {
	return tblPk;
}

public void setTblPk(int tblPk) {
	this.tblPk = tblPk;
}

public Jobdescription getJobdesc() {
	return Jobdesc;
}

public void setJobdesc(Jobdescription jobdesc) {
	Jobdesc = jobdesc;
}

public CandidateInformation getCandidateInform() {
	return CandidateInform;
}

public void setCandidateInform(CandidateInformation candidateInform) {
	CandidateInform = candidateInform;
}

public CompanyDescription getCompany() {
	return company;
}

public void setCompany(CompanyDescription company) {
	this.company = company;
}

public Integer getBdmEmpNo() {
	return bdmEmpNo;
}


public void setBdmEmpNo(Integer bdmEmpNo) {
	this.bdmEmpNo = bdmEmpNo;
}

public String getProfile_status() {
	return profile_status;
}

public void setProfile_status(String profile_status) {
	this.profile_status = profile_status;
}

public String getComments() {
	return Comments;
}

public void setComments(String comments) {
	Comments = comments;
}

public int getFlag() {
	return flag;
}

public void setFlag(int flag) {
	this.flag = flag;
}

public Date getSubmit_date() {
	return submit_date;
}

public void setSubmit_date(Date submit_date) {
	this.submit_date = submit_date;
}
   
  
   
   
   
  
 }


