package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_RecPortal_InvolveTechapnel")
public class InvolveTechPanelTable implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tblpk")
	 private  Integer tblpk;
	 
	 @ManyToOne
	 @JoinColumn(name="jobdescid")
	 private Jobdescription jobDesc;
	 
	 @Column(name="involvetp")  
	 private int involvetp;

	public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

	public Jobdescription getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(Jobdescription jobDesc) {
		this.jobDesc = jobDesc;
	}

	public int getInvolvetp() {
		return involvetp;
	}

	public void setInvolvetp(int involvetp) {
		this.involvetp = involvetp;
	}
		

}
