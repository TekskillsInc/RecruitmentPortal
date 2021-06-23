package com.recruitmentportal.DTO;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;
import com.recruitmentportal.entity.Tbl_RecPortal_candidateAttachments;

@Entity
@Table(name="Tbl_RecPortal_CandidateInformation")
public class AttachmentsDTO {
	
	
	String canDocs;
	List<Tbl_RecPortal_candidateAttachments> docList;
	List<Tbl_RecPortal_JobAttachments> jobattachments;
	
	
	public String getCanDocs() {
		return canDocs;
	}
	public void setCanDocs(String canDocs) {
		this.canDocs = canDocs;
	}
	public List<Tbl_RecPortal_candidateAttachments> getDocList() {
		return docList;
	}
	public void setDocList(List<Tbl_RecPortal_candidateAttachments> docList) {
		this.docList = docList;
	}
	public List<Tbl_RecPortal_JobAttachments> getJobattachments() {
		return jobattachments;
	}
	public void setJobattachments(List<Tbl_RecPortal_JobAttachments> jobattachments) {
		this.jobattachments = jobattachments;
	}
	
	
	/*private int candidateid;
	private String attachments;
	private String attachmenttype;
	private String jattachment;
	private String jattachmettype;
	private String file;
	private String fileType;
	public int getCandidateid() {
		return candidateid;
	}
	public void setCandidateid(int candidateid) {
		this.candidateid = candidateid;
	}
	public String getAttachments() {
		return attachments;
	}
	public void setAttachments(String attachments) {
		this.attachments = attachments;
	}
	public String getAttachmenttype() {
		return attachmenttype;
	}
	public void setAttachmenttype(String attachmenttype) {
		this.attachmenttype = attachmenttype;
	}
	public String getJattachment() {
		return jattachment;
	}
	public void setJattachment(String jattachment) {
		this.jattachment = jattachment;
	}
	public String getJattachmettype() {
		return jattachmettype;
	}
	public void setJattachmettype(String jattachmettype) {
		this.jattachmettype = jattachmettype;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}*/
}
