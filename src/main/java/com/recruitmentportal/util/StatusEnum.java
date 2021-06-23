package com.recruitmentportal.util;

public enum StatusEnum {
	Approved("Approved"),Rejected("Rejected"),Onhold("Onhold"),ApprovedByManagement("Approved By Management");
	private String name;
	
	StatusEnum(String name){
		this.name=name;
	}

	public String getName() {
		return name;
	}
   // Optionally and/or additionally, toString.
	    @Override public String toString() { return name; }
	 
}