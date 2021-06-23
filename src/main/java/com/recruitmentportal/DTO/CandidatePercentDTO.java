package com.recruitmentportal.DTO;

public class CandidatePercentDTO {
	private String candidateName;
	private Double ssc;
	private Double interperc;;
	private Double graduation;
	private Double pg;
	
	public Double getSsc() {
		return ssc;
	}
	public void setSsc(Double ssc) {
		this.ssc = ssc;
	}
	public Double getInterperc() {
		return interperc;
	}
	public void setInterperc(Double interperc) {
		this.interperc = interperc;
	}
	public Double getGraduation() {
		return graduation;
	}
	public void setGraduation(Double graduation) {
		this.graduation = graduation;
	}
	public Double getPg() {
		return pg;
	}
	public void setPg(Double pg) {
		this.pg = pg;
	}
	public String getCandidateName() {
		return candidateName;
	}
	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}
	

}
