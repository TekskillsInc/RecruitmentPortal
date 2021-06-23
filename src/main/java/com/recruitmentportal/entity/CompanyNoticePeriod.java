package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_RecPortal_NoticePeriodCompanies")
public class CompanyNoticePeriod implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="company_id")
	private Integer company_id;

	@Column(name="CompanyName")
	private String companyname;
	
	@Column(name="NoticePeriod")
	private Integer noticeperiod;
	@Column(name="CompanyPanid")
	private String companypanid;
	
	public String getCompanypanid() {
		return companypanid;
	}

	public void setCompanypanid(String companypanid) {
		this.companypanid = companypanid;
	}
	public Integer getCompany_id() {
		return company_id;
	}

	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public Integer getNoticeperiod() {
		return noticeperiod;
	}

	public void setNoticeperiod(Integer noticeperiod) {
		this.noticeperiod = noticeperiod;
	}

	
	
}
