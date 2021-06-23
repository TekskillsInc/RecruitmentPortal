package com.recruitmentportal.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="Tbl_RecPortal_CandidateAdditionalInfo")
public class Tbl_RecPortal_CandidateAdditionalInfo implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tbl_pk")
	 private Integer tbl_pk;

	@Column(name="fathername")
	   private String fathername;
	 
	 @Column(name="mothername")
	   private String mothername;
	 
	 @Column(name="familyDetails")
	   private String familyDetails;
	 
	 @Column(name="ctc_pm")
	   private String ctc_pm;
	 
	 @Column(name="ectc_pm")
	   private String ectc_pm;
	 
	 @Column(name="negratePM")
	   private String negratePM;
	 
	 @Column(name="negratePA")
	   private String negratePA; 
	   
	   @Column(name="mgmtAppctcPA")
	   private String mgmtAppctcPA;
	   
	   @Column(name="mgmtAppctcPM")
	   private String mgmtAppctcPM;
	   
	   
	   @Column(name="offeredctcPA")
	   private String offeredctcPA;
	   
	   @Column(name="offeredDesignation")
	   private String offeredDesignation;
	   
	   @Temporal(TemporalType.DATE)
		@Column(name = "dojDate")
		private Date dojDate;

	   @Column(name="offeredctcPM")
	   private String offeredctcPM;
	   
	   @Column(name="MgmtComments")
	   private String mgmtComments;
	   
	   public String getCan_ExpecComments() {
		return can_ExpecComments;
	}

	public void setCan_ExpecComments(String can_ExpecComments) {
		this.can_ExpecComments = can_ExpecComments;
	}

	@Column(name="negComments")
	   private String negComments;
	   
	   @Column(name="can_ExpecComments")
	   private String can_ExpecComments;
	   
	   
	   public String getNegComments() {
		return negComments;
	}

	public void setNegComments(String negComments) {
		this.negComments = negComments;
	}

	@Column(name="addtnlbenifits")
	   private String addtnlbenifits;
	   
	   @Column(name="candidateid")
		 private int candidateid;
	   
  	   @Column(name="nego_ctc_pm")
	   private String nego_ctc_pm;
	   
	   @Column(name="nego_ctc_pa")
	   private String nego_ctc_pa;
	   
	   @Column(name="nego_ectc_pm")
	   private String nego_ectc_pm;
	   
	   @Column(name="nego_ectc_pa")
	   private String nego_ectc_pa;
	   
	   @Column(name="nego_rate_pm")
	   private String nego_rate_pm;
	   
	   @Column(name="nego_rate_pa")
	   private String nego_rate_pa;
	   
	   public Date getDojDate() {
			return dojDate;
		}

		public void setDojDate(Date dojDate) {
			this.dojDate = dojDate;
		}
	   
	   public String getNego_ctc_pm() {
		return nego_ctc_pm;
	}

	public void setNego_ctc_pm(String nego_ctc_pm) {
		this.nego_ctc_pm = nego_ctc_pm;
	}

	public String getNego_ctc_pa() {
		return nego_ctc_pa;
	}

	public void setNego_ctc_pa(String nego_ctc_pa) {
		this.nego_ctc_pa = nego_ctc_pa;
	}

	public String getNego_ectc_pm() {
		return nego_ectc_pm;
	}

	public void setNego_ectc_pm(String nego_ectc_pm) {
		this.nego_ectc_pm = nego_ectc_pm;
	}

	public String getNego_ectc_pa() {
		return nego_ectc_pa;
	}

	public void setNego_ectc_pa(String nego_ectc_pa) {
		this.nego_ectc_pa = nego_ectc_pa;
	}

	public String getNego_rate_pm() {
		return nego_rate_pm;
	}

	public void setNego_rate_pm(String nego_rate_pm) {
		this.nego_rate_pm = nego_rate_pm;
	}

	public String getNego_rate_pa() {
		return nego_rate_pa;
	}

	public void setNego_rate_pa(String nego_rate_pa) {
		this.nego_rate_pa = nego_rate_pa;
	}
	   
	   public String getMgmtComments() {
		return mgmtComments;
	}

	public void setMgmtComments(String mgmtComments) {
		this.mgmtComments = mgmtComments;
	}

	
	 public String getOfferedDesignation() {
			return offeredDesignation;
		}

		public void setOfferedDesignation(String offeredDesignation) {
			this.offeredDesignation = offeredDesignation;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}


	   
	 public Integer getTbl_pk() {
		return tbl_pk;
	}

	public void setTbl_pk(Integer tbl_pk) {
		this.tbl_pk = tbl_pk;
	}

	public String getFathername() {
		return fathername;
	}

	public void setFathername(String fathername) {
		this.fathername = fathername;
	}

	public String getMothername() {
		return mothername;
	}

	public void setMothername(String mothername) {
		this.mothername = mothername;
	}

	

	public String getCtc_pm() {
		return ctc_pm;
	}

	public String getFamilyDetails() {
		return familyDetails;
	}

	public void setFamilyDetails(String familyDetails) {
		this.familyDetails = familyDetails;
	}

	public void setCtc_pm(String ctc_pm) {
		this.ctc_pm = ctc_pm;
	}

	public String getEctc_pm() {
		return ectc_pm;
	}

	public void setEctc_pm(String ectc_pm) {
		this.ectc_pm = ectc_pm;
	}

	public String getNegratePM() {
		return negratePM;
	}

	public void setNegratePM(String negratePM) {
		this.negratePM = negratePM;
	}

	public String getNegratePA() {
		return negratePA;
	}

	public void setNegratePA(String negratePA) {
		this.negratePA = negratePA;
	}

	public String getMgmtAppctcPA() {
		return mgmtAppctcPA;
	}

	public void setMgmtAppctcPA(String mgmtAppctcPA) {
		this.mgmtAppctcPA = mgmtAppctcPA;
	}

	public String getMgmtAppctcPM() {
		return mgmtAppctcPM;
	}

	public void setMgmtAppctcPM(String mgmtAppctcPM) {
		this.mgmtAppctcPM = mgmtAppctcPM;
	}

	public String getOfferedctcPA() {
		return offeredctcPA;
	}

	public void setOfferedctcPA(String offeredctcPA) {
		this.offeredctcPA = offeredctcPA;
	}

	public String getOfferedctcPM() {
		return offeredctcPM;
	}

	public void setOfferedctcPM(String offeredctcPM) {
		this.offeredctcPM = offeredctcPM;
	}

	

	public String getAddtnlbenifits() {
		return addtnlbenifits;
	}

	public void setAddtnlbenifits(String addtnlbenifits) {
		this.addtnlbenifits = addtnlbenifits;
	}

	public int getCandidateid() {
		return candidateid;
	}

	public void setCandidateid(int candidateid) {
		this.candidateid = candidateid;
	}

	 @Override
		public String toString() {
			return "Tbl_RecPortal_CandidateAdditionalInfo [tbl_pk=" + tbl_pk + ", fathername=" + fathername
					+ ", mothername=" + mothername + ", familyDetails=" + familyDetails + ", ctc_pm=" + ctc_pm
					+ ", ectc_pm=" + ectc_pm + ", negratePM=" + negratePM + ", negratePA=" + negratePA + ", mgmtAppctcPA="
					+ mgmtAppctcPA + ", mgmtAppctcPM=" + mgmtAppctcPM + ", offeredctcPA=" + offeredctcPA + ", offeredctcPM="
					+ offeredctcPM + ", mgmtComments=" + mgmtComments + ", addtnlbenifits=" + addtnlbenifits
					+ ", candidateid=" + candidateid + ", nego_ctc_pm=" + nego_ctc_pm + ", nego_ctc_pa=" + nego_ctc_pa
					+ ", nego_ectc_pm=" + nego_ectc_pm + ", nego_ectc_pa=" + nego_ectc_pa + ", nego_rate_pm=" + nego_rate_pm
					+ ", nego_rate_pa=" + nego_rate_pa + "]";
		}
	
}
