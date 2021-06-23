package com.recruitmentportal.DTO;

public class ReportsOverview {
	
	private Integer totalReq;
	private Integer totalSub;
	private Integer totalCSelected;
	private Integer requirements;
	private Integer submitted;
	private Integer clientSelected;
	private String clientName;
	
	
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public Integer getTotalReq() {
		return totalReq;
	}
	public void setTotalReq(Integer totalReq) {
		this.totalReq = totalReq;
	}
	public Integer getTotalSub() {
		return totalSub;
	}
	public void setTotalSub(Integer totalSub) {
		this.totalSub = totalSub;
	}
	public Integer getTotalCSelected() {
		return totalCSelected;
	}
	public void setTotalCSelected(Integer totalCSelected) {
		this.totalCSelected = totalCSelected;
	}
	public Integer getRequirements() {
		return requirements;
	}
	public void setRequirements(Integer requirements) {
		this.requirements = requirements;
	}
	public Integer getSubmitted() {
		return submitted;
	}
	public void setSubmitted(Integer submitted) {
		this.submitted = submitted;
	}
	public Integer getClientSelected() {
		return clientSelected;
	}
	public void setClientSelected(Integer clientSelected) {
		this.clientSelected = clientSelected;
	}
	

}
