package com.recruitmentportal.DTO;

import java.sql.Date;

public class TLDAshboardCountDTO {
	private String tlname;
	private String recname;
	private int recruitercount;
	private int sctclearedCount;
	private int recruiterSubmiitedCount;
	private int clientstatus;
	private Integer recEmpno;
	private int tlclearedCount;
	private int clientclearedCount;
	private int tlemp;
	private Integer tlEmpno;
	private String fromdate;
	private String todate;
	private String bdname;
	private String catname; 
	private String jobcode;
	private String clientname;
	private String sctsubdate;
	
	public int getTlemp() {
		return tlemp;
	}
	public void setTlemp(int tlemp) {
		this.tlemp = tlemp;
	}
	public int getTlclearedCount() {
		return tlclearedCount;
	}
	public void setTlclearedCount(int tlclearedCount) {
		this.tlclearedCount = tlclearedCount;
	}
	public int getClientclearedCount() {
		return clientclearedCount;
	}
	public void setClientclearedCount(int clientclearedCount) {
		this.clientclearedCount = clientclearedCount;
	}

	
	
	
	public Integer getRecEmpno() {
		return recEmpno;
	}
	public void setRecEmpno(Integer recEmpno) {
		this.recEmpno = recEmpno;
	}
	public Integer getTlEmpno() {
		return tlEmpno;
	}
	public void setTlEmpno(Integer tlEmpno) {
		this.tlEmpno = tlEmpno;
	}
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
	
	
	
	public int getClientstatus() {
		return clientstatus;
	}
	public void setClientstatus(int clientstatus) {
		this.clientstatus = clientstatus;
	}
	public String getRecname() {
		return recname;
	}
	public void setRecname(String recname) {
		this.recname = recname;
	}
	public String getTlname() {
		return tlname;
	}
	public void setTlname(String tlname) {
		this.tlname = tlname;
	}
	public int getRecruitercount() {
		return recruitercount;
	}
	public void setRecruitercount(int recruitercount) {
		this.recruitercount = recruitercount;
	}
	public int getSctclearedCount() {
		return sctclearedCount;
	}
	public void setSctclearedCount(int sctclearedCount) {
		this.sctclearedCount = sctclearedCount;
	}
	public int getRecruiterSubmiitedCount() {
		return recruiterSubmiitedCount;
	}
	public void setRecruiterSubmiitedCount(int recruiterSubmiitedCount) {
		this.recruiterSubmiitedCount = recruiterSubmiitedCount;
	}
	public String getBdname() {
		return bdname;
	}
	public void setBdname(String bdname) {
		this.bdname = bdname;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public String getJobcode() {
		return jobcode;
	}
	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}
	public String getSctsubdate() {
		return sctsubdate;
	}
	public void setSctsubdate(String sctsubdate) {
		this.sctsubdate = sctsubdate;
	}

}
