
package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Tbl_PreOnbording_PersonnelDetails")
public class PreOnbordingPersonnelDetails implements Serializable
{
	private static final long serialVersionUID = 1L;
@Id
  @GeneratedValue(strategy=GenerationType.IDENTITY)
  @Column(name="id")
  private Integer id;
  
  @Column(name="candidateid")
  private Integer candidateid;
  
  @Column(name="idproof")
  private String idproof;
  
  @Column(name="isreceived")
  private String isreceived;
  
  @Column(name="addressproof")
  private String addressproof;
  
  @Column(name="isadproffreceived")
  private String isadproffreceived;
  
  @Column(name="verifier_comments")
  private String verifier_comments;
    
  @Column(name="verifiedby")
  private String verifiedby;
  
  @Column(name="neg_comments")
  private String neg_comments;
  
  @Column(name="neg_by")
  private String neg_by;
  
  @Column(name="photo")
  private String photo;

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

public String getIdproof() {
	return idproof;
}

public void setIdproof(String idproof) {
	this.idproof = idproof;
}

public String getIsreceived() {
	return isreceived;
}

public void setIsreceived(String isreceived) {
	this.isreceived = isreceived;
}

public String getAddressproof() {
	return addressproof;
}

public void setAddressproof(String addressproof) {
	this.addressproof = addressproof;
}

public String getPhoto() {
	return photo;
}

public void setPhoto(String photo) {
	this.photo = photo;
}

public String getIsadproffreceived() {
	return isadproffreceived;
}

public void setIsadproffreceived(String isadproffreceived) {
	this.isadproffreceived = isadproffreceived;
}

public String getVerifier_comments() {
	return verifier_comments;
}

public void setVerifier_comments(String verifier_comments) {
	this.verifier_comments = verifier_comments;
}

public String getVerifiedby() {
	return verifiedby;
}

public void setVerifiedby(String verifiedby) {
	this.verifiedby = verifiedby;
}

public String getNeg_comments() {
	return neg_comments;
}

public void setNeg_comments(String neg_comments) {
	this.neg_comments = neg_comments;
}

public String getNeg_by() {
	return neg_by;
}

public void setNeg_by(String neg_by) {
	this.neg_by = neg_by;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}
  
  
}


