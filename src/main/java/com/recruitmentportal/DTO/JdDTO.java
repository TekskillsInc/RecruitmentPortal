package com.recruitmentportal.DTO;

import com.recruitmentportal.entity.Jobdescription;

public class JdDTO {
	private Jobdescription jobdesc;
	private String name;
	private String empStatus;
	public Jobdescription getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(Jobdescription jobdesc) {
		this.jobdesc = jobdesc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

}
