package com.recruitmentportal.DTO;

public class JobProfileCountDto {
	private String role;
	private int selectedCount;
	private int rejectedCount;
	
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public int getSelectedCount() {
		return selectedCount;
	}
	public void setSelectedCount(int selectedCount) {
		this.selectedCount = selectedCount;
	}
	public int getRejectedCount() {
		return rejectedCount;
	}
	public void setRejectedCount(int rejectedCount) {
		this.rejectedCount = rejectedCount;
	}
}
