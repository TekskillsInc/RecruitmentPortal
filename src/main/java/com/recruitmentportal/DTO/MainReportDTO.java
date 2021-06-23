package com.recruitmentportal.DTO;

import java.util.LinkedList;
import java.util.List;

public class MainReportDTO {
	
	List<MainReport> mainRerportList=new LinkedList<MainReport>();

	public List<MainReport> getMainRerportList() {
		return mainRerportList;
	}

	public void setMainRerportList(List<MainReport> mainRerportList) {
		this.mainRerportList = mainRerportList;
	}
	
	List<MainReport> BDMReportList=new LinkedList<MainReport>();

	public List<MainReport> getBDMReportList() {
		return BDMReportList;
	}

	public void setBDMReportList(List<MainReport> bDMReportList) {
		BDMReportList = bDMReportList;
	}

}
