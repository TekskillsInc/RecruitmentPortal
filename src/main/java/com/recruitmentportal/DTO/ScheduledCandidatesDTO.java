package com.recruitmentportal.DTO;

import com.recruitmentportal.entity.CandidateInformation;

public class ScheduledCandidatesDTO {
	private CandidateInformation candidate;
	private String tpinterviewDate;
	private String tpinterviewMode;
	private String clinterviewDate;
	private String clinterviewMode;
	
	
	public String getTpinterviewDate() {
		return tpinterviewDate;
	}
	public void setTpinterviewDate(String tpinterviewDate) {
		this.tpinterviewDate = tpinterviewDate;
	}
	public String getTpinterviewMode() {
		return tpinterviewMode;
	}
	public void setTpinterviewMode(String tpinterviewMode) {
		this.tpinterviewMode = tpinterviewMode;
	}
	public String getClinterviewDate() {
		return clinterviewDate;
	}
	public void setClinterviewDate(String clinterviewDate) {
		this.clinterviewDate = clinterviewDate;
	}
	public String getClinterviewMode() {
		return clinterviewMode;
	}
	public void setClinterviewMode(String clinterviewMode) {
		this.clinterviewMode = clinterviewMode;
	}
	
	
	
	
	
	public CandidateInformation getCandidate() {
		return candidate;
	}
	public void setCandidate(CandidateInformation candidate) {
		this.candidate = candidate;
	}
	
	
	
}
