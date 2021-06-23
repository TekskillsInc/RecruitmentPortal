package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="TBL_ATTENDANCE_USERS")
public class Users implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
    @Column(name="UserID")
	private Integer UserID;
    
    @Column(name="UserName")
	private String userName;
    
    @Column(name="Pwd")
	private String pwd;
    
    @Column(name="FullName")
	private String fullName;
    
    @Column(name="Address")
	private String Address;
    
    @Column(name="BarCodeNo")
	private Integer BarCodeNo;
    
    @Column(name="Email")
	private String Email;
    
    @Column(name="ContactNo")
	private String ContactNo;
    
    @Column(name="ISNightShift")
	private Integer ISNightShift;
    
    @Column(name="JoiningDate")
	private Date JoiningDate;
    
    @Column(name="PostedBy")
	private Integer PostedBy;
    
    @Column(name="Timings")
	private String Timings;
    
    @Column(name="Status")
	private Integer Status;
    
    @Column(name="Disabled")
	private Integer Disabled;
    
    @Column(name="recrutier_name")
	private String recrutier_name;
    
    @Column(name="hr_name")
	private String hr_name;
    
    @Column(name="fathers_name")
	private String fathers_name;
    
    @Column(name="blood_group")
	private String blood_group;
    
    @Column(name="dob")
	private String dob;
    
    @Column(name="designation")
	private String designation;
    
    @Column(name="dept_id")
	private Integer dept_id;
    
    @Column(name="emp_type")
	private String emp_type;
    
    @Column(name="employee_role")
	private String employee_role;
    
    @Column(name="emp_billing")
	private String emp_billing;
    
    @Column(name="bill_period")
	private String bill_period;
    
    @Column(name="passport")
	private String passport;
    
    @Column(name="bond_period")
	private Integer bond_period;
    
    @Column(name="variable_pay")
	private String variable_pay;
    
    @Column(name="bd_name")
	private String bd_name;
    
    @Column(name="pan_no")
	private String pan_no;
    
    @Column(name="pf_no")
	private String pf_no;
    
    @Column(name="remarks")
	private String remarks;
    
    @Column(name="submit_date")
	private String submit_date;
    
    @Column(name="emp_number")
	private Integer emp_number;
    
    
    
	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
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
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		fullName = fullName;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public Integer getBarCodeNo() {
		return BarCodeNo;
	}
	public void setBarCodeNo(Integer barCodeNo) {
		BarCodeNo = barCodeNo;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	public Integer getISNightShift() {
		return ISNightShift;
	}
	public void setISNightShift(Integer iSNightShift) {
		ISNightShift = iSNightShift;
	}
	public Date getJoiningDate() {
		return JoiningDate;
	}
	public void setJoiningDate(Date joiningDate) {
		JoiningDate = joiningDate;
	}
	public Integer getPostedBy() {
		return PostedBy;
	}
	public void setPostedBy(Integer postedBy) {
		PostedBy = postedBy;
	}
	public String getTimings() {
		return Timings;
	}
	public void setTimings(String timings) {
		Timings = timings;
	}
	public Integer getStatus() {
		return Status;
	}
	public void setStatus(Integer status) {
		Status = status;
	}
	public Integer getDisabled() {
		return Disabled;
	}
	public void setDisabled(Integer disabled) {
		Disabled = disabled;
	}
	public String getRecrutier_name() {
		return recrutier_name;
	}
	public void setRecrutier_name(String recrutier_name) {
		this.recrutier_name = recrutier_name;
	}
	public String getHr_name() {
		return hr_name;
	}
	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}
	public String getFathers_name() {
		return fathers_name;
	}
	public void setFathers_name(String fathers_name) {
		this.fathers_name = fathers_name;
	}
	public String getBlood_group() {
		return blood_group;
	}
	public void setBlood_group(String blood_group) {
		this.blood_group = blood_group;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Integer getDept_id() {
		return dept_id;
	}
	public void setDept_id(Integer dept_id) {
		this.dept_id = dept_id;
	}
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getEmployee_role() {
		return employee_role;
	}
	public void setEmployee_role(String employee_role) {
		this.employee_role = employee_role;
	}
	public String getEmp_billing() {
		return emp_billing;
	}
	public void setEmp_billing(String emp_billing) {
		this.emp_billing = emp_billing;
	}
	public String getBill_period() {
		return bill_period;
	}
	public void setBill_period(String bill_period) {
		this.bill_period = bill_period;
	}
	public String getPassport() {
		return passport;
	}
	public void setPassport(String passport) {
		this.passport = passport;
	}
	public Integer getBond_period() {
		return bond_period;
	}
	public void setBond_period(Integer bond_period) {
		this.bond_period = bond_period;
	}
	public String getVariable_pay() {
		return variable_pay;
	}
	public void setVariable_pay(String variable_pay) {
		this.variable_pay = variable_pay;
	}
	public String getBd_name() {
		return bd_name;
	}
	public void setBd_name(String bd_name) {
		this.bd_name = bd_name;
	}
	public String getPan_no() {
		return pan_no;
	}
	public void setPan_no(String pan_no) {
		this.pan_no = pan_no;
	}
	public String getPf_no() {
		return pf_no;
	}
	public void setPf_no(String pf_no) {
		this.pf_no = pf_no;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSubmit_date() {
		return submit_date;
	}
	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}
	public Integer getEmp_number() {
		return emp_number;
	}
	public void setEmp_number(Integer emp_number) {
		this.emp_number = emp_number;
	}
	
	
	
	
	
	
	
}
