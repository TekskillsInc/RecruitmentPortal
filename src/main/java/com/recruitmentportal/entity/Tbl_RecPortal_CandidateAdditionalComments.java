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
@Table(name="Tbl_RecPortal_CandidateAdditionalComment")
public class Tbl_RecPortal_CandidateAdditionalComments implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="tbl_pk")
	 private Integer tbl_pk;

	 @Column(name="candidateid")
	 private int candidateid;
	   
	@Column(name="comment")
	   private String comment;
	 
    @Column(name="commentType")
	   private String commentType;
	 
    @Column(name="commentedBy")
	    private int commentedBy;
	   
	@Temporal(TemporalType.DATE)
	@Column(name = "commentedDate")
	   private Date commentedDate;

	public Integer getTbl_pk() {
		return tbl_pk;
	}

	public void setTbl_pk(Integer tbl_pk) {
		this.tbl_pk = tbl_pk;
	}

	public int getCandidateid() {
		return candidateid;
	}

	public void setCandidateid(int candidateid) {
		this.candidateid = candidateid;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommentType() {
		return commentType;
	}

	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}

	public int getCommentedBy() {
		return commentedBy;
	}

	public void setCommentedBy(int commentedBy) {
		this.commentedBy = commentedBy;
	}

	public Date getCommentedDate() {
		return commentedDate;
	}

	public void setCommentedDate(Date commentedDate) {
		this.commentedDate = commentedDate;
	}

}
