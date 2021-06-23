
package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Tbl_Preonboarding_EducationDetails")
public class PreonboardingEducationDetails implements Serializable
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
  
  @Column(name="ssc")
  private String ssc;
  
  @Column(name="sscperc")
  private Integer sscperc;
  
  @Column(name="inter")
  private String inter;
  
  @Column(name="interperc")
  private Integer interperc;
  
  @Column(name="degree")
  private String degree;
  
  @Column(name="degree_perc")
  private Integer degree_perc;
  
  @Column(name="pg")
  private String pg;
  
  @Column(name="pgperc")
  private Integer pgperc;
  
  @Column(name="verifier_comments")
  private String verifier_comments;
  
  @Column(name="verifiedby")
  private String verifiedby;
  
  @Column(name="neg_comments")
  private String neg_comments;
  
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

public String getSsc() {
	return ssc;
}

public void setSsc(String ssc) {
	this.ssc = ssc;
}

public Integer getSscperc() {
	return sscperc;
}

public void setSscperc(Integer sscperc) {
	this.sscperc = sscperc;
}

public String getInter() {
	return inter;
}

public void setInter(String inter) {
	this.inter = inter;
}

public Integer getInterperc() {
	return interperc;
}

public void setInterperc(Integer interperc) {
	this.interperc = interperc;
}

public String getDegree() {
	return degree;
}

public void setDegree(String degree) {
	this.degree = degree;
}

public Integer getDegree_perc() {
	return degree_perc;
}

public void setDegree_perc(Integer degree_perc) {
	this.degree_perc = degree_perc;
}

public String getPg() {
	return pg;
}

public void setPg(String pg) {
	this.pg = pg;
}

public Integer getPgperc() {
	return pgperc;
}

public void setPgperc(Integer pgperc) {
	this.pgperc = pgperc;
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

public String getNegby() {
	return negby;
}

public void setNegby(String negby) {
	this.negby = negby;
}

public static long getSerialversionuid() {
	return serialVersionUID;
}
   
  

}


