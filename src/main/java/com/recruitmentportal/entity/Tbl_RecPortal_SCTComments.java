package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "Tbl_RecPortal_SCTComments")
public class Tbl_RecPortal_SCTComments implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="sctid")
    private Integer sctid;
	@ManyToOne
	@JoinColumn(name = "jobdescid")
	private Jobdescription jobid;
	
	@ManyToOne
	@JoinColumn(name = "candidateid", referencedColumnName = "candidateid")
	private CandidateInformation canid;
	
	@Column(name="comment_sct")
	private String comment_sct;
	
	
	//@Temporal(TemporalType.DATE)
	@Column(name="submitdate")
	private String submitdate;
	
	public String getSubmitdate() {
		return submitdate;
	}

	public void setSubmitdate(String submitdate) {
		this.submitdate = submitdate;
	}

	public Jobdescription getJobid() {
		return jobid;
	}

	public void setJobid(Jobdescription jobid) {
		this.jobid = jobid;
	}

	public CandidateInformation getCanid() {
		return canid;
	}

	public void setCanid(CandidateInformation canid) {
		this.canid = canid;
	}

	
	
	public Integer getSctid() {
		return sctid;
	}

	public void setSctid(Integer sctid) {
		this.sctid = sctid;
	}

	
	public String getComment_sct() {
		return comment_sct;
	}

	public void setComment_sct(String comment_sct) {
		this.comment_sct = comment_sct;
	}



	
	
}
