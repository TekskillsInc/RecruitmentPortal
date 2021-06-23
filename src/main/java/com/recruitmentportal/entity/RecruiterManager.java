package com.recruitmentportal.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Tbl_RecPortal_RecruiterManager")
public class RecruiterManager implements Serializable{
	   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	   @GeneratedValue(strategy=GenerationType.IDENTITY)
	   @Column(name="tblpk")
	   private Integer tblpk;
	   
	   @Column(name="recruiterempno")
	   private Integer recruiterempno;
	   
	   @Column(name="managerempno")
	   private int managerempno;

	public Integer getTblpk() {
		return tblpk;
	}

	public void setTblpk(Integer tblpk) {
		this.tblpk = tblpk;
	}

	public Integer getRecruiterempno() {
		return recruiterempno;
	}

	public void setRecruiterempno(Integer recruiterempno) {
		this.recruiterempno = recruiterempno;
	}

	public int getManagerempno() {
		return managerempno;
	}

	public void setManagerempno(int managerempno) {
		this.managerempno = managerempno;
	}
	
	   
      

}
