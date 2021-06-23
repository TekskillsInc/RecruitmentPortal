 package com.recruitmentportal.entity;
 
 import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
 @Entity
 @Table(name="Tbl_RecPortal_CompanyDescription")
 public class CompanyDescription implements Serializable
 {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Id
   @GeneratedValue
   @Column(name="cmpny_id")
   private Integer cmpny_id;
   
   @Column(name="cmpny_name")
   private String cmpny_name;
   
   @Column(name="submit_date")
   @Temporal(TemporalType.DATE)
   private Date submit_date;
   
   public Date getSubmit_date()
   {
     return this.submit_date;
   }
   
   public void setSubmit_date(Date submit_date) 
   { 
	   this.submit_date = submit_date; 
	   }
   
   public Integer getCmpny_id() {
     return this.cmpny_id;
   }
   
   public void setCmpny_id(Integer cmpny_id) 
   { 
	   this.cmpny_id = cmpny_id;
   }
   
   public String getCmpny_name() {
     return this.cmpny_name;
   }
   
   public void setCmpny_name(String cmpny_name) 
   { 
	   this.cmpny_name = cmpny_name; 
	   }
 }


