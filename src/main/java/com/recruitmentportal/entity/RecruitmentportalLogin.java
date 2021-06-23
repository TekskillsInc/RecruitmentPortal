package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="Tbl_RecPortal_RecruitmentportalLogin")
public class RecruitmentportalLogin implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
    @Column(name="tblpk")
	private Integer tblpk;
    
    @Column(name="UserName")
	private String userName;
    
    @Column(name="Pwd")
	private String pwd;
    
    @Column(name="employee_role")
   	private String employee_role;
    
    @Temporal(TemporalType.DATE)
    @Column(name="createddate")
   	private Date createdDate;
    
    @Temporal(TemporalType.DATE)
    @Column(name="updatedDate")
   	private Date updatedDate;
    
    @Column(name="emp_number")
   	private Integer emp_number;
    
    @Column(name="email")
   	private String email;
    
    @Column(name="emp_lead")
   	private Integer emp_lead;
    
    @Column(name="employee_status")
    private String empStatus;
    
    @ManyToOne
	@JoinColumn(name = "dept_ID", referencedColumnName = "dept_ID")
   	private DepartmentTable department;

	public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	

	public String getEmployee_role() {
		return employee_role;
	}

	public void setEmployee_role(String employee_role) {
		this.employee_role = employee_role;
	}

	public Integer getEmp_number() {
		return emp_number;
	}

	public void setEmp_number(Integer emp_number) {
		this.emp_number = emp_number;
	}

	public DepartmentTable getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentTable department) {
		this.department = department;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Integer getEmp_lead() {
		return emp_lead;
	}

	public void setEmp_lead(Integer emp_lead) {
		this.emp_lead = emp_lead;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}
    

}
