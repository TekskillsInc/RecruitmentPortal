package com.recruitmentportal.DTO;

import java.util.Date;




public class JobAllocationView {
	
	   private Integer tblpk;
	   
	   
	   private Integer assignedto;
	   
	  
	   private Integer assignedby;
	 
	   private Integer tlempno;
	   
	   
	 


	   private String empstatus;
	   
	   
	 
	   private Date unassigneddate;
	   
	   
	
	   private Date reassigneddate;
	   
	  

	public Date getReassigneddate() {
		return reassigneddate;
	}

	public void setReassigneddate(Date reassigneddate) {
		this.reassigneddate = reassigneddate;
	}

	public Date getUnassigneddate() {
		return unassigneddate;
	}

	public void setUnassigneddate(Date unassigneddate) {
		this.unassigneddate = unassigneddate;
	}

	
	   private Integer jobDescid;
	   
	  
	   private Date assigneddate;
	   
	   
	   private Integer departmentid;
	   
	   public Integer getTblpk() {
			return tblpk;
		}

		public void setTblpk(Integer tblpk) {
			this.tblpk = tblpk;
		}

	public Integer getAssignedby() {
		return assignedby;
	}

	public void setAssignedby(Integer assignedby) {
		this.assignedby = assignedby;
	}

	public Integer getJobDescid() {
		return jobDescid;
	}

	public void setJobDesc(Integer jobDescid) {
		this.jobDescid = jobDescid;
	}

	public Integer getAssignedto() {
		return assignedto;
	}

	public void setAssignedto(Integer assignedto) {
		this.assignedto = assignedto;
	}

	public Date getAssigneddate() {
		return assigneddate;
	}

	public void setAssigneddate(Date assigneddate) {
		this.assigneddate = assigneddate;
	}

	public Integer getDepartmentid() {
		return departmentid;
	}

	public void setDepartmentid(Integer departmentid) {
		this.departmentid = departmentid;
	}
	   
	public String getEmpstatus() {
		return empstatus;
	}

	public void setEmpstatus(String empstatus) {
		this.empstatus = empstatus;
	}
	public Integer getTlempno() {
		return tlempno;
	}

	public void setTlempno(Integer tlempno) {
		this.tlempno = tlempno;
	}
	  
}
