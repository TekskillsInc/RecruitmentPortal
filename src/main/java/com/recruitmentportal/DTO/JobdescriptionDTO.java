package com.recruitmentportal.DTO;

import com.recruitmentportal.entity.Jobdescription;
import com.recruitmentportal.entity.Tbl_RecPortal_tecpanelFeedBack;

public class JobdescriptionDTO {
	private Jobdescription jd;
	private String jobCode;
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}
	private String userName;
	private String assignedTl;
	private Tbl_RecPortal_tecpanelFeedBack tpfeedback;
	private String empStatus;
	private int count;
	
	
	public Jobdescription getJd() {
		return jd;
	}
	public void setJd(Jobdescription jd) {
		this.jd = jd;
	}
	public Tbl_RecPortal_tecpanelFeedBack getTpfeedback() {
		return tpfeedback;
	}
	public void setTpfeedback(Tbl_RecPortal_tecpanelFeedBack tpfeedback) {
		this.tpfeedback = tpfeedback;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmpStatus() {
		return empStatus;
	}
	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getAssignedTl() {
		return assignedTl;
	}
	public void setAssignedTl(String assignedTl) {
		this.assignedTl = assignedTl;
	}
	

}
