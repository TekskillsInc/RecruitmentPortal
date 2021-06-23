package com.recruitmentportal.DTO;

import java.util.Date;

public class JaDTO {
	private Integer jobid;
	private Integer recEmpNo;
	private Integer tlEmpNo;
	private String assignedTo;
	private Date tlAssignedON;
	private String mgrName;
	private Date bdmAssignedON;
	private String tlName;
	private Date mgrAssignedON;
	
	
	public String getAssignedTo() {
		return assignedTo;
	}
	
	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}
	public String getMgrName() {
		return mgrName;
	}
	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}
	public Date getTlAssignedON() {
		return tlAssignedON;
	}
	public void setTlAssignedON(Date tlAssignedON) {
		this.tlAssignedON = tlAssignedON;
	}
	public Date getBdmAssignedON() {
		return bdmAssignedON;
	}
	public void setBdmAssignedON(Date bdmAssignedON) {
		this.bdmAssignedON = bdmAssignedON;
	}
	public String getTlName() {
		return tlName;
	}
	public void setTlName(String tlName) {
		this.tlName = tlName;
	}
	public Date getMgrAssignedON() {
		return mgrAssignedON;
	}
	public void setMgrAssignedON(Date mgrAssignedON) {
		this.mgrAssignedON = mgrAssignedON;
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public Integer getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(Integer recEmpNo) {
		this.recEmpNo = recEmpNo;
	}

	public Integer getTlEmpNo() {
		return tlEmpNo;
	}

	public void setTlEmpNo(Integer tlEmpNo) {
		this.tlEmpNo = tlEmpNo;
	}
	
}
