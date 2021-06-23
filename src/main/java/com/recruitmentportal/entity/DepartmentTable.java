 package com.recruitmentportal.entity;
 
 import java.io.Serializable;

import javax.persistence.Entity;
 import javax.persistence.Id;
 import javax.persistence.Table;
 
 @Entity
 @Table(name="TBL_OBT_EMPLOYEE_DEPARTMENT")
 public class DepartmentTable implements Serializable
 {
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
@Id
   private Integer dept_ID;
   private String dept_name;
   
   public Integer getDept_ID()
   {
     return this.dept_ID;
   }
   
   public void setDept_ID(Integer dept_ID) {
     this.dept_ID = dept_ID;
   }
   
   public String getDept_name() {
     return this.dept_name;
   }
   
   public void setDept_name(String dept_name) {
     this.dept_name = dept_name;
   }
 }


