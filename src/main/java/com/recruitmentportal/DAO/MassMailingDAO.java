package com.recruitmentportal.DAO;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.recruitmentportal.DTO.CandidateInfoDTO;
import com.recruitmentportal.DTO.CandidateStatusDTO;
import com.recruitmentportal.DTO.DisplayRequirementsDTO;
import com.recruitmentportal.DTO.ResumeDTO;
import com.recruitmentportal.DTO.UserDTO;
import com.recruitmentportal.controller.HandlingException;
import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.CompanyDescription;
import com.recruitmentportal.entity.CompanyNoticePeriod;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.Tbl_RecPortal_tecpanelFeedBack;

@Repository
public class MassMailingDAO {
	@Autowired
	private SessionFactory sessfact;
	  private static final Logger logger = Logger.getLogger(MassMailingDAO.class);
	  private Session getCurrentSession() {

	        return sessfact.getCurrentSession();
	    } 
	@Transactional(propagation = Propagation.REQUIRED)
	public List<ResumeDTO> getmailsbyskill(String skills) throws HandlingException {
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
public Date getSringDatetoSQLDate(String date) throws ParseException {
java.sql.Date from_date = null;
try {
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	Date parsedDate = format.parse(date);
	from_date = new java.sql.Date(parsedDate.getTime());
} catch (Exception e) {
	logger.error("Exception in Commons getSringDatetoSQLDate :", e);
}
return from_date;
}
@Transactional(propagation = Propagation.REQUIRED)
public List<DisplayRequirementsDTO> AllTLRequirementsByManager(Integer empNumber, Integer bdempno, Integer clienid, String fromdate, String todate) throws HandlingException {
 System.out.println("ALL TL BY MGR REQU+++");
List<DisplayRequirementsDTO> AlljdList=null;

  try
  {
	  int[] arry;
	 
	  HashMap<Integer,ArrayList> map= new HashMap<Integer,ArrayList>();
	  if(empNumber == 200698) {
		  arry=new int[]{200360,201344,200698,201117};					
	  }else {
		  arry=new int[]{201432,202123,201434};
	  }
	  Query query =null;
	 
	  for (int i : arry) {
	  String sql= "exec REC_AllTLRequirementsByManager @loginEmpNo="+i+",@bdEmpNo="+bdempno+",@clientId="+clienid+",@fromdate='"+getSringDatetoSQLDate(fromdate)+"',@todate='"+getSringDatetoSQLDate(todate)+"'  ";
      query = getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(DisplayRequirementsDTO.class));
	     map.put(i,  (ArrayList) query.list());
	  }
	
	  ArrayList list1=new ArrayList();
	  ArrayList list2=new ArrayList();
	  ArrayList list3=new ArrayList();
	  ArrayList list4=new ArrayList();
	  
	  ArrayList list5=new ArrayList();
	  ArrayList list6=new ArrayList();
	  ArrayList list7=new ArrayList();
	  ArrayList mergedList=new ArrayList();
	  
	 list1=map.get(201117);
	 list2=map.get(201344);
	 list3=map.get(200698);
	 list4=map.get(200360);
	 list5=map.get(201432);
	 list6=map.get(202123);
	 list7=map.get(201434);

	 if(empNumber == 200698) {
		 mergedList=(ArrayList) Stream.of(list1,list2,list3,list4).flatMap(Collection::stream).collect(Collectors.toList());
	 }else {
		 mergedList=(ArrayList) Stream.of(list5,list6,list7).flatMap(Collection::stream).collect(Collectors.toList());
	 }
	 
	 AlljdList=mergedList;
  }
	catch (Exception ex) {
		logger.error("Exception raised in the method getTLAllJobDesc:", ex);
	}
return AlljdList;
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
public List<Integer> getAllTlAssignToByJobID(Integer jobdescid, Integer empNumber,String role) throws HandlingException {
List<Integer> allocationList=null;
 try
  {
	 if(empNumber==200698) {
		String sql="select recempno from Tbl_RecPortal_RECAllocation where tlEmpno in(200698,200360,201344,201117) and jobdescid="+jobdescid+"";
		allocationList = getCurrentSession().createSQLQuery(sql).list();
	 }else {
		 String sql="select recempno from Tbl_RecPortal_RECAllocation where tlEmpno in(201432,202123,201434) and jobdescid="+jobdescid+"";
			allocationList = getCurrentSession().createSQLQuery(sql).list();
	 }
  }
  catch (Exception ex) {
		logger.error("Exception raised in the method getAllTlAssignToByJobID:", ex);
		 
	}
return allocationList;
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
@Transactional(propagation = Propagation.REQUIRED)
public List<CandidateInfoDTO> getAllCandidateList(String role,Integer empNo, Integer jobId, String jobType,Integer assignedTl) throws HandlingException {
 List<CandidateInfoDTO> AllcanddateList=null;

 try
  {
	 String sql=null;
	 sql="select jobid as jobId, recEmpNo as recEmpNo, candidateid as candidateId from Tbl_RecPortal_CandidateStatus where jobid="+jobId+" and recEmpNo="+empNo+" and recStatus='Selected' and assignedTl="+assignedTl+" "; 
    
  	AllcanddateList= getCurrentSession().createSQLQuery(sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoDTO.class)).list();
	  	
  }
  catch (Exception ex) {
		logger.error("Exception raised in the method getAllCandidateList:", ex);
		
	}
return AllcanddateList;
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
@Transactional(propagation = Propagation.REQUIRED)

public CandidateStatusDTO getCandidateStutusByUser(Integer candidateId,
	Integer loginEmpNumber, String role,Integer jobid) throws HandlingException {
	
 CandidateStatusDTO status=null;
try {
	
	String sq=null;
	
	switch(role) {
	case "TEAMLEAD":
		sq="select tlStatus as status, tlComment as coment from Tbl_RecPortal_CandidateStatus where jobid="+jobid+"and tlEmpNo="+loginEmpNumber+" and candidateid="+candidateId+" ";
		
		System.out.println("getCandidateStutusByUser++"+sq);
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
public UserDTO getUserNameByEmpNo(Integer empNumber, String role) throws HandlingException {
 UserDTO userName=null;
try
  {
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
}
