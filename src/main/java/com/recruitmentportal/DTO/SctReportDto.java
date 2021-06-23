package com.recruitmentportal.DTO;

public class SctReportDto {
private Integer jobdescid;
private Integer createdby;
private String jdCategory;
private Integer tlEmpNo;
private String tlname;
private String bdname;
private String jobcode;
private String company;

public String getTlname() {
	return tlname;
}
public void setTlname(String tlname) {
	this.tlname = tlname;
}
public String getBdname() {
	return bdname;
}
public void setBdname(String bdname) {
	this.bdname = bdname;
}
public String getJobcode() {
	return jobcode;
}
public void setJobcode(String jobcode) {
	this.jobcode = jobcode;
}
public Integer getJobdescid() {
	return jobdescid;
}
public void setJobdescid(Integer jobdescid) {
	this.jobdescid = jobdescid;
}
public Integer getCreatedby() {
	return createdby;
}
public void setCreatedby(Integer createdby) {
	this.createdby = createdby;
}
public String getJdCategory() {
	return jdCategory;
}
public void setJdCategory(String jdCategory) {
	this.jdCategory = jdCategory;
}
public Integer getTlEmpNo() {
	return tlEmpNo;
}
public void setTlEmpNo(Integer tlEmpNo) {
	this.tlEmpNo = tlEmpNo;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
}
