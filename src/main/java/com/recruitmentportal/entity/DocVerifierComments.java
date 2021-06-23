package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="TBL_RECPORTAL_PREOBT_DocComments")

public class DocVerifierComments implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="TBL_PK")
	private Integer id;
    
	

	@Column(name="candidate_id")
	private int candidateid;
 
    @Column(name="comments")
	private String comments;
    
 
    @Column(name="verifiedBy")
	private int verifiedBy;
 
   
    @Column(name="updateDate")
	private String updateDate;
    

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	
	public int getVerifiedBy() {
		return verifiedBy;
	}

	public void setVerifiedBy(int verifiedBy) {
		this.verifiedBy = verifiedBy;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCandidateid() {
		return candidateid;
	}

	public void setCandidateid(int candidateid) {
		this.candidateid = candidateid;
	}

	

	

}
