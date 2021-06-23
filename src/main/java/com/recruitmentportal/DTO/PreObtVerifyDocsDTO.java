package com.recruitmentportal.DTO;

import java.util.List;

import com.recruitmentportal.entity.TBL_RECPORTAL_PREOBT_ATTACHMENTS;
import com.recruitmentportal.entity.Tbl_Recportal_Preobt_Doc_Status;

public class PreObtVerifyDocsDTO {

	List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> canDocs;
	List<Tbl_Recportal_Preobt_Doc_Status> docList;
	private String role;
	
	public List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> getCanDocs() {
		return canDocs;
	}
	public void setCanDocs(List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> canDocs) {
		this.canDocs = canDocs;
	}
	public List<Tbl_Recportal_Preobt_Doc_Status> getDocList() {
		return docList;
	}
	public void setDocList(List<Tbl_Recportal_Preobt_Doc_Status> docList) {
		this.docList = docList;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
}
