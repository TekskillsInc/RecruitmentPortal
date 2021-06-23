package com.recruitmentportal.DTO;

public class ViewUserProfilesSCTStatusDTO {
	private String clientname;
	private Integer jobid;
	private String bdname;
	private String jobdesc;
	private String jobCodeID;
	private String jdCategory;
	private String skill;
	
	private String recname;
	private String tlname;
	private String tlcomments;
	private String tlstatus;
	private String sctstatus;
	private String sctcomments;
	private String sctClearedDate;
	private String bdcomments;
	private String bdstatus;
	private String clientstatus;
	
	
	private Integer candidateId;
	private String contactno;
	private String candidatename;
	private String clientinterviewstatus;
	private Integer   tlempno;
	private Integer  recempno;
	private Integer  bdmempno;
	private String modofinterview;
	private String intrvdate;

	
	
	
	

	
	/*
	 * private InterviewDetails interevieDetails; private CandidateStatusDTO
	 * candidateStatus; private CandidateStatus candidateStatusObj; private
	 * CandidateInformation candidateInfo;
	 */
	public String getJobCodeID() {
		return jobCodeID;
	}
	public void setJobCodeID(String jobCodeID) {
		this.jobCodeID = jobCodeID;
	}
	

	
	public String getTlname() {
		return tlname;
	}
	public void setTlname(String tlname) {
		this.tlname = tlname;
	}
	
	
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getModofinterview() {
		return modofinterview;
	}
	public void setModofinterview(String modofinterview) {
		this.modofinterview = modofinterview;
	}
	
	
	
	public String getBdcomments() {
		return bdcomments;
	}
	public void setBdcomments(String bdcomments) {
		this.bdcomments = bdcomments;
	}
	public String getTlcomments() {
		return tlcomments;
	}
	public void setTlcomments(String tlcomments) {
		this.tlcomments = tlcomments;
	}
	
	
	
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}
	public String getBdname() {
		return bdname;
	}
	public void setBdname(String bdname) {
		this.bdname = bdname;
	}
	public String getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(String jobdesc) {
		this.jobdesc = jobdesc;
	}
	public String getSctstatus() {
		return sctstatus;
	}
	public void setSctstatus(String sctstatus) {
		this.sctstatus = sctstatus;
	}
	public String getSctcomments() {
		return sctcomments;
	}
	public void setSctcomments(String sctcomments) {
		this.sctcomments = sctcomments;
	}
	public String getRecname() {
		return recname;
	}
	public void setRecname(String recname) {
		this.recname = recname;
	}
	
	public String getIntrvdate() {
		return intrvdate;
	}
	public void setIntrvdate(String intrvdate) {
		this.intrvdate = intrvdate;
	}
	public Integer getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(Integer candidateId) {
		this.candidateId = candidateId;
	}
	public String getTlstatus() {
		return tlstatus;
	}
	public void setTlstatus(String tlstatus) {
		this.tlstatus = tlstatus;
	}
	public String getJdCategory() {
		return jdCategory;
	}
	public void setJdCategory(String jdCategory) {
		this.jdCategory = jdCategory;
	}
	public String getSctClearedDate() {
		return sctClearedDate;
	}
	public void setSctClearedDate(String sctClearedDate) {
		this.sctClearedDate = sctClearedDate;
	}
	public String getBdstatus() {
		return bdstatus;
	}
	public void setBdstatus(String bdstatus) {
		this.bdstatus = bdstatus;
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getCandidatename() {
		return candidatename;
	}
	public void setCandidatename(String candidatename) {
		this.candidatename = candidatename;
	}
	public String getClientstatus() {
		return clientstatus;
	}
	public void setClientstatus(String clientstatus) {
		this.clientstatus = clientstatus;
	}
	public String getClientinterviewstatus() {
		return clientinterviewstatus;
	}
	public void setClientinterviewstatus(String clientinterviewstatus) {
		this.clientinterviewstatus = clientinterviewstatus;
	}
	public Integer getTlempno() {
		return tlempno;
	}
	public void setTlempno(Integer tlempno) {
		this.tlempno = tlempno;
	}
	public Integer getRecempno() {
		return recempno;
	}
	public void setRecempno(Integer recempno) {
		this.recempno = recempno;
	}
	public Integer getBdmempno() {
		return bdmempno;
	}
	public void setBdmempno(Integer bdmempno) {
		this.bdmempno = bdmempno;
	}
}
