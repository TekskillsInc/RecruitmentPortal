package com.recruitmentportal.DTO;

public class CandidateInfoDTO {
	
	private Integer candidateId;
	private Integer jobId;
	private Integer recEmpNo;
	private String fName;
	private String lName;
	
	
	
	
	
	public String getFName() {
		return fName;
	}
	public void setFName(String fName) {
		this.fName = fName;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	private String contactNo;
	
	
	public Integer getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(Integer candidateId) {
		this.candidateId = candidateId;
	}
	public Integer getJobId() {
		return jobId;
	}
	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}
	public Integer getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(Integer recEmpNo) {
		this.recEmpNo = recEmpNo;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	

}
