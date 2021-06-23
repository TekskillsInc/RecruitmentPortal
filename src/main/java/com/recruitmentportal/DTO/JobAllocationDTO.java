package com.recruitmentportal.DTO;

public class JobAllocationDTO {
	private Integer jdID;
	private String jobDescription;
	private int istp;
	private int createdby;
	private int assignedBy;
	private String cmpny_name;
	private String empStatus;
	private String jdCategory;
	private String jobCode;

	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	public Integer getJdID() {
		return jdID;
	}
	public void setJdID(Integer jdID) {
		this.jdID = jdID;
	}

	public int getIstp() {
		return istp;
	}

	public void setIstp(int istp) {
		this.istp = istp;
	}
	
	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public int getCreatedby() {
		return createdby;
	}

	public void setCreatedby(int createdby) {
		this.createdby = createdby;
	}

	public String getCmpny_name() {
		return cmpny_name;
	}

	public void setCmpny_name(String cmpny_name) {
		this.cmpny_name = cmpny_name;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public String getJdCategory() {
		return jdCategory;
	}
	public void setJdCategory(String jdCategory) {
		this.jdCategory = jdCategory;
	}
	public int getAssignedBy() {
		return assignedBy;
	}
	public void setAssignedBy(int assignedBy) {
		this.assignedBy = assignedBy;
	}
	

}
