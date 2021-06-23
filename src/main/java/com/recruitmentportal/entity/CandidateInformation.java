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
 @Table(name="Tbl_RecPortal_CandidateInformation")
 public class CandidateInformation implements Serializable
 {
	 
	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="candidateid")
	 private Integer candidateid;
	 
	 @Column(name="pancard")
	 private String pancard;
	
	@Column(name="min_timereq_join")
	 private String min_timereq_join;
	
   @Column(name="hbstart_date")
   @Temporal(TemporalType.DATE)
   private Date hbstart_date;
   
   @Temporal(TemporalType.DATE)
   @Column(name="hbend_date")
   private Date hbend_date;
   
   @Column(name="first_name")
   private String first_name;
   
   @Column(name="last_name")
   private String last_name;
   
   @Column(name="middle_name")
   private String middle_name;
   
   @Column(name="contact_number")
   private String contact_number;
   
   @Column(name="altcnt_number")
   private String altcnt_number;
   
   @Column(name="emailID")
   private String emailID;
   
   @Column(name="dob")
   @Temporal(TemporalType.DATE)
   private Date dob;
   
   @Column(name="basic_qualification")
   private String basic_qualification;
   
   @Column(name="highest_qualification")
   private String highest_qualification;
   
   @Column(name="ssc")
   private Double ssc;
   
   @Column(name="bIEplus12")
   private Double bIEplus12;
   
   
   @Column(name="graduation")
   private Double graduation;
   
   @Column(name="post_Graduation")
   private Double post_Graduation;
   
   @Column(name="primaryskill")
   private String primaryskill;
   
   
   @Column(name="secskill")
   private String secskill;
   
   @Column(name="candDesignation")
   private String candDesignation;
   
   @Column(name="total_experience")
   private String total_experience;
   
   @Column(name="submit_date")
   private Date submit_date;
   
   @Column(name="currentCTC")
   private String currentCTC;
   
   @Column(name="expectedCTC")
   private String expectedCTC;
   
   @Column(name="noticeperiod")
   private String noticeperiod;
   
   @Column(name="workLocation")
   private String workLocation;
   
   @Column(name="current_org")
   private String current_org;
   
   @Column(name="relevantExp")
   private String relevantExp;
   
  

@Column(name="noticeprd_negotiable")
   private String noticeprd_negotiable;
   
   @Column(name="desc_np_negotion")
   private String desc_np_negotion;
   
   @Column(name="int_pipeline_com")
   private String int_pipeline_com;
   
   @Column(name="f2f_intervew")
   private String f2f_intervew;
   
@Temporal(TemporalType.DATE)
   @Column(name="doj_cur_org")
   private Date doj_cur_org;

   @Temporal(TemporalType.DATE)
   @Column(name="prev_relivd_date")
   private Date prev_relivd_date;


	@Temporal(TemporalType.DATE)
   @Column(name="prev_start_date")
   private Date prev_start_date;

   
   @Column(name="can_native_loc")
   private String can_native_loc;
   
   @Column(name="prim_skill_rate")
   private String prim_skill_rate;
   
   @Column(name="sec_skill_rate")
   private String sec_skill_rate;
   
   
   @Column(name="comm_skills_rate")
   private String comm_skills_rate;
   
   
   @Column(name="rep_mgr_name")
   private String rep_mgr_name;
   
   
   @Column(name="mgr_official_emailid")
   private String mgr_official_emailid;
   
   @Column(name="is_tek_payroll")
   private String is_tek_payroll;
   
   
   @Column(name="is_working")
   private String is_working;
   
   @Column(name="cur_cmpny_name")
   private String cur_cmpny_name;
   
   
   @Column(name="duration")
   private String duration;
   
   
   @Column(name="prev_org")
   private String prev_org;
   
   
   @Column(name="bank_stmt")
   private String bank_stmt;
   
   @Column(name="bank_name")
   private String bank_name;
   
   @Column(name="bank_loc")
   private String bank_loc;
   
   @Column(name="cmpny_docs")
   private String cmpny_docs;
   
   @Column(name="job_change")
   private String job_change;
   
   @Column(name="intrw_pipeline")
   private String intrw_pipeline;
   
   
   @Column(name="offer_inhand")
   private String offer_inhand;
   
   
   @Column(name="family_bckgrund")
   private String family_bckgrund;
   
   @Column(name="spouse_wrk")
   private String spouse_wrk;
   
   @Column(name="kids_info")
   private String kids_info;
   
   @Column(name="resn_reloc")
   private String resn_reloc;
   
  @Column(name="intrstlevlworkLoc")
   private String intrstlevlworkLoc;
   
   @Column(name="comskillsRatig")
   private String comskillsRatig;
   
   @Column(name="Professional_Refrnces")
   private String professional_Refrnces;
   
   @Column(name="idProofDetails")
   private String idProofDetails;
   
   @Column(name="resumeName")
   private String file_upload_name;
   
   @Column(name="skypeid")
   private String skypeid;
   
   


public String getIntrstlevlworkLoc() {
	return intrstlevlworkLoc;
}
public void setIntrstlevlworkLoc(String intrstlevlworkLoc) {
	this.intrstlevlworkLoc = intrstlevlworkLoc;
}
public String getComskillsRatig() {
	return comskillsRatig;
}
public void setComskillsRatig(String comskillsRatig) {
	this.comskillsRatig = comskillsRatig;
}
public String getProfessional_Refrnces() {
	return professional_Refrnces;
}
public void setProfessional_Refrnces(String professional_Refrnces) {
	this.professional_Refrnces = professional_Refrnces;
}
public String getIdProofDetails() {
	return idProofDetails;
}
public void setIdProofDetails(String idProofDetails) {
	this.idProofDetails = idProofDetails;
}
	public String getSkypeid() {
	return skypeid;
}
public void setSkypeid(String skypeid) {
	this.skypeid = skypeid;
}
	@Column(name="modeofinterview")
	private String modeofinterview;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="interviewdate")
	private Date interviewdate;
   

public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}

@Column(name="last_name")
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}


public String getMiddle_name() {
	return middle_name;
}
public void setMiddle_name(String middle_name) {
	this.middle_name = middle_name;
}


public String getContact_number() {
	return contact_number;
}
public void setContact_number(String contact_number) {
	this.contact_number = contact_number;
}
public String getMin_timereq_join() {
	return min_timereq_join;
}
public void setMin_timereq_join(String min_timereq_join) {
	this.min_timereq_join = min_timereq_join;
}

public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}

@Column(name="basic_qualification")
public String getBasic_qualification() {
	return basic_qualification;
}
public void setBasic_qualification(String basic_qualification) {
	this.basic_qualification = basic_qualification;
}

@Column(name="ssc")
public Double getSsc() {
	return ssc;
}
public void setSsc(Double ssc) {
	this.ssc = ssc;
}

@Column(name="bIEplus12")
public Double getBIEplus12() {
	return bIEplus12;
}
public void setBIEplus12(Double bIEplus12) {
	this.bIEplus12 = bIEplus12;
}

@Column(name="graduation")
public Double getGraduation() {
	return graduation;
}
public void setGraduation(Double graduation) {
	this.graduation = graduation;
}

@Column(name="post_Graduation")
public Double getPost_Graduation() {
	return post_Graduation;
}
public void setPost_Graduation(Double post_Graduation) {
	this.post_Graduation = post_Graduation;
}


public String getCandDesignation() {
	return candDesignation;
}

public void setCandDesignation(String candDesignation) {
	this.candDesignation = candDesignation;
}

/*@ManyToOne
@JoinColumn(name="J_ID", referencedColumnName="J_ID")*/



@Column(name="total_experience")
public String getTotal_experience() {
	return total_experience;
}
public void setTotal_experience(String total_experience) {
	this.total_experience = total_experience;
}

@Column(name="submit_date")
public Date getSubmit_date() {
	return submit_date;
}
public void setSubmit_date(Date submit_date) {
	this.submit_date = submit_date;
}

@Column(name="currentCTC")
public String getCurrentCTC() {
	return currentCTC;
}
public void setCurrentCTC(String currentCTC) {
	this.currentCTC = currentCTC;
}

@Column(name="expectedCTC")
public String getExpectedCTC() {
	return expectedCTC;
}
public void setExpectedCTC(String expectedCTC) {
	this.expectedCTC = expectedCTC;
}


@Column(name="noticeperiod")
public String getNoticeperiod() {
	return noticeperiod;
}
public void setNoticeperiod(String noticeperiod) {
	this.noticeperiod = noticeperiod;
}

@Column(name="workLocation")
public String getWorkLocation() {
	return workLocation;
}
public void setWorkLocation(String workLocation) {
	this.workLocation = workLocation;
}


@Column(name="current_org")
public String getCurrent_org() {
	return current_org;
}
public void setCurrent_org(String current_org) {
	this.current_org = current_org;
}


@Column(name="relevantExp")
public String getRelevantExp() {
	return relevantExp;
}
public void setRelevantExp(String relevantExp) {
	this.relevantExp = relevantExp;
}

public Integer getCandidateid() {
	return candidateid;
}
public void setCnadidateid(Integer candidateid) {
	this.candidateid = candidateid;
}
public String getPancard() {
	return pancard;
}
public void setPancard(String pancard) {
	this.pancard = pancard;
}
public Date getHbstart_date() {
	return hbstart_date;
}
public void setHbstart_date(Date hbstart_date) {
	this.hbstart_date = hbstart_date;
}
public Date getHbend_date() {
	return hbend_date;
}
public void setHbend_date(Date hbend_date) {
	this.hbend_date = hbend_date;
}
public String getAltcnt_number() {
	return altcnt_number;
}
public void setAltcnt_number(String altcnt_number) {
	this.altcnt_number = altcnt_number;
}
public String getEmailID() {
	return emailID;
}
public void setEmailID(String emailID) {
	this.emailID = emailID;
}

public String getPrimaryskill() {
	return primaryskill;
}
public void setPrimaryskill(String primaryskill) {
	this.primaryskill = primaryskill;
}
public String getSecskill() {
	return secskill;
}
public void setSecskill(String secskill) {
	this.secskill = secskill;
}
/*public List<CandidateJobs> getCandidatejobList() {
	return candidatejobList;
}
public void setCandidatejobList(List<CandidateJobs> candidatejobList) {
	this.candidatejobList = candidatejobList;
}*/
public String getHighest_qualification() {
	return highest_qualification;
}
public void setHighest_qualification(String highest_qualification) {
	this.highest_qualification = highest_qualification;
}

public String getFile_upload_name() {
	return file_upload_name;
}
public void setFile_upload_name(String file_upload_name) {
	this.file_upload_name = file_upload_name;
}
public String getModeofinterview() {
	return modeofinterview;
}

public void setModeofinterview(String modeofinterview) {
	this.modeofinterview = modeofinterview;
}

public Date getInterviewdate() {
	return interviewdate;
}

public void setInterviewdate(Date interviewdate2) {
	this.interviewdate = interviewdate2;
}

public String getNoticeprd_negotiable() {
	return noticeprd_negotiable;
}
public void setNoticeprd_negotiable(String noticeprd_negotiable) {
	this.noticeprd_negotiable = noticeprd_negotiable;
}
public String getDesc_np_negotion() {
	return desc_np_negotion;
}
public void setDesc_np_negotion(String desc_np_negotion) {
	this.desc_np_negotion = desc_np_negotion;
}
public String getInt_pipeline_com() {
	return int_pipeline_com;
}
public void setInt_pipeline_com(String int_pipeline_com) {
	this.int_pipeline_com = int_pipeline_com;
}
public String getF2f_intervew() {
	return f2f_intervew;
}
public void setF2f_intervew(String f2f_intervew) {
	this.f2f_intervew = f2f_intervew;
}


public Date getDoj_cur_org() {
	return doj_cur_org;
}
public void setDoj_cur_org(Date doj_cur_org) {
	this.doj_cur_org = doj_cur_org;
}
public Date getPrev_relivd_date() {
	return prev_relivd_date;
}
public void setPrev_relivd_date(Date prev_relivd_date) {
	this.prev_relivd_date = prev_relivd_date;
}
public Date getPrev_start_date() {
	return prev_start_date;
}
public void setPrev_start_date(Date prev_start_date) {
	this.prev_start_date = prev_start_date;
}
public String getCan_native_loc() {
	return can_native_loc;
}
public void setCan_native_loc(String can_native_loc) {
	this.can_native_loc = can_native_loc;
}
public String getPrim_skill_rate() {
	return prim_skill_rate;
}
public void setPrim_skill_rate(String prim_skill_rate) {
	this.prim_skill_rate = prim_skill_rate;
}
public String getSec_skill_rate() {
	return sec_skill_rate;
}
public void setSec_skill_rate(String sec_skill_rate) {
	this.sec_skill_rate = sec_skill_rate;
}
public String getComm_skills_rate() {
	return comm_skills_rate;
}
public void setComm_skills_rate(String comm_skills_rate) {
	this.comm_skills_rate = comm_skills_rate;
}
public String getRep_mgr_name() {
	return rep_mgr_name;
}
public void setRep_mgr_name(String rep_mgr_name) {
	this.rep_mgr_name = rep_mgr_name;
}
public String getMgr_official_emailid() {
	return mgr_official_emailid;
}
public void setMgr_official_emailid(String mgr_official_emailid) {
	this.mgr_official_emailid = mgr_official_emailid;
}
public String getIs_tek_payroll() {
	return is_tek_payroll;
}
public void setIs_tek_payroll(String is_tek_payroll) {
	this.is_tek_payroll = is_tek_payroll;
}
public String getIs_working() {
	return is_working;
}
public void setIs_working(String is_working) {
	this.is_working = is_working;
}
public String getCur_cmpny_name() {
	return cur_cmpny_name;
}
public void setCur_cmpny_name(String cur_cmpny_name) {
	this.cur_cmpny_name = cur_cmpny_name;
}
public String getDuration() {
	return duration;
}
public void setDuration(String duration) {
	this.duration = duration;
}
public String getPrev_org() {
	return prev_org;
}
public void setPrev_org(String prev_org) {
	this.prev_org = prev_org;
}
public String getBank_stmt() {
	return bank_stmt;
}
public void setBank_stmt(String bank_stmt) {
	this.bank_stmt = bank_stmt;
}
public String getBank_name() {
	return bank_name;
}
public void setBank_name(String bank_name) {
	this.bank_name = bank_name;
}
public String getBank_loc() {
	return bank_loc;
}
public void setBank_loc(String bank_loc) {
	this.bank_loc = bank_loc;
}
public String getCmpny_docs() {
	return cmpny_docs;
}
public void setCmpny_docs(String cmpny_docs) {
	this.cmpny_docs = cmpny_docs;
}
public String getJob_change() {
	return job_change;
}
public void setJob_change(String job_change) {
	this.job_change = job_change;
}
public String getIntrw_pipeline() {
	return intrw_pipeline;
}
public void setIntrw_pipeline(String intrw_pipeline) {
	this.intrw_pipeline = intrw_pipeline;
}
public String getOffer_inhand() {
	return offer_inhand;
}
public void setOffer_inhand(String offer_inhand) {
	this.offer_inhand = offer_inhand;
}
public String getFamily_bckgrund() {
	return family_bckgrund;
}
public void setFamily_bckgrund(String family_bckgrund) {
	this.family_bckgrund = family_bckgrund;
}
public String getSpouse_wrk() {
	return spouse_wrk;
}
public void setSpouse_wrk(String spouse_wrk) {
	this.spouse_wrk = spouse_wrk;
}
public String getKids_info() {
	return kids_info;
}
public void setKids_info(String kids_info) {
	this.kids_info = kids_info;
}
public String getResn_reloc() {
	return resn_reloc;
}
public void setResn_reloc(String resn_reloc) {
	this.resn_reloc = resn_reloc;
}
	
 }


