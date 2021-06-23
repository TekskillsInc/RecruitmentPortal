package com.recruitmentportal.DTO;

import java.util.Date;
import java.util.List;

import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.Tbl_RecPortal_candidateAttachments;


public class CandidateDTO {
	private CandidateInformation candidateInfo;
	private CandidateStatusDTO candidateStatus;
	private InterviewDetails interevieDetails; 
	private CandidateStatus candidateStatusObj;
	private String userName;
	private String company;
	private Integer sourcedBy;
	private Integer empl_lead;
	private String sctstatus;
	private Tbl_RecPortal_candidateAttachments candidateAttachements;
	private String clientAvaiableFromTime;
	private String clientAvaiableToTime;
	private String bdmStatus;
	private String sctSubmissionDate;
	private String tlName;
	
	public String getTlName() {
		return tlName;
	}
	public void setTlName(String tlName) {
		this.tlName = tlName;
	}
	public String getClientAvaiableFromTime() {
		return clientAvaiableFromTime;
	}
	public void setClientAvaiableFromTime(String clientAvaiableFromTime) {
		this.clientAvaiableFromTime = clientAvaiableFromTime;
	}
	public String getClientAvaiableToTime() {
		return clientAvaiableToTime;
	}
	public void setClientAvaiableToTime(String clientAvaiableToTime) {
		this.clientAvaiableToTime = clientAvaiableToTime;
	}
	
	public Tbl_RecPortal_candidateAttachments getCandidateAttachements() {
		return candidateAttachements;
	}
	public void setCandidateAttachements(Tbl_RecPortal_candidateAttachments candidateAttachements) {
		this.candidateAttachements = candidateAttachements;
	}
	public CandidateStatusDTO getCandidateStatus() {
		return candidateStatus;
	}
	public void setCandidateStatus(CandidateStatusDTO candidateStatus) {
		this.candidateStatus = candidateStatus;
	}
	public CandidateInformation getCandidateInfo() {
		return candidateInfo;
	}
	public void setCandidateInfo(CandidateInformation candidateInfo) {
		this.candidateInfo = candidateInfo;
	}
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public InterviewDetails getInterevieDetails() {
		return interevieDetails;
	}
	public void setInterevieDetails(InterviewDetails interevieDetails) {
		this.interevieDetails = interevieDetails;
	}
	public CandidateStatus getCandidateStatusObj() {
		return candidateStatusObj;
	}
	public void setCandidateStatusObj(CandidateStatus candidateStatusObj) {
		this.candidateStatusObj = candidateStatusObj;
	}
	public Integer getSourcedBy() {
		return sourcedBy;
	}
	public void setSourcedBy(Integer sourcedBy) {
		this.sourcedBy = sourcedBy;
	}
	public Integer getEmpl_lead() {
		return empl_lead;
	}
	public void setEmpl_lead(Integer empl_lead) {
		this.empl_lead = empl_lead;
	}
	public String getSctstatus() {
		return sctstatus;
	}
	public void setSctstatus(String sctstatus) {
		this.sctstatus = sctstatus;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
	public String getBdmStatus() {
		return bdmStatus;
	}
	public void setBdmStatus(String bdmStatus) {
		this.bdmStatus = bdmStatus;
	}
	public String getSctSubmissionDate() {
		return sctSubmissionDate;
	}
	public void setSctSubmissionDate(String sctSubmissionDate) {
		this.sctSubmissionDate = sctSubmissionDate;
	}
	
}
