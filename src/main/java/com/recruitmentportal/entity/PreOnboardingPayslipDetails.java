
package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Tbl_PreOnboarding_PayslipDetails")
public class PreOnboardingPayslipDetails implements Serializable
{
	private static final long serialVersionUID = 1L;

@Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name="id")
  private Integer id;
  
  @Column(name="candidateid")
  private Integer candidateid;
  
  @Column(name="month")
  private String month;
  
  @Column(name="payslip")
  private String payslip;
  
  @Column(name="bank_stmt")
  private String bank_stmt;
  
  @Column(name="comments")
  private String comments;

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public Integer getCandidateid() {
	return candidateid;
}

public void setCandidateid(Integer candidateid) {
	this.candidateid = candidateid;
}

public String getMonth() {
	return month;
}

public void setMonth(String month) {
	this.month = month;
}

public String getPayslip() {
	return payslip;
}

public void setPayslip(String payslip) {
	this.payslip = payslip;
}

public String getBank_stmt() {
	return bank_stmt;
}

public void setBank_stmt(String bank_stmt) {
	this.bank_stmt = bank_stmt;
}

public String getComments() {
	return comments;
}

public void setComments(String comments) {
	this.comments = comments;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}
  	
}


