package com.recruitmentportal.DTO;

import java.sql.Timestamp;

public class AllocationInfoDTO {
	public Integer jobdescid;
	public Integer bdEmpNo;
	public Integer tlEmpNo;
	public Integer recEmpNo;
	public Timestamp bdAssignedDate;
	public Timestamp tlAssignedDate;
	
	
	public Integer getJobdescid() {
		return jobdescid;
	}
	public void setJobdescid(Integer jobdescid) {
		this.jobdescid = jobdescid;
	}
	public Integer getBdEmpNo() {
		return bdEmpNo;
	}
	public void setBdEmpNo(Integer bdEmpNo) {
		this.bdEmpNo = bdEmpNo;
	}
	public Integer getTlEmpNo() {
		return tlEmpNo;
	}
	public void setTlEmpNo(Integer tlEmpNo) {
		this.tlEmpNo = tlEmpNo;
	}
	public Integer getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(Integer recEmpNo) {
		this.recEmpNo = recEmpNo;
	}
	public Timestamp getBdAssignedDate() {
		return bdAssignedDate;
	}
	public void setBdAssignedDate(Timestamp bdAssignedDate) {
		this.bdAssignedDate = bdAssignedDate;
	}
	public Timestamp getTlAssignedDate() {
		return tlAssignedDate;
	}
	public void setTlAssignedDate(Timestamp tlAssignedDate) {
		this.tlAssignedDate = tlAssignedDate;
	}
	
	

}
