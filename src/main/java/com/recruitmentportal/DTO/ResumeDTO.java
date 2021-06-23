package com.recruitmentportal.DTO;

import java.util.Date;

import javax.mail.search.DateTerm;

import org.apache.log4j.helpers.DateTimeDateFormat;

public class ResumeDTO {
	
	String resumeName;
	String resumeData;
	String first_name;
	String contact_number;
	String altcnt_number;
	String emailID;
	Date dob;
	String basic_qualification;
	String highest_qualification;
	String primaryskill;
	String total_experience;
	String relevantExp;
	String candDesignation;
	String currentCTC;
	String expectedCTC;
	String noticeperiod;
	String workLocation;
	String userName;
	Integer recempno;
	Integer candidateid;
	Date rectrsubdate;
	String recName;
	String jobcode;
	UserDTO userDto;
	
	
	
	public UserDTO getUserDto() {
		return userDto;
	}
	public void setUserDto(UserDTO userDto) {
		this.userDto = userDto;
	}
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public Date getRectrsubdate() {
		return rectrsubdate;
	}
	public void setRectrsubdate(Date rectrsubdate) {
		this.rectrsubdate = rectrsubdate;
	}
	public Integer getCandidateid() {
		return candidateid;
	}
	public void setCandidateid(Integer candidateid) {
		this.candidateid = candidateid;
	}
	public Integer getRecempno() {
		return recempno;
	}
	public void setRecempno(Integer recempno) {
		this.recempno = recempno;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getResumeName() {
		return resumeName;
	}
	public void setResumeName(String resumeName) {
		this.resumeName = resumeName;
	}
	public String getResumeData() {
		return resumeData;
	}
	public void setResumeData(String resumeData) {
		this.resumeData = resumeData;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getAltcnt_number() {
		return altcnt_number;
	}
	public void setAltcnt_number(String altcnt_number) {
		this.altcnt_number = altcnt_number;
	}
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getBasic_qualification() {
		return basic_qualification;
	}
	public void setBasic_qualification(String basic_qualification) {
		this.basic_qualification = basic_qualification;
	}
	public String getHighest_qualification() {
		return highest_qualification;
	}
	public void setHighest_qualification(String highest_qualification) {
		this.highest_qualification = highest_qualification;
	}
	public String getPrimaryskill() {
		return primaryskill;
	}
	public void setPrimaryskill(String primaryskill) {
		this.primaryskill = primaryskill;
	}
	public String getTotal_experience() {
		return total_experience;
	}
	public void setTotal_experience(String total_experience) {
		this.total_experience = total_experience;
	}
	public String getRelevantExp() {
		return relevantExp;
	}
	public void setRelevantExp(String relevantExp) {
		this.relevantExp = relevantExp;
	}
	public String getCandDesignation() {
		return candDesignation;
	}
	public void setCandDesignation(String candDesignation) {
		this.candDesignation = candDesignation;
	}
	public String getCurrentCTC() {
		return currentCTC;
	}
	public void setCurrentCTC(String currentCTC) {
		this.currentCTC = currentCTC;
	}
	public String getExpectedCTC() {
		return expectedCTC;
	}
	public void setExpectedCTC(String expectedCTC) {
		this.expectedCTC = expectedCTC;
	}
	public String getNoticeperiod() {
		return noticeperiod;
	}
	public void setNoticeperiod(String noticeperiod) {
		this.noticeperiod = noticeperiod;
	}
	public String getWorkLocation() {
		return workLocation;
	}
	public void setWorkLocation(String workLocation) {
		this.workLocation = workLocation;
	}
	
}
