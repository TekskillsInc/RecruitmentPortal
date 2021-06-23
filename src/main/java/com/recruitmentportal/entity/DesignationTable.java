 package com.recruitmentportal.entity;
 
 import java.io.Serializable;

import javax.persistence.Entity;
 import javax.persistence.Id;
 
 @Entity
 @javax.persistence.Table(name="designation_table")
 public class DesignationTable implements Serializable
 {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
   private int desg_ID;
   private String desg_name;
   
   public int getDesg_ID()
   {
     return this.desg_ID;
   }
   
   public void setDesg_ID(int desg_ID) {
     this.desg_ID = desg_ID;
   }
   
   public String getDesg_name() {
     return this.desg_name;
   }
   
   public void setDesg_name(String desg_name) {
     this.desg_name = desg_name;
   }
 }


