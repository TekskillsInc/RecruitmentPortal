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
@Table(name="Tbl_RecPortal_PreobtStatus")
public class Tbl_RecPortal_PreobtStatus implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="TBL_PK")
	private Integer TBL_PK;
	
	@Column(name="candidate_id")
	private int candidate_id;
	
	@Column(name="doc_verify_status")
	private String doc_verify_status;
	 
	@Column(name="doc_verify_uploadedBy")
	private int doc_verify_uploadedBy;
	
	public String getDoccomments() {
		return doccomments;
	}

	public void setDoccomments(String doccomments) {
		this.doccomments = doccomments;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Temporal(TemporalType.DATE)
	@Column(name="doc_verify_date")
	private Date doc_verify_date;
	    
	@Column(name="nego_status")
	private String nego_status;
	 
	@Column(name="nego_uploadedBy")
	private int nego_uploadedBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="nego_subdate")
	private Date nego_subdate;
	
	@Column(name="mgmt_status")
	private String mgmt_status;
	 
	@Column(name="mgmt_uploadedBy")
	private int mgmt_uploadedBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="mgmt_subdate")
	private Date mgmt_subdate;
	
	@Column(name="doc_verify_mgmt_filename")
	private String doc_verify_mgmt_filename;
	
	@Column(name="doc_verify_mgmt_filename2")
	private String doc_verify_mgmt_filename2;
	
	
	@Column(name="negteam_mgmt_filename")
	private String negteam_mgmt_filename;
	
	
	@Column(name="doccomments")
	private String doccomments;
	
	public String getDoc_verify_mgmt_filename() {
		return doc_verify_mgmt_filename;
	}

	public void setDoc_verify_mgmt_filename(String doc_verify_mgmt_filename) {
		this.doc_verify_mgmt_filename = doc_verify_mgmt_filename;
	}

	public String getNegteam_mgmt_filename() {
		return negteam_mgmt_filename;
	}

	public void setNegteam_mgmt_filename(String negteam_mgmt_filename) {
		this.negteam_mgmt_filename = negteam_mgmt_filename;
	}
	
	public String getDoc_verify_mgmt_filename2() {
		return doc_verify_mgmt_filename2;
	}

	public void setDoc_verify_mgmt_filename2(String doc_verify_mgmt_filename2) {
		this.doc_verify_mgmt_filename2 = doc_verify_mgmt_filename2;
	}

	public String getHr_loi_status() {
		return hr_loi_status;
	}

	public void setHr_loi_status(String hr_loi_status) {
		this.hr_loi_status = hr_loi_status;
	}

	public int getHr_loi_updateby() {
		return hr_loi_updateby;
	}

	public void setHr_loi_updateby(int hr_loi_updateby) {
		this.hr_loi_updateby = hr_loi_updateby;
	}

	public String getHr_loi_filename() {
		return hr_loi_filename;
	}

	public void setHr_loi_filename(String hr_loi_filename) {
		this.hr_loi_filename = hr_loi_filename;
	}

	public Date getHr_loi_submitdate() {
		return hr_loi_submitdate;
	}

	public void setHr_loi_submitdate(Date hr_loi_submitdate) {
		this.hr_loi_submitdate = hr_loi_submitdate;
	}

	@Column(name="hr_loi_status")
	private String hr_loi_status;
	
	@Column(name="hr_loi_updateby")
	private int hr_loi_updateby;
	
	@Column(name="hr_loi_filename")
	private String hr_loi_filename;
	
	@Temporal(TemporalType.DATE)
	@Column(name="hr_loi_submitdate")
	private Date hr_loi_submitdate;
	
	public String getHr_loi_comment() {
		return hr_loi_comment;
	}

	public void setHr_loi_comment(String hr_loi_comment) {
		this.hr_loi_comment = hr_loi_comment;
	}

	@Column(name="hr_loi_comment")
	private String hr_loi_comment;
	
	
	public Integer getTBL_PK() {
		return TBL_PK;
	}

	public void setTBL_PK(Integer tBL_PK) {
		TBL_PK = tBL_PK;
	}

	public int getCandidate_id() {
		return candidate_id;
	}

	public void setCandidate_id(int candidate_id) {
		this.candidate_id = candidate_id;
	}

	public String getDoc_verify_status() {
		return doc_verify_status;
	}

	public void setDoc_verify_status(String doc_verify_status) {
		this.doc_verify_status = doc_verify_status;
	}

	public int getDoc_verify_uploadedBy() {
		return doc_verify_uploadedBy;
	}

	public void setDoc_verify_uploadedBy(int doc_verify_uploadedBy) {
		this.doc_verify_uploadedBy = doc_verify_uploadedBy;
	}

	public Date getDoc_verify_date() {
		return doc_verify_date;
	}

	public void setDoc_verify_date(Date doc_verify_date) {
		this.doc_verify_date = doc_verify_date;
	}

	public String getNego_status() {
		return nego_status;
	}

	public void setNego_status(String nego_status) {
		this.nego_status = nego_status;
	}

	public int getNego_uploadedBy() {
		return nego_uploadedBy;
	}

	public void setNego_uploadedBy(int nego_uploadedBy) {
		this.nego_uploadedBy = nego_uploadedBy;
	}

	public Date getNego_subdate() {
		return nego_subdate;
	}

	public void setNego_subdate(Date nego_subdate) {
		this.nego_subdate = nego_subdate;
	}

	public String getMgmt_status() {
		return mgmt_status;
	}

	public void setMgmt_status(String mgmt_status) {
		this.mgmt_status = mgmt_status;
	}

	public int getMgmt_uploadedBy() {
		return mgmt_uploadedBy;
	}

	public void setMgmt_uploadedBy(int mgmt_uploadedBy) {
		this.mgmt_uploadedBy = mgmt_uploadedBy;
	}

	public Date getMgmt_subdate() {
		return mgmt_subdate;
	}

	public void setMgmt_subdate(Date mgmt_subdate) {
		this.mgmt_subdate = mgmt_subdate;
	}

	
	    
	
	
}
