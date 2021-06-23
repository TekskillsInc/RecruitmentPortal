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
@Table(name="Tbl_RecPortal_RECAllocation")
public class JobAllocationRecruiter implements Serializable{
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	  @GeneratedValue(strategy=GenerationType.IDENTITY)
	  @Column(name="tblpk")
	  private Integer tblpk;
	  
	  @Column(name="tlEmpno")
	  private Integer tlempno;
	  
	  @Column(name="recempno")
	  private Integer recempno;
	  
	  @Column(name="empstatus")
	  private String recstatus;
	  
	  @Temporal(TemporalType.TIMESTAMP)
	  @Column(name="assigneddate")
	  private Date tlassigneddate; 
	  
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

	@Column(name="jobdescid")
	  private Integer jobdescid;
	  
	  @Column(name="departmentid")
	  private Integer departmentid;

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

	public Integer getTlempno() {
		return tlempno;
	}

	public void setTlempno(Integer tlempno) {
		this.tlempno = tlempno;
	}

	public Integer getRecempno() {
		return recempno;
	}

	public void setRecempno(Integer recempno) {
		this.recempno = recempno;
	}

	public String getRecstatus() {
		return recstatus;
	}

	public void setRecstatus(String recstatus) {
		this.recstatus = recstatus;
	}

	public Date getTlassigneddate() {
		return tlassigneddate;
	}

	public void setTlassigneddate(Date tlassigneddate) {
		this.tlassigneddate = tlassigneddate;
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
