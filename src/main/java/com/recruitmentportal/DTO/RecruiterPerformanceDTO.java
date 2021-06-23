package com.recruitmentportal.DTO;

public class RecruiterPerformanceDTO {
	private Integer jobid;
	private String jobcode;
	private String client;
	private int recsub;
	private int sctCleared;
	private int clientCleared;
	private String companyname;
	private String tlName;
	private String recName;
	private String fromdate;
	private String todate;
	
	
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public int getRecsub() {
		return recsub;
	}
	public void setRecsub(int recsub) {
		this.recsub = recsub;
	}
	public int getSctCleared() {
		return sctCleared;
	}
	public void setSctCleared(int sctCleared) {
		this.sctCleared = sctCleared;
	}
	public int getClientCleared() {
		return clientCleared;
	}
	public void setClientCleared(int clientCleared) {
		this.clientCleared = clientCleared;
	}
	public String getTlName() {
		return tlName;
	}
	public void setTlName(String tlName) {
		this.tlName = tlName;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	
	

}
