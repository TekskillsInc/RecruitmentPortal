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
@Table(name="Tbl_RecPortal_JobAttachments")

public class Tbl_RecPortal_JobAttachments implements Serializable{

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
	 
	
	
	 @Column(name="attachmentname")
	private String attachmentname;
	    
	    @Temporal(TemporalType.DATE)
	    @Column(name="attachedDate")
	   	private Date attachedDate;
	    
	    @Column(name="attachmentType")
		private String attachmentType;
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


	public String getAttachmentname() {
		return attachmentname;
	}

	public void setAttachmentname(String attachmentname) {
		this.attachmentname = attachmentname;
	}

	public Date getAttachedDate() {
		return attachedDate;
	}

	public void setAttachedDate(Date attachedDate) {
		this.attachedDate = attachedDate;
	}

	public String getAttachmentType() {
		return attachmentType;
	}

	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}

   
}
