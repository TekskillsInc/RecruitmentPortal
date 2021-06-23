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
@Table(name="TBL_RECPORTAL_PREOBT_ATTACHMENTS")

public class TBL_RECPORTAL_PREOBT_ATTACHMENTS implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="TBL_PK")
	private Integer tbl_pk;
    
	 public Integer getTbl_pk() {
		return tbl_pk;
	}

	public void setTbl_pk(Integer tbl_pk) {
		this.tbl_pk = tbl_pk;
	}

	@Column(name="candidate_id")
	 private int candidate_id;
	
	@Column(name="fileName")
	 private String fileName;
	    
	    @Temporal(TemporalType.DATE)
	    @Column(name="uploadedDate")
	   	private Date uploadedDate;
	    
	    @Column(name="fileType")
		private String fileType;
	    
	    @Column(name="uploadedBy")
		private Integer uploadedBy;
	    
	    @Column(name="status")
		private String status;

	    
	    @Column(name="comments")
		private String comments;

	    

		public String getComments() {
			return comments;
		}

		public void setComments(String comments) {
			this.comments = comments;
		}

		public String getFileName() {
			return fileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public Date getUploadedDate() {
			return uploadedDate;
		}

		public void setUploadedDate(Date uploadedDate) {
			this.uploadedDate = uploadedDate;
		}

		public String getFileType() {
			return fileType;
		}

		public void setFileType(String fileType) {
			this.fileType = fileType;
		}

		public Integer getUploadedBy() {
			return uploadedBy;
		}

		public void setUploadedBy(Integer uploadedBy) {
			this.uploadedBy = uploadedBy;
		}

		public int getCandidate_id() {
			return candidate_id;
		}

		public void setCandidate_id(int candidate_id) {
			this.candidate_id = candidate_id;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
	         
}
