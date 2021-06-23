package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Tbl_RecPortal_Jobdescription")
public class Jobdescription implements Serializable {
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "jobdescid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer jobdescid;

	@Column(name = "jobCode")
	private String jobCode;

	@Column(name = "jobDescription")
	private String jobDescription;

	@Column(name = "jd_category")
	private String jdCategory;
	
/*	@Column(name = "isFulltime")
	private String isFulltime;
	
	public String getIsFulltime() {
		return isFulltime;
	}

	public void setIsFulltime(String isFulltime) {
		this.isFulltime = isFulltime;
	}*/

	public String getJdCategory() {
		return jdCategory;
	}

	public void setJdCategory(String jdCategory) {
		this.jdCategory = jdCategory;
	}

	@Column(name = "allocated_buget")
	private String allocatedBudget;

	public String getAttachmentname() {
		return attachmentname;
	}

	public void setAttachmentname(String attachmentname) {
		this.attachmentname = attachmentname;
	}

	@Column(name = "attachmentname")
	private String attachmentname;

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	@Column(name = "flag")
	private Integer flag;

	@Column(name = "no_of_positions")
	private int no_of_positions;

	@Temporal(TemporalType.DATE)
	@Column(name = "posEndDate")
	private Date posEndDate;

	@Column(name = "jobstatus")
	private String jobstatus;

	@Column(name = "priority")
	private String jdPriority;

	@Column(name = "joblabel")
	private String joblabel;

	public String getJoblabel() {
		return joblabel;
	}

	public void setJoblabel(String joblabel) {
		this.joblabel = joblabel;
	}
	 @Temporal(TemporalType.DATE)
     @Column(name = "jdcloseddate")
     private Date jdcloseddate;


	public Date getJdcloseddate() {
		return jdcloseddate;
	}

	public void setJdcloseddate(Date jdcloseddate) {
		this.jdcloseddate = jdcloseddate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createdDate")
	private Date createdDate;

	@Column(name = "createdby")
	private Integer createdby;

	@Column(name = "acc_name")
	private String acc_name;

	@Column(name = "segment")
	private String segment;

	@Column(name = "External_Internal")
	private String external_internal;

	@Column(name = "jobDescGiven")
	private String jobDescGiven;

	@Column(name = "technology")
	private String technology;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "jobrecieved_time")
	private Date jobrecieved_time;

	public Date getJobrecieved_time() {
		return jobrecieved_time;
	}

	public void setJobrecieved_time(Date jobrecieved_time) {
		this.jobrecieved_time = jobrecieved_time;
	}

	@ManyToOne
	@JoinColumn(name = "cmpny_id")
	private CompanyDescription company;

	@Column(name = "duration_project")
	private String duration_project;

	@Column(name = "location_project")
	private String location_project;

	public String getAcc_name() {
		return this.acc_name;
	}

	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}

	public String getSegment() {
		return this.segment;
	}

	public void setSegment(String segment) {
		this.segment = segment;
	}

	public String getExternal_internal() {
		return this.external_internal;
	}

	public void setExternal_internal(String external_internal) {
		this.external_internal = external_internal;
	}

	public Integer getFlag() {
		return this.flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}

	public int getNo_of_positions() {
		return this.no_of_positions;
	}

	public void setNo_of_positions(int no_of_positions) {
		this.no_of_positions = no_of_positions;
	}

	public String getDuration_project() {
		return this.duration_project;
	}

	public void setDuration_project(String duration_project) {
		this.duration_project = duration_project;
	}

	public String getLocation_project() {
		return this.location_project;
	}

	public void setLocation_project(String location_project) {
		this.location_project = location_project;
	}

	public Integer getJobdescid() {
		return jobdescid;
	}

	public void setJobdescid(Integer jobdescid) {
		this.jobdescid = jobdescid;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public Date getPosEndDate() {
		return posEndDate;
	}

	public void setPosEndDate(Date posEndDate) {
		this.posEndDate = posEndDate;
	}

	public String getJobstatus() {
		return jobstatus;
	}

	public void setJobstatus(String jobstatus) {
		this.jobstatus = jobstatus;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getCreatedby() {
		return createdby;
	}

	public void setCreatedby(Integer createdby) {
		this.createdby = createdby;
	}

	public String getJobDescGiven() {
		return jobDescGiven;
	}

	public void setJobDescGiven(String jobDescGiven) {
		this.jobDescGiven = jobDescGiven;
	}

	public CompanyDescription getCompany() {
		return company;
	}

	public void setCompany(CompanyDescription company) {
		this.company = company;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getJdPriority() {
		return jdPriority;
	}

	public void setJdPriority(String jdPriority) {
		this.jdPriority = jdPriority;
	}

	public String getAllocatedBudget() {
		return allocatedBudget;
	}

	public void setAllocatedBudget(String allocatedBudget) {
		this.allocatedBudget = allocatedBudget;
	}

}
