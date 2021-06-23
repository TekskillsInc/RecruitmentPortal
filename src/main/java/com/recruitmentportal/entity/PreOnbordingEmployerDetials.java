
package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Tbl_PreOnbording_EmployerDetials")
public class PreOnbordingEmployerDetials implements Serializable
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name="id")
  private Integer id;
  
  @Column(name="candidateid")
  private Integer candidateid;
  
  @Column(name="employer_name")
  private String employername;
  
  @Column(name="tenure_resume")
  private String tenureresume;
  
  @Column(name="appointment_tenure")//tenure_actual
  private String appointmenttenure;
  
  @Column(name="relieve_tenure")//tenure_actual
  private String relievetenure;
  
  @Column(name="ctc")
  private String ctc;
  
  @Column(name="last_drawn_ctc")
  private String ldctc;
  
  @Column(name="reasonforchange")
  private String reasonforchange;
  
  @Column(name="reccomments")
  private String reccomments;
  
  @Column(name="verifier_comments")
  private String verifiercomments;
  
  @Column(name="bank_stmts_tenure")
  private String bankstmtstenure;
  
  @Column(name="payslips_tenure")   
  private String payslipstenure;
  
  @Column(name="verified_date")
  private String verifieddate;
  
  @Column(name="added_date")
  private String addeddate;
  
  @Column(name="verifiedby")
  private String verifiedby;
  
  @Column(name="addedby")
  private String addedby;
  
  @Column(name="neg_comments")
  private String negcomments;
  
  @Column(name="neg_date")
  private String negdate;
  
  @Column(name="negby")
  private String negby;

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


public String getReccomments() {
	return reccomments;
}

public void setReccomments(String reccomments) {
	this.reccomments = reccomments;
}








public String getVerifiedby() {
	return verifiedby;
}

public void setVerifiedby(String verifiedby) {
	this.verifiedby = verifiedby;
}

public String getAddedby() {
	return addedby;
}

public void setAddedby(String addedby) {
	this.addedby = addedby;
}



public String getNegby() {
	return negby;
}

public void setNegby(String negby) {
	this.negby = negby;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}

public String getEmployername() {
	return employername;
}

public void setEmployername(String employername) {
	this.employername = employername;
}

public String getTenureresume() {
	return tenureresume;
}

public void setTenureresume(String tenureresume) {
	this.tenureresume = tenureresume;
}


public String getCtc() {
	return ctc;
}

public void setCtc(String ctc) {
	this.ctc = ctc;
}

public String getLdctc() {
	return ldctc;
}

public void setLdctc(String ldctc) {
	this.ldctc = ldctc;
}

public String getReasonforchange() {
	return reasonforchange;
}

public void setReasonforchange(String reasonforchange) {
	this.reasonforchange = reasonforchange;
}

public String getVerifiercomments() {
	return verifiercomments;
}

public void setVerifiercomments(String verifiercomments) {
	this.verifiercomments = verifiercomments;
}



public String getVerifieddate() {
	return verifieddate;
}

public void setVerifieddate(String verifieddate) {
	this.verifieddate = verifieddate;
}

public String getNegcomments() {
	return negcomments;
}

public void setNegcomments(String negcomments) {
	this.negcomments = negcomments;
}

public String getNegdate() {
	return negdate;
}

public void setNegdate(String negdate) {
	this.negdate = negdate;
}

public String getAppointmenttenure() {
	return appointmenttenure;
}

public void setAppointmenttenure(String appointmenttenure) {
	this.appointmenttenure = appointmenttenure;
}

public String getRelievetenure() {
	return relievetenure;
}

public void setRelievetenure(String relievetenure) {
	this.relievetenure = relievetenure;
}

public String getBankstmtstenure() {
	return bankstmtstenure;
}

public void setBankstmtstenure(String bankstmtstenure) {
	this.bankstmtstenure = bankstmtstenure;
}

public String getPayslipstenure() {
	return payslipstenure;
}

public void setPayslipstenure(String payslipstenure) {
	this.payslipstenure = payslipstenure;
}

public String getAddeddate() {
	return addeddate;
}

public void setAddeddate(String addeddate) {
	this.addeddate = addeddate;
}

}


