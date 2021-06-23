package com.recruitmentportal.DTO;

public class CandidateStatusDTO {
	private Integer candidateId;
	private String status;
	private String cliStatus;
	private String coment;
	private String cliComent;
	private String tlrejComent;
    private String recSubmitDate;
	private String sctSubmitDate;
	
	
	
	
	public String getRecSubmitDate() {
		return recSubmitDate;
	}
	public void setRecSubmitDate(String recSubmitDate) {
		this.recSubmitDate = recSubmitDate;
	}
	public String getSctSubmitDate() {
		return sctSubmitDate;
	}
	public void setSctSubmitDate(String sctSubmitDate) {
		this.sctSubmitDate = sctSubmitDate;
	}
	public Integer getCandidateId() {
		return candidateId;
	}
	public void setCandidateId(Integer candidateId) {
		this.candidateId = candidateId;
	}
	public String getCliStatus() {
		return cliStatus;
	}
	public void setCliStatus(String cliStatus) {
		this.cliStatus = cliStatus;
	}
	public String getCliComent() {
		return cliComent;
	}
	public void setCliComent(String cliComent) {
		this.cliComent = cliComent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getTlrejComent() {
		return tlrejComent;
	}
	public void setTlrejComent(String tlrejComent) {
		this.tlrejComent = tlrejComent;
	}

}
