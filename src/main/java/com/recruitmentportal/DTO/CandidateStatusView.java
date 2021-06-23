package com.recruitmentportal.DTO;

import java.util.Date;

import com.recruitmentportal.entity.Tbl_RecPortal_PreobtStatus;


public class CandidateStatusView {
	private Integer candidateid;
	private String tlStatus;
	private Integer tlEmpNo;
	private Date tlSubmitDate; 
	private String sctStatus;
	private Integer sctempno;
	private Date sctSubmitDate; 
	private Integer recEmpNo;
	private Date recSubmitDate;
	private String bdmStatus;
	private Integer bdmEmpNo;
	private Date bdmSubmitDate;
	private Date clientSelectedDate;
	private Integer jobid;
	private String canname;
	private String recname;
	private String worklocation;
	private String bdname;
	private String clientname;
	private String clientStatus;
	private String clientfeedback;
	private String on_board_date;
	private String cli_rej_reason;
	public Tbl_RecPortal_PreobtStatus preObtStatus; 
	
	public Tbl_RecPortal_PreobtStatus getPreObtStatus() {
		return preObtStatus;
	}
	public void setPreObtStatus(Tbl_RecPortal_PreobtStatus preObtStatus) {
		this.preObtStatus = preObtStatus;
	}
	public Integer getJobid() {
		return jobid;
	}
	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}
	public String getCanname() {
		return canname;
	}
	public void setCanname(String canname) {
		this.canname = canname;
	}
	public Date getClientSelectedDate() {
		return clientSelectedDate;
	}
	public void setClientSelectedDate(Date clientSelectedDate) {
		this.clientSelectedDate = clientSelectedDate;
	}
	public String getRecname() {
		return recname;
	}
	public void setRecname(String recname) {
		this.recname = recname;
	}
	public String getWorklocation() {
		return worklocation;
	}
	public void setWorklocation(String worklocation) {
		this.worklocation = worklocation;
	}
	public String getBdname() {
		return bdname;
	}
	public void setBdname(String bdname) {
		this.bdname = bdname;
	}
	public String getClientname() {
		return clientname;
	}
	public void setClientname(String clientname) {
		this.clientname = clientname;
	}

	
	
	public Integer getCandidateid() {
		return candidateid;
	}
	public void setCandidateid(Integer candidateid) {
		this.candidateid = candidateid;
	}
	public String getTlStatus() {
		return tlStatus;
	}
	public void setTlStatus(String tlStatus) {
		this.tlStatus = tlStatus;
	}
	public Integer getTlEmpNo() {
		return tlEmpNo;
	}
	public void setTlEmpNo(Integer tlEmpNo) {
		this.tlEmpNo = tlEmpNo;
	}
	public Date getTlSubmitDate() {
		return tlSubmitDate;
	}
	public void setTlSubmitDate(Date tlSubmitDate) {
		this.tlSubmitDate = tlSubmitDate;
	}
	public String getSctStatus() {
		return sctStatus;
	}
	public void setSctStatus(String sctStatus) {
		this.sctStatus = sctStatus;
	}
	public Integer getSctempno() {
		return sctempno;
	}
	public void setSctempno(Integer sctempno) {
		this.sctempno = sctempno;
	}
	public Date getSctSubmitDate() {
		return sctSubmitDate;
	}
	public void setSctSubmitDate(Date sctSubmitDate) {
		this.sctSubmitDate = sctSubmitDate;
	}
	public Integer getRecEmpNo() {
		return recEmpNo;
	}
	public void setRecEmpNo(Integer recEmpNo) {
		this.recEmpNo = recEmpNo;
	}
	public Date getRecSubmitDate() {
		return recSubmitDate;
	}
	public void setRecSubmitDate(Date recSubmitDate) {
		this.recSubmitDate = recSubmitDate;
	}
	public String getBdmStatus() {
		return bdmStatus;
	}
	public void setBdmStatus(String bdmStatus) {
		this.bdmStatus = bdmStatus;
	}
	public Integer getBdmEmpNo() {
		return bdmEmpNo;
	}
	public void setBdmEmpNo(Integer bdmEmpNo) {
		this.bdmEmpNo = bdmEmpNo;
	}
	public Date getBdmSubmitDate() {
		return bdmSubmitDate;
	}
	public void setBdmSubmitDate(Date bdmSubmitDate) {
		this.bdmSubmitDate = bdmSubmitDate;
	}
	public String getClientStatus() {
		return clientStatus;
	}
	public void setClientStatus(String clientStatus) {
		this.clientStatus = clientStatus;
	}
	public String getClientfeedback() {
		return clientfeedback;
	}
	public void setClientfeedback(String clientfeedback) {
		this.clientfeedback = clientfeedback;
	}
	public String getOn_board_date() {
		return on_board_date;
	}
	public void setOn_board_date(String on_board_date) {
		this.on_board_date = on_board_date;
	}
	public String getCli_rej_reason() {
		return cli_rej_reason;
	}
	public void setCli_rej_reason(String cli_rej_reason) {
		this.cli_rej_reason = cli_rej_reason;
	}
	
	
	

}
