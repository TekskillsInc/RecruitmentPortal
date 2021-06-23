package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="Tbl_RecPortal_CandidateFeedBack")
public class CandidateFeedBack implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Fb_id")
	private Integer fb_id;
	
	@ManyToOne
	@JoinColumn(name = "candidateid")
	private CandidateInformation candidate;
	
	@Column(name="takenBy")
	private Integer takenby;
	
	@Column(name="comments")
	private String comments;
	
	@ManyToOne
	@JoinColumn(name = "jobid")
	private Jobdescription jobdesc;
	
	 @Column(name="timeofcall")
	 private Date timeofcall;
	
	 
	public Integer getFb_id() {
		return fb_id;
	}

	public void setFb_id(Integer fb_id) {
		this.fb_id = fb_id;
	}

	public CandidateInformation getCandidate() {
		return candidate;
	}

	public void setCandidate(CandidateInformation candidate) {
		this.candidate = candidate;
	}

	public Integer getTakenby() {
		return takenby;
	}

	public void setTakenby(Integer takenby) {
		this.takenby = takenby;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Jobdescription getJobdesc() {
		return jobdesc;
	}

	public void setJobdesc(Jobdescription jobdesc) {
		this.jobdesc = jobdesc;
	}

	public Date getTimeofcall() {
		return timeofcall;
	}

	public void setTimeofcall(Date timeofcall) {
		this.timeofcall = timeofcall;
	}

	

}
