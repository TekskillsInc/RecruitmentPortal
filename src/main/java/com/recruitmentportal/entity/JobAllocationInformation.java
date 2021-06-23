
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
@Table(name="Tbl_RecPortal_JobAllocationInformation")
public class JobAllocationInformation implements Serializable
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name="tblpk")
  private Integer tblpk;
  
  @Column(name="bdempno")
  private Integer bdempno;
  
  @Column(name="tlempno")
  private Integer tlempno;
  
  @Column(name="recempno")
  private Integer recempno;
  
  @Column(name="recstatus")
  private String recstatus;
  
  @Column(name="tlstatus")
  private String tlstatus;
  
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="tlunassigneddate")
  private Date tlunassigneddate;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="tlreassigneddate")
  private Date tlreassigneddate;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="bdunassigneddate")
  private Date bdunassigneddate;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="bdreassigneddate")
  private Date bdreassigneddate;

  @Column(name="jobdescid")
  private Integer jobdescid;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="bdassigneddate")
  private Date bdassigneddate;
  
  @Temporal(TemporalType.TIMESTAMP)
  @Column(name="tlassigneddate")
  private Date tlassigneddate; 
  
  
  
  
  
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

public String getTlstatus() {
	return tlstatus;
}

public void setTlstatus(String tlstatus) {
	this.tlstatus = tlstatus;
}

public Date getTlunassigneddate() {
	return tlunassigneddate;
}

public void setTlunassigneddate(Date tlunassigneddate) {
	this.tlunassigneddate = tlunassigneddate;
}

public Date getTlreassigneddate() {
	return tlreassigneddate;
}

public void setTlreassigneddate(Date tlreassigneddate) {
	this.tlreassigneddate = tlreassigneddate;
}

public Date getBdunassigneddate() {
	return bdunassigneddate;
}

public void setBdunassigneddate(Date bdunassigneddate) {
	this.bdunassigneddate = bdunassigneddate;
}

public Date getBdreassigneddate() {
	return bdreassigneddate;
}

public void setBdreassigneddate(Date bdreassigneddate) {
	this.bdreassigneddate = bdreassigneddate;
}

public Integer getJobdescid() {
	return jobdescid;
}

public void setJobdescid(Integer jobdescid) {
	this.jobdescid = jobdescid;
}

public Date getBdassigneddate() {
	return bdassigneddate;
}

public void setBdassigneddate(Date bdassigneddate) {
	this.bdassigneddate = bdassigneddate;
}

public Date getTlassigneddate() {
	return tlassigneddate;
}

public void setTlassigneddate(Date tlassigneddate) {
	this.tlassigneddate = tlassigneddate;
}


  

  
  

}


