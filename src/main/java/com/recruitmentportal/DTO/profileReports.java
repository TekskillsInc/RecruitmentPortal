package com.recruitmentportal.DTO;

public class profileReports {
	
	
	private String client_name;
	private Integer total_profiles;
	private Integer sixhrs;
	private Integer twentyfourhrs;
	private String candidate_Status;
	private Integer total;
	private Integer on_hold;
	private Integer noShow;
	private Integer rejected;
	private Integer shortlisted;
	private Integer onboarded;
	
	public Integer getOn_hold() {
		return on_hold;
	}
	public void setOn_hold(Integer on_hold) {
		this.on_hold = on_hold;
	}
	public Integer getNoShow() {
		return noShow;
	}
	public void setNoShow(Integer noShow) {
		this.noShow = noShow;
	}
	
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getSixhrs() {
		return sixhrs;
	}
	public void setSixhrs(Integer sixhrs) {
		this.sixhrs = sixhrs;
	}
	
	public String getClient_name() {
		return client_name;
	}
	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	public Integer getTotal_profiles() {
		return total_profiles;
	}
	public void setTotal_profiles(Integer total_profiles) {
		this.total_profiles = total_profiles;
	}
	
	public Integer getTwentyfourhrs() {
		return twentyfourhrs;
	}
	public void setTwentyfourhrs(Integer twentyfourhrs) {
		this.twentyfourhrs = twentyfourhrs;
	}
	public String getCandidate_Status() {
		return candidate_Status;
	}
	public void setCandidate_Status(String candidate_Status) {
		this.candidate_Status = candidate_Status;
	}
	public Integer getRejected() {
		return rejected;
	}
	public void setRejected(Integer rejected) {
		this.rejected = rejected;
	}
	public Integer getShortlisted() {
		return shortlisted;
	}
	public void setShortlisted(Integer shortlisted) {
		this.shortlisted = shortlisted;
	}
	public Integer getOnboarded() {
		return onboarded;
	}
	public void setOnboarded(Integer onboarded) {
		this.onboarded = onboarded;
	}
	
	

}
