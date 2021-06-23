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
@Table(name="TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS")
public class TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="clk_id")
	private Integer clk_id;
   
	    @Column(name="candidate_id")
	    private int candidate_id;
	
	    @Column(name="ssc")
	    private String ssc;
	
	    @Column(name="intermediate")
	    private String intermediate;

	    @Column(name="graduation")
		private String graduation;
	    
	    @Column(name="post_graduation")
		private String post_graduation;

	    @Column(name="others")
		private String others;
	    
	    @Column(name="comments")
	  	private String comments;
	    

		@Column(name="subbmited_by")
	  	private int subbmited_by;
	    
	    @Temporal(TemporalType.DATE)
	    @Column(name="submmited_date")
	   	private Date submmited_date;
	    

	    public Integer getClk_id() {
			return clk_id;
		}

		public void setClk_id(Integer clk_id) {
			this.clk_id = clk_id;
		}

		public int getCandidate_id() {
			return candidate_id;
		}

		public void setCandidate_id(int candidate_id) {
			this.candidate_id = candidate_id;
		}

		public String getSsc() {
			return ssc;
		}

		public void setSsc(String ssc) {
			this.ssc = ssc;
		}

		public String getIntermediate() {
			return intermediate;
		}

		public void setIntermediate(String intermediate) {
			this.intermediate = intermediate;
		}

		public String getGraduation() {
			return graduation;
		}

		public void setGraduation(String graduation) {
			this.graduation = graduation;
		}

		public String getPost_graduation() {
			return post_graduation;
		}

		public void setPost_graduation(String post_graduation) {
			this.post_graduation = post_graduation;
		}

		public String getOthers() {
			return others;
		}

		public void setOthers(String others) {
			this.others = others;
		}

		public String getComments() {
			return comments;
		}

		public void setComments(String comments) {
			this.comments = comments;
		}

		public int getSubbmited_by() {
			return subbmited_by;
		}

		public void setSubbmited_by(int subbmited_by) {
			this.subbmited_by = subbmited_by;
		}

		public Date getSubmmited_date() {
			return submmited_date;
		}

		public void setSubmmited_date(Date submmited_date) {
			this.submmited_date = submmited_date;
		}




}
