package com.recruitmentportal.DAO;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.recruitmentportal.DTO.CCategoryReportDTO;
import com.recruitmentportal.DTO.CandidateInfoDTO;
import com.recruitmentportal.DTO.CandidateInfoDTONew;
import com.recruitmentportal.DTO.CandidatePercentDTO;
import com.recruitmentportal.DTO.CandidatePersonnelInfoDTO;
import com.recruitmentportal.DTO.CandidateStatusDTO;
import com.recruitmentportal.DTO.DisplayRequirementsDTO;
import com.recruitmentportal.DTO.JobAllocationDTO;
import com.recruitmentportal.DTO.JobProfileCountDto;
import com.recruitmentportal.DTO.ResumeDTO;
import com.recruitmentportal.DTO.SctReportDto;
import com.recruitmentportal.DTO.UserDTO;
import com.recruitmentportal.DTO.ViewUserProfilesSCTStatusDTO;
import com.recruitmentportal.controller.HandlingException;
import com.recruitmentportal.entity.CandidateFeedBack;
import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.CompanyDescription;
import com.recruitmentportal.entity.CompanyNoticePeriod;
import com.recruitmentportal.entity.DepartmentTable;
import com.recruitmentportal.entity.DocVerifierComments;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.JobAllocation;
import com.recruitmentportal.entity.JobAllocationRecruiter;
import com.recruitmentportal.entity.JobAllocationTL;
import com.recruitmentportal.entity.JobMandatorySkills;
import com.recruitmentportal.entity.JobStatus;
import com.recruitmentportal.entity.Jobdescription;
import com.recruitmentportal.entity.PreOnboardingPayslipDetails;
import com.recruitmentportal.entity.PreOnbordingEmployerDetials;
import com.recruitmentportal.entity.PreOnbordingPersonnelDetails;
import com.recruitmentportal.entity.PreonboardingEducationDetails;
import com.recruitmentportal.entity.RecruiterDailySubmissions;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS;
import com.recruitmentportal.entity.Tbl_RecPortal_CandidateAdditionalComments;
import com.recruitmentportal.entity.Tbl_RecPortal_CandidateAdditionalInfo;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;
import com.recruitmentportal.entity.Tbl_RecPortal_PreobtStatus;
import com.recruitmentportal.entity.Tbl_RecPortal_SCTComments;
import com.recruitmentportal.entity.Tbl_RecPortal_candidateAttachments;
import com.recruitmentportal.entity.Tbl_RecPortal_tecpanelFeedBack;

@Repository
public class RecruitmentPortalDAO {
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(RecruitmentPortalDAO.class);
	  private Session getCurrentSession() {

	        return sessfact.getCurrentSession();
	    } 
	@Transactional(propagation = Propagation.REQUIRED)
	public Integer saveLoginUserData(RecruitmentportalLogin reclogin) throws HandlingException {
		 Integer generatedId=null;
		 try {
		 generatedId= (Integer) getCurrentSession().save(reclogin);
	}catch (Exception ex) {
		logger.error("Exception raised in the method saveLoginUserData:", ex);
		
			
		
	}
		return generatedId;
	 }

	@Transactional(propagation = Propagation.REQUIRED)
	public List<DepartmentTable> getDepartments(String designation) throws HandlingException {
		 List<DepartmentTable> departments=null;
		 try{
				Criteria criteria=getCurrentSession().createCriteria(DepartmentTable.class);
				 Disjunction objDisjunction = Restrictions.disjunction();
				 	objDisjunction.add(Restrictions.eq("dept_ID", 1));
			        objDisjunction.add(Restrictions.eq("dept_ID", 3));
			        objDisjunction.add(Restrictions.eq("dept_ID", 5));
			        objDisjunction.add(Restrictions.eq("dept_ID", 6));
			        objDisjunction.add(Restrictions.eq("dept_ID", 10));
			        objDisjunction.add(Restrictions.eq("dept_ID", 12));
			        if(designation.equalsIgnoreCase("Admin")){
			        objDisjunction.add(Restrictions.eq("dept_ID", 7));
		 				}
			        criteria.add(objDisjunction);
			        criteria.setProjection(Projections.projectionList().add(Projections.property("dept_ID"), "dept_ID")
																	   .add(Projections.property("dept_name"),"dept_name"));
					criteria.setResultTransformer(new AliasToBeanResultTransformer(DepartmentTable.class));
			        departments=criteria.list();
			        
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getDepartments:", ex);
				
			}
		return departments;
	}
	 		//We are getting all Team leads not managers based on updated requirement.dont confuse
		@Transactional(propagation = Propagation.REQUIRED)
			public List<RecruitmentportalLogin> getManagers() throws HandlingException {
				 List<RecruitmentportalLogin> managerList=null;
					
					try{
					Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rec");
					criteria.createAlias("rec.department", "dept");
				
					criteria.add(Restrictions.eq("employee_role", "TEAMLEAD"));
					criteria.add(Restrictions.eq("empStatus", "Active"));
					criteria.setProjection(
							Projections.projectionList().add(Projections.property("userName"), "userName")
										.add(Projections.property("emp_number"),"emp_number")
										);
					criteria.setResultTransformer(new AliasToBeanResultTransformer(RecruitmentportalLogin.class));
					managerList=criteria.list();
				}
					catch (Exception ex) {
						logger.error("Exception raised in the method getManagersByDepartment:", ex);
						
					}
					
					return managerList;
					
			}
		
		
		@Transactional(propagation = Propagation.REQUIRED)
		   public CompanyDescription findBycompanyname(String cmpny_name) throws HandlingException
		   {
			 CompanyDescription result = null;
			 try{
		    // Session session = this.sessfact.getCurrentSession();
		     String hql = "from CompanyDescription u where u.cmpny_name =:companyName";
		     result = (CompanyDescription) getCurrentSession().createQuery(hql).setParameter("companyName", cmpny_name).uniqueResult();
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method findBycompanyname:", ex);


					
				}
		     return result;
		   }
		 
		@Transactional(propagation = Propagation.REQUIRED)
		   public void addClients(CompanyDescription company) throws HandlingException
		   {
			 try{
		    //
				 getCurrentSession().save(company);
			 }
		     catch (Exception ex) {
					logger.error("Exception raised in the method addClients:", ex);
					 
				}
		   }
		 
		@Transactional(propagation = Propagation.REQUIRED)
		public List<RecruitmentportalLogin> getAllUsers() throws HandlingException {
			 List<RecruitmentportalLogin> userList=null;
			 try{
					
					Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class);
					userList=criteria.list();
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getAllUsers:", ex);
					
				}
			return userList;
		}
			
		  @Transactional(propagation = Propagation.REQUIRED)
		   public void updateEmploye(Integer empNo, Integer deptId, String designation, String userLead, String status_edit) throws HandlingException
		   {
			     RecruitmentportalLogin userUpdate = null;
			   try{
			   	// Session session = sessfact.getCurrentSession();
			   	 Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class);
			   	criteria.add(Restrictions.eq("emp_number", empNo));
			   	userUpdate = (RecruitmentportalLogin)criteria.uniqueResult();
			     if(userUpdate!=null){
			     
			     DepartmentTable department = new DepartmentTable();
			     department.setDept_ID(deptId);
			     userUpdate.setUpdatedDate(new Date());
			     userUpdate.setEmployee_role(designation);
			     userUpdate.setDepartment(department);
			     userUpdate.setEmpStatus(status_edit);
			     if(userLead!=null){
			     userUpdate.setEmp_lead(Integer.parseInt(userLead));
			     }
			     else{
			    	 userUpdate.setEmp_lead(null);
			     }
			     getCurrentSession().update(userUpdate);
			     }
		   }
		   catch (Exception ex) {
				logger.error("Exception raised in the method updateEmploye:", ex);
				
			}
		   }

		   
		 @Transactional(propagation = Propagation.REQUIRED)
		public List<CompanyDescription> getAllClients() throws HandlingException {
			  List<CompanyDescription> clientList=null;
			  try
			  {
				 // 
				  Criteria criteria=getCurrentSession().createCriteria(CompanyDescription.class);
				  clientList=criteria.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method updateEmploye:", ex);
					 
				}
			return clientList;
		}
		 
		 @Transactional(propagation = Propagation.REQUIRED)
			public String getAllClientsById(String cid) throws HandlingException {
				  String clientList=null;
				  Integer compId=null;
				  if(cid!=null) {
					  compId=Integer.parseInt(cid);
				  }
				  try
				  {
					 // 
					  String hql="select cmpny_name from CompanyDescription where cmpny_id="+compId+"";
					  clientList=(String) getCurrentSession().createQuery(hql).uniqueResult();
				  }
				  catch (Exception ex) {
						logger.error("Exception raised in the method getAllClientsRest:", ex);
						 
					}
				return clientList;
			}


		@Transactional(propagation = Propagation.REQUIRED)
		public Jobdescription findJobDescById(String jobid) throws HandlingException {
			 Integer jobId=null;
			 if(jobid!=null) {
			 jobId=Integer.parseInt(jobid);
			 }
			 Jobdescription jobDescObj=null;
			 try{
				 //
				  Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class);
				  criteria.setFetchMode("company", FetchMode.EAGER);
				  criteria.add(Restrictions.eq("jobdescid", jobId));
				  jobDescObj=(Jobdescription) criteria.uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateEmploye:", ex);
					
				}
			return jobDescObj;
		}

		@Transactional(propagation = Propagation.REQUIRED)
		public Integer addjobDesc(Jobdescription jobDesc) throws HandlingException {
			 Integer jobDescId=null;
			 try{
				//  
				 jobDescId=(Integer) getCurrentSession().save(jobDesc);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method addjobDesc:", ex);
				
				}
			return jobDescId;
		}

		@Transactional(propagation = Propagation.REQUIRED)
		public void saveJobAllocation(JobAllocation jobAllocation) throws HandlingException {
			 try{
				 // 
				 getCurrentSession().save(jobAllocation);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method saveJobAllocation:", ex);
					 }
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
			public void updateUnAssign(JobAllocation jobAllocation) throws HandlingException {
				 try{
					  
					 getCurrentSession().update(jobAllocation);
				 }
				 catch (Exception ex) {
						logger.error("Exception raised in the method updateUnAssign:", ex);
						 
				 }
			}
		 
		@Transactional(propagation = Propagation.REQUIRED)
		public List<Jobdescription> getAllJobDescription(Integer loginEmpNumber) throws HandlingException {
			 List<Jobdescription> jdList=null;
			  try
			  {
				// 
				 String sql= "exec allJobDescription @loginemp="+loginEmpNumber+",@fromdate ='',@todate=''";
					Query query = getCurrentSession().createSQLQuery(sql).addEntity(Jobdescription.class);
				 
				  jdList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAllJobDescription:", ex);
					 
				}
			return jdList;
		}
		 
		@Transactional(propagation = Propagation.REQUIRED)
		public List<Integer> getAssignToByJobID(Integer jobdescid, Integer empNumber,String role) throws HandlingException {
			List<Integer> allocationList=null;
			 try
			  {
				 
				  
					 if(role.equalsIgnoreCase("BDM")){
						 String sql="select tlempno from Tbl_RecPortal_TlAllocation where bdEmpNo="+empNumber+" and jobdescid="+jobdescid+"";
					allocationList = getCurrentSession().createSQLQuery(sql).list();
					 }
				else {
					String sql="select recempno from Tbl_RecPortal_RECAllocation where tlEmpno="+empNumber+" and jobdescid="+jobdescid+"";
					allocationList = getCurrentSession().createSQLQuery(sql).list();
				
						}
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAssignToByJobID:", ex);
					 
				}
			return allocationList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public UserDTO getUserNameByEmpNo(Integer empNumber, String role) throws HandlingException {
			 UserDTO userName=null;
			try
			  {
				 // 
				  Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class);
					criteria.add(Restrictions.eq("emp_number", empNumber));
					criteria.add(Restrictions.eq("employee_role", role));
					criteria.setProjection(
							Projections.projectionList().add(Projections.property("userName"), "userName")
							.add(Projections.property("emp_number"), "emp_number")
							.add(Projections.property("email"), "email")
							.add(Projections.property("emp_lead"), "emp_lead")
							.add(Projections.property("employee_role"), "empRole"));
							
					criteria.setResultTransformer(new AliasToBeanResultTransformer(UserDTO.class));
					userName=(UserDTO) criteria.uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getUserNameByEmpNo:", ex);
					 
				}
			return userName;
		}

		@Transactional(propagation = Propagation.REQUIRED)
			public List<CandidateInfoDTO> getCandidateList(String role,Integer empNo, Integer jobId, String jobType,Integer assignedTl) throws HandlingException {
				 List<CandidateInfoDTO> canddateList=null;
			
				 try
				  {
					 String sql=null;
					  		
					 
					  		
					  		switch(role) {
							
							
							case "BDM":
								 
								
								if(jobType.equalsIgnoreCase("External")){
									sql="select jobid as jobId, recEmpNo as recEmpNo , candidateid as candidateId from Tbl_RecPortal_CandidateStatus where jobid="+jobId+" and tlEmpNo="+empNo+" and sctStatus is not null";
						  		
								}else {
									sql="select jobid as jobId, recEmpNo as recEmpNo , candidateid as candidateId from Tbl_RecPortal_CandidateStatus where jobid="+jobId+" and tlEmpNo="+empNo+" and tlStatus='Selected'";
									
								}
								break;
								
							case "TEAMLEAD":
								if(assignedTl!=null) {
									sql="select jobid as jobId, recEmpNo as recEmpNo , candidateid as candidateId from Tbl_RecPortal_CandidateStatus where jobid="+jobId+" and recEmpNo="+empNo+" and recStatus='Selected' and assignedTl="+assignedTl+"";
							  		}
								else {
									sql="select jobid as jobId, recEmpNo as recEmpNo , candidateid as candidateId from Tbl_RecPortal_CandidateStatus where jobid="+jobId+" and recEmpNo="+empNo+" and recStatus='Selected'";
								}
								break;
								
					  	}
					  		canddateList= getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoDTO.class)).list();
					  	
						
					  
				  }
				  catch (Exception ex) {
						logger.error("Exception raised in the method getCandidateList:", ex);
						
					}
				return canddateList;
			}
		 
		@Transactional(propagation = Propagation.REQUIRED)
		public List<CandidateInfoDTONew> getCandidateListSCT(Integer jobId) throws HandlingException {
			 List<CandidateInfoDTONew> canddateList=null;
		
			 try
			  {
				  String sql= "exec [REC_ViewProfilesByJdSCT] @jobid="+jobId+"";
				  Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoDTONew.class));
				  canddateList=query.list();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getCandidateList:", ex);
					
				}
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public CandidateInformation getCandidateInfoByCandidateID(
				Integer candidateId) throws HandlingException {
			 CandidateInformation candidateInfo=null;
			 try{
				 String hql="from CandidateInformation where candidateid="+candidateId+"";
				 candidateInfo=(CandidateInformation) getCurrentSession().createQuery(hql).uniqueResult();
			 }catch(Exception ex) {
					logger.error("Exception raised in the method getCandidateInfoByCandidateID:", ex);
					 
				}
			return candidateInfo;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<RecruitmentportalLogin> getUsersByDesignation(
				String designation) throws HandlingException {
			 List<RecruitmentportalLogin> userList=null;
				
				try{
				//Session session = sessfact.getCurrentSession();
				Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rec");
				
				 
				if(designation.equalsIgnoreCase("RECRUITER")){
					criteria.add(Restrictions.eq("employee_role", "TEAMLEAD"));
				}
				criteria.setProjection(
						Projections.projectionList().add(Projections.property("userName"), "userName")
									.add(Projections.property("emp_number"),"emp_number"));
				criteria.setResultTransformer(new AliasToBeanResultTransformer(RecruitmentportalLogin.class));
				userList=criteria.list();
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method getUsersByDesignation:", ex);
					
				}
				
				return userList;
				
		}
		
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<DisplayRequirementsDTO> getTLAllJobDesc(Integer empNumber, Integer bdempno, Integer clienid) throws HandlingException {
			
			List<DisplayRequirementsDTO> jdList=null;
			  try
			   
			  {
				  
				  String sql= "exec REC_TLDisplayRequirements @loginEmpNo="+empNumber+",@bdEmpNo="+bdempno+",@clientId="+clienid+"";
					Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
					 jdList=query.list();
			  }
				catch (Exception ex) {
					logger.error("Exception raised in the method getTLAllJobDesc:", ex);
					
				}
			return jdList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<DisplayRequirementsDTO> getRecAllJobDesc(Integer empNumber, Integer bdempno, Integer clienid) throws HandlingException {
			
			List<DisplayRequirementsDTO> jdList=null;
			  try
			   
			  {
				  
				  String sql= "exec REC_RecruiterDisplayRequirements @loginEmpNo="+empNumber+",@bdEmpNo="+bdempno+",@clientId="+clienid+"";
					Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
					 jdList=query.list();
			  }
				catch (Exception ex) {
					logger.error("Exception raised in the method getRecAllJobDesc:", ex);
				
				}
			return jdList;
		}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<JobAllocationDTO> getAllJobDesc(Integer empNumber) throws HandlingException {
			 List<JobAllocationDTO> jdList=null;
				
				try{
				//Session session = sessfact.getCurrentSession();
				Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				criteria.createAlias("job.jobDesc", "jd");
				criteria.createAlias("jd.company", "cm");
				criteria.add(Restrictions.eq("assignedto", empNumber));
				//criteria.add(Restrictions.ne("jd.jobstatus","Req Closed"));
				  criteria.add(Restrictions.eq("jd.jobstatus","Open"));
				criteria.addOrder(Order.asc("jd.createdDate"));
				criteria.setProjection(
						Projections.projectionList().add(Projections.property("jd.jobdescid"), "jdID").add(Projections.property("jd.jobDescription"), "jobDescription")
						.add(Projections.property("jd.createdby"), "createdby")
						.add(Projections.property("cm.cmpny_name"), "cmpny_name")
						.add(Projections.property("job.empstatus"), "empStatus")
						.add(Projections.property("job.assignedby"), "assignedBy")
						);
						
				criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocationDTO.class));
				jdList=criteria.list();
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method getAllJobDesc:", ex);
					
				}
			return jdList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Jobdescription getjobDescriptionByJobID(Integer jdID) throws HandlingException {
			 Jobdescription jobDescObj=null;
			 try{
				 
				  Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class);
				  criteria.setFetchMode("company", FetchMode.EAGER);
				  criteria.add(Restrictions.eq("jobdescid", jdID));
				  jobDescObj=(Jobdescription) criteria.uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateEmploye:", ex);
					
				}
			return jobDescObj;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<UserDTO> getUsersByEmpNo(Integer empNumber,String role) throws HandlingException {
			 List<UserDTO> userList=null;
			 try
			  {
				  
				  Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rec");
				  criteria.createAlias("rec.department", "dept");
					switch(role) {
					
						
					case "BDM":
						criteria.add(Restrictions.eq("employee_role", "TEAMLEAD"));
						criteria.add(Restrictions.eq("empStatus", "Active"));
						break;
						
					case "TEAMLEAD":
						criteria.add(Restrictions.eq("emp_lead", empNumber));
						criteria.add(Restrictions.eq("employee_role", "RECRUITER"));
						criteria.add(Restrictions.eq("empStatus", "Active"));
						break;
						
						
					}
					
						
					
					criteria.setProjection(
							Projections.projectionList().add(Projections.property("userName"), "userName")
							.add(Projections.property("emp_number"), "emp_number")
							.add(Projections.property("dept.dept_ID"), "deptId")
							
							);
					criteria.setResultTransformer(new AliasToBeanResultTransformer(UserDTO.class));
					userList= criteria.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getUsersByEmpNo:", ex);
					
				}
			return userList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Long getJobAssignedOrNot(Integer jobid,Integer empNumber, String role) throws HandlingException {
			 Long count =null;
			 try
			 
			  {
				  	
				  	Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				  	criteria.createAlias("job.jobDesc", "desc");
				  	criteria.add(Restrictions.eq("desc.jobdescid", jobid));
				  	if(!role.equalsIgnoreCase("DELIVERYTEAM")) {
					criteria.add(Restrictions.eq("job.assignedby", empNumber));
					}
				  	else if(!role.equalsIgnoreCase("BDM")) {
						criteria.add(Restrictions.eq("job.assignedby", empNumber));
						}
					
					criteria.setProjection(Projections.rowCount());
					count = (Long)criteria.uniqueResult();
					System.out.println("count--"+count);
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getJobAssignedOrNot:", ex);
					
				}
			return count;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public CandidatePercentDTO getPercentageByCandidateID(
				Integer candidateid) throws HandlingException {
			 CandidatePercentDTO candidateObj=null;
			 try
			  {
				  	
				  	Criteria criteria=getCurrentSession().createCriteria(CandidateInformation.class);
					criteria.add(Restrictions.eq("candidateid", candidateid));
					criteria.setProjection(
							Projections.projectionList()
							.add(Projections.property("first_name"), "candidateName")
							.add(Projections.property("ssc"), "ssc")
							.add(Projections.property("bIEplus12"), "interperc")
							.add(Projections.property("graduation"), "graduation")
							.add(Projections.property("post_Graduation"), "pg"));
					criteria.setResultTransformer(new AliasToBeanResultTransformer(CandidatePercentDTO.class));
					
					candidateObj = (CandidatePercentDTO) criteria.uniqueResult();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getPercentageByCandidateID:", ex);
					
				}
			return candidateObj;
		}
		 
		@Transactional(propagation = Propagation.REQUIRED)
		public String candidateExistOrNot(String pan_num) throws HandlingException {
			 String pan=null;
			 try
			  {
				  	
				  	 String sql="select pancard from Tbl_RecPortal_CandidateInformation where pancard='"+pan_num+"'";
				  	pan=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method candidateExistOrNot:", ex);
					
				}
			return pan;
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public int addCandidate(CandidateInformation candidateInfo) throws HandlingException {
			 logger.info("Came to Dao of add candidate---");
			 Integer candidateid=null;
			 try{
				 
				 candidateid=(Integer) getCurrentSession().save(candidateInfo);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method addCandidate:", ex);
					
				}
			
			return candidateid;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public void saveInterviewDetails(InterviewDetails interviewObj) throws HandlingException {
			 try{
				 
				 getCurrentSession().save(interviewObj);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method saveInterviewDetails:", ex);
					
				}
			
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Integer saveCandidateStatus(CandidateStatus candidatestatus) throws HandlingException {
			Integer candidateId=null;
			 try{
				 
				  candidateId=(Integer) getCurrentSession().save(candidatestatus); 
				 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method saveCandidateStatus:", ex);
					
				}
			return candidateId;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public CandidateStatus getStatusByCandidateID(Integer candidateid,Integer jobid) throws HandlingException {
			 CandidateStatus statusObj=null;
			try
			  {
				  	
				  	Criteria criteria=getCurrentSession().createCriteria(CandidateStatus.class,"cs");
				  	criteria.createAlias("cs.candidate", "can");
					criteria.add(Restrictions.eq("can.candidateid", candidateid));
					criteria.createAlias("cs.jobdesc", "job");
					criteria.add(Restrictions.eq("job.jobdescid", jobid));
					statusObj = (CandidateStatus) criteria.uniqueResult();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getStatusByCandidateID:", ex);
					
				}
			
			return statusObj;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public void saveCandidateStutusByCandidateID(
				CandidateStatus candidateStatus) throws HandlingException {
			try{
				 
				getCurrentSession().update(candidateStatus); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getPercentageByCandidateID:", ex);
					
				}
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public void updateCandidate(CandidateInformation candidateInfo) throws HandlingException {
			 try{
				 
				 getCurrentSession().update(candidateInfo); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateCandidate:", ex);
					
				}
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public void updatejobDesc(Jobdescription jd) throws HandlingException {
			 try{
				 
				 getCurrentSession().update(jd); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updatejobDesc:", ex);
				
				}
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public JobAllocation getAssigneeDataByJobID(Integer jobDescId,Integer empNumber) throws HandlingException {
			 JobAllocation allocationObj=null;
			 try
			  {
				  
				  Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				  criteria.createAlias("job.jobDesc", "desc");
					criteria.add(Restrictions.eq("desc.jobdescid", jobDescId));
					criteria.add(Restrictions.eq("assignedto", empNumber));
					criteria.setProjection(
							Projections.projectionList().add(Projections.property("assignedto"), "assignedto")
							.add(Projections.property("assignedby"), "assignedby"));
					criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocation.class));
					allocationObj=(JobAllocation) criteria.uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAssigneeDataByJobID:", ex);
					
				}
			return allocationObj;
		}
		@Transactional(propagation = Propagation.REQUIRED)
			public Integer getAssignedTl(Integer jobDescId,Integer empNumber) throws HandlingException {
				 Integer assignedtl=null;
				 try
				  {
					  
					 // String sql="select assignedby from Tbl_RecPortal_JobAllocation where assignedto="+empNumber+"and jobdescid="+jobDescId+"and empstatus='Active'";
					  String sql="select tlEmpNo from Tbl_RecPortal_RecAllocation where recEmpNo="+empNumber+"and jobdescid="+jobDescId+"and empstatus='Active'";
					  assignedtl=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
					  
				  }
				  catch (Exception ex) {
						logger.error("Exception raised in the method getAssignedTl:", ex);
						
					}
				return assignedtl;
			}
		@Transactional(propagation = Propagation.REQUIRED)
		public JobAllocation checkAssignedToUserOrNot(Integer jobid,
				Integer assigneeEmp, Integer loginEmpNumber) throws HandlingException {
			 JobAllocation allocatedornot=null;
			 try
			  {
				  
				 Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				  criteria.createAlias("job.jobDesc", "desc");
					criteria.add(Restrictions.eq("desc.jobdescid", jobid));
					criteria.add(Restrictions.eq("job.assignedto", assigneeEmp));
					criteria.add(Restrictions.eq("job.assignedby", loginEmpNumber));
					allocatedornot=(JobAllocation) criteria.uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method checkAssignedToUserOrNot:", ex);
					
				}
			return allocatedornot;
		}

		@Transactional(propagation = Propagation.REQUIRED)
		public List<UserDTO> recruiteList() throws HandlingException {
			 List<UserDTO> list=null;
				
				try{
				//Session session = sessfact.getCurrentSession();
				Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rec");
				
				criteria.add(Restrictions.eq("employee_role", "RECRUITER"));
				criteria.setProjection(
						Projections.projectionList().add(Projections.property("userName"), "userName")
									.add(Projections.property("emp_number"),"emp_number")
									.add(Projections.property("emp_lead"),"emp_lead"));
				criteria.setResultTransformer(new AliasToBeanResultTransformer(UserDTO.class));
				list=criteria.list();
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method recruiteList:", ex);
					
				}
			return list;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public JobAllocation getAssignToObj(Integer jobId, Integer emp_number) throws HandlingException {
			JobAllocation allocationObj=null;
			 try
			  {
				  
				  Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				  criteria.createAlias("job.jobDesc", "desc");
					criteria.add(Restrictions.eq("desc.jobdescid", jobId));
					criteria.add(Restrictions.eq("assignedto", emp_number));
					criteria.add(Restrictions.eq("involveTechnicalPanel", 1));
					criteria.setProjection(
							Projections.projectionList().add(Projections.property("assignedto"), "assignedto")
							.add(Projections.property("assignedby"), "assignedby"));
					criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocation.class));
					allocationObj=(JobAllocation) criteria.uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAssignToObj:", ex);
				
				}
			return allocationObj;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public CandidateStatus getCandidateStatusTableByCandidateId(
				Integer candidateid,Integer jobid) throws HandlingException {
			 CandidateStatus candidateObj=null;
			 try{
				 String hql="from CandidateStatus where jobdesc.jobdescid="+jobid+" and candidate.candidateid="+candidateid+"";
			/*
			 * Criteria
			 * criteria=getCurrentSession().createCriteria(CandidateStatus.class,"can_sts");
			 * criteria.createAlias("can_sts.candidate", "can");
			 * criteria.add(Restrictions.eq("can.candidateid", candidateid));
			 * criteria.createAlias("can_sts.jobdesc", "jd");
			 * criteria.add(Restrictions.eq("jd.jobdescid", jobid));
			 * candidateObj=(CandidateStatus) criteria.uniqueResult();
			 */
				 candidateObj=(CandidateStatus) getCurrentSession().createQuery(hql).uniqueResult();
				 
			 } catch (Exception ex) {
					logger.error("Exception raised in the method getCandidateStatusTableByCandidateId:", ex);
					
				}
			return candidateObj;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<JobAllocation> findJobAllocationById(String jobid,Integer loginEmpNo) throws HandlingException {
			 List<JobAllocation> allocationObjList=null;
			try{
				
			  	Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
			  	criteria.createAlias("job.jobDesc", "desc");
			  	if(jobid!=null){
			  	criteria.add(Restrictions.eq("desc.jobdescid", Integer.parseInt(jobid)));
			  	}
			  	criteria.add(Restrictions.eq("assignedby", loginEmpNo));
			  	
			  	criteria.setProjection(
						Projections.projectionList().add(Projections.property("assignedto"), "assignedto"));
			  	
				criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocation.class));
				allocationObjList=criteria.list();
				
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method findJobAllocationById:", ex);
					
				}
			return allocationObjList;
		}
			@Transactional(propagation = Propagation.REQUIRED)

		public CandidateStatusDTO getCandidateStutusByUser(Integer candidateId,
				Integer loginEmpNumber, String role,Integer jobid) throws HandlingException {
			 CandidateStatusDTO status=null;
			try {
				
				String sq=null;
				
				switch(role) {
				case "TEAMLEAD":
					sq="select tlStatus as status, tlComment as coment from Tbl_RecPortal_CandidateStatus where jobid="+jobid+"and tlEmpNo="+loginEmpNumber+" and candidateid="+candidateId+" ";
					break;
				case "SCT":
					sq="select sctstatus as status, sctcomment as coment from Tbl_RecPortal_CandidateStatus where jobid="+jobid+"and sctempno="+loginEmpNumber+" and candidateid="+candidateId+" ";
					break;
				case "RECRUITER":
					sq="select recStatus as status, recComment as coment from Tbl_RecPortal_CandidateStatus where jobid="+jobid+"and recempno="+loginEmpNumber+" and candidateid="+candidateId+" ";
					break;
				case "BDM":
					sq="select bdmStatus as status, bdmComment as coment from Tbl_RecPortal_CandidateStatus where jobid="+jobid+"and bdmempno="+loginEmpNumber+" and candidateid="+candidateId+" ";
					break;
					
				}
			  	
				Query query = getCurrentSession().createSQLQuery(sq).setResultTransformer(new AliasToBeanResultTransformer(CandidateStatusDTO.class));
				
			  
			  	status=(CandidateStatusDTO) query.uniqueResult();
				
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method getCandidateStutusByUser:", ex);
					String content = ex.toString();
					StringWriter errors = new StringWriter();
					ex.printStackTrace(new PrintWriter(errors));
					throw new HandlingException("Exception due to", errors.toString(), content);
				}
			return status;
		}
	@Transactional(propagation = Propagation.REQUIRED)
		public JobAllocation getJobAllocationOjOfAssignedTo(Integer assignedto,Integer jobid,Integer assignedby) throws HandlingException {
			 JobAllocation job=null;
			 try{
				 
				  	Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"ja");
				  	criteria.createAlias("ja.jobDesc", "jd");
				  	criteria.add(Restrictions.eq("jd.jobdescid", jobid)); 
				  	criteria.add(Restrictions.eq("assignedto", assignedto));
					criteria.add(Restrictions.eq("assignedby", assignedby));
				  	job=(JobAllocation) criteria.uniqueResult();
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getJobAllocationOjOfAssignedTo:", ex);
					String content = ex.toString();
					StringWriter errors = new StringWriter();
					ex.printStackTrace(new PrintWriter(errors));
					throw new HandlingException("Exception due to", errors.toString(), content);
				}
			return job;
		}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public void updateJobAllocation(JobAllocation allocateObj) throws HandlingException {
			 try{
				 
				 getCurrentSession().update(allocateObj);
				  	
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateJobAllocation:", ex);
					
				}
		}

		@Transactional(propagation = Propagation.REQUIRED)
		public Integer getDepatNoByEmpNo(Integer assignedTo) throws HandlingException {
			Integer deptNo=null;
			try{
			
			String sql="select dept_ID from Tbl_RecPortal_RecruitmentportalLogin where emp_number="+assignedTo;
			deptNo=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
			
		}
			 catch (Exception ex) {
					logger.error("Exception raised in the method getDepatNoByEmpNo:", ex);
					
				}
			return deptNo;
		 }
		@Transactional(propagation = Propagation.REQUIRED)
		public Jobdescription checkJobDescExistOrNot(String jobCode) throws HandlingException {
			 Jobdescription jobDescObj=null;
			 try{
				  
				  Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class);
				  criteria.add(Restrictions.eq("jobCode", jobCode));
				  jobDescObj=(Jobdescription) criteria.uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateEmploye:", ex);
					
				}
			return jobDescObj;
		}
		
@Transactional
		public List<JobAllocationDTO> getAllJdByDates(java.sql.Date sqlstartDate,
				java.sql.Date sqlendDate) throws HandlingException {
			List<JobAllocationDTO> jdList=null;
			try{
			//Session session = sessfact.getCurrentSession();
			Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class,"job");
			
			criteria.add(Restrictions.ge("createdDate", sqlstartDate));
			criteria.add(Restrictions.le("createdDate", sqlendDate));
			criteria.setProjection(
					Projections.projectionList().add(Projections.property("job.jobdescid"), "jdID"));
								
			criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocationDTO.class));
			jdList=criteria.list();
		}
			catch (Exception ex) {
				logger.error("Exception raised in the method getAllJobDesc:", ex);
				
			}
		return jdList;
			
		}
@Transactional
public JobStatus getJobStatusTableByJobId(Integer jobDescId) throws HandlingException {
	JobStatus jsObj=null;
	 try{
		 
		  Criteria criteria=getCurrentSession().createCriteria(JobStatus.class,"sts");
		  criteria.createAlias("sts.jobdesc", "job");
		  criteria.add(Restrictions.eq("job.jobdescid", jobDescId));
		  jsObj=(JobStatus) criteria.uniqueResult();
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getJobStatusTableByJobId:", ex);
			
		}
	return jsObj;
}
@Transactional(propagation = Propagation.REQUIRED)
public void updateJobStatusByJobId(JobStatus jdstatus) throws HandlingException {
	try{
		
		getCurrentSession().update(jdstatus);
	}
	catch (Exception ex) {
		logger.error("Exception raised in the method updateJobStatusByJobId:", ex);
		
	}
}
@Transactional
public Integer getEmployeeLeaByEmpNo(Integer tl_empNo) throws HandlingException {
	Integer mgrEmpNo=null;
	try{
		//Session session = sessfact.getCurrentSession(); 
	String sql="select emp_lead from Tbl_RecPortal_RecruitmentportalLogin where emp_number="+tl_empNo+"";
	mgrEmpNo=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
	}
		catch (Exception ex) {
			logger.error("Exception raised in the method updateCandidateStatusByJobId:", ex);
			
		
	}
	
	return mgrEmpNo;
}
@Transactional
public String getJobDescById(Integer jobid) throws HandlingException {
	
	 String jobDesc=null;
	 try{
		 
		  String sql="select jobDescription  from Tbl_RecPortal_Jobdescription where jobdescid="+jobid+"";//shows error in jsp while adding cretedby 
		  jobDesc=(String) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getJobDescById:", ex);
			
		}
	return jobDesc;
}
@Transactional
public String getJobCodeById(Integer jobid) throws HandlingException {
	
	 String jobDesc=null;
	 try{
		 
		  String sql="select jobCode  from Tbl_RecPortal_Jobdescription where jobdescid="+jobid+"";//shows error in jsp while adding cretedby 
		  jobDesc=(String) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getJobCodeById:", ex);
			
		}
	return jobDesc;
}
@Transactional
public Integer getWorkLoadCount(Integer empno) { 
	int reqcount=0;
	try {
	 
	 String sql="select COUNT(*)as reqcount from Tbl_RecPortal_JobAllocation where assignedto="+empno;
	  reqcount=(Integer)getCurrentSession().createSQLQuery(sql).uniqueResult();
}catch (Exception ex) {
	logger.error("Exception raised in the method saveLoginUserData:", ex);
	
}
	 return reqcount; 
}
@Transactional
public Integer saveRecruiterDailySubmissions(RecruiterDailySubmissions subms) throws HandlingException {
	Integer generatedId=null;
	 try {
	
	 generatedId= (Integer) getCurrentSession().save(subms);
}catch (Exception ex) {
	logger.error("Exception raised in the method saveRecruiterDailySubmissions:", ex);
	
}
	return generatedId;
	
}
@Transactional
public List<RecruiterDailySubmissions> getAllDailySubmissionListById(
		Integer empNumber) {
	List<RecruiterDailySubmissions> subList=null;

	 try {
	Session sess = this.sessfact.getCurrentSession(); 
	
	String hql="from RecruiterDailySubmissions where recId="+empNumber+"order by tblpk desc";
	subList=sess.createQuery(hql).list();
	 }
	catch (Exception ex) {
		logger.error("Exception raised in the method getAllDailySubmissionListById:", ex);
		
	}
	return subList;  
}
@Transactional
public Integer checkDailySubmissionById(Integer jid, Integer empNumber) {
	Integer existsornot=0;
	try {
		Session sess = this.sessfact.getCurrentSession(); 
	String hql="select tblpk from Tbl_RecPortal_RecruiterDailySubmissions where jobid="+jid+" and recId="+empNumber;
	 existsornot=(Integer)sess.createSQLQuery(hql).uniqueResult();
	}
	catch (Exception ex) {
		logger.error("Exception raised in the method getAllDailySubmissionListById:", ex);
		
	}
	return existsornot; 
}

@Transactional
public void updateDailySubmissionById(Integer did, Integer ttl_dwd,
		Integer ttl_spoken, Integer ttl_agreed) {
	try {
	// Session session = this.sessfact.getCurrentSession();
	 RecruiterDailySubmissions sub = (RecruiterDailySubmissions)getCurrentSession().get(RecruiterDailySubmissions.class, did);
	 sub.setAgreed(ttl_agreed);
	 sub.setContacted(ttl_spoken);
	 sub.setDowloaded(ttl_dwd);
	 sub.setCreatedDate(new Date()); 
	 getCurrentSession().update(sub); 
	}
	catch (Exception ex) {
		logger.error("Exception raised in the method updateDailySubmissionById:", ex);
		
	}
}
@Transactional
public void saveJobStatus(JobStatus jdstatus) throws HandlingException {

	 try {
		
		 getCurrentSession().save(jdstatus);
	}catch (Exception ex) {
		logger.error("Exception raised in the method saveLoginUserData:", ex);
		
	}
}
@Transactional
public RecruitmentportalLogin checkEmployee(Integer empno) throws HandlingException {
	RecruitmentportalLogin rcObj=null;
	 try{
		 
		 Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rc");
		  
		  	criteria.add(Restrictions.eq("rc.emp_number", empno));
		  	rcObj= (RecruitmentportalLogin) criteria.uniqueResult();
		 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method checkTechPanel:", ex);
			
		}
	return rcObj;
	
	
}
@Transactional
public void saveJdMandatorySkills(JobMandatorySkills jdRequiredSkills) throws HandlingException {
	try{
		 //Session session = sessfact.getCurrentSession(); 
		getCurrentSession().save(jdRequiredSkills);
		 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method saveJdMandatorySkills:", ex);
			
		}
}
@Transactional
public List<JobMandatorySkills> getMandatorySkillsByJobid(int jobid) throws HandlingException {
	List<JobMandatorySkills> jdSkills=null;
	 try{
		 
		 Criteria criteria=getCurrentSession().createCriteria(JobMandatorySkills.class,"JM");
		 criteria.createAlias("JM.jobdesc", "jd");
		  	criteria.add(Restrictions.eq("jd.jobdescid", jobid));
		  	jdSkills= criteria.list();
		 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method checkTechPanel:", ex);
			
		}
	return jdSkills;
	
}
@Transactional
public JobProfileCountDto getRolesCount(String role, Integer jobid) throws HandlingException {
    JobProfileCountDto jobRoleDto=new JobProfileCountDto();
   
    try
      {
                  
             
                  int selectedCount = 0;
                  int rejectedCount=0;
                  if(role.equalsIgnoreCase("BDM")){
                         
                        String sqlSel="select count(jobid)as bdm_count from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.bdmstatus='Selected' and c.jobid="+jobid+"";
                        selectedCount=(int) getCurrentSession().createSQLQuery(sqlSel).uniqueResult();
                        String sqlRej="select count(jobid)as bdm_count from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.bdmstatus='Rejected' and c.jobid="+jobid+"";
                        rejectedCount=(int) getCurrentSession().createSQLQuery(sqlRej).uniqueResult();
                        
                        
                  }
                  else if(role.equalsIgnoreCase("SCT")){
                      String sql1="select count(jobid)as sct_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.sctstatus='Selected' and c.jobid="+jobid+"";
                      String sql2="select count(jobid)as sct_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.sctstatus='Rejected' and c.jobid="+jobid+"";
                      selectedCount=(int) getCurrentSession().createSQLQuery(sql1).uniqueResult();
                      rejectedCount=(int) getCurrentSession().createSQLQuery(sql2).uniqueResult();
                      
                                   
               }
                  else if(role.equalsIgnoreCase("MANAGER")){
                         String sql1="select count(jobid)as mgr_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.mgrstatus='Selected' and c.jobid="+jobid+"";
                         String sql2="select count(jobid)as mgr_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.mgrstatus='Rejected' and c.jobid="+jobid+"";
                         selectedCount=(int) getCurrentSession().createSQLQuery(sql1).uniqueResult();
                         rejectedCount=(int) getCurrentSession().createSQLQuery(sql2).uniqueResult();
                         
                                      
                  }
                  else if(role.equalsIgnoreCase("TEAMLEAD")){
                         
                         String sql1="select count(jobid)as tl_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.tlstatus='Selected' and c.jobid="+jobid+"";
                         selectedCount=(int) getCurrentSession().createSQLQuery(sql1).uniqueResult();
                         String sql2="select count(jobid)as tl_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.tlstatus='Rejected' and c.jobid="+jobid+"";
                         rejectedCount=(int) getCurrentSession().createSQLQuery(sql2).uniqueResult();
                         
                  }
                  else if(role.equalsIgnoreCase("RECRUITER")){
                         String sql1="select count(jobid)as rec_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.recstatus='selected' and c.jobid="+jobid+"";
                        selectedCount=(int) getCurrentSession().createSQLQuery(sql1).uniqueResult();
                         String sql2="select count(jobid)as rec_status from Tbl_RecPortal_CandidateStatus c,Tbl_RecPortal_Jobdescription d where c.jobid=d.jobdescid and c.recstatus='Rejected' and c.jobid="+jobid+" ";
                         rejectedCount=(int) getCurrentSession().createSQLQuery(sql2).uniqueResult();
                         
                  }
                  jobRoleDto.setRole(role);
                  jobRoleDto.setSelectedCount(selectedCount);
                  jobRoleDto.setRejectedCount(rejectedCount);
                  
                  
      }
      catch (Exception ex) {
			logger.error("Exception raised in the method getRolesCount:", ex);
    		
           }
    return jobRoleDto;
}
@Transactional

public List<String> getRoles() throws HandlingException{
       
       List<String> view_role=null;
       try{   
              
              String sql="select distinct employee_role from Tbl_RecPortal_RecruitmentportalLogin";
              view_role= getCurrentSession().createSQLQuery(sql).list();
              
       }
       catch(Exception ex){
    	   logger.error("Exception raised in the method getRoles:", ex);
    	   
              
       }
       return view_role;
}
@Transactional
public List<DisplayRequirementsDTO> allJobDescription(Integer bdempno, Integer clienid) throws HandlingException {
	 List<DisplayRequirementsDTO> jdList=null;
		
		try{
			
			  String sql= "exec REC_SCTDisplayRequirements @bdEmpNo="+bdempno+" ,@clientId="+clienid+"";
				Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
			  jdList=query.list();
	}
		catch (Exception ex) {
			logger.error("Exception raised in the method allJobDescription:", ex);
			  
		}
	return jdList;
}
@Transactional
public InterviewDetails getintervieDetailsByCandidateid(Integer candidateid,Integer jobid) throws HandlingException {
	InterviewDetails intObj=null;
	 try{
		 
		  Criteria criteria=getCurrentSession().createCriteria(InterviewDetails.class,"int");
		  criteria.createAlias("int.candidate", "can");
		  criteria.add(Restrictions.eq("can.candidateid", candidateid));
		  criteria.createAlias("int.jobDesc", "job");
		  criteria.add(Restrictions.eq("job.jobdescid", jobid));//add job id
		  intObj=(InterviewDetails) criteria.uniqueResult();
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getintervieDetailsByCandidateid:", ex);
			   
		}
	return intObj;
}
@Transactional
public List<InterviewDetails> getCanddatesByInterviewStatus(String intStatus, String inttype, Integer jobid) throws HandlingException {
	List<InterviewDetails>intObj=null;
	 try{
		 
		  Criteria criteria=getCurrentSession().createCriteria(InterviewDetails.class,"int");
		  criteria.createAlias("int.jobDesc", "job");
		  criteria.add(Restrictions.eq("job.jobdescid", jobid));
		  if(inttype.equalsIgnoreCase("TP")){
		  criteria.add(Restrictions.eq("int.interviewstatus", intStatus));
		  }
		  else if(inttype.equalsIgnoreCase("client")){
			  criteria.add(Restrictions.eq("int.clientinterview", intStatus));
		  }
		 
		  intObj= criteria.list();
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getintervieDetailsByCandidateid:", ex);
			   
		}
	return intObj;
}



//Interview Details Insertion

@Transactional
public void saveClientInterviewDetails(InterviewDetails interviewObj) throws HandlingException {
	 try {
	
		 getCurrentSession().save(interviewObj);
}catch (Exception ex) {
	logger.error("Exception raised in the method saveLoginUserData:", ex);
	 
}
	//return generatedId;
	
} 

//View Interview Details

@Transactional
public List Interview_view(int jobid) throws HandlingException{
     List interview=null;
     try{
            
         
            String sql="select interviewdate,modeofinterview,clientinterview,jobdescid from Tbl_RecPortal_InterviewDetails where jobdescid="+jobid+"";
            
            interview= getCurrentSession().createSQLQuery(sql).list();
     }
     catch(Exception ex){
    	 logger.error("Exception raised in the method saveLoginUserData:", ex);
    	 
     }
     return interview;
     
}

@Transactional
public void delete_view(int jobid) throws HandlingException{
	
	try{
		
		
		String hql="delete from InterviewDetails where jobDesc.jobdescid="+jobid+"";
	
		getCurrentSession().createQuery(hql);
	
	}
	catch(Exception ex){
		logger.error("Exception raised in the method delete_view:", ex);
		}
	
	
}

@Transactional
public void save_tl_insert(Tbl_RecPortal_tecpanelFeedBack tl_inserts) throws HandlingException {
	 try {
	
		 getCurrentSession().save(tl_inserts);
}catch (Exception ex) {
	logger.error("Exception raised in the method save_tl_insert:", ex);
	
}
	//return generatedId;
	
} 
@Transactional
public void update_tl_insert(Tbl_RecPortal_tecpanelFeedBack tl_inserts) throws HandlingException {
	 try {
	
		 getCurrentSession().update(tl_inserts);
}catch (Exception ex) {
	logger.error("Exception raised in the method update_tl_insert:", ex);
	 
}
	//return generatedId;
	
} 

//TL_Inteviewer view
@Transactional
public List<Tbl_RecPortal_tecpanelFeedBack> TL_Interview_view(int jobid) throws HandlingException{
	List<Tbl_RecPortal_tecpanelFeedBack> interview=null;
	try{
		
		Session sess=sessfact.getCurrentSession();
		String hql="from Tbl_RecPortal_tecpanelFeedBack where jobDesc.jobdescid="+jobid+" ";
		interview=sess.createQuery(hql).list();
	}
	catch(Exception ex){
		logger.error("Exception raised in the method TL_Interview_view:", ex);
		
	}
	return interview;
	
}

//Integration from Rasheeda

@Transactional
public void tlFileUpload(Tbl_RecPortal_tecpanelFeedBack jobid) throws HandlingException {
	 try{Session sess = sessfact.getCurrentSession();
    sess.update(jobid);
} catch (Exception ex) {
	logger.error("Exception raised in the method tlFileUpload:", ex);
	
}
}
@Transactional
public Tbl_RecPortal_tecpanelFeedBack fileDownloadByID(Integer jobid) throws HandlingException {
	
	Tbl_RecPortal_tecpanelFeedBack downloadinfo=null;
	 try{
		 
		 String sql="from Tbl_RecPortal_tecpanelFeedBack where jobid="+jobid;
	
		 downloadinfo= (Tbl_RecPortal_tecpanelFeedBack) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method Download file option:", ex);
			 
		}
	return downloadinfo;
	
}
@Transactional
public Tbl_RecPortal_tecpanelFeedBack getInterviewByJobId(int jobid) throws HandlingException {
	Tbl_RecPortal_tecpanelFeedBack intObj=null;
	 try{
		 
		  Criteria criteria=getCurrentSession().createCriteria(Tbl_RecPortal_tecpanelFeedBack.class,"int");
		  criteria.createAlias("int.jobDesc", "job");
		  criteria.add(Restrictions.eq("job.jobdescid", jobid));
		  intObj= (Tbl_RecPortal_tecpanelFeedBack) criteria.uniqueResult();
	 } 
	 catch (Exception ex) {
			logger.error("Exception raised in the method getInterviewByJobId:", ex);
			 
		}
	return intObj;

}
@Transactional
public void updateInterviewDetails(InterviewDetails interviewObj) throws HandlingException {
	try{
		 
		getCurrentSession().update(interviewObj);
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method updateInterviewDetails:", ex);
			 
		}
	
}

public CandidateStatusDTO getSCTStatusByCandidatedId(Integer candidateId, String role) throws HandlingException {
	CandidateStatusDTO cs=null;
	try
	  {
		  	
		  	Criteria criteria=getCurrentSession().createCriteria(CandidateStatus.class,"cs");
		  	criteria.createAlias("cs.candidate", "can");
			criteria.add(Restrictions.eq("can.candidateid", candidateId));
			criteria.add(Restrictions.eq("cs.sctStatus", role));
			
			criteria.setProjection(
					Projections.projectionList()
					.add(Projections.property("can.candidateid"), "candidateId")
					.add(Projections.property("recStatus"),"status")
					.add(Projections.property("recComment"),"coment")
					.add(Projections.property("clientStatus"),"cliStatus")
					.add(Projections.property("clientComment"),"cliComent"));
			criteria.setResultTransformer(new AliasToBeanResultTransformer(CandidateStatusDTO.class));
			
			cs = (CandidateStatusDTO) criteria.uniqueResult();
	  }
	  catch (Exception ex) {
			logger.error("Exception raised in the method getStatusByCandidateID:", ex);
			 
		}
	return cs;
}
//Multiple Files Upload for particular jd's
@Transactional
public void saveMultipleFiles(Tbl_RecPortal_JobAttachments upload_files) throws HandlingException {
	 try {
	
		 getCurrentSession().save(upload_files);
}catch (Exception ex) {
	logger.error("Exception raised in the method saveMultipleFiles:", ex);
	 
}
	//return generatedId;
} 

//Download Multiple Files for Jd's
@Transactional
public List<Tbl_RecPortal_JobAttachments> MultiplefileDownloadByID(Integer jobid) throws HandlingException {
	
	List<Tbl_RecPortal_JobAttachments> downloadinfo=null;
	 try{
		 
		 String sql="from  Tbl_RecPortal_JobAttachments where jobid="+jobid;
	
		 downloadinfo= getCurrentSession().createQuery(sql).list();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method Download file option:", ex);
			 
		}
	return downloadinfo;
	
}
@Transactional
public String fileDownloadByType(Integer jobid,String Type) throws HandlingException {
	
	String attchmentName=null;
	 try{
		 
		 String sql="select attachmentname from  Tbl_RecPortal_JobAttachments where jobid="+jobid+"and attachmentType='"+Type+"'";
	
		 attchmentName= (String) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the fileDownloadByType option:", ex);
			 
		}
	return attchmentName;
	
}
@Transactional
public Tbl_RecPortal_JobAttachments MultiplefileDownloadByType(Integer jobid, String attachementType) throws HandlingException {
	
	Tbl_RecPortal_JobAttachments downloadinfo=null;
	 try{
		 
		 String sql="from  Tbl_RecPortal_JobAttachments where jobid="+jobid+ "and attachmentType='"+attachementType+"'";
	
		 downloadinfo= (Tbl_RecPortal_JobAttachments) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method MultiplefileDownloadByType:", ex);
			 
		}
	return downloadinfo;
	
}
@Transactional
public String saveCandidateFeedBack(CandidateFeedBack feedback) throws HandlingException {
	Integer fbid=null;
	String message=null;
	try{
		
		 //Session session = sessfact.getCurrentSession(); 
		  fbid=(Integer) getCurrentSession().save(feedback);
		  if(fbid!=null){
			  message="Feedback Saved Successfully";
		  }
		  else{
			  message="Feedback Not Saved";
		  }
			  
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method saveCandidateFeedBack :", ex);
			
		}
	return message;
	
}
@Transactional
public List<CandidateFeedBack> getFeedBackByCandidateid(int i) throws HandlingException {
	List<CandidateFeedBack> list=null;
	try{
		// Session session = sessfact.getCurrentSession(); 
		
		  	Criteria criteria=getCurrentSession().createCriteria(CandidateFeedBack.class,"cs");
		  	criteria.createAlias("cs.candidate", "can");
			criteria.add(Restrictions.eq("can.candidateid", i));
			
			list=criteria.list();
			
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method saveCandidateFeedBack :", ex);
			 
		}
	return list;
}

@Transactional
public Integer candidateEmailExistOrNot(String email,String jobDescId) throws HandlingException {
	 Integer candidateObj=null;
	 try
	  {
		  	
		  	String sql="select tblpk from Tbl_RecPortal_CandidateStatus where candidateid in (select candidateid from Tbl_RecPortal_CandidateInformation where emailID='"+email+"') and jobid="+jobDescId+"";
			candidateObj = (Integer)getCurrentSession().createSQLQuery(sql).uniqueResult();
	  }
	  catch (Exception ex) {
			logger.error("Exception raised in the method checking candidateEmailExistOrNot :", ex);
			 
		}
	return candidateObj;
	
}

@Transactional
public Integer candidateContactExistOrNot(String contact, String jobDescId) throws HandlingException {
	 Integer candidateObj=null;
	 try
	  {
		  	
		  	String sql="select tblpk from Tbl_RecPortal_CandidateStatus where candidateid in (select candidateid from Tbl_RecPortal_CandidateInformation where contact_number='"+contact+"') and jobid="+jobDescId+"";
			candidateObj = (Integer)getCurrentSession().createSQLQuery(sql).uniqueResult();
	  }
	  catch (Exception ex) {
			logger.error("Exception raised in the method checking candidateContactExistOrNot :", ex);
			
		}
	return candidateObj;
	
}
@Transactional
public Integer checkInterviewScheduledByTime(String interview_time,
		Integer jobid,String inttype, String interviewdate) throws HandlingException {
	Integer jobdescid=null;
	 try{
		 
		 String sql=null;
		 if(inttype.equalsIgnoreCase("Internal")){
			sql= "select jobdescid from Tbl_RecPortal_InterviewDetails where CONVERT(varchar(5),CAST(interviewdate AS TIME),108)='"+interview_time+"' and CONVERT(varchar(10),CAST(interviewdate AS date),120)='"+interviewdate+"' and jobdescid="+jobid+"";
			 jobdescid=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
		 }
		 else if(inttype.equalsIgnoreCase("Client")){
			  sql="select jobdescid from Tbl_RecPortal_InterviewDetails where CONVERT(varchar(5),CAST(cliIntDate AS TIME),108)='"+interview_time+"' and CONVERT(varchar(10),CAST(cliIntDate AS date),120)='"+interviewdate+"' and jobdescid="+jobid+" ";
				 jobdescid=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
		 }
		
		 

	 } catch (Exception ex) {
			logger.error("Exception raised in the method getintervieDetailsByCandidateid:", ex);
			 
		}
	return jobdescid;

}

@Transactional
public int getTotalJDCountByEmpId(Integer emp_number) {
	int  totaljdcount=0;

	try{
       
       String sql="select count(distinct ja.jobdescid) from Tbl_RecPortal_JobAllocation ja,Tbl_RecPortal_Jobdescription jd where ja.jobdescid=jd.jobdescid and ja.assignedto="+emp_number+"";
         totaljdcount=(int)getCurrentSession().createSQLQuery(sql).uniqueResult();
         }
       catch (Exception ex) {
			logger.error("Exception raised in the method getTotalJDCountByEmpId:", ex);
			 
		}
       return totaljdcount;
}
@Transactional
public int getTotalRecSubmittedCount(Integer emp_number) {
	int  totalrecsub=0;
	try {
       
       String sql="select count(distinct cs.candidateid) from Tbl_RecPortal_CandidateStatus cs,Tbl_RecPortal_Jobdescription jd where cs.jobid=jd.jobdescid and cs.recempno="+emp_number+" and cs.recstatus='Selected' and  cs.recsubmitdate >= dateadd(day, 0,GetDate()-1)";
        totalrecsub=(int)getCurrentSession().createSQLQuery(sql).uniqueResult();
	}
	 catch (Exception ex) {
			logger.error("Exception raised in the method getTotalRecSubmittedCount:", ex);
			 
		}
       return totalrecsub;
}

@Transactional
public int getSCTTotalSubmittedCount(Integer emp_number) {
	 int  scttotalselcount=0;
       try {
       
       String sql="select count(distinct cs.candidateid) from Tbl_RecPortal_CandidateStatus cs,Tbl_RecPortal_Jobdescription jd where cs.jobid=jd.jobdescid and cs.recempno="+emp_number+" and cs.sctstatus='Selected' and cs.sctsubmitdate >= dateadd(day, 0,GetDate()-1)";
         scttotalselcount=(int)getCurrentSession().createSQLQuery(sql).uniqueResult();
}catch (Exception ex) {
	logger.error("Exception raised in the method getTotalJDCountByEmpId:", ex);
	 
}
       return scttotalselcount;
       
}

@Transactional
public Integer getCreatedByJobId(Integer jobId) throws HandlingException {
	Integer createdBy=null;
	 try{
		 
		  String sql="select createdby  from Tbl_RecPortal_Jobdescription where jobdescid="+jobId+"";
		  createdBy=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getCreatedByJobId:", ex);
			 
		}
	return createdBy;
}
@Transactional
public String getJobTypeByJobId(Integer jobId) throws HandlingException {
	String jobType=null;
	 try{
		 
		  String sql="select External_Internal  from Tbl_RecPortal_Jobdescription where jobdescid="+jobId+"";
		  jobType=(String) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getJobTypeByJobId:", ex);
			
		}
	return jobType;
}

@Transactional
public List<UserDTO> SCTLIst() throws HandlingException {
	List<UserDTO> list=null;
	
	try{
	//Session session = sessfact.getCurrentSession();
	Criteria criteria=getCurrentSession().createCriteria(RecruitmentportalLogin.class,"rec");
	
	criteria.add(Restrictions.eq("employee_role", "SCT"));
	criteria.setProjection(
			Projections.projectionList().add(Projections.property("userName"), "userName")
						.add(Projections.property("emp_number"),"emp_number")
						.add(Projections.property("email"),"email"));
	criteria.setResultTransformer(new AliasToBeanResultTransformer(UserDTO.class));
	list=criteria.list();
}
	catch (Exception ex) {
		logger.error("Exception raised in the method recruiteList:", ex);
		
	}
return list;
}
@Transactional
public Integer checkCandidateExists(String email, String phnNumber) throws HandlingException {
	Integer candidateid=null;
	try {
		//Session session = sessfact.getCurrentSession();
		String sql="select candidateid from Tbl_RecPortal_CandidateInformation where emailID='"+email+"' and contact_number='"+phnNumber+"'";
		candidateid=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
		
		
	}catch (Exception ex) {
		logger.error("Exception raised in the method checkCandidateExists:", ex);
		
	}
	return candidateid;
}
@Transactional
public Integer  getJobIdByCandidateid(Integer candidateid,Integer jobid) throws HandlingException {
	Integer jid=null;
	try {
		//Session session = sessfact.getCurrentSession();
		String sql="select jobid from Tbl_RecPortal_CandidateStatus where candidateid="+candidateid+"and jobid="+jobid+" ";
		jid=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
		
		
	}catch (Exception ex) {
		logger.error("Exception raised in the method getJobIdByCandidateid:", ex);
		 
	}
	return jid;
}
//Rasheeda Integration

@Transactional
public List<ResumeDTO> getEmailIdsListBySkills(String skills) throws HandlingException {
	List<ResumeDTO> eamilslist=null;
	 try{
		 String sql="SELECT distinct CONCAT(first_name, ' ', last_name) as userName,contact_number as contact_number,emailid as emailID,total_experience as total_experience,\r\n" + 
		 		"primaryskill as primaryskill,workLocation as workLocation,noticeperiod as noticeperiod,convert(varchar(10),submit_date,101) as resumeData\r\n" + 
		 		"FROM Tbl_RecPortal_CandidateInformation  WHERE primaryskill LIKE '%"+skills+"%' OR secskill LIKE '%"+skills+"%'";
		 //String sql="select emailid,contact_number,primaryskill from Tbl_RecPortal_CandidateInformation where primaryskill='"+skills+"' or secskill='"+skills+"'";
		 eamilslist=getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(ResumeDTO.class)).list();
		 
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getCandidateInfoByCandidateID:", ex);
			
		}
	return eamilslist;
}
@Transactional
public List getEmailIdsBySkills(String skills) throws HandlingException {
	List eamilslist=null;
	 try{
		 
		 String sql="select emailid,contact_number,primaryskill from Tbl_RecPortal_CandidateInformation where primaryskill='"+skills+"' or secskill='"+skills+"'";
		  eamilslist= getCurrentSession().createSQLQuery(sql).list();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getCandidateInfoByCandidateID:", ex);
			
		}
	return eamilslist;
}

@Transactional
public List  getResumeBySkills(String skills) throws HandlingException {
	List<ResumeDTO> profilelist=null;
	//List  profilelist=null;
	
	 try{
			
		 
	 //Session session = sessfact.getCurrentSession();
			Criteria criteria=getCurrentSession().createCriteria(CandidateStatus.class,"cs");
			criteria.createAlias("cs.candidate", "ci");
			criteria.createAlias("cs.jobdesc", "jd");
			criteria.add(Restrictions.ne("cs.clientStatus", "Selected"));
			
			criteria.add(Restrictions.eq("ci.primaryskill", skills));
			criteria.setProjection(
					Projections.projectionList()
								.add(Projections.property("ci.file_upload_name"), "resumeName")
								.add(Projections.property("ci.first_name"),"first_name")
								.add(Projections.property("ci.contact_number"),"contact_number")
								.add(Projections.property("ci.altcnt_number"),"altcnt_number")
								.add(Projections.property("ci.emailID"),"emailID")
								.add(Projections.property("ci.dob"),"dob")
								.add(Projections.property("ci.basic_qualification"),"basic_qualification")
								.add(Projections.property("ci.highest_qualification"),"highest_qualification")
								.add(Projections.property("ci.primaryskill"),"primaryskill")
								.add(Projections.property("ci.total_experience"),"total_experience")
								.add(Projections.property("ci.relevantExp"),"relevantExp")
								.add(Projections.property("ci.candDesignation"),"candDesignation")
								.add(Projections.property("ci.currentCTC"),"currentCTC")
								.add(Projections.property("ci.expectedCTC"),"expectedCTC")
								.add(Projections.property("ci.noticeperiod"),"noticeperiod")
								.add(Projections.property("ci.workLocation"),"workLocation")
								.add(Projections.property("cs.recEmpNo"),"recempno")
								.add(Projections.property("ci.candidateid"),"candidateid")
								.add(Projections.property("cs.recSubmitDate"),"rectrsubdate")
								.add(Projections.property("jd.jobCode"),"jobcode")
								);
			criteria.setResultTransformer(new AliasToBeanResultTransformer(ResumeDTO.class));
			profilelist=criteria.list();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getResumeBySkills:", ex);
			
		}
	return profilelist;
}

@Transactional
public void updateJobStatus(JobStatus jdstatus) throws HandlingException {

	 try {
		
		 getCurrentSession().update(jdstatus);
	}catch (Exception ex) {
		logger.error("Exception raised in the method updateJobStatus:", ex);
		
	}
}
@Transactional
public Tbl_RecPortal_JobAttachments getAtchmetbyTblPk(Integer tblpk) throws HandlingException {
	Tbl_RecPortal_JobAttachments obj=null;
	 try{
		 
		 String sql="from  Tbl_RecPortal_JobAttachments where tblpk="+tblpk;
	
		 obj= (Tbl_RecPortal_JobAttachments) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getAtchmetbyTblPk:", ex);
			
		}
	return obj;
}
@Transactional
public void updateJdDoc(Tbl_RecPortal_JobAttachments jaObj) throws HandlingException {
	 try {
		
		 getCurrentSession().update(jaObj);
	}catch (Exception ex) {
		logger.error("Exception raised in the method updateJdDoc:", ex);
		 
	}
	
}
@Transactional
public List<String> getEmailByRole(String role) throws HandlingException {
	List<String> eamilslist=null;
	 try{
		 
		  String sql="select email from Tbl_RecPortal_RecruitmentportalLogin where employee_role='"+role+"'and employee_status='Active'";
		  eamilslist= getCurrentSession().createSQLQuery(sql).list();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getCandidateInfoByCandidateID:", ex);
			
		}
	return eamilslist;
}

@Transactional
public Integer addNoticePeriodComp(CompanyNoticePeriod noticeObj) throws HandlingException {
	Integer noticeid=null;
	try {
		
		 noticeid=(Integer) getCurrentSession().save(noticeObj);
	}catch (Exception ex) {
		logger.error("Exception raised in the method company notice period status:", ex);
		
	}
	return noticeid;
}

@Transactional
public List<CompanyNoticePeriod> getnoticePeriodCompnyList() throws HandlingException {
	List<CompanyNoticePeriod> list=null;
	try{
		// Session session = sessfact.getCurrentSession(); 
		
		 Criteria criteria=getCurrentSession().createCriteria(CompanyNoticePeriod.class);
			list=criteria.list();
			
	 } catch (Exception ex) {
			logger.error("Exception raised in the method view company list :", ex);
			
		}
	return list;
}
@Transactional
public CompanyNoticePeriod companyPANExistOrNot(String companypanid) throws HandlingException {
	CompanyNoticePeriod noticeperiodObj=null;
	 try{
		  
		  Criteria criteria=getCurrentSession().createCriteria(CompanyNoticePeriod.class);
		  criteria.add(Restrictions.eq("companypanid", companypanid));
		  noticeperiodObj=(CompanyNoticePeriod) criteria.uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method companyPANExistOrNot:", ex);
			
		}
	return noticeperiodObj;
	
}
@Transactional
public String updateNoticePeriodComp(String companyName, String companypanid, int noticeperiod, int compid) throws HandlingException {
	 String message=null; 
	try{
		 Session sess = this.sessfact.getCurrentSession();  
		 CompanyNoticePeriod updtenp = (CompanyNoticePeriod)sess.get(CompanyNoticePeriod.class, compid);
		 updtenp.setCompanyname(companyName);
		 updtenp.setNoticeperiod(noticeperiod);
		 updtenp.setCompanypanid(companypanid);
		sess.update(updtenp);
		message=companyName+companypanid+noticeperiod+"updated sucessfully";
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method updateNoticePeriodComp:", ex);
			 
		}
	 return message;
	
}
@Transactional
public Date getAssignDate(Integer emp_number, Integer jobDesId) throws HandlingException {
	Date assignDate=null;
	try{
		  
		  String sql="select assigneddate from JobAllocation where jobDesc.jobdescid="+jobDesId+"and assignedto="+emp_number+"";
		  assignDate =   (Date) getCurrentSession().createQuery(sql).uniqueResult();
		 
		
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method updateNoticePeriodComp:", ex);
			
				
		}
	 return assignDate;
}

//Multiple Files Upload for candidate other documents
@Transactional
public String saveOtherFiles(Tbl_RecPortal_candidateAttachments upload_files) throws HandlingException {
	String downloadinfo =null;
	 try {
	
		 getCurrentSession().save(upload_files);
}catch (Exception ex) {
	logger.error("Exception raised in the method saveMultipleFiles:", ex);
	
}
	//return generatedId;
	return downloadinfo;
} 


//Download candidate other documents
@Transactional
public Tbl_RecPortal_candidateAttachments downloadOtherDocuments(Integer candidateid) throws HandlingException {
	
	Tbl_RecPortal_candidateAttachments downloadinfo=null;
	 try{
		 
		 String sql="from  Tbl_RecPortal_candidateAttachments where candidateid="+candidateid;
	
		 downloadinfo= (Tbl_RecPortal_candidateAttachments) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method Download file option:", ex);
			 
		}
	return downloadinfo;
	
}
@Transactional
public void updateCandidateAttachmnets(Tbl_RecPortal_candidateAttachments canAttchObj) throws HandlingException {

		 try {
		
			 getCurrentSession().update(canAttchObj);
		
	}catch (Exception ex) {
		logger.error("Exception raised in the method updateCandidateAttachmnets:", ex);
		
	}
		//return generatedId;
	} 

@Transactional
public List<CandidateInfoDTO> getCandidateListByTLSelected(String role, Integer loginEmpNumber, Integer jobId,String jobType) throws HandlingException {
       List<CandidateInfoDTO> canddateList=null;
       try
         {
                     
                     Criteria criteria=getCurrentSession().createCriteria(CandidateStatus.class,"candistatus");
                     criteria.createAlias("candistatus.jobdesc", "job");
                     criteria.createAlias("candistatus.candidate", "candiInfo");
                     if(jobId!=null){
                     criteria.add(Restrictions.eq("job.jobdescid", jobId));
                     }      
                     if(jobType.equalsIgnoreCase("External")){
                            criteria.add(Restrictions.eq("tlStatus", "Selected"));
                            criteria.setProjection(
                                         Projections.projectionList().add(Projections.property("candiInfo.candidateid"), "candidateId")
                                         .add(Projections.property("recEmpNo"), "recEmpNo")
                                         .add(Projections.property("job.jobdescid"), "jobId"));
                           criteria.setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoDTO.class));
                           canddateList= criteria.list();
                     }
                     else {
                            
                     }
                     
         }
         catch (Exception ex) {
                     logger.error("Exception raised in the method getCandidateListByTLSelected:", ex);
                     
              }
       return canddateList;
                     }


@Transactional
public List<JobAllocationDTO> getAllJobDescByTLSelected(Integer empNumber,String role) throws HandlingException {
       List<JobAllocationDTO> jdList=null;
              
              try{
              //Session session = sessfact.getCurrentSession();
              Criteria criteria=null;
              
              
       if(role.equalsIgnoreCase("BDM")){
              criteria=getCurrentSession().createCriteria(Jobdescription.class,"job");
              criteria.add(Restrictions.eq("job.createdby", empNumber));
              criteria.createAlias("job.company", "cm");      
              
              criteria.addOrder(Order.desc("job.createdDate"));
              criteria.setProjection(
                           Projections.projectionList().add(Projections.property("job.jobdescid"), "jdID").add(Projections.property("job.jobDescription"), "jobDescription")
                           .add(Projections.property("job.createdby"), "createdby")
                           .add(Projections.property("cm.cmpny_name"), "cmpny_name")
                           .add(Projections.property("job.jdCategory"), "jdCategory")
                           .add(Projections.property("job.jobCode"),"jobCode")
                           );
       }
       else if(role.equalsIgnoreCase("TEAMLEAD")) {
              criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
              criteria.createAlias("job.jobDesc", "jd");
              criteria.add(Restrictions.eq("job.assignedto", empNumber));
              criteria.createAlias("jd.company", "cm"); 
              criteria.addOrder(Order.desc("jd.createdDate"));
              criteria.setProjection(
                           Projections.projectionList().add(Projections.property("jd.jobdescid"), "jdID").add(Projections.property("jd.jobDescription"), "jobDescription")
                           .add(Projections.property("jd.createdby"), "createdby")
                           .add(Projections.property("cm.cmpny_name"), "cmpny_name")
                           );
       }
       else if(role.equalsIgnoreCase("RECRUITER")) {
              criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
              criteria.createAlias("job.jobDesc", "jd");
              criteria.add(Restrictions.eq("job.assignedto", empNumber));
              criteria.createAlias("jd.company", "cm"); 
              criteria.addOrder(Order.desc("jd.createdDate"));
              criteria.setProjection(
                           Projections.projectionList().add(Projections.property("jd.jobdescid"), "jdID").add(Projections.property("jd.jobDescription"), "jobDescription")
                           .add(Projections.property("jd.createdby"), "createdby")
                           .add(Projections.property("cm.cmpny_name"), "cmpny_name")
                           );
       }
       else if(role.equalsIgnoreCase("SCT")) {
              
              criteria=getCurrentSession().createCriteria(Jobdescription.class,"job");
              criteria.createAlias("job.company", "cm");
              criteria.setProjection(
                                  Projections.projectionList().add(Projections.property("job.jobdescid"), "jdID").add(Projections.property("job.jobDescription"), "jobDescription")
                                  .add(Projections.property("job.createdby"), "createdby")
                                  .add(Projections.property("cm.cmpny_name"), "cmpny_name")
                                  );
              criteria.addOrder(Order.desc("createdDate"));
              
       }
       else {}
       
                           
              criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocationDTO.class));
              jdList=criteria.list();
       }
              catch (Exception ex) {
                     logger.error("Exception raised in the method getAllJobDescByTLSelected:", ex);
                    
              }
             
       return jdList;
}



//get BdNames


@Transactional
public List<RecruitmentportalLogin> getBdNames() throws HandlingException {
	List<RecruitmentportalLogin> bdName=null;
	 try{
		 
		  String sql=" from RecruitmentportalLogin where employee_role='BDM' ";
		  bdName= getCurrentSession().createQuery(sql).list();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getCandidateInfoByCandidateID:", ex);
			
		}
	return bdName;
}

//

@Transactional
public List<Jobdescription> getJobsBySearchSCT(Integer createdBy,Integer clientName) throws HandlingException {
       List<Jobdescription> jdList=null;
       try{
    	   							
                                  Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class,"job");
                                  criteria.createAlias("job.company", "c");
                     
                                  criteria.add(Restrictions.ne("jobstatus", "Req Closed"));
                                         if(createdBy!=null && clientName==null){
                                                criteria.add(Restrictions.eq("createdby", createdBy));
                                                }
                                                else if(createdBy==null && clientName!=null){
                                                criteria.add(Restrictions.eq("c.cmpny_id", clientName));
                                               
                                                }
                                                
                                                else if(createdBy!=null&&clientName!=null){
                                                       
                                                       criteria.add(Restrictions.eq("createdby", createdBy));
                                                       criteria.add(Restrictions.eq("c.cmpny_id", clientName));
                                                      
                                                       
                                                }
                                                else{
                                                       
                                                }
                                         
                                         criteria.addOrder(Order.desc("createdDate"));
                                         jdList=criteria.list();
                   
               
       }
       catch (Exception ex) {
                     logger.error("Exception raised in the method getJobsBySearchSCT:", ex);
                    
              }
       return jdList;
}
@Transactional
public List<JobAllocationDTO> getJobsBySearch(Integer createdBy,Integer clientName,Integer loginEmpNo) throws HandlingException {
       List<JobAllocationDTO> jdList=null;
       try{
              
              
              
           		Criteria criteria=getCurrentSession().createCriteria(JobAllocation.class,"job");
				criteria.createAlias("job.jobDesc", "jd");
				criteria.createAlias("jd.company", "c");
				criteria.add(Restrictions.eq("assignedto", loginEmpNo));
				criteria.add(Restrictions.ne("jd.jobstatus", "Req Closed"));
				 if(createdBy!=null && clientName==null){
                     criteria.add(Restrictions.eq("jd.createdby", createdBy));
                    
                    
                     }
                     else if(createdBy==null && clientName!=null){
                     criteria.add(Restrictions.eq("c.cmpny_id", clientName));
                     }
                     
                     else if(createdBy!=null&&clientName!=null){
                            
                            criteria.add(Restrictions.eq("jd.createdby", createdBy));
                            criteria.add(Restrictions.eq("c.cmpny_id", clientName));
                     }
                     else{
                     }
				 criteria.addOrder(Order.asc("jd.createdDate"));
				criteria.setProjection(
						Projections.projectionList().add(Projections.property("jd.jobdescid"), "jdID").add(Projections.property("jd.jobDescription"), "jobDescription")
						.add(Projections.property("jd.createdby"), "createdby")
						.add(Projections.property("c.cmpny_name"), "cmpny_name")
						.add(Projections.property("job.empstatus"), "empStatus")
						.add(Projections.property("job.assignedby"), "assignedBy")
						);
						
				criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocationDTO.class));
				jdList=criteria.list();            	   
                                    
               
       }
       catch (Exception ex) {
                     logger.error("Exception raised in the method getJobTypeByJobId:", ex);
                     
              }
       return jdList;
}


@Transactional
public String getEmpStatusByJobId(Integer jobid,Integer loginNo) throws HandlingException{
	String empStatus=null;
	try{
		 
		 String sql="select empstatus from Tbl_RecPortal_JobAllocation where assignedto="+loginNo+" and jobdescid="+jobid+"";
		 empStatus = (String) getCurrentSession().createSQLQuery(sql).uniqueResult();
	} catch (Exception ex) {
		logger.error("Exception raised in the method getEmpStatusByJobId:", ex);
		
	}
	return empStatus;
	
}
@Transactional
public Jobdescription mailproofDownloadByID(Integer jobid) throws HandlingException {
	Jobdescription downloadinfo=null;
	 try{
		 
		 String sql="from Jobdescription where jobdescid="+jobid;
		 downloadinfo= (Jobdescription) getCurrentSession().createQuery(sql).uniqueResult();
		  
	 } catch (Exception ex) {
			logger.error("Exception raised in the method mailproofDownloadByID:", ex);
			
		}
	return downloadinfo;
	
}
@Transactional
public void bdmailproofUpload(Jobdescription jobid) throws HandlingException {
	 try{
		
		 getCurrentSession().update(jobid);
} catch (Exception ex) {
	logger.error("Exception raised in the method bdmailproofUpload:", ex);
	
}
	
}

@Transactional
public String mailProofDownload(Integer jobid) throws HandlingException {
	
	String attchmentName=null;
	 try{
		 
		 String sql="select attachmentname from  Jobdescription where jobdescid="+jobid+"";
	
		 attchmentName= (String) getCurrentSession().createQuery(sql).uniqueResult();
	 } catch (Exception ex) {
			logger.error("Exception raised in the fileDownloadByType option:", ex);
			 
		}
	return attchmentName;
	
}

@Transactional
public int checkTLAssignedOrNot(Integer jobdescid, Integer loginEmpNumber) throws HandlingException {
	int count=0;
	try{
		 
		 String sql="select count(assignedto) from Tbl_RecPortal_JobAllocation where assignedby="+loginEmpNumber+" and jobdescid="+jobdescid+"";
		 count = (int) getCurrentSession().createSQLQuery(sql).uniqueResult();
	} catch (Exception ex) {
		logger.error("Exception raised in the method getEmpStatusByJobId:", ex);
		 
	}
	return count;
}
@Transactional
public String getMailFileNameByJobId(Integer jobid) throws HandlingException {
	String mailfilename=null;
	 try{
		 
		 String sql="select attachmentname from  Jobdescription where jobdescid="+jobid+"";
		 mailfilename= (String) getCurrentSession().createQuery(sql).uniqueResult();
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getMailFileNameByJobId:", ex);
			
		}
	return mailfilename;
}

@Transactional
public void addSCTComments(Tbl_RecPortal_SCTComments comentStatus) throws HandlingException {
	
	try {
	
	 getCurrentSession().save(comentStatus);
}catch (Exception ex) {
	logger.error("Exception raised in the method addSCTComments:", ex);
	
}
	
	
}

@Transactional
public List<Tbl_RecPortal_SCTComments> getSCTComments(Integer candidateid, Integer jobid) throws HandlingException {
	List<Tbl_RecPortal_SCTComments> sctcomments=null;
	 try{
		 
		 String sql="from Tbl_RecPortal_SCTComments where jobid.jobdescid="+jobid+" and canid.candidateid="+candidateid+"";
		 sctcomments= getCurrentSession().createQuery(sql).list();
	 } catch (Exception ex) {
			logger.error("Exception raised in the method getSCTComments:", ex);
			
		}
	return sctcomments;
}

@Transactional
public String getCompanyNameByjobId(Integer cmpnyid) throws HandlingException {
	String cmnpnyname=null;
	try{
	 Session sess = this.sessfact.getCurrentSession();  
	 String sql="select cmpny_name from  Tbl_RecPortal_CompanyDescription where cmpny_id="+cmpnyid+"";
	 cmnpnyname= (String) sess.createSQLQuery(sql).uniqueResult();
	}
	 catch (Exception ex) {
			logger.error("Exception raised in the method getCompanyNameByjobId:", ex);
			
		}
	return cmnpnyname;
	
}
@Transactional
public List<Jobdescription> getAllJDS() throws HandlingException {
	 List<Jobdescription> jdList=null;
	  try
	  {
		  
		  Criteria criteria=getCurrentSession().createCriteria(Jobdescription.class);
		 // criteria.add(Restrictions.eq("createdby", loginEmpNumber));
		  criteria.setFetchMode("company", FetchMode.EAGER);
		  criteria.addOrder(Order.desc("createdDate"));
		  jdList=criteria.list();
	  }
	  catch (Exception ex) {
			logger.error("Exception raised in the method getAllJobDescription:", ex);
			
		}
	return jdList;
}
@Transactional
public List<Jobdescription> getJobCodeByCompId(Integer cid) throws HandlingException {
	
	List<Jobdescription> list=null;
	 try{
		 
		  String sql="select jobCode,jobdescid from Tbl_RecPortal_Jobdescription where cmpny_id="+cid+"";//shows error in jsp while adding cretedby 
		  list=getCurrentSession().createSQLQuery(sql).list(); 
		  
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getJobCodeById:", ex);
			
		}
	return list;
}

@Transactional
public List<Integer> getAssignedTlByJobid(Integer _jobdescid,String fromdate, String todate) throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		  String sql="select distinct ja.assignedto from Tbl_RecPortal_JobAllocation ja,Tbl_RecPortal_RecruitmentportalLogin rl where ja.jobdescid="+_jobdescid+" and rl.employee_role='TEAMLEAD' and  ja.assignedto=rl.emp_number and convert(date,ja.assigneddate)>='"+fromdate+"' and convert(date,ja.assigneddate)<='"+todate+"' ";//shows error in jsp while adding cretedby 
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
		  System.out.println("sql"+sql);
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return assignedTl;
}
@Transactional
public Integer getRecCountByTL(Integer _tl, Integer _jobdescid,String fromdate,String todate) throws HandlingException {
	Integer recCount=null;
	 try{
		 
		  String sql="select count(assignedto) from Tbl_RecPortal_JobAllocation  where jobdescid="+_jobdescid+" and assignedby="+_tl+" ";//shows error in jsp while adding cretedby 
		  recCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return recCount;
}
@Transactional
public Integer getRecSubCount1(Integer _jobdescid,Integer _tl,String fromdate,String todate) throws HandlingException {
	Integer recsubCount=null;
	 try{
		 
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+" and recstatus='Selected' and assignedTl="+_tl+"";
		  recsubCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return recsubCount;
}
@Transactional
public Integer getSctClearedCount1(Integer _jobdescid,Integer _tl,String fromdate,String todate) throws HandlingException {
	Integer sctCount=null;
	 try{
		 
		  String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+"  and assignedTl="+_tl+" and (sctStatus='Selected' or sctStatus='VP select' or sctStatus='BD Select' or sctStatus='Director select') ";//shows error in jsp while adding cretedby 
		  sctCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return sctCount;
}

@Transactional
public Integer getTlClearedCount(Integer _jobdescid, Integer _tl,String fromdate,String todate) throws HandlingException {
	Integer tlCount=null;
	 try{
		 
		  String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+"  and assignedTl="+_tl+" and tlstatus='Selected' ";//shows error in jsp while adding cretedby 
		  tlCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return tlCount;
}

@Transactional
public Integer getclientClearedCount(Integer _jobdescid, Integer _tl,String fromdate,String todate) throws HandlingException {
	Integer cCCount=null;
	 try{
		 
		  String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+"  and assignedTl="+_tl+" and clientstatus='Selected' ";//shows error in jsp while adding cretedby 
		  cCCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return cCCount;
}
@Transactional
public List<Integer> getAssignedTlByJob() throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		 String sql="select distinct ja.assignedto from Tbl_RecPortal_JobAllocation ja,Tbl_RecPortal_RecruitmentportalLogin rl where rl.employee_role='TEAMLEAD' and  ja.assignedto=rl.emp_number"; 
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return assignedTl;
}

@Transactional
public List<Integer> getAssignedRecByTl(Integer _tl) throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		  String sql="select distinct assignedto from Tbl_RecPortal_JobAllocation  where assignedby="+_tl+"";//shows error in jsp while adding cretedby 
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return assignedTl;

}

@Transactional
public List<Integer> getAllAssignedRecByTl(Integer tl) throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		  String sql="select distinct recEmpNo from Tbl_RecPortal_RECAllocation  where tlEmpNo="+tl+" and empstatus='Active'"; 
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAllAssignedRecByTl:", ex);
			
		}
	return assignedTl;

}

@Transactional
public Integer getClientstatus(Integer _rec,Integer _tl) throws HandlingException {
	Integer getClientstatus=null;
	 try{
		 
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and assignedTl="+_tl+" and clientstatus='Selected' "; 
		// String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+"  and assignedTl="+_tl+" and (sctStatus='Selected' or sctStatus='VP select' or sctStatus='BD Select' or sctStatus='Director select') ";//shows error in jsp while adding cretedby 
		 getClientstatus=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return getClientstatus;
}
@Transactional
public List<Integer> getjobDescriptionByRecruiter(Integer rEmpno, Integer tEmpno, String fromdate, String todate) throws HandlingException {
	List<Integer> jidcid=null;
	 try{
		 
		 String sql="select distinct jobid from Tbl_RecPortal_CandidateStatus  where recempno="+rEmpno+" and recstatus='Selected' and assignedtl="+tEmpno+" and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
		// String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+_jobdescid+"  and assignedTl="+_tl+" and (sctStatus='Selected' or sctStatus='VP select' or sctStatus='BD Select' or sctStatus='Director select') ";//shows error in jsp while adding cretedby 
		 jidcid=getCurrentSession().createSQLQuery(sql).list();
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return jidcid;
}
@Transactional
public Integer getRecSubCount(Integer _rec,Integer _tl, String fromdate, String todate,Integer jobid) throws HandlingException {
	Integer recsubCount=null;
	 try{
		 String sql=null;
		 if(jobid!=null) {
		if (_tl!=null) {
			sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and jobid="+jobid+" and recstatus='Selected'and assignedTl="+_tl+" and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
			//sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and assignedTl="+_tl+" and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'";	
		}
		 else {
			  sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and jobid="+jobid+" and recstatus='Selected' and convert(date,recsubmitdate) >= '"+fromdate+"'and convert(date,recsubmitdate) <= '"+todate+"'"; 
		 }
		  recsubCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
	 else {
		 if (_tl!=null) {
				sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and recstatus='Selected'and assignedTl="+_tl+" and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
				//sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and assignedTl="+_tl+" and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'";	
			}
			 else {
				  sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and recstatus='Selected' and convert(date,recsubmitdate) >= '"+fromdate+"'and convert(date,recsubmitdate) <= '"+todate+"'"; 
			 }
			  recsubCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
		 }
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return recsubCount;
}
@Transactional
public Integer getSctClearedCount(Integer _rec,Integer _tl, String fromdate, String todate,Integer jobid) throws HandlingException {
	Integer sctCount=null;
	 try{
		 
	
		 
		 if(jobid!=null) {
		 
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and jobid="+jobid+" and assignedTl="+_tl+" and (sctStatus='Selected' or sctStatus='VP select' or sctStatus='BD Select' or sctStatus='Director select')and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
		  sctCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }else {
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+"  and assignedTl="+_tl+" and (sctStatus='Selected' or sctStatus='VP select' or sctStatus='BD Select' or sctStatus='Director select')and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'";
	
		 sctCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
		 }
		 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return sctCount;
}
@Transactional
public Integer getClientstatus(Integer _rec,Integer _tl, String fromdate, String todate,Integer jobid) throws HandlingException {
	Integer getClientstatus=null;
	 try{
		 
		// Session session = this.sessfact.getCurrentSession();

		 if(jobid!=null) {
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and jobid="+jobid+" and assignedTl="+_tl+" and clientstatus='Selected' and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
		 getClientstatus=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }else {
		 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where recempno="+_rec+" and assignedTl="+_tl+" and clientstatus='Selected' and convert(date,recsubmitdate) >= '"+fromdate+"' and convert(date,recsubmitdate) <= '"+todate+"'"; 
		 getClientstatus=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
	 }
		 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return getClientstatus;
}

@Transactional
public List<Integer> getAssignedRecByTl(Integer _tl, String fromdate, String todate) throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		  String sql="select distinct assignedto from Tbl_RecPortal_JobAllocation  where assignedby="+_tl+" ";
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return assignedTl;

}
@Transactional
public List<Integer> getAssignedTlByJobid() throws HandlingException {
	List<Integer> assignedTl=null;
	 try{
		 
		 String sql=null;
			  sql="select distinct ja.assignedto from Tbl_RecPortal_JobAllocation ja,Tbl_RecPortal_RecruitmentportalLogin rl where rl.employee_role='TEAMLEAD' and  ja.assignedto=rl.emp_number";  
		  assignedTl=getCurrentSession().createSQLQuery(sql).list(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
			
		}
	return assignedTl;
}

@Transactional
public String getCompanyIdByJobId(int jobid) throws HandlingException {
	
	 String compname=null;
	 try{
	 String sql1="SELECT cmpny_name FROM Tbl_RecPortal_CompanyDescription WHERE cmpny_id IN (SELECT cmpny_id FROM Tbl_RecPortal_Jobdescription where jobdescid="+jobid+")";  
	 compname =(String) getCurrentSession().createSQLQuery(sql1).uniqueResult(); 
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getCompanyIdByJobId:", ex);
			
		}
	return compname;
	
}
@Transactional
public String getclientPrjlocByjobId(Integer jobid) throws HandlingException {
	Session sess = this.sessfact.getCurrentSession(); 
	String proj_loc=null;
	 try{
	String hql="select location_project  from Tbl_RecPortal_Jobdescription where jobdescid="+jobid+"";
	proj_loc=(String) sess.createSQLQuery(hql).uniqueResult();
}
catch (Exception ex) {
		logger.error("Exception raised in the method getclientPrjlocByjobId:", ex);
		
	}
	return proj_loc; 
}


//By Rasheeda


   @Transactional(propagation = Propagation.REQUIRED)
	public RecruitmentportalLogin getEamilbyName(String name) throws HandlingException {
		RecruitmentportalLogin email=null;
		 try{
			 
			  String sql="from RecruitmentportalLogin where UserName='"+name+"'";
			  email= (RecruitmentportalLogin) getCurrentSession().createQuery(sql).uniqueResult();
			  
		 } catch (Exception ex) {
				logger.error("Exception raised in the method getEamilbyName:", ex);
				
			}
		return email;
	}

   @Transactional(propagation = Propagation.REQUIRED)
	public List<RecruitmentportalLogin> getEamilbyNegorole() throws HandlingException {
    	List<RecruitmentportalLogin> negoemail=null;
		 try{
			 
			  String sql="from RecruitmentportalLogin where employee_role='NEGOTIATOR'";
			  negoemail= (List<RecruitmentportalLogin>) getCurrentSession().createQuery(sql).list();
			  
		 } catch (Exception ex) {
				logger.error("Exception raised in the method getEamilbyNegorole:", ex);
				 
			}
		return negoemail;
	}

   @Transactional(propagation = Propagation.REQUIRED)
	public List<RecruitmentportalLogin> getEamilbyHrList() throws HandlingException {
		List<RecruitmentportalLogin> hrEmail=null;
		 try{
			 
			  String sql="from RecruitmentportalLogin where employee_role='HRMANAGER'";
			  hrEmail= (List<RecruitmentportalLogin>) getCurrentSession().createQuery(sql).list();
			  
		 } catch (Exception ex) {
				logger.error("Exception raised in the method getEamilbyHrList:", ex);
				 
			}
		return hrEmail;
	}
   @Transactional(propagation = Propagation.REQUIRED)
	public List<RecruitmentportalLogin> getEamilbyHrUserList() throws HandlingException {
		List<RecruitmentportalLogin> hrUserEmail=null;
		 try{
			 
			  String sql="from RecruitmentportalLogin where employee_role='HRUSER'";
			  hrUserEmail= (List<RecruitmentportalLogin>) getCurrentSession().createQuery(sql).list();
			  
		 } catch (Exception ex) {
				logger.error("Exception raised in the method getEamilbyHrUserList:", ex);
				
			}
		return hrUserEmail;
	}
    
    
   @Transactional(propagation = Propagation.REQUIRED)
    public String getBdEmailByBdName(String username) {
           String sql=null;
           String email =null;
           try {
        	
           sql="select email from Tbl_RecPortal_RecruitmentportalLogin where UserName='"+username+"'";
           email=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
           }catch (Exception e) {
        		logger.error("Exception raised in the method getBdEmailByBdName:", e);
		}
           return email;
    }
   
   
   @Transactional(propagation = Propagation.REQUIRED)
   public String getUserNameByBdName(String fname) {
          String sql=null;
          String uName =null;
          try {
       	   sql="select UserName from TBL_ATTENDANCE_USERS where FullName='"+fname+"' and status=1";
          //sql="select email from Tbl_RecPortal_RecruitmentportalLogin where UserName='"+username+"'";
       	uName=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
          }catch (Exception e) {
       		logger.error("Exception raised in the method getUserNameByBdName:", e);
		}
          return uName;
   }
   @Transactional(propagation = Propagation.REQUIRED)
	public PreonboardingEducationDetails getEducationDetailsByCanId(int candidateid) throws HandlingException {
	   PreonboardingEducationDetails canObj=null;
		try{
		    // Session session = this.sessfact.getCurrentSession();
		     String sql = "from PreonboardingEducationDetails  where candidateid ="+candidateid;
		     canObj = (PreonboardingEducationDetails) getCurrentSession().createQuery(sql).uniqueResult();
			
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getEducationDetailsByCanId:", ex);
			
		}
	return canObj;
	}
   @Transactional(propagation = Propagation.REQUIRED)
	public String addEducationDetails(PreonboardingEducationDetails canaddObj) throws HandlingException {
		String message=null;
		 try{
			 
			Integer saveobj=(Integer) getCurrentSession().save(canaddObj);
			 
			 if(saveobj>0) {
				 message="saved";
			 }
			 else {
				 message="notSaved"; 
			 }
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method addEducationDetails:", ex);
				
			}
		
		return message;	
	}
   @Transactional(propagation = Propagation.REQUIRED)
	public TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS updateEducationDetails(String ssc, String intermediate,
			String graduation, String post_graduation, String educomments, Integer tblpk,Integer loginEmpNumber) throws HandlingException {
		TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS message=null;
		
		try {
		//Session sess = this.sessfact.getCurrentSession();
		
		TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS updatedetails = (TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS)getCurrentSession().get(TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS.class, tblpk);
		updatedetails.setSsc(ssc);
		updatedetails.setIntermediate(intermediate);
		updatedetails.setGraduation(graduation);
		updatedetails.setPost_graduation(post_graduation);
		updatedetails.setComments(educomments);
		updatedetails.setSubbmited_by(loginEmpNumber);
		updatedetails.setSubmmited_date(new Date());
		getCurrentSession().update(updatedetails);
		
		}
		 catch (Exception ex) {
				logger.error("Exception raised in the method updateEducationDetails:", ex);
				
			}
		
		return message;
	}
   
   @Transactional(propagation = Propagation.REQUIRED)
    public void saveTLAllocation(JobAllocationTL tlAllocation) throws HandlingException {
		//Session session = sessfact.getCurrentSession();
		
		 try{
			 getCurrentSession().save(tlAllocation);
			
			
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method saveTLAllocation:", ex);
				 
			} 
		
		
	} 
    @Transactional(propagation = Propagation.REQUIRED)
	public void saveRecAllocation(JobAllocationRecruiter recAllocation) throws HandlingException {
		//Session session = sessfact.getCurrentSession();
		 try{
			 getCurrentSession().save(recAllocation);
			
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method saveRecAllocation:", ex);
				
			}
		
		
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void tlUnAssign(JobAllocationTL checkAllotedTOTL) throws HandlingException {
		 //Session session = sessfact.getCurrentSession();
		 try{
			 getCurrentSession().update(checkAllotedTOTL);
			
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method tlUnAssign:", ex);
				 
		 }
		
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public void recUnAssign(JobAllocationRecruiter recAllocation) throws HandlingException {
		// Session session = sessfact.getCurrentSession();
		 try{
			 getCurrentSession().update(recAllocation);
			
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method recUnAssign:", ex);
				 
		 }
		
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public JobAllocationTL checkAssignedToTLOrNot(Integer jobid,
			Integer assigneeEmp, Integer loginEmpNumber) throws HandlingException {
		JobAllocationTL allocatedornot=null;
		//Session session = sessfact.getCurrentSession();
		
		 try
		  {
			  Criteria criteria=getCurrentSession().createCriteria(JobAllocationTL.class,"job");
				criteria.add(Restrictions.eq("jobdescid", jobid));
				criteria.add(Restrictions.eq("tlempno", assigneeEmp));
				criteria.add(Restrictions.eq("bdempno", loginEmpNumber));
				allocatedornot=(JobAllocationTL) criteria.uniqueResult();
				
		  }
		  catch (Exception ex) {
				logger.error("Exception raised in the method checkAssignedToTLOrNot:", ex);
				
			} 
		return allocatedornot;
	}
	@Transactional(propagation = Propagation.REQUIRED)
	public JobAllocationRecruiter checkAssignedToRecOrNot(Integer jobid,
			Integer assigneeEmp, Integer loginEmpNumber) throws HandlingException {
		JobAllocationRecruiter allocatedornot=null;
		//Session session = sessfact.getCurrentSession();
		 
		 try
		  {
			  Criteria criteria=getCurrentSession().createCriteria(JobAllocationRecruiter.class,"job");
				criteria.add(Restrictions.eq("jobdescid", jobid));
				criteria.add(Restrictions.eq("recempno", assigneeEmp));
				criteria.add(Restrictions.eq("tlempno", loginEmpNumber));
				allocatedornot=(JobAllocationRecruiter) criteria.uniqueResult();
				
		  }
		  catch (Exception ex) {
				logger.error("Exception raised in the method checkAssignedToRecOrNot:", ex);
				
			} 
		return allocatedornot;
	}

	
	@Transactional(propagation = Propagation.REQUIRED)
	public String fileExistOrNot(String fileName,int candidateid) throws HandlingException {
		 String pan=null;
		 try
		  {
			  	
			  	 String sql="select fileName from TBL_RECPORTAL_PREOBT_ATTACHMENTS where candidate_id="+candidateid+" and fileName='"+fileName+"'";
			  	pan=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
		  }
		  catch (Exception ex) {
				logger.error("Exception raised in the method fileExistOrNot:", ex);
				
			}
		return pan;
		
	}
	
	
	
	@Transactional
	public List<Tbl_RecPortal_JobAttachments> getAllJobList(int jobid) throws HandlingException {
		List<Tbl_RecPortal_JobAttachments> jbean=null;
	
		try{
			//Session session = sessfact.getCurrentSession();
			
			String sql="select tblpk,attachmentname,attachmentType from Tbl_RecPortal_JobAttachments where jobid="+jobid+" and attachmentType!='Mail'";
			jbean= getCurrentSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(Tbl_RecPortal_JobAttachments.class)).list();
		
		}
		catch (Exception ex) {
			logger.error("Exception raised in the method Tbl_RecPortal_JobAttachments:", ex);
			
		}
		return jbean;
		
		
	}
	
	@Transactional
	public List<Tbl_RecPortal_candidateAttachments> getAllCandiateList(int candidateid) throws HandlingException {
		List<Tbl_RecPortal_candidateAttachments> cbean=null;
	
		try{
			//Session session = sessfact.getCurrentSession();
			
			String sql="select tblpk,attachmentname,attachmentType from Tbl_RecPortal_candidateAttachments where candidateid="+candidateid+"";
			cbean=  getCurrentSession().createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(Tbl_RecPortal_candidateAttachments.class)).list();
				

		}
		catch (Exception ex) {
			logger.error("Exception raised in the method getAllCandiateList:", ex);
			
		}
		
		return cbean;
	}
	
	@Transactional
	public String getAllCanInfo(int candidateid) throws HandlingException {
		String canbean=null;
	
		try{
			//Session session = sessfact.getCurrentSession();
			
			String sql="select resumeName from Tbl_RecPortal_CandidateInformation where candidateid="+candidateid+"";
			canbean= (String) getCurrentSession().createSQLQuery(sql).uniqueResult();
				

		}
		catch (Exception ex) {
			logger.error("Exception raised in the method getAllCanInfo:", ex);
			
		}
		
		return canbean;
	}
	
	
	
	 
	 
	 @Transactional
	 public List<String> fileDownloadByName(Integer candidateid,String fileName) throws HandlingException {
	 	
		 List<String> attchmentName=null;
	 	 try{
	 		 
	 		 String sql="select attachmentname from  Tbl_RecPortal_candidateAttachments where candidateid="+candidateid+" and attachmentname='"+fileName+"'";
	 	
	 		 attchmentName= (List) getCurrentSession().createQuery(sql).list();
	 		  
	 	 } catch (Exception ex) {
	 			logger.error("Exception raised in the fileDownloadByName option:", ex);
	 			
	 		}
	 	return attchmentName;
	 	
}

	 
	 
	//can attahments chck whether file alrdy exist or not
		 @Transactional(propagation = Propagation.REQUIRED)
		    public String getCanAttachFilenameByType(Integer candidateid, String fname) {
		           String sql=null;
		           String ftype =null;try {
		          
		           sql="select attachmentname from Tbl_RecPortal_candidateAttachments where candidateid="+candidateid+" and attachmentname='"+fname+"'";
		           ftype=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
		           }catch (Exception e) {
		        	   logger.error("Exception raised in the getCanAttachFilenameByType option:", e);
				}
		           return ftype;
		    }
		 
		 
		 @Transactional
	public String getCanResumeFilenameByType(Integer canid, String filename) {
		
		  String sql=null;
          String rtype =null;
          try {
         
          sql="select resumeName from Tbl_RecPortal_CandidateInformation where candidateid="+canid+" and resumeName='"+filename+"'";
          rtype=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
          }
          catch (Exception e) {
       	   logger.error("Exception raised in the getCanResumeFilenameByType option:", e);
		}
          return rtype;
   }
	

	 @Transactional
	public String getJobAttachFilenameByType(Integer jobid, String filename) {
		
		  String sql=null;
          String ctype =null;
          try {
         
          sql="select attachmentname from Tbl_RecPortal_Jobdescription where jobdescid="+jobid+" and attachmentname='"+filename+"'";
          ctype=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
	 } catch (Exception ex) {
			logger.error("Exception raised in the getJobAttachFilenameByType option:", ex);
			
		}
          return ctype;
   }
	
	
	
	 @Transactional
		public String checkJobCodeExist(String jobCode) throws HandlingException {
			String jobcode="";
		 	 try{
		 		 
		 		 String sql="select jobCode from Tbl_RecPortal_Jobdescription where jobCode='"+jobCode+"'";
		 		 
		 	
		 		jobcode= (String) getCurrentSession().createSQLQuery(sql).uniqueResult();
		 		  
		 	 } catch (Exception ex) {
		 			logger.error("Exception raised in the checkJobCodeExist option:", ex);
		 			
		 		}
		 	
		 	return jobcode;
		 
	}
	

	 @Transactional
		public List<SctReportDto> getJobIdByJdCategory(Integer bdempno, String jdcategory, String fromdate, String todate) throws HandlingException {
			List<SctReportDto> jdList=null;
		 	 try{
					
					//String sql="select distinct jd1_.createdby as createdby, jd1_.jobdescid as jobdescid, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid where   convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and jd1_.jd_category='"+jdcategory+"' and jd1_.createdby="+bdempno+" and this_.tlstatus='Selected'";
					
					String sql="select distinct jd1_.jobdescid as jobdescid,jd1_.createdby as createdby,(select cmpny_name from Tbl_RecPortal_CompanyDescription where cmpny_id=jd1_.cmpny_id) as company,(select fullname from TBL_ATTENDANCE_USERS where emp_number=jd1_.createdby) as bdname, (select fullname from TBL_ATTENDANCE_USERS where emp_number=this_.tlEmpNo) as tlname,jd1_.jobCode as jobcode , this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid join Tbl_RecPortal_TlAllocation t on jd1_.jobdescid=t.jobdescid where   jd1_.jd_category='"+jdcategory+"' and convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and this_.tlstatus='Selected' and t.empstatus='Active' and  jd1_.createdby="+bdempno+"" ;
					
					
					Query query=getCurrentSession().createSQLQuery(sql).setResultTransformer( new AliasToBeanResultTransformer(SctReportDto.class) );
					jdList = query.list();
				
		 	 }
		 	 catch (Exception ex) {
		 			logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
		 			
		 		}
		 	return jdList;
		}	 
		
		@Transactional
		public List<Integer> getTlsByJobid(Integer jobdescid) throws HandlingException {
			List<Integer> assignTl=null;
			 try{
				 String sql="select distinct ja.assignedto from Tbl_RecPortal_JobAllocation ja,Tbl_RecPortal_RecruitmentportalLogin rl where ja.jobdescid="+jobdescid+" and rl.employee_role='TEAMLEAD' and  ja.assignedto=rl.emp_number";
				 assignTl=getCurrentSession().createSQLQuery(sql).list(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
					
				}
			return assignTl;
		}
		
		
		@Transactional
		public List<Integer> getAllTlsByJobid(Integer jobdescid) throws HandlingException {
			List<Integer> assignTl=null;
			 try{
				 String sql="select distinct tlEmpNo from Tbl_RecPortal_TlAllocation  where jobdescid="+jobdescid+" and empstatus='Active'";
				 assignTl=getCurrentSession().createSQLQuery(sql).list(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getAllTlsByJobid:", ex);
					
				}
			return assignTl;
		}
		
		
		@Transactional
		public Integer getTlSubCount(Integer jd, Integer tl,String fd,String td) throws HandlingException {
			/* String fd=null;
				Date sysDate=new Date();
				 SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
				 
					 fd= formatter.format(sysDate);*/
			Integer TLsubCount=null;
			 try{
				 
				String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+jd+" and tlstatus='Selected' and assignedTl="+tl+" and convert(date,tlsubmitdate)>='"+fd+"' and convert(date,tlsubmitdate)<='"+td+"'  "; //and convert(date,tlsubmitdate)>='"+fromdate+"' and convert(date,tlsubmitdate)<='"+todate+"'//
				 TLsubCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getTlSubCount:", ex);
					
				}
			return TLsubCount;
		}
		 
		@Transactional
		public Integer getSctClearedCountByTlsub(Integer jd,Integer tl,String fd,String td) throws HandlingException {
			Integer sctselCount=null;
		 try{
				 
				 String sql="select count(candidateid) from Tbl_RecPortal_CandidateStatus  where jobid="+jd+" and sctStatus in('Selected','VP select','BD Select','Director select','Asst VP select') and tlEmpNo="+tl+" and convert(date,sctsubmitdate)>='"+fd+"' and convert(date,sctsubmitdate)<='"+td+"'"; // and candidateid IS NOT NULL and candidateid <> '' and convert(date,sctsubmitdate)>='"+fromdate+"' and convert(date,sctsubmitdate)<='"+todate+"'
				  sctselCount=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getSctClearedCountByTlsub:", ex);
					
				}
			return sctselCount;
		}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<SctReportDto> getJobIdByAllJdCategory(String fromdate, String todate) throws HandlingException {
			 List<SctReportDto> jdList=null;
				try{
				
				//jd1_.jd_category in ('A' ,'B1' ,'B2' ,'C') and   String sql="select distinct jd1_.createdby as createdby, jd1_.jobdescid as jobdescid, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid where  jd1_.jd_category in ('A' ,'B1' ,'B2' ,'C') and convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and this_.tlstatus='Selected' ";
				String sql="select distinct jd1_.jobdescid as jobdescid,jd1_.createdby as createdby,(select fullname from TBL_ATTENDANCE_USERS where emp_number=jd1_.createdby) as bdname, (select fullname from TBL_ATTENDANCE_USERS where emp_number=this_.tlEmpNo) as tlname,(select cmpny_name from Tbl_RecPortal_CompanyDescription where cmpny_id=jd1_.cmpny_id) as company,jd1_.jobCode as jobcode, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid join Tbl_RecPortal_TlAllocation t on jd1_.jobdescid=t.jobdescid where   convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and this_.tlstatus='Selected' and t.empstatus='Active' \r\n" + 
						"";
				Query query=getCurrentSession().createSQLQuery(sql).setResultTransformer( new AliasToBeanResultTransformer(SctReportDto.class) );
				jdList = query.list();
				
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method getUsersByDesignation:", ex);
					
				}
				return jdList;
		}
		
		
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<SctReportDto> getJobIdByBdmAllJdCategory(int bdempno,String fromdate, String todate) throws HandlingException {
			 List<SctReportDto> jdList=null;
			 try{
				
				
				//  jd1_.jd_category in ('A' ,'B1' ,'B2' ,'C') and String sql="select distinct jd1_.createdby as createdby, jd1_.jobdescid as jobdescid, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid where  (jd1_.jd_category='A' or jd1_.jd_category='B1' or jd1_.jd_category='B2' or jd1_.jd_category='C') and convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and jd1_.createdby="+bdempno+" and this_.tlstatus='Selected'";
				
				
				
				String sql="select distinct jd1_.jobdescid as jobdescid, jd1_.createdby as createdby,(select cmpny_name from Tbl_RecPortal_CompanyDescription where cmpny_id=jd1_.cmpny_id) as company,(select fullname from TBL_ATTENDANCE_USERS where emp_number=jd1_.createdby) as bdname, (select fullname from TBL_ATTENDANCE_USERS where emp_number=this_.tlEmpNo) as tlname,jd1_.jobCode as jobcode, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid join Tbl_RecPortal_TlAllocation t on jd1_.jobdescid=t.jobdescid where  convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and this_.tlstatus='Selected' and t.empstatus='Active' and  jd1_.createdby="+bdempno+" " ;
				
				
				Query query=getCurrentSession().createSQLQuery(sql).setResultTransformer( new AliasToBeanResultTransformer(SctReportDto.class) );
				jdList = query.list();
				
				 
				
				
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method getUsersByDesignation:", ex);
					
				}
				
				return jdList;
		}
		
		@Transactional
		public String getSctClearedDateByTlsub(Integer jd, Integer tl, String fromdate, String todate) throws HandlingException {
			
			String sctcldate=null;
			 try{
				 
				  String sql="select sctsubmitdate from Tbl_RecPortal_CandidateStatus  where jobid="+jd+" and sctStatus in('Selected','VP select','BD Select','Director select') and assignedTl="+tl+" and convert(date,sctsubmitdate)>='"+fromdate+"' and convert(date,sctsubmitdate)<='"+todate+"' "; 
				  sctcldate=(String) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getAssignedTlByJobid:", ex);
					
				}
			return sctcldate;
		}

		@Transactional(propagation = Propagation.REQUIRED)
		public List<SctReportDto> getJobIdByJdCategoryAllBdm(String fromdate, String todate, String jdcategory) throws HandlingException {
			 List<SctReportDto> jdList=null;
				try{
				
				
				//String sql="select distinct jd1_.createdby as createdby, jd1_.jobdescid as jobdescid, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as  jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid where   convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and jd1_.jd_category='"+jdcategory+"' and this_.tlstatus='Selected'";
				
				String sql="select distinct jd1_.jobdescid as jobdescid,jd1_.createdby as createdby,(select cmpny_name from Tbl_RecPortal_CompanyDescription where cmpny_id=jd1_.cmpny_id) as company,"
						+ "(select fullname from TBL_ATTENDANCE_USERS where emp_number=jd1_.createdby) as bdname, (select fullname from TBL_ATTENDANCE_USERS "
						+ "where emp_number=this_.tlEmpNo) as tlname,jd1_.jobCode as jobcode, this_.tlEmpNo as tlEmpNo, jd1_.jd_category as "
						+ " jdCategory from Tbl_RecPortal_CandidateStatus this_ inner join Tbl_RecPortal_Jobdescription jd1_ on  this_.jobid=jd1_.jobdescid "
						+ "join Tbl_RecPortal_TlAllocation t on jd1_.jobdescid=t.jobdescid where  jd1_.jd_category ='"+jdcategory+"' "
						+ "and convert(date,this_.sctsubmitdate) >= '"+fromdate+"' and convert(date,this_.sctsubmitdate) <= '"+todate+"' and this_.tlstatus='Selected' and t.empstatus='Active'  "; 
						
				
				
				Query query=getCurrentSession().createSQLQuery(sql).setResultTransformer( new AliasToBeanResultTransformer(SctReportDto.class) );
				jdList = query.list();
				
				
				
			}
				catch (Exception ex) {
					logger.error("Exception raised in the method getUsersByDesignation:", ex);
					
				}
				
				return jdList;
	}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<Jobdescription> getAllJobDescriptionByDate(Integer loginEmpNumber, Date fromdate, Date todate) throws HandlingException {
			List<Jobdescription> jdList=null;
			  try
			  {
				
				
				
				String sql= "exec allJobDescription @loginemp="+loginEmpNumber+",@fromdate ='"+fromdate+"',@todate='"+todate+"'";
				Query query = getCurrentSession().createSQLQuery(sql).addEntity(Jobdescription.class);
				jdList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAllJobDescriptionByDate:", ex);
					 
				}
			return jdList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<DisplayRequirementsDTO> getAllClosedJobDescriptionByDate(Integer loginEmpNumber, String fdate, String tdate) throws HandlingException {
			List<DisplayRequirementsDTO> jdList=null;
			  try
			  {
				  String sql= "exec REC_DisplayClosedRequirements @loginEmpNo="+loginEmpNumber+",@fromdate='"+fdate+"',@todate='"+tdate+"'";
				
				  Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
				  jdList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getAllJobDescriptionByDate:", ex);
					
				}
			return jdList;
		}
		@Transactional
		public String getSCTSubmittedDate(Integer jobId, Integer candSourceby, Integer candidateId) throws HandlingException {
			String sctSubmittedDate=null;
			 try{
				 
				  String sql="select convert(varchar, sctsubmitdate, 23) as  sctsubmitdate  from Tbl_RecPortal_CandidateStatus  where jobid="+jobId+" and sctStatus in('Selected','VP select','BD Select','Director select','SCT screen reject','SCT Screen Hold','SCT soft skills reject','Asst VP select') and  recempno="+candSourceby+" and candidateid="+candidateId+"" ; 
				  sctSubmittedDate=(String) getCurrentSession().createSQLQuery(sql).uniqueResult(); 
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method getSCTSubmittedDate:", ex);
					
				}
			return sctSubmittedDate;
			
		}
		@Transactional
		public String checkResumeExistorNot(String fileName) {
			String filename=null;
			try {
			Session sess = this.sessfact.getCurrentSession(); 
			String hql="select resumeName from Tbl_RecPortal_CandidateInformation where resumeName='"+fileName+"'";
			 filename=(String)sess.createSQLQuery(hql).uniqueResult();
			}
			catch (Exception ex) {
				logger.error("Exception raised in the method checkResumeExistorNot:", ex);
				
			}
			return filename;
			
			
		}
		
		
		@Transactional(propagation = Propagation.REQUIRED)
		public String getFullNameByEmpNo(Integer empno) throws HandlingException {
			String userName=null;
			try
			  {
				  
				  String hql="select FullName from TBL_ATTENDANCE_USERS where emp_number="+empno+"";
				  userName=(String)getCurrentSession().createSQLQuery(hql).uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getFullNameByEmpNo:", ex);
					
				}
			return userName;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String getFullNameByUserName(String usernme) throws HandlingException {
			String Fullname=null;
			try
			  {
				  
				  String hql="select FullName from TBL_ATTENDANCE_USERS where UserName='"+usernme+"' and status=1";
				  Fullname=(String)getCurrentSession().createSQLQuery(hql).uniqueResult();
				  
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getFullNameByUserName:", ex);
					
				}
			return Fullname;
		}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<DisplayRequirementsDTO> getDisplayRequirements(Integer loginEmpNumber) throws HandlingException {
			List<DisplayRequirementsDTO> jdList=null;
			  try
			  {
				  String sql= "exec BDM_DisplayRequirements @loginEmpNo="+loginEmpNumber+"";
					Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
							
				  jdList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getDisplayRequirements:", ex);
					 
				}
			return jdList;
			
		}
		
		@Transactional(propagation = Propagation.REQUIRED)
		public List<CCategoryReportDTO> cCategoryReportByDate(String fromdate, String todate) {
			List<CCategoryReportDTO> cCatList=null;
			  try
			  {
				  String sql= "exec REC_CcategoryReportByDate @fromdate='"+fromdate+"',@todate='"+todate+"'";
					Query query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CCategoryReportDTO.class));
					cCatList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method cCategoryReportByDate:", ex);
				}
			return cCatList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<CandidateInfoDTO> getCandidateListRecruiter(Integer jobDescId,Integer loginEmpNo) {
			 List<CandidateInfoDTO> canddateList=null;
				
			 try
			  {
				 String sql1= "select candidateid as candidateId,jobid as jobId,recEmpNo as recEmpNo from Tbl_RecPortal_CandidateStatus where jobid="+jobDescId+" and recEmpNo="+loginEmpNo+" and recStatus='Selected'";
						Query query = getCurrentSession().createSQLQuery(sql1).setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoDTO.class));
						canddateList=query.list();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getCandidateListRecruiter:", ex);
					
				}
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String getNameByjobId(Integer jobId) {
			String bdName=null;
			 try
			  {
			String hql="select FullName from TBL_ATTENDANCE_USERS where emp_number=(select createdby from Tbl_RecPortal_Jobdescription where jobdescid ="+jobId+") and status=1";
			  bdName=(String)getCurrentSession().createSQLQuery(hql).uniqueResult();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getNameByjobId:", ex);
					
				} 
			return bdName;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<JobAllocation> getAllocationListByJobID(Integer jobid, Integer empNumber, String role) throws HandlingException {
			
			
				List<JobAllocation> allocationList=null;
				 try
				  {
					  Session session = this.sessfact.getCurrentSession(); 
					  Criteria criteria=session.createCriteria(JobAllocation.class,"job");
					  criteria.createAlias("job.jobDesc", "desc");
						criteria.add(Restrictions.eq("desc.jobdescid", jobid));
						if(role.equalsIgnoreCase("TEAMLEAD")) {
							
							criteria.add(Restrictions.eq("assignedby", empNumber));
							criteria.setProjection(
									Projections.projectionList().add(Projections.property("assignedto"), "assignedto")
									.add(Projections.property("assignedby"), "assignedby")
									.add(Projections.property("empstatus"), "empstatus"));
									
							criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocation.class));
							allocationList=criteria.list();
						}
						
						else if(role.equalsIgnoreCase("BDM")){
							criteria.add(Restrictions.eq("desc.createdby", empNumber));
							criteria.setProjection(
									Projections.projectionList().add(Projections.property("assignedto"), "assignedto")
									.add(Projections.property("assignedby"), "assignedby")
									.add(Projections.property("empstatus"), "empstatus"));
									
							criteria.setResultTransformer(new AliasToBeanResultTransformer(JobAllocation.class));
							allocationList=criteria.list();
					}
							else {
						
						
							}
					  
				  }
				  catch (Exception ex) {
						logger.error("Exception raised in the method getAllocationListByJobID:", ex);
						 String content = ex.toString();
							StringWriter errors = new StringWriter();
							ex.printStackTrace(new PrintWriter(errors));
							throw new HandlingException("Exception due to", errors.toString(), content);
					}
				return allocationList;
			
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String getInterviewDate(int canid,int jobdescid) {
			String interviewDate=null;
			 try
			  {
			String hql="select convert(varchar,cliIntDate,23) from Tbl_RecPortal_InterviewDetails where cnadidateid="+canid+" and jobdescid="+jobdescid+"";
			interviewDate=(String)getCurrentSession().createSQLQuery(hql).uniqueResult();
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getNameByjobId:", ex);
					
				} 
			return interviewDate;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String savePersonnelDetails(CandidatePersonnelInfoDTO info, String candidateid) {
			int candidate=0;String message=null;
			if(!candidateid.isEmpty()) {
				candidate=Integer.parseInt(candidateid);
			}
			 String additionalFamilyInfo="";
			 try
			  {
				 String infohql="from Tbl_RecPortal_CandidateAdditionalInfo where candidateid="+candidate+"";
				 Tbl_RecPortal_CandidateAdditionalInfo obj=(Tbl_RecPortal_CandidateAdditionalInfo)getCurrentSession().createQuery(infohql).uniqueResult();
				 
				 System.out.println("obj in dao"+obj);
				 
				 if(obj!=null) {
					 additionalFamilyInfo=obj.getFamilyDetails()+""+info.getFamilyDetails();
					 if(null!=info.getFather()) {
					 obj.setFathername(info.getFather());}
					 if(null!=info.getFather()) {
					 obj.setMothername(info.getMother());}
					 if(null!=info.getFamilyDetails()) {
					 obj.setFamilyDetails(additionalFamilyInfo);}
					 try {
					 getCurrentSession().update(obj); 
					 message="Success";}
					 catch(Exception e) {
						 logger.error("Exception raised in the method while updating additional info:", e);
					 }
				 }
				 else {
					 Tbl_RecPortal_CandidateAdditionalInfo nwobj=new Tbl_RecPortal_CandidateAdditionalInfo();
					 additionalFamilyInfo=info.getFamilyDetails();
					 nwobj.setCandidateid(candidate);
					 if(null!=info.getFather()) {
						 nwobj.setFathername(info.getFather());}
					 if(null!=info.getMother()) {
						 nwobj.setMothername(info.getMother());}
					 if(null!=info.getFamilyDetails()) {
						 nwobj.setFamilyDetails(additionalFamilyInfo);}
					 try {
					 getCurrentSession().save(nwobj); 
					 message="Success";
					 }
					 catch(Exception e) {
						 logger.error("Exception raised in the method while saving additional info:", e);
					 }
				 }
			
			  }
			  catch (Exception ex) {
					logger.error("Exception raised in the method getNameByjobId:", ex);
					
				} 
		
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<String> getcandidateDocStatus(Integer canid) {
			List<String> docList=null;
			
			 try{
			  //   Session session = this.sessfact.getCurrentSession();
			     String sql = "select status from TBL_RECPORTAL_PREOBT_ATTACHMENTS  where candidate_id ="+canid;
			     docList =  getCurrentSession().createQuery(sql).list();
				
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method TBL_RECPORTAL_PREOBT_ATTACHMENTS:", ex);
				
			}
		return docList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Tbl_RecPortal_PreobtStatus updateDocSubmitStatus(Tbl_RecPortal_PreobtStatus candiaddtnlinfo) {
			 try{
				  
				 getCurrentSession().update(candiaddtnlinfo);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateDocSubmitStatus:"+ ex.toString());
					 
			 }
			return null;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<ViewUserProfilesSCTStatusDTO> getBdReportByClientAndBD(String client, String bdm,String fromdate,String todate) {
			List<ViewUserProfilesSCTStatusDTO> canddateList = null;
			String sql1=null;
			try {
				
	
				//String sql1= "exec Rec_BDMReportByBDM  @BDM ="+bdm+"";
			
				sql1= "exec Rec_BDMReportByClient  @client="+client+",@BDM ='"+bdm+"',@fromdate='"+fromdate+"',@todate='"+todate+"'";
				Query query = getCurrentSession().createSQLQuery(sql1).setResultTransformer(new AliasToBeanResultTransformer(ViewUserProfilesSCTStatusDTO.class));
				canddateList=query.list();
				
			} catch (Exception ex) {
				logger.error("Exception raised in the method updateDocSubmitStatus:"+ ex.toString());
				 
		 }
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<ViewUserProfilesSCTStatusDTO> getSctReportByDates(String fromdate, String todate) {
			List<ViewUserProfilesSCTStatusDTO> canddateList = null;
			try {
				
				String sql1= "exec Rec_SCTReportByDates  @fromdate='"+fromdate+"',@todate ='"+todate+"'";
				Query query = getCurrentSession().createSQLQuery(sql1).setResultTransformer(new AliasToBeanResultTransformer(ViewUserProfilesSCTStatusDTO.class));
				canddateList=query.list();
				
			} catch (Exception ex) {
				logger.error("Exception raised in the method getSctReportByDates:"+ ex.toString());
				 
		 }
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<ViewUserProfilesSCTStatusDTO> SCTReportByTillDate() {
			List<ViewUserProfilesSCTStatusDTO> canddateList = null;
			try {
				
				String sql1= "exec Rec_SCTReportByTillDate ";
				Query query = getCurrentSession().createSQLQuery(sql1).setResultTransformer(new AliasToBeanResultTransformer(ViewUserProfilesSCTStatusDTO.class));
				canddateList=query.list();
				
			} catch (Exception ex) {
				logger.error("Exception raised in the method updateDocSubmitStatus:"+ ex.toString());
				 
		 }
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<ViewUserProfilesSCTStatusDTO> getBdReportByLoginBd(Integer loginEmpNumber) {
			List<ViewUserProfilesSCTStatusDTO> canddateList = null;
			String sql1=null;
			try {
				
	
				//String sql1= "exec Rec_BDMReportByBDM  @BDM ="+bdm+"";
			
				sql1= "exec Rec_BDMReportByBDM  @BDM ="+loginEmpNumber+"";
				Query query = getCurrentSession().createSQLQuery(sql1).setResultTransformer(new AliasToBeanResultTransformer(ViewUserProfilesSCTStatusDTO.class));
				canddateList=query.list();
				
			} catch (Exception ex) {
				logger.error("Exception raised in the method updateDocSubmitStatus:"+ ex.toString());
				 
		 }
			return canddateList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String getusermailbyempno(Integer sourcedByEmp) {
			String sql=null;
	           String email =null;
	           try {
	        	
	           sql="select email from Tbl_RecPortal_RecruitmentportalLogin where emp_number="+sourcedByEmp+"";
	           email=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
	           }catch (Exception e) {
	        		logger.error("Exception raised in the method getBdEmailByBdName:", e);
			}
	           return email;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Map<String, Integer> getCcategoryCountByDates(String fromdate, String todate) {
			String sql=null;
			Map<String, Integer> map=null;
	           List<Object[]> objList=null;
	           try {
	        	
	           sql="select  (select  fullname  from TBL_ATTENDANCE_USERS where emp_number=j.createdby) as bdname,count(candidateid) as bdcount from"
	           		+ " Tbl_RecPortal_CandidateStatus c join Tbl_RecPortal_Jobdescription j on c.jobid=j.jobdescid  where c.bdmstatus='To Client' and c.bdmempno=j.createdby "
	           		+ "and convert(Date,c.bdmsubmitdate)>='"+fromdate+"' and convert(Date,c.bdmsubmitdate)<='"+todate+"' and j.jd_category='C' group by j.createdby\r\n" + 
	           		"";
	           objList= getCurrentSession().createSQLQuery(sql).list();
	           
	           
	           map = objList.stream() .collect(Collectors.toMap(record -> (String) record[0], record -> (Integer) record[1]));
				
				
				

	           }catch (Exception e) {
	        		logger.error("Exception raised in the method getCcategoryCountByDates:", e);
			}
	           return map;	
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Integer getDocumentCountbycandidateid(Integer canid) {

			String sql=null;
			Integer count =null;
	           try {
	        	
	           sql="select count(1) from TBL_RECPORTAL_PREOBT_ATTACHMENTS where candidate_id="+canid+"";
	           count=(Integer) getCurrentSession().createSQLQuery(sql).uniqueResult();
	           }catch (Exception e) {
	        		logger.error("Exception raised in the method getBdEmailByBdName:", e);
			}
	           return count;
			
			
			
			
		}
		@Transactional
		public Map<String, Integer> getFTEcategoryCountByDates(String fromdate, String todate) {
			String sql=null;
			Map<String, Integer> map=null;
	           List<Object[]> objList=null;
	           try {
	        	
	           sql="select  (select  fullname  from TBL_ATTENDANCE_USERS where emp_number=j.createdby) as bdname,count(candidateid) as bdcount from"
	           		+ " Tbl_RecPortal_CandidateStatus c join Tbl_RecPortal_Jobdescription j on c.jobid=j.jobdescid  where c.bdmstatus='To Client' and c.bdmempno=j.createdby "
	           		+ "and convert(Date,c.bdmsubmitdate)>='"+fromdate+"' and convert(Date,c.bdmsubmitdate)<='"+todate+"' and j.External_Internal='External Fulltime' group by j.createdby\r\n" + 
	           		"";
	           objList= getCurrentSession().createSQLQuery(sql).list();
	           
	           
	           map = objList.stream() .collect(Collectors.toMap(record -> (String) record[0], record -> (Integer) record[1]));
				
				
				

	           }catch (Exception e) {
	        		logger.error("Exception raised in the method getCcategoryCountByDates:", e);
			}
	           return map;	
			
			
			
		}
		@Transactional
		public List<Tbl_RecPortal_CandidateAdditionalComments> viewCandidateEducationAdditionalComments(Integer canid) {
			List<Tbl_RecPortal_CandidateAdditionalComments> comments=null;
			 try{
				 String sql="from Tbl_RecPortal_CandidateAdditionalComments where candidateid="+canid+" and commentType='Education' order by tbl_pk desc ";
				 comments= getCurrentSession().createQuery(sql).list();
			 } catch (Exception ex) {
					logger.error("Exception raised in the method viewCandidateAdditionalComments:", ex);
				}
			return comments;
		}
		@Transactional
		public List<Tbl_RecPortal_CandidateAdditionalComments> viewCandidateEmploymentAdditionalComments(
				Integer canid) {
			List<Tbl_RecPortal_CandidateAdditionalComments> comments=null;
			 try{
				 String sql="from Tbl_RecPortal_CandidateAdditionalComments where candidateid="+canid+" and commentType='Employment' order by tbl_pk desc ";
				 comments= getCurrentSession().createQuery(sql).list();
			 } catch (Exception ex) {
					logger.error("Exception raised in the method viewCandidateAdditionalComments:", ex);
				}
			return comments;
		}
		@Transactional
		public String getFilenameByCandidateId(Integer candidateid) {
			 String fname =null;
			   try {
		           String sql=null;
		           sql="select hr_loi_filename from Tbl_RecPortal_PreobtStatus where candidate_id="+candidateid+"";
		           fname=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
			   }
			   catch (Exception ex) {
					logger.error("Exception raised in the method getFilenameByCandidateId:", ex);
				}             
		           return fname;
		}
		
	
		@Transactional(propagation = Propagation.REQUIRED)
		public void saveVerificationComments(DocVerifierComments docObj) {
			try {
			Session sess = this.sessfact.getCurrentSession();
			 sess.save(docObj);
		
		}catch (Exception e) {
            logger.error(e.getMessage(), e);
		}
     }
		@Transactional(propagation = Propagation.REQUIRED)
		public List<DocVerifierComments> viewDocumentVerifierComments(Integer canid) {
			List<DocVerifierComments> comments=null;
			 try{
				 
				 String sql="from DocVerifierComments where candidate_id="+canid+" order by id desc ";
				 comments= getCurrentSession().createQuery(sql).list();
			 } catch (Exception ex) {
					logger.error(ex.getMessage(), ex);
				
				}
			return comments;
		}
		
		@Transactional
		public String addCandidateAdditionalComments(Tbl_RecPortal_CandidateAdditionalComments canaddObj) {
				String message=null;
				 try{
					 Session sess = this.sessfact.getCurrentSession();
					Integer saveobj=(Integer) sess.save(canaddObj);
					 if(saveobj>0) {
						 message="saved";
					 }
					 else {
						 message="notSaved"; 
					 }
				 }
				 catch (Exception ex) {
						logger.error("Exception raised in the method addCandidateAdditionalComments:", ex);
						
					}
				return message;	
			}
		@Transactional
		public Tbl_RecPortal_CandidateAdditionalInfo updatemgmtReservationDetails(String mgmtAppctcPA, String mgmtAppctcPM,
				String mgmtComments, String addtnlbenifits, Integer tblpk) throws HandlingException {
			Tbl_RecPortal_CandidateAdditionalInfo message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_CandidateAdditionalInfo updatedetails = (Tbl_RecPortal_CandidateAdditionalInfo)sess.get(Tbl_RecPortal_CandidateAdditionalInfo.class, tblpk);
			updatedetails.setMgmtAppctcPA(mgmtAppctcPA);
			updatedetails.setMgmtAppctcPM(mgmtAppctcPM);
			//updatedetails.setOfferedDesignation(offeredDesignation);
			if(!mgmtComments.isEmpty()) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
				 LocalDateTime now = LocalDateTime.now();// " - "+dtf.format(now);
				updatedetails.setMgmtComments(mgmtComments+" - "+dtf.format(now));	
			}
			
			updatedetails.setAddtnlbenifits(addtnlbenifits);
			sess.update(updatedetails);
			
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method addmgmtReservationDetails:", ex);
					
				}
			
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public Tbl_RecPortal_CandidateAdditionalInfo updatenegcanExpecDetails(String nego_rate_pa, String nego_rate_pm,
				String offeredDesignation, Integer tblpk, Date dojDate, String rec_rate_pa, String rec_rate_pm, 
				String negcandcomments) throws HandlingException {
	     Tbl_RecPortal_CandidateAdditionalInfo message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_CandidateAdditionalInfo updatedetails = (Tbl_RecPortal_CandidateAdditionalInfo)sess.get(Tbl_RecPortal_CandidateAdditionalInfo.class, tblpk);
			updatedetails.setNego_rate_pa(nego_rate_pa);
			updatedetails.setNego_rate_pm(nego_rate_pm);
			updatedetails.setOfferedDesignation(offeredDesignation);
			updatedetails.setDojDate(dojDate);
			updatedetails.setNegratePA(rec_rate_pa);
			updatedetails.setNegratePM(rec_rate_pm);
			if(!negcandcomments.isEmpty()) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
				 LocalDateTime now = LocalDateTime.now();// " - "+dtf.format(now);
				updatedetails.setCan_ExpecComments(negcandcomments+" - "+dtf.format(now));
			}
			
			
			sess.update(updatedetails);
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method updatenegcanExpecDetails:", ex);
				}
			return message;
		}
		@Transactional
		public Tbl_RecPortal_PreobtStatus updateNegPageStatus(String negstatus, Integer loginEmpNumber, Date date,
				Integer tblpk) throws HandlingException {
			Tbl_RecPortal_PreobtStatus message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_PreobtStatus updatedetails = (Tbl_RecPortal_PreobtStatus)sess.get(Tbl_RecPortal_PreobtStatus.class, tblpk);
			updatedetails.setNego_status(negstatus);
			updatedetails.setNego_subdate(date);
			updatedetails.setNego_uploadedBy(loginEmpNumber);
			sess.update(updatedetails);
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateNegPageStatus:", ex);
					
				}
			
			return message;
		}
		/*public String saveEmployerDetails(String employer,String tenure,String ctc,String ldctc,String changereason,String comments, Integer candidate_Id) {
			String message = null;
			try {
				PreOnbordingEmployerDetials bankDtlObj = new PreOnbordingEmployerDetials();
				bankDtlObj.setCandidateid(candidate_Id);
				bankDtlObj.setEmployername(employer);
				bankDtlObj.setTenureresume(tenure);
				bankDtlObj.setCtc(ctc);
				bankDtlObj.setLdctc(ldctc);
				bankDtlObj.setReasonforchange(changereason);
				bankDtlObj.setReccomments(comments);
				
				Integer ankpkId = (Integer) getCurrentSession().save(bankDtlObj);
				if(ankpkId!=null) {
					message = "Employee Bank Details Added Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		*/
		@Transactional(propagation = Propagation.REQUIRED)
		public String saveverifierEmployerDetails(String appointmentletter, String relievingletter, String bankstmt,
				String payslip, String comments, Integer candidate_Id, String ver_employername, String ver_id, Integer loginEmpNumber) {
			String message = null;
			try {
				int id=0;
				if(ver_id!="") {
					id = Integer.parseInt(ver_id);
				}
				Session sess = this.sessfact.getCurrentSession();
				PreOnbordingEmployerDetials updatedetails = (PreOnbordingEmployerDetials)sess.get(PreOnbordingEmployerDetials.class, id);
				Date cd=new Date();
				if(updatedetails!=null) {
				updatedetails.setAppointmenttenure(appointmentletter);
				updatedetails.setRelievetenure(relievingletter);
				updatedetails.setBankstmtstenure(bankstmt);
				updatedetails.setPayslipstenure(payslip);
				if(!comments.isEmpty()) {
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
					 LocalDateTime now = LocalDateTime.now();//" - "+dtf.format(now);
					updatedetails.setVerifiercomments(comments+" - "+dtf.format(now));	
				}
				
				updatedetails.setVerifiedby(loginEmpNumber.toString());
				//updatedetails.setVerifieddate(cd.toString());
				sess.update(updatedetails);
					message = "Employeer Details Added Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String saveCandidatePayslip(String months, String payslips, String bankstmt, String comments,
				Integer candidate_Id, Integer loginEmpNumber) {
			String message = null;
			try {
				
				Session sess = this.sessfact.getCurrentSession();
				PreOnboardingPayslipDetails  payslipObj=new PreOnboardingPayslipDetails();
				payslipObj.setMonth(months);
				payslipObj.setPayslip(payslips);
				payslipObj.setBank_stmt(bankstmt);
				payslipObj.setComments(comments);
				payslipObj.setCandidateid(candidate_Id);
				Integer id=(Integer) sess.save(payslipObj);
				if(id!=null) {
					message = "Payslip Details Added Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<PreOnboardingPayslipDetails> getPayslipDetailsByCanId(Integer canid) {
			List<PreOnboardingPayslipDetails> paysliList=null;
			try{
			    // Session session = this.sessfact.getCurrentSession();
			     String sql = "from PreOnboardingPayslipDetails  where candidateid ="+canid;
			     paysliList = (List<PreOnboardingPayslipDetails>) getCurrentSession().createQuery(sql).list();				
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getPayslipDetailsByCanId:", ex);
				
			}
		return paysliList;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String saveCandidateProofs(String idproof, String idproofRN, String addressproof, String addressproofRN,
				String photoRN, Integer candidate_Id, Integer loginEmpNumber) {
			String message = null;
			try {
				
				Session sess = this.sessfact.getCurrentSession();
				PreOnbordingPersonnelDetails  persnelObj=new PreOnbordingPersonnelDetails();
				persnelObj.setIdproof(idproof);
				char cidproofRN=idproofRN.charAt(0);
				char caddressproofRN=addressproofRN.charAt(0);
				persnelObj.setIsreceived(idproofRN);
				persnelObj.setAddressproof(addressproof);
				persnelObj.setIsadproffreceived(addressproofRN);
				persnelObj.setPhoto(photoRN);
				persnelObj.setCandidateid(candidate_Id);
				Integer id=(Integer) sess.save(persnelObj);
				if(id!=null) {
					message = "Details Added Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String editCourse(String course_id, String postgraduate, String graduate,
				String intermediate, Integer candidate_Id, String ssc, Integer loginEmpNumber) {
			String message = null;
			try {
				int id=0;
				if(course_id!="") {
					id = Integer.parseInt(course_id);
				}
				Session sess = this.sessfact.getCurrentSession();
				PreonboardingEducationDetails updatedetails = (PreonboardingEducationDetails)sess.get(PreonboardingEducationDetails.class, id);
				if(updatedetails!=null) {
				updatedetails.setPg(postgraduate);
				updatedetails.setDegree(graduate);
				updatedetails.setInter(intermediate);
				updatedetails.setSsc(ssc);
				sess.update(updatedetails);
					message = "Course Details Updated Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public String editPercentage(String course_id, String postgraduate, String graduate, String intermediate,
				Integer candidate_Id, String ssc, Integer loginEmpNumber) {
			String message = null;
			try {
				int id=0,postgraduateprc=0,graduateprc=0,intermediateprc=0,sscprc=0;
				if(course_id!="") {	id = Integer.parseInt(course_id);	}
				if(postgraduate!="") {	postgraduateprc = Integer.parseInt(postgraduate);}
				if(graduate!="") {graduateprc = Integer.parseInt(graduate);	}
				if(ssc!="") {sscprc = Integer.parseInt(ssc);	}
				if(intermediate!="") {intermediateprc = Integer.parseInt(intermediate);	}
				
				Session sess = this.sessfact.getCurrentSession();
				PreonboardingEducationDetails updatedetails = (PreonboardingEducationDetails)sess.get(PreonboardingEducationDetails.class, id);
				if(updatedetails!=null) {
				updatedetails.setPgperc(postgraduateprc);
				updatedetails.setDegree_perc(graduateprc);
				updatedetails.setInterperc(intermediateprc);
				updatedetails.setSscperc(sscprc);
				sess.update(updatedetails);
					message = "Percentage Details Updated Successfully";	
				}else {
					message = "Something Went Wrong";
				}
				
			} catch (Exception e) {
				logger.info(e.getMessage(), e);
			}
			return message;
		}
		@Transactional(propagation = Propagation.REQUIRED)
		public List<PreOnbordingPersonnelDetails> getPersonalDetailsByCanId(Integer canid) {
			List<PreOnbordingPersonnelDetails> paysliList=null;
			try{
			    // Session session = this.sessfact.getCurrentSession();
			     String sql = "from PreOnbordingPersonnelDetails  where candidateid ="+canid;
			     paysliList = (List<PreOnbordingPersonnelDetails>) getCurrentSession().createQuery(sql).list();				
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getPersonalDetailsByCanId:", ex);
				
			}
		return paysliList;
		}
		
		 @Transactional(propagation = Propagation.REQUIRED)
			public String updateeducationdetails(PreonboardingEducationDetails canaddObj) throws HandlingException {
				String message=null;
				 try{
					 
					 getCurrentSession().update(canaddObj);
					
						 message="updated";
					/* }
					 else {
						 message="notupdated"; 
					 }*/
				 }
				 catch (Exception ex) {
						logger.error("Exception raised in the method updateeducationdetails:", ex);
						
					}
				
				return message;	
			}
		 @Transactional(propagation = Propagation.REQUIRED)
		public String updatepersonaldetails(CandidateInformation canaddObj) {
			 String message=null;
			 try{
				 
				 getCurrentSession().update(canaddObj);
				
					 message="updated";
				/* }
				 else {
					 message="notupdated"; 
				 }*/
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updatepersonaldetails:", ex);
					
				}
			
			return message;	
		}
		 
		 @Transactional(propagation = Propagation.REQUIRED)
			public String updateCandidateAdditionalDetails(Tbl_RecPortal_CandidateAdditionalInfo canaddObj) {
				 String message=null;
				 try{
					 
					 getCurrentSession().update(canaddObj);
					
						 message="updated";
					/* }
					 else {
						 message="notupdated"; 
					 }*/
				 }
				 catch (Exception ex) {
						logger.error("Exception raised in the method updatepersonaldetails:", ex);
						
					}
				
				return message;	
			}
		 
		 @Transactional(propagation = Propagation.REQUIRED)
			public Tbl_RecPortal_CandidateAdditionalInfo getcandidateAdditionalInfoById(
					Integer candidateId) throws HandlingException {
			
			 Tbl_RecPortal_CandidateAdditionalInfo candidateInfo=null;
				 try{
					 String hql="from Tbl_RecPortal_CandidateAdditionalInfo where candidateid="+candidateId+"";
					 candidateInfo=(Tbl_RecPortal_CandidateAdditionalInfo) getCurrentSession().createQuery(hql).uniqueResult();
				 }catch(Exception ex) {
						logger.error("Exception raised in the method getcandidateAdditionalInfoById:", ex);
						 
					}
				return candidateInfo;
			}
		 @Transactional(propagation = Propagation.REQUIRED)
		public PreOnbordingEmployerDetials getEmployerDetailsByid(String neg_id) {
			int neg_id1=0;
			if(neg_id!="") {
				neg_id1 = Integer.parseInt(neg_id);
			}
			PreOnbordingEmployerDetials candidateInfo=null;
			 try{
				 String hql="from PreOnbordingEmployerDetials where id="+neg_id1+"";
				 candidateInfo=(PreOnbordingEmployerDetials) getCurrentSession().createQuery(hql).uniqueResult();
			 }catch(Exception ex) {
					logger.error("Exception raised in the method getEmployerDetailsByid:", ex);
					 
				}
			return candidateInfo;
		}
		 @Transactional(propagation = Propagation.REQUIRED)
		public void updateEmployerDetails(PreOnbordingEmployerDetials canaddObj) {
			 try{
				 getCurrentSession().update(canaddObj);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateEmployerDetails:", ex);
				}
		}
		 @Transactional(propagation = Propagation.REQUIRED)
		public PreOnbordingPersonnelDetails getPersonaDetailById(int id) {
			
			PreOnbordingPersonnelDetails candidateInfo=null;
			 try{
				 String hql="from PreOnbordingPersonnelDetails where id="+id+"";
				 candidateInfo=(PreOnbordingPersonnelDetails) getCurrentSession().createQuery(hql).uniqueResult();
			 }catch(Exception ex) {
					logger.error("Exception raised in the method updateCandidateProofsById:", ex);
					 
				}
			return candidateInfo;
		}
		 @Transactional(propagation = Propagation.REQUIRED)
		public void updateCandidateProofsById(PreOnbordingPersonnelDetails persnelObj) {
			try{
				 getCurrentSession().update(persnelObj);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateCandidateProofsById:", ex);
				}
		}
		 @Transactional(propagation = Propagation.REQUIRED)
		public PreOnboardingPayslipDetails getpaySlipDetailsBytableId(int id) {
			PreOnboardingPayslipDetails candidateInfo=null;
			 try{
				 String hql="from PreOnboardingPayslipDetails where id="+id+"";
				 candidateInfo=(PreOnboardingPayslipDetails) getCurrentSession().createQuery(hql).uniqueResult();
			 }catch(Exception ex) {
					logger.error("Exception raised in the method getpaySlipDetailsBytableId:", ex);
					 
				}
			return candidateInfo;
		}
		
		 @Transactional(propagation = Propagation.REQUIRED)
			public void updatePayslipDetails(PreOnboardingPayslipDetails persnelObj) {
				try{
					 getCurrentSession().update(persnelObj);
				 }
				 catch (Exception ex) {
						logger.error("Exception raised in the method updatePayslipDetails:", ex);
					}
			}
}
