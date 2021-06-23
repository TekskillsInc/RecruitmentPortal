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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="Tbl_RecPortal_InterviewDetails")
public class InterviewDetails implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tblpk")
	private Integer tblpk;
	
	@ManyToOne
	@JoinColumn(name="jobdescid")
	private Jobdescription jobDesc;
	
	@ManyToOne
	@JoinColumn(name="cnadidateid")
	private CandidateInformation candidate;
	
	@Column(name="modeofinterview")
	private String modeofinterview;
	
	@Column(name="interviewstatus")
	private String interviewstatus;
	
	@Column(name="clientinterview")
	private String clientinterview;
	
	@Column(name="interviewtype")
	private String interviewType;
	
	@Column(name="clIntMode")
	private String clIntMode;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="interviewdate")
	private Date interviewdate;
	
	@Temporal(TemporalType.TIMESTAMP)
	
	@Column(name="cliIntDate")
	private Date cliIntDate;
	
	public String getClIntMode() {
		return clIntMode;
	}

	public void setClIntMode(String clIntMode) {
		this.clIntMode = clIntMode;
	}

	public Date getCliIntDate() {
		return cliIntDate;
	}

	public void setCliIntDate(Date cliIntDate) {
		this.cliIntDate = cliIntDate;
	}

	
	
	public String getInterviewType() {
		return interviewType;
	}

	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}

	public String getClientinterview() {
		return clientinterview;
	}

	public void setClientinterview(String clientinterview) {
		this.clientinterview = clientinterview;
	}

	public String getInterviewstatus() {
		return interviewstatus;
	}

	public void setInterviewstatus(String interviewstatus) {
		this.interviewstatus = interviewstatus;
	}

	
	
	public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

	public Jobdescription getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(Jobdescription jobDesc) {
		this.jobDesc = jobDesc;
	}

	public CandidateInformation getCandidate() {
		return candidate;
	}

	public void setCandidate(CandidateInformation candidate) {
		this.candidate = candidate;
	}

	public String getModeofinterview() {
		return modeofinterview;
	}

	public void setModeofinterview(String modeofinterview) {
		this.modeofinterview = modeofinterview;
	}

	public Date getInterviewdate() {
		return interviewdate;
	}

	public void setInterviewdate(Date interviewdate2) {
		this.interviewdate = interviewdate2;
	}

	
}
