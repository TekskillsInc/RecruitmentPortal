
package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="Tbl_RecPortal_TlAllocation")
public class JobAllocationTL implements Serializable
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name="tblpk")
  private Integer tblpk;
  




@Column(name="bdEmpNo")
  private Integer bdempno;
  
  @Column(name="tlEmpno")
  private Integer tlempno;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="assigneddate")
  private Date bdassigneddate;
  
  @Column(name="empstatus")
  private String tlstatus;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="unassigneddate")
  private Date unassigneddate;
 
  @Column(name="jobdescid")
  private Integer jobdescid;
  
  @Column(name="departmentid")
  private Integer departmentid;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="reassigneddate")
  private Date reassigneddate;
  
  
  public Date getReassigneddate() {
	return reassigneddate;
}

public void setReassigneddate(Date reassigneddate) {
	this.reassigneddate = reassigneddate;
}

public Integer getDepartmentid() {
	return departmentid;
}

public void setDepartmentid(Integer departmentid) {
	this.departmentid = departmentid;
}

public Integer getTblpk() {
	return tblpk;
}

public void setTblpk(Integer tblpk) {
	this.tblpk = tblpk;
}

public Integer getBdempno() {
	return bdempno;
}

public void setBdempno(Integer bdempno) {
	this.bdempno = bdempno;
}

public Integer getTlempno() {
	return tlempno;
}

public void setTlempno(Integer tlempno) {
	this.tlempno = tlempno;
}

public Date getBdassigneddate() {
	return bdassigneddate;
}

public void setBdassigneddate(Date bdassigneddate) {
	this.bdassigneddate = bdassigneddate;
}

public String getTlstatus() {
	return tlstatus;
}

public void setTlstatus(String tlstatus) {
	this.tlstatus = tlstatus;
}

public Date getUnassigneddate() {
	return unassigneddate;
}

public void setUnassigneddate(Date unassigneddate) {
	this.unassigneddate = unassigneddate;
}

public Integer getJobdescid() {
	return jobdescid;
}

public void setJobdescid(Integer jobdescid) {
	this.jobdescid = jobdescid;
}
  
 
  
  
  
 
  

  
  

}


