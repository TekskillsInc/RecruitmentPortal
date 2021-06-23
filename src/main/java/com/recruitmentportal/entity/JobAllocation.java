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
 @Table(name="Tbl_RecPortal_JobAllocation")
 public class JobAllocation implements Serializable
 {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   @Column(name="tblpk")
   private Integer tblpk;
   
   @Column(name="assignedto")
   private Integer assignedto;
   
   @Column(name="assignedby")
   private Integer assignedby;
   @Column(name="tlempno")
   private Integer tlempno;
   
   
 

@Column(name="empstatus")
   private String empstatus;
   
   @Temporal(TemporalType.TIMESTAMP)
   @Column(name="unassigneddate")
   private Date unassigneddate;
   
   @Temporal(TemporalType.TIMESTAMP)
   @Column(name="reassigneddate")
   private Date reassigneddate;
   
  

public Date getReassigneddate() {
	return reassigneddate;
}

public void setReassigneddate(Date reassigneddate) {
	this.reassigneddate = reassigneddate;
}

public Date getUnassigneddate() {
	return unassigneddate;
}

public void setUnassigneddate(Date unassigneddate) {
	this.unassigneddate = unassigneddate;
}

@ManyToOne
   @JoinColumn(name="jobdescid")

   private Jobdescription jobDesc;
   
   @Temporal(TemporalType.TIMESTAMP)
   @Column(name="assigneddate")
   private Date assigneddate;
   
   @Column(name="departmentid")  
   private Integer departmentid;
   
   public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

public Integer getAssignedby() {
	return assignedby;
}

public void setAssignedby(Integer assignedby) {
	this.assignedby = assignedby;
}

public Jobdescription getJobDesc() {
	return jobDesc;
}

public void setJobDesc(Jobdescription jobDesc) {
	this.jobDesc = jobDesc;
}

public Integer getAssignedto() {
	return assignedto;
}

public void setAssignedto(Integer assignedto) {
	this.assignedto = assignedto;
}

public Date getAssigneddate() {
	return assigneddate;
}

public void setAssigneddate(Date assigneddate) {
	this.assigneddate = assigneddate;
}

public Integer getDepartmentid() {
	return departmentid;
}

public void setDepartmentid(Integer departmentid) {
	this.departmentid = departmentid;
}
   
public String getEmpstatus() {
	return empstatus;
}

public void setEmpstatus(String empstatus) {
	this.empstatus = empstatus;
}
public Integer getTlempno() {
	return tlempno;
}

public void setTlempno(Integer tlempno) {
	this.tlempno = tlempno;
}
  
 }


