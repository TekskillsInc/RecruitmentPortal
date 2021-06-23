package com.recruitmentportal.DTO;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MainReport {
	private Integer jobDescId;
	private String client;
	private String type;
	private String account;
	private String bdm;
	private String sender;
	private String priority;
	private String requirement;
	private String technology;
	private Integer positions;
	private String locations;
	private String req_lable;
	private Date recievedTime;
	private String jdCategory;
	private Date bdmAssignedON;
	private Date mgrAssignedON;
	private Date tlAssignedON;
	private String rec;
	private String consultant;
	private String consultantContNo;
	private Date time;
	private String toLeads;
	private String p_status;
	private String sctTeam;
	private String sctStatus;
	private Date sctReceTime;
	private Date sctRespTime;
	private Date profileSubTime;
	private Integer profileNo;
	private String submittedTo;
	private String candidateStatus;
	private String requirementStatus;
	private String interviewStatus;
	private Date interviewDate;
	private String rejectReason;
	private Date onboardingDate;
	private String comment;
	private String assignedTo;
	private String mgrName;
	private String tlName;
	
	List<JaDTO> jaDto=new ArrayList<>();
	public List<JaDTO> getJaDto() {
		return jaDto;
	}
	public void setJaDto(List<JaDTO> jaDto) {
		this.jaDto = jaDto;
	}

	public String getTlName() {
		return tlName;
	}
	public void setTlName(String tlName) {
		this.tlName = tlName;
	}
	public Date getBdmAssignedON() {
		return bdmAssignedON;
	}
	public void setBdmAssignedON(Date bdmAssignedON) {
		this.bdmAssignedON = bdmAssignedON;
	}
	public Date getMgrAssignedON() {
		return mgrAssignedON;
	}
	public void setMgrAssignedON(Date mgrAssignedON) {
		this.mgrAssignedON = mgrAssignedON;
	}
	public Date getTlAssignedON() {
		return tlAssignedON;
	}
	public void setTlAssignedON(Date tlAssignedON) {
		this.tlAssignedON = tlAssignedON;
	}

	
	
	public Integer getJobDescId() {
		return jobDescId;
	}
	public void setJobDescId(Integer jobDescId) {
		this.jobDescId = jobDescId;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String clientName) {
		this.client = clientName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getBdm() {
		return bdm;
	}
	public void setBdm(String bdm2) {
		this.bdm = bdm2;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getRequirement() {
		return requirement;
	}
	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}
	public String getTechnology() {
		return technology;
	}
	public void setTechnology(String technology) {
		this.technology = technology;
	}
	public Integer getPositions() {
		return positions;
	}
	public void setPositions(Integer positions) {
		this.positions = positions;
	}
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
	}
	public String getReq_lable() {
		return req_lable;
	}
	public void setReq_lable(String req_lable) {
		this.req_lable = req_lable;
	}
	public Date getRecievedTime() {
		return recievedTime;
	}
	public void setRecievedTime(Date recievedTime2) {
		this.recievedTime = recievedTime2;
	}
	public String getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}
	
	public String getRec() {
		return rec;
	}
	public void setRec(String rec) {
		this.rec = rec;
	}
	public String getConsultant() {
		return consultant;
	}
	public void setConsultant(String consultant) {
		this.consultant = consultant;
	}
	public String getConsultantContNo() {
		return consultantContNo;
	}
	public void setConsultantContNo(String consultantContNo) {
		this.consultantContNo = consultantContNo;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date recSubTime) {
		this.time =  recSubTime;
	}
	public String getToLeads() {
		return toLeads;
	}
	public void setToLeads(String toLeads) {
		this.toLeads = toLeads;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public String getSctTeam() {
		return sctTeam;
	}
	public void setSctTeam(String sctTeam) {
		this.sctTeam = sctTeam;
	}
	public String getSctStatus() {
		return sctStatus;
	}
	public void setSctStatus(String sctStatus) {
		this.sctStatus = sctStatus;
	}
	public Date getSctReceTime() {
		return sctReceTime;
	}
	public void setSctReceTime(Date sctReceTime) {
		this.sctReceTime = sctReceTime;
	}
	public Date getSctRespTime() {
		return sctRespTime;
	}
	public void setSctRespTime(Date sctRespTime) {
		this.sctRespTime = sctRespTime;
	}
	public Date getProfileSubTime() {
		return profileSubTime;
	}
	public void setProfileSubTime(Date profileSubTime) {
		this.profileSubTime = profileSubTime;
	}
	public Integer getProfileNo() {
		return profileNo;
	}
	public void setProfileNo(Integer profileNo) {
		this.profileNo = profileNo;
	}
	public String getSubmittedTo() {
		return submittedTo;
	}
	public void setSubmittedTo(String submittedTo) {
		this.submittedTo = submittedTo;
	}
	public String getCandidateStatus() {
		return candidateStatus;
	}
	public void setCandidateStatus(String candidateStatus) {
		this.candidateStatus = candidateStatus;
	}
	public String getRequirementStatus() {
		return requirementStatus;
	}
	public void setRequirementStatus(String requirementStatus) {
		this.requirementStatus = requirementStatus;
	}
	public String getInterviewStatus() {
		return interviewStatus;
	}
	public void setInterviewStatus(String interviewStatus) {
		this.interviewStatus = interviewStatus;
	}
	public Date getInterviewDate() {
		return interviewDate;
	}
	public void setInterviewDate(Date interviewDate2) {
		this.interviewDate = interviewDate2;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	public Date getOnboardingDate() {
		return onboardingDate;
	}
	public void setOnboardingDate(Date onboardingDate) {
		this.onboardingDate = onboardingDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getJdCategory() {
		return jdCategory;
	}
	public void setJdCategory(String jdCategory) {
		this.jdCategory = jdCategory;
	}
	
	
	
	
	

}
