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
@Table(name="Tbl_Recportal_Preobt_Doc_Status")

public class Tbl_Recportal_Preobt_Doc_Status implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="TBL_PK")
	private Integer TBL_PK;
    
	public Integer getTBL_PK() {
		return TBL_PK;
	}

	public void setTBL_PK(Integer tBL_PK) {
		TBL_PK = tBL_PK;
	}

	@Column(name="candidate_id")
	private int candidate_id;
 
    @Column(name="comments")
	private String comments;
    
    

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Column(name="doc_verified_status")
	private String doc_verified_status;
 
    @Column(name="verifiedBy")
	private int verifiedBy;
 
    @Temporal(TemporalType.DATE)
    @Column(name="updateDate")
	private Date updateDate;
    

    @Column(name="fileName")
	private String fileName;
 
    @Column(name="fileType")
	private String fileType;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name="isActive")
	private String isActive;
	 
	

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getDoc_verified_status() {
		return doc_verified_status;
	}

	public void setDoc_verified_status(String doc_verified_status) {
		this.doc_verified_status = doc_verified_status;
	}

	public int getVerifiedBy() {
		return verifiedBy;
	}

	public void setVerifiedBy(int verifiedBy) {
		this.verifiedBy = verifiedBy;
	}

	public String getIsActive() {
		return isActive;
	}

	public void setIsActive(String isActive) {
		this.isActive = isActive;
	}

	

}
