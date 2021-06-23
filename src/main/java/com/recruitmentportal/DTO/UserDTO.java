package com.recruitmentportal.DTO;

import java.util.Date;

import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.Users;

public class UserDTO {
private String userName;
private Integer emp_number;
private Integer deptId;
private String email;
private String pwd;
private String depertment;
private String empStatus;
private Integer emp_lead;
private String leadName;
private String empRole;
private String fullname;
private Date date;


public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public Integer getEmp_number() {
	return emp_number;
}
public void setEmp_number(Integer emp_number) {
	this.emp_number = emp_number;
}
public Integer getDeptId() {
	return deptId;
}
public void setDeptId(Integer deptId) {
	this.deptId = deptId;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}

public Integer getEmp_lead() {
	return emp_lead;
}
public void setEmp_lead(Integer emp_lead) {
	this.emp_lead = emp_lead;
}
public String getEmpRole() {
	return empRole;
}
public void setEmpRole(String empRole) {
	this.empRole = empRole;
}
public String getLeadName() {
	return leadName;
}
public void setLeadName(String leadName) {
	this.leadName = leadName;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getDepertment() {
	return depertment;
}
public void setDepertment(String depertment) {
	this.depertment = depertment;
}
public String getEmpStatus() {
	return empStatus;
}
public void setEmpStatus(String empStatus) {
	this.empStatus = empStatus;
}
public String getFullname() {
	return fullname;
}
public void setFullname(String fullname) {
	this.fullname = fullname;
}

}
