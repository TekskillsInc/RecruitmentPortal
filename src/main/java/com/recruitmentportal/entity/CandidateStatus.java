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
@Table(name = "Tbl_RecPortal_CandidateStatus")
public class CandidateStatus implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	   @GeneratedValue(strategy=GenerationType.IDENTITY)
	   @Column(name="tblpk")
	   private Integer tblpk;
	
	@ManyToOne
	@JoinColumn(name = "jobid")
	private Jobdescription jobdesc;
	
	@ManyToOne
	@JoinColumn(name = "candidateid", referencedColumnName = "candidateid")
	private CandidateInformation candidate;
	
	@Column(name="tlStatus")
	private String tlStatus;
	
	@Column(name="tlComment")
	private String tlComment;
	
	@Column(name="tlrejectedcomments")
	private String tlrejectedcomments;
	
	@Column(name="tlEmpNo")
	private Integer tlEmpNo;
	
	@Column(name="assignedTl")
	private Integer assignedTl;
	
	@Column(name="profilestatus")
	private String profilestatus;
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tlSubmitDate")
	private Date tlSubmitDate; 
	
	@Column(name="sctstatus")
	private String sctStatus;
	
	
	@Column(name="sctcomment")
	private String sctComment;
	
	@Column(name="sctempno")
	private Integer sctempno;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="sctsubmitdate")
	private Date sctSubmitDate; 
	
	@Column(name="tpStatus")
	private String tpStatus;
	
	@Column(name="tpComment")
	private String tpComment;
	
	@Column(name="tpEmpNo")
	private Integer tpEmpNo;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="tpSubmitDate")
	private Date tpSubmitDate; 
	
	@Column(name="recStatus")
	private String recStatus;
	
	@Column(name="recComment")
	private String recComment;
	
	@Column(name="recEmpNo")
	private Integer recEmpNo;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="recSubmitDate")
	private Date recSubmitDate;
	

	@Column(name="mgrStatus")
	private String mgrStatus;
	
	@Column(name="mgrComment")
	private String mgrComment;
	
	@Column(name="mgrEmpNo")
	private Integer mgrEmpNo;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="mgrSubmitDate")
	private Date mgrSubmitDate;
	
	@Column(name="bdmStatus")
	private String bdmStatus;
	
	@Column(name="bdmComment")
	private String bdmComment;
	
	@Column(name="bdmEmpNo")
	private Integer bdmEmpNo;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="bdmSubmitDate")
	private Date bdmSubmitDate;
	
	@Column(name="clientStatus")
	private String clientStatus;
	
	@Column(name="clientfeedback")
	private String clientComment;
	
	@Temporal(TemporalType.DATE)
	@Column(name="on_board_date")
	private Date onBoardDate;
	
	@Column(name="jdstatus")
	private String jdStatus;
	
	@Column(name="cli_rej_reason")
	private String rejectReason;
	
	@Column(name="comment_sct")
	private String comment_sct;
	
	public Date getClientresponsedate() {
		return clientresponsedate;
	}
	public void setClientresponsedate(Date clientresponsedate) {
		this.clientresponsedate = clientresponsedate;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="clientresponsedate")
	private Date clientresponsedate;
	
	
	
	public String getTlrejectedcomments() {
		return tlrejectedcomments;
	}
	public void setTlrejectedcomments(String tlrejectedcomments) {
		this.tlrejectedcomments = tlrejectedcomments;
	}
	public String getComment_sct() {
		return comment_sct;
	}
	public void setComment_sct(String comment_sct) {
		this.comment_sct = comment_sct;
	}
	public Date getOnBoardDate() {
		return onBoardDate;
	}
	public void setOnBoardDate(Date onBoardDate) {
		this.onBoardDate = onBoardDate;
	}
	public Integer getTblpk() {
		return tblpk;
	}
	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}
	public Jobdescription getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(Jobdescription jobdesc) {
		this.jobdesc = jobdesc;
	}
	
	public String getClientStatus() {
		return clientStatus;
	}
	public void setClientStatus(String clientStatus) {
		this.clientStatus = clientStatus;
	}
	public String getClientComment() {
		return clientComment;
	}
	public void setClientComment(String clientComment) {
		this.clientComment = clientComment;
	}
	public CandidateInformation getCandidate() {
		return candidate;
	}
	public void setCandidate(CandidateInformation candidate) {
		this.candidate = candidate;
	}
	public String getRecStatus() {
		return recStatus;
	}
	public void setRecStatus(String recStatus) {
		this.recStatus = recStatus;
	}
	public String getRecComment() {
		return recComment;
	}
	public void setRecComment(String recComment) {
		this.recComment = recComment;
	}
	public Integer getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(Integer recEmpNo) {
		this.recEmpNo = recEmpNo;
	}
	public Date getRecSubmitDate() {
		return recSubmitDate;
	}
	public void setRecSubmitDate(Date recSubmitDate) {
		this.recSubmitDate = recSubmitDate;
	}
	
	public String getTlStatus() {
		return tlStatus;
	}
	public void setTlStatus(String tlStatus) {
		this.tlStatus = tlStatus;
	}
	public String getTlComment() {
		return tlComment;
	}
	public void setTlComment(String tlComment) {
		this.tlComment = tlComment;
	}
	public Integer getTlEmpNo() {
		return tlEmpNo;
	}
	public void setTlEmpNo(Integer tlEmpNo) {
		this.tlEmpNo = tlEmpNo;
	}
	public Date getTlSubmitDate() {
		return tlSubmitDate;
	}
	public void setTlSubmitDate(Date tlSubmitDate) {
		this.tlSubmitDate = tlSubmitDate;
	}
	public String getTpStatus() {
		return tpStatus;
	}
	public void setTpStatus(String tpStatus) {
		this.tpStatus = tpStatus;
	}
	public String getTpComment() {
		return tpComment;
	}
	public void setTpComment(String tpComment) {
		this.tpComment = tpComment;
	}
	public Integer getTpEmpNo() {
		return tpEmpNo;
	}
	public void setTpEmpNo(Integer tpEmpNo) {
		this.tpEmpNo = tpEmpNo;
	}
	public Date getTpSubmitDate() {
		return tpSubmitDate;
	}
	public void setTpSubmitDate(Date tpSubmitDate) {
		this.tpSubmitDate = tpSubmitDate;
	}
	public String getMgrStatus() {
		return mgrStatus;
	}
	public void setMgrStatus(String mgrStatus) {
		this.mgrStatus = mgrStatus;
	}
	public String getMgrComment() {
		return mgrComment;
	}
	public void setMgrComment(String mgrComment) {
		this.mgrComment = mgrComment;
	}
	public Integer getMgrEmpNo() {
		return mgrEmpNo;
	}
	public void setMgrEmpNo(Integer mgrEmpNo) {
		this.mgrEmpNo = mgrEmpNo;
	}
	public Date getMgrSubmitDate() {
		return mgrSubmitDate;
	}
	public void setMgrSubmitDate(Date mgrSubmitDate) {
		this.mgrSubmitDate = mgrSubmitDate;
	}
	public String getBdmStatus() {
		return bdmStatus;
	}
	public void setBdmStatus(String bdmStatus) {
		this.bdmStatus = bdmStatus;
	}
	public String getBdmComment() {
		return bdmComment;
	}
	public void setBdmComment(String bdmComment) {
		this.bdmComment = bdmComment;
	}
	public Integer getBdmEmpNo() {
		return bdmEmpNo;
	}
	public void setBdmEmpNo(Integer bdmEmpNo) {
		this.bdmEmpNo = bdmEmpNo;
	}
	public Date getBdmSubmitDate() {
		return bdmSubmitDate;
	}
	public void setBdmSubmitDate(Date bdmSubmitDate) {
		this.bdmSubmitDate = bdmSubmitDate;
	}
	public String getJdStatus() {
		return jdStatus;
	}
	public void setJdStatus(String jdStatus) {
		this.jdStatus = jdStatus;
	}
	
	public String getSctStatus() {
		return sctStatus;
	}
	public void setSctStatus(String sctStatus) {
		this.sctStatus = sctStatus;
	}
	public String getSctComment() {
		return sctComment;
	}
	public void setSctComment(String sctComment) {
		this.sctComment = sctComment;
	}
	public Integer getSctempno() {
		return sctempno;
	}
	public void setSctempno(Integer sctempno) {
		this.sctempno = sctempno;
	}
	public Date getSctSubmitDate() {
		return sctSubmitDate;
	}
	public void setSctSubmitDate(Date sctSubmitDate) {
		this.sctSubmitDate = sctSubmitDate;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public Integer getAssignedTl() {
		return assignedTl;
	}
	public void setAssignedTl(Integer assignedTl) {
		this.assignedTl = assignedTl;
	}
	public String getProfilestatus() {
		return profilestatus;
	}
	public void setProfilestatus(String profilestatus) {
		this.profilestatus = profilestatus;
	}
	
	
	
}
