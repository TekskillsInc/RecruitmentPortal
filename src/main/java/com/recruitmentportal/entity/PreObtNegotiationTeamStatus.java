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
@Table(name="TBL_RECPORTAL_PREOBT_NEG_STATUS")
public class PreObtNegotiationTeamStatus implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	   @GeneratedValue(strategy=GenerationType.IDENTITY)
	   @Column(name="TBL_PK")
	   private Integer tblPk;
	
	   @Column(name="candidate_id")
	   private Integer candidate_id;
	   
	   @Column(name="comments")
	   private String comments;
	   
	   @Column(name="negStatus")
	   private String negStatus;
	   
	   @Column(name="verifiedBy")
	   private Integer verifiedBy;
	  
	   @Temporal(TemporalType.DATE)
	   @Column(name="updateDate")
	   private Date updateDate;
	   
	   @Column(name="isActive")
	   private String isActive;
	  
	   public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	@Column(name="filename")
	   private String filename;
	   
	   @Column(name="filetype")
	   private String filetype;
	   
	   public Integer getTblPk() {
		return tblPk;
	}

	public void setTblPk(Integer tblPk) {
		this.tblPk = tblPk;
	}

	public Integer getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(Integer candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getNegStatus() {
		return negStatus;
	}

	public void setNegStatus(String negStatus) {
		this.negStatus = negStatus;
	}

	public Integer getVerifiedBy() {
		return verifiedBy;
	}

	public void setVerifiedBy(Integer verifiedBy) {
		this.verifiedBy = verifiedBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	

}
