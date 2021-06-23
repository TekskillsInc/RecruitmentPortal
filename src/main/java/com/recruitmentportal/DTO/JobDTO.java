package com.recruitmentportal.DTO;

import java.util.ArrayList;
import java.util.List;

import com.recruitmentportal.entity.Jobdescription;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;

public class JobDTO {
	private Jobdescription jobdesc;
	private String assignName;
	private List<Tbl_RecPortal_JobAttachments> zipfile=new ArrayList<Tbl_RecPortal_JobAttachments>();
	public Jobdescription getJobdesc() {
		return jobdesc;
	}
	public void setJobdesc(Jobdescription jobdesc) {
		this.jobdesc = jobdesc;
	}
	public String getAssignName() {
		return assignName;
	}
	public void setAssignName(String assignName) {
		this.assignName = assignName;
	}
	public List<Tbl_RecPortal_JobAttachments> getZipfile() {
		return zipfile;
	}
	public void setZipfile(List<Tbl_RecPortal_JobAttachments> downloadinfo) {
		this.zipfile = downloadinfo;
	}
	
}
