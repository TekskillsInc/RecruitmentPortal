package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="Tbl_RecPortal_tecpanelFeedBack")
public class Tbl_RecPortal_tecpanelFeedBack implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tblpk")
	 private Integer tblpk;
	 
	 @ManyToOne
	 @JoinColumn(name="jobid")
	 private Jobdescription jobDesc;
	 
	 @Column(name="availableType")
	 private String availableType;
	 
	 @Column(name="tpname")
	 private String tpname;
	
	 @Column(name="tpavalabletime")
	 private String tpavalabletime;
	 
	 @Column(name="clavailabletime")
	 private String clavalabletime;
	 
	 @Column(name="clIntMode")
	 private String clIntMode;
	 
	 
	 @Column(name="clavailabletimeto")
	 private String clavailabletimeto;
	
	 public String getClavailabletimeto() {
		return clavailabletimeto;
	}

	public void setClavailabletimeto(String clavailabletimeto) {
		this.clavailabletimeto = clavailabletimeto;
	}

	@Temporal(TemporalType.DATE)
	 @Column(name="clavailabledate")
	 private  Date clinterviewdate;
	 
	 @Temporal(TemporalType.DATE)
	 @Column(name=" tpavailabledate")
	 private  Date  tpavailabledate;
	 
	 public String getAvailableType() {
		return availableType;
	}

	public void setAvailableType(String availableType) {
		this.availableType = availableType;
	}

	public String getClavalabletime() {
		return clavalabletime;
	}

	public void setClavalabletime(String clavalabletime) {
		this.clavalabletime = clavalabletime;
	}

	public Date getClinterviewdate() {
		return clinterviewdate;
	}

	public void setClinterviewdate(Date clinterviewdate) {
		this.clinterviewdate = clinterviewdate;
	}

	 @Column(name="tpattachment")
	 @Lob
	 private byte[] file_data;
	 @Transient
	 private MultipartFile file;
	  
	 @Column(name="attachmentname")
	 private String attachmentname;
	 
	 @Column(name="emp_number")
	 private Integer emp_number;
	 
	 @Column(name="interviewmode")
	 private String interview_type;
	 
	 public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

	public Jobdescription getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(Jobdescription jobDesc) {
		this.jobDesc = jobDesc;
	}

	

	public String getTpname() {
		return tpname;
	}

	public void setTpname(String tpname) {
		this.tpname = tpname;
	}

	public String getTpavalabletime() {
		return tpavalabletime;
	}

	public void setTpavalabletime(String tpavalabletime) {
		this.tpavalabletime = tpavalabletime;
	}

	public byte[] getFile_data() {
		return file_data;
	}

	public void setFile_data(byte[] file_data) {
		this.file_data = file_data;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}


	public String getAttachmentname() {
		return attachmentname;
	}

	public void setAttachmentname(String attachmentname) {
		this.attachmentname = attachmentname;
	}

	public Integer getEmp_number() {
		return emp_number;
	}

	public void setEmp_number(Integer emp_number) {
		this.emp_number = emp_number;
	}

	

	public void setModeofinterview(String interview_type) {
		this.setInterview_type(interview_type);
		
	}

	public String getInterview_type() {
		return interview_type;
	}

	public void setInterview_type(String interview_type) {
		this.interview_type = interview_type;
	}

	public String getClIntMode() {
		return clIntMode;
	}

	public void setClIntMode(String clIntMode) {
		this.clIntMode = clIntMode;
	}

	public Date getTpavailabledate() {
		return tpavailabledate;
	}

	public void setTpavailabledate(Date tpavailabledate) {
		this.tpavailabledate = tpavailabledate;
	}

}
