 package com.recruitmentportal.DTO;

import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.Tbl_RecPortal_candidateAttachments;
 
 public class JsonResponse {
   private CandidateInformation candidateInfo ;
   private InterviewDetails interview;
	private Tbl_RecPortal_candidateAttachments candidateAttachements;
   
   
public Tbl_RecPortal_candidateAttachments getCandidateAttachements() {
		return candidateAttachements;
	}
	public void setCandidateAttachements(Tbl_RecPortal_candidateAttachments candidateAttachements) {
		this.candidateAttachements = candidateAttachements;
	}
public CandidateInformation getCandidateInfo() {
	return candidateInfo;
}
public void setCandidateInfo(CandidateInformation candidateInfo) {
	this.candidateInfo = candidateInfo;
}
public InterviewDetails getInterview() {
	return interview;
}
public void setInterview(InterviewDetails interview) {
	this.interview = interview;
}
   
  
 }


