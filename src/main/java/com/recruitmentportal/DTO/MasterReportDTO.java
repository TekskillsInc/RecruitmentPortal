package com.recruitmentportal.DTO;

import java.util.List;

import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.JobAllocation;

public class MasterReportDTO {
	
	private List mainreport;
	private List<JobAllocation> masterJobAll;
	private  List<CandidateStatus> masterCanStatus;
	CandidateInfoDTO MasterCandInfo;
	public List getMainreport() {
		return mainreport;
	}
	public void setMainreport(List mainreport) {
		this.mainreport = mainreport;
	}
	public List<JobAllocation> getMasterJobAll() {
		return masterJobAll;
	}
	public void setMasterJobAll(List<JobAllocation> masterJobAll) {
		this.masterJobAll = masterJobAll;
	}
	public List<CandidateStatus> getMasterCanStatus() {
		return masterCanStatus;
	}
	public void setMasterCanStatus(List<CandidateStatus> masterCanStatus) {
		this.masterCanStatus = masterCanStatus;
	}
	public CandidateInfoDTO getMasterCandInfo() {
		return MasterCandInfo;
	}
	public void setMasterCandInfo(CandidateInfoDTO masterCandInfo) {
		MasterCandInfo = masterCandInfo;
	}

}
