package com.recruitmentportal.DAO;

import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.recruitmentportal.DTO.CandidateInfoViewForNegotiation;
import com.recruitmentportal.controller.HandlingException;
import com.recruitmentportal.entity.PreObtNegotiationTeamStatus;
import com.recruitmentportal.entity.PreOnbordingEmployerDetials;
import com.recruitmentportal.entity.TBL_RECPORTAL_PREOBT_ATTACHMENTS;
import com.recruitmentportal.entity.Tbl_RecPortal_CandidateAdditionalInfo;
import com.recruitmentportal.entity.Tbl_RecPortal_PreobtStatus;
import com.recruitmentportal.entity.Tbl_Recportal_Preobt_Doc_Status;

@Repository
public class ReportsDao {
	public static final ThreadLocal<Session> local = new ThreadLocal<>(); 
	@Autowired
	private SessionFactory sessfact;
	
	  private static final Logger logger = Logger.getLogger(ReportsDao.class);
	  private Session getCurrentSession() {

		  Session session = (Session) local.get();
		    if(session == null){
		        session = sessfact.openSession();
		        local.set(session);
		    }else {
		    	session = sessfact.getCurrentSession();
		    }
	        return session;
	    } 
	// get managers list 
	
	@Transactional
	public List getAllJobId(String fromDate,String endDate) throws HandlingException{
		List results  =null;
	
		try{
		Session session = this.sessfact.getCurrentSession();
		String reportQuery = "Exec [dbo].[usptest] @fromdate ='"+fromDate+"' ,@todate='"+endDate+"'";
		 results  =session.createSQLQuery(reportQuery).list();
				 
				 
		}
		 catch (Exception ex) {
				logger.error("Exception raised in the method getAllJobId:", ex);
				
			}
		return results;
		
	}
	@Transactional
	public List<CandidateInfoViewForNegotiation> getcandiListByClientSelected(String empRole) throws HandlingException {
		List<CandidateInfoViewForNegotiation> list=null;
		 try{
			 System.out.println(empRole);
			 String Sql=null;
			 if(!empRole.equalsIgnoreCase("HRMANAGER")) {
			  Sql= "select * from CandidateInfoViewForNegotiation";
			 }
			 else {
				 Sql= "select * from CandidateInfoViewForLOI";
			 }
			  list=getCurrentSession().createSQLQuery(Sql).setResultTransformer(new AliasToBeanResultTransformer(CandidateInfoViewForNegotiation.class)).list(); 
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getcandiListByClientSelected:", ex);
				
			}
		return list;
	}

	@Transactional
	public String saveNegotiationComments(PreObtNegotiationTeamStatus negObj) throws HandlingException {
		String message=null;
		 try {
		
		Integer generatedId= (Integer) getCurrentSession().save(negObj);
		 if(generatedId>0) {
			 message="saved";
		 }
		 else {
			 message="notSaved";
		 }
	}catch (Exception ex) {
		logger.error("Exception raised in the method saveLoginUserData:", ex);
		
			
		 
	}
		return message;
	}
	@Transactional
	public List<PreObtNegotiationTeamStatus> viewNegotiateComments(Integer canid) throws HandlingException {
		
		List<PreObtNegotiationTeamStatus> sctcomments=null;
		 try{
			 
			 String sql="from PreObtNegotiationTeamStatus where candidate_id="+canid+" order by tblPk desc ";
			 sctcomments= getCurrentSession().createQuery(sql).list();
		 } catch (Exception ex) {
				logger.error("Exception raised in the method getSCTComments:", ex);
			
			}
		return sctcomments;
		

	}

		@Transactional
		public String savePreObtOtherFiles(TBL_RECPORTAL_PREOBT_ATTACHMENTS documents) throws HandlingException {
			String message=null; 
			logger.info("came to dao");
			 try {
			
			Integer  saveObj=(Integer) getCurrentSession().save(documents);
			  if(saveObj>0) {
				  message="saved"; 
			  }
			  else {
				  message="notSaved";  
			  }
		}catch (Exception ex) {
			logger.error("Exception raised in the method saveMultipleFiles:", ex);
			
		}
			return message;

	  } 
		
		
		@Transactional
		public List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> getcandidateDocInfo(Integer candidate_id) throws HandlingException {
			List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> docList=null;
			
				 try{
				  //   Session session = this.sessfact.getCurrentSession();
				     String sql = "from TBL_RECPORTAL_PREOBT_ATTACHMENTS  where candidate_id ="+candidate_id;
				     docList = (List<TBL_RECPORTAL_PREOBT_ATTACHMENTS>) getCurrentSession().createQuery(sql).list();
					
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method TBL_RECPORTAL_PREOBT_ATTACHMENTS:", ex);
					
				}
			return docList;
		}
		

		@Transactional
		public TBL_RECPORTAL_PREOBT_ATTACHMENTS prefileDownloadByID(Integer candidate_id,String fileType) throws HandlingException {
			
			 TBL_RECPORTAL_PREOBT_ATTACHMENTS  downloadinfo=null;
			 try{
				 
				 String sql="from TBL_RECPORTAL_PREOBT_ATTACHMENTS where candidate_id="+candidate_id+" and fileType='"+fileType+"'"; 
				 logger.info(sql);
				 downloadinfo= (TBL_RECPORTAL_PREOBT_ATTACHMENTS) getCurrentSession().createQuery(sql).list();
				  
			 } catch (Exception ex) {
					logger.error("Exception raised in the method pre obt Download file option:", ex);
					
				}
			return downloadinfo;
			
		}


		@Transactional
		public Integer savePreOBTVerifyDocs(Tbl_Recportal_Preobt_Doc_Status candidateid) throws HandlingException {
			 Integer tbl_pk=null;
			 try{
				 
				 tbl_pk=(Integer) getCurrentSession().save(candidateid);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method addCandidate:", ex);
					
				}
			
			return tbl_pk;
		}


		//view pre obt verify documents
		@Transactional
		public List<Tbl_Recportal_Preobt_Doc_Status> getVerifyDocs(Integer candidate_id) throws HandlingException {
			List<Tbl_Recportal_Preobt_Doc_Status> docList=null;
			
				 try{
				     //Session session = this.sessfact.getCurrentSession();
				     String sql = "from Tbl_Recportal_Preobt_Doc_Status  where candidate_id ="+candidate_id;
				     docList = (List<Tbl_Recportal_Preobt_Doc_Status>) getCurrentSession().createQuery(sql).list();
				
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method Tbl_Recportal_Preobt_Doc_Status:", ex);
					
				}
			return docList;
		}


		//verify docs file already exist

		@Transactional

		public String checkVerifyDocsExists(Integer candidate_id, String fileName) {
			String existsornot=null;
			try {
			Session sess = this.sessfact.getCurrentSession(); 
			String hql="select fileName from TBL_RECPORTAL_PREOBT_DOC_STATUS where  candidate_id="+candidate_id+" and fileName='"+fileName+"'";
			 existsornot=(String)sess.createSQLQuery(hql).uniqueResult();
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method checkVerifyDocsExists:", ex);
					
				}
			return existsornot; 
		}
		@Transactional
		public String addCandiAddtnlDetails(Tbl_RecPortal_CandidateAdditionalInfo canaddObj) throws HandlingException {
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
					logger.error("Exception raised in the method addCandiAddtnlDetails:", ex);
					
				}
			
			return message;	
		}
		@Transactional
		public Tbl_RecPortal_CandidateAdditionalInfo updatemgmtReservationDetails(String mgmtAppctcPA, String mgmtAppctcPM,String mgmtComments, String addtnlbenifits, Integer tblpk, String offeredDesignation) throws HandlingException {
			Tbl_RecPortal_CandidateAdditionalInfo message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_CandidateAdditionalInfo updatedetails = (Tbl_RecPortal_CandidateAdditionalInfo)sess.get(Tbl_RecPortal_CandidateAdditionalInfo.class, tblpk);
			updatedetails.setMgmtAppctcPA(mgmtAppctcPA);
			updatedetails.setMgmtAppctcPM(mgmtAppctcPM);
			updatedetails.setOfferedDesignation(offeredDesignation);
			updatedetails.setMgmtComments(mgmtComments);
			updatedetails.setAddtnlbenifits(addtnlbenifits);
			sess.update(updatedetails);
			
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method addmgmtReservationDetails:", ex);
					
				}
			
			return message;
		}
		
		@Transactional
		public Tbl_RecPortal_CandidateAdditionalInfo getcanidateAdditionDetailsByCanId(int candidateid) throws HandlingException {
			Tbl_RecPortal_CandidateAdditionalInfo canObj=null;
			try{
			    // Session session = this.sessfact.getCurrentSession();
			     String sql = "from Tbl_RecPortal_CandidateAdditionalInfo  where candidateid ="+candidateid;
			     canObj = (Tbl_RecPortal_CandidateAdditionalInfo) getCurrentSession().createQuery(sql).uniqueResult();
				
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getcanidateAdditionDetailsByCanId:", ex);
				
			}
		return canObj;
		}
		
	   @Transactional(propagation = Propagation.REQUIRED)
	    public String getFilenameByType(Integer canid, String fname) {
		   String ftype =null;
		   try {
	           String sql=null;
	           //candidate_id="+canid+" and 
	           sql="select  distinct fileName from TBL_RECPORTAL_PREOBT_ATTACHMENTS where fileName='"+fname+"'";
	           ftype=(String) getCurrentSession().createSQLQuery(sql).uniqueResult();
		   }
		   catch (Exception ex) {
				logger.error("Exception raised in the method getFilenameByType:", ex);
			}             
	           return ftype;
	    }
	    
	   @Transactional(propagation = Propagation.REQUIRED)
	    public void updatePreObtDocs(String newFilename, Integer canid, String ftype) {
		   try {
	          
	           Query q=getCurrentSession().createQuery("update TBL_RECPORTAL_PREOBT_ATTACHMENTS set fileName='"+newFilename+"' where candidate_id="+canid+" and fileType='"+ftype+"'");
	           q.executeUpdate();
		   }catch (Exception ex) {
				logger.error("Exception raised in the method updatePreObtDocs:", ex);
				
			}
	           
	    }
	    
	   @Transactional(propagation = Propagation.REQUIRED)
		public Tbl_RecPortal_CandidateAdditionalInfo updatecanPersonalDetails(String fathername, String mothername,
				String familyDetails, String ctc_pm, String ectc_pm, String negratePM,
				String negratePA, Integer tblpk) throws HandlingException {
	      Tbl_RecPortal_CandidateAdditionalInfo message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_CandidateAdditionalInfo updatedetails = (Tbl_RecPortal_CandidateAdditionalInfo)sess.get(Tbl_RecPortal_CandidateAdditionalInfo.class, tblpk);
			
			if(updatedetails!=null) {
				String additionalFamilyInfo=updatedetails.getFamilyDetails();
				familyDetails=familyDetails+";"+additionalFamilyInfo;
			updatedetails.setFathername(fathername);
			updatedetails.setMothername(mothername);
			updatedetails.setFamilyDetails(familyDetails);
		/*	updatedetails.setCtc_pm(ctc_pm);
			updatedetails.setEctc_pm(ectc_pm);
			updatedetails.setNegratePM(negratePM);
			updatedetails.setNegratePA(negratePA);*/
			sess.update(updatedetails);
			}
			
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method addmgmtReservationDetails:", ex);
					
				}
			
			return message;
		}
	    
	   @Transactional(propagation = Propagation.REQUIRED)
		public Tbl_RecPortal_CandidateAdditionalInfo updatenegcanExpecDetails(String nego_ctc_pa, String nego_ctc_pm,
				String nego_ectc_pm, String nego_ectc_pa, String nego_rate_pm, String nego_rate_pa, Integer tblpk) throws HandlingException {
	     Tbl_RecPortal_CandidateAdditionalInfo message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_CandidateAdditionalInfo updatedetails = (Tbl_RecPortal_CandidateAdditionalInfo)sess.get(Tbl_RecPortal_CandidateAdditionalInfo.class, tblpk);
			updatedetails.setNego_ctc_pa(nego_ctc_pa);
			updatedetails.setNego_ctc_pm(nego_ctc_pm);
			updatedetails.setNego_ectc_pa(nego_ectc_pa);
			updatedetails.setNego_ectc_pm(nego_ectc_pm);
			updatedetails.setNego_rate_pa(nego_rate_pa);
			updatedetails.setNego_rate_pm(nego_rate_pm);
			sess.update(updatedetails);
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method updatenegcanExpecDetails:", ex);
				}
			return message;
		}
		
		@Transactional
		public String addCandiExpecDetails(Tbl_RecPortal_CandidateAdditionalInfo canaddObj) throws HandlingException {
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
					logger.error("Exception raised in the method addCandiExpecDetails:", ex);
					
				}
			
			return message;	
		}
		@Transactional
		public Tbl_RecPortal_PreobtStatus getpreobtStatusByCanId(Integer candidateid) throws HandlingException {
			Tbl_RecPortal_PreobtStatus canObj=null;
			try{
			     //Session session = this.sessfact.getCurrentSession();
			     String sql = "from Tbl_RecPortal_PreobtStatus  where candidate_id ="+candidateid;
			     canObj = (Tbl_RecPortal_PreobtStatus) getCurrentSession().createQuery(sql).uniqueResult();
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method Tbl_Recportal_Preobt_Doc_Status:", ex);
				
			}
		return canObj;
		}
		@Transactional
		public String saveNegotiationStatus(Tbl_RecPortal_PreobtStatus negObj) throws HandlingException {
			String message=null;
			 try {
			
			Integer generatedId= (Integer) getCurrentSession().save(negObj);
			 if(generatedId>0) {
				 message="saved";
			 }
			 else {
				 message="notSaved";
			 }
		}catch (Exception ex) {
			logger.error("Exception raised in the method saveLoginUserData:", ex);
			
				
			
		}
			return message;
		}
		@Transactional
		public Tbl_RecPortal_PreobtStatus updateNegPageStatus(String negstatus, Integer loginEmpNumber, Date date,
				String originalFilename, Integer tblpk) throws HandlingException {
			Tbl_RecPortal_PreobtStatus message=null;
			
			try {
			Session sess = this.sessfact.getCurrentSession();
			
			Tbl_RecPortal_PreobtStatus updatedetails = (Tbl_RecPortal_PreobtStatus)sess.get(Tbl_RecPortal_PreobtStatus.class, tblpk);
			updatedetails.setNego_status(negstatus);
			updatedetails.setNego_subdate(date);
			updatedetails.setNego_uploadedBy(loginEmpNumber);
			if(originalFilename!=null) {
			updatedetails.setNegteam_mgmt_filename(originalFilename);
			}
			sess.update(updatedetails);
			
			}
			 catch (Exception ex) {
					logger.error("Exception raised in the method updateNegPageStatus:", ex);
					
				}
			
			return message;
		}
		
		
		@Transactional
		public Integer savePreOBTVerifyDocs(Tbl_RecPortal_PreobtStatus docSubmit) throws HandlingException {
			 Integer tbl_pk=null;
			 try{
				 
				 tbl_pk=(Integer) getCurrentSession().save(docSubmit);
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method addCandidate:", ex);
					
				}
			
			return tbl_pk;
		}
		
		
		
	   @Transactional(propagation = Propagation.REQUIRED)
		public void saveVerifyDocs(int tbl_pk,String status,String comments) throws HandlingException {
		   System.out.println("status"+status);
			 try{
				 Criteria criteria=getCurrentSession().createCriteria(TBL_RECPORTAL_PREOBT_ATTACHMENTS.class);
				 criteria.add(Restrictions.eq("tbl_pk", tbl_pk));
				 TBL_RECPORTAL_PREOBT_ATTACHMENTS sub = (TBL_RECPORTAL_PREOBT_ATTACHMENTS) criteria.uniqueResult();
				 logger.info("saveVerifyDocs status update--"+sub.toString());
				 if(sub!=null)	{
					
				 sub.setStatus(status);
				 sub.setComments(comments);
				 sub.setUploadedDate(new Date());
				 getCurrentSession().update(sub); 
				 } 
				 else{
				 }
			 }
			 catch (Exception ex) {
					logger.error("Exception raised in the method TBL_RECPORTAL_PREOBT_ATTACHMENTS:"+ex.getCause().getMessage());
					
				}
			
		}
	    
	    

	   @Transactional(propagation = Propagation.REQUIRED)
	   	public Tbl_RecPortal_PreobtStatus updateDocSubmit(String doc_ver_status,String doc_file,int tblpk,int doc_verify_uploadedBy) throws HandlingException {
	    	Tbl_RecPortal_PreobtStatus message=null;
	   		
	   		try {
	   		Session sess = this.sessfact.getCurrentSession();
	   		Tbl_RecPortal_PreobtStatus updatedetails = (Tbl_RecPortal_PreobtStatus)sess.get(Tbl_RecPortal_PreobtStatus.class, tblpk);
	   		
	   		updatedetails.setDoc_verify_status(doc_ver_status);
	   		updatedetails.setDoc_verify_date(new Date());
	   		updatedetails.setDoc_verify_uploadedBy(doc_verify_uploadedBy);
	   	
	   		if(doc_file!=null){
	   		updatedetails.setDoc_verify_mgmt_filename(doc_file);
	   		}
	   		
	   		sess.update(updatedetails);
	   		
	   		}
	   		 catch (Exception ex) {
	   				logger.error("Exception raised in the method Tbl_Recportal_Preobt_Doc_Status updateDocSubmit:", ex);
	   				
	   			}
	   		
	   		return message;
	   	}

	   @Transactional(propagation = Propagation.REQUIRED)
		public String deleteFilenameById(Integer tblpk, Integer canid) {
			String Message = "";
			try {
			Session sess = sessfact.getCurrentSession();
		    Query q=sess.createQuery("delete TBL_RECPORTAL_PREOBT_ATTACHMENTS where TBL_PK='"+tblpk+"' where candidate_id="+canid+"");
		    int i= q.executeUpdate();
				if(i>0){
					Message = "success";
				   }
				else {
					Message = "error";
				} 
			}
			catch (Exception ex) {
					logger.error("Exception raised in the method Tbl_Recportal_Preobt_Doc_Status deleteFilenameById:", ex);
					
				}
				return Message;
		}
	   @Transactional(propagation = Propagation.REQUIRED)
		public Tbl_RecPortal_PreobtStatus updateLoicanDetails(Integer tblpk, Integer canid, String loistatus, String loiComments,
				Integer uploadedBy, Date subdate, String loifile) throws HandlingException {
	Tbl_RecPortal_PreobtStatus message=null;
	   		
	   		try {
	   		Session sess = this.sessfact.getCurrentSession();
	   		Tbl_RecPortal_PreobtStatus updatedetails = (Tbl_RecPortal_PreobtStatus)sess.get(Tbl_RecPortal_PreobtStatus.class, tblpk);
	   		
	   		updatedetails.setHr_loi_comment(loiComments);
	   		if(loifile!=null) {
	   			updatedetails.setHr_loi_filename(loifile);
	   		}else {
	   			updatedetails.setHr_loi_filename(null);
	   		}
	   		
	   		updatedetails.setHr_loi_status(loistatus);
	   		updatedetails.setHr_loi_submitdate(subdate);
	   		updatedetails.setHr_loi_updateby(uploadedBy);
	   	
	   		sess.update(updatedetails);
	   		
	   		}
	   		 catch (Exception ex) {
	   				logger.error("Exception raised in the method Tbl_Recportal_Preobt_Doc_Status updateLoicanDetails:", ex);
	   				
	   			}
	   		
	   		return message;
		}

	  
	
	 @Transactional(propagation = Propagation.REQUIRED)

	public String saveCandidateEmployers(PreOnbordingEmployerDetials employerObjectnew) {
		 Integer tbl_pk=null;
		 String message=null;
		 try{
			 
			 tbl_pk=(Integer) getCurrentSession().save(employerObjectnew);
			 if(tbl_pk!=null) {
				 message="Success";
			 }
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method addCandidate:", ex);
				 message="Failed";
			}
		return null;
	}
	 @Transactional(propagation = Propagation.REQUIRED)

	public Integer getEmployerDetils(int candidate) {
		 Integer employer=null;
		 try {
			 
			 String hql="SELECT TOP 1 candidateid from Tbl_PreOnbording_EmployerDetials where candidateid="+candidate+"";
			 employer= (Integer) getCurrentSession().createSQLQuery(hql).uniqueResult();
		 }
		 catch (Exception ex) {
				logger.error("Exception raised in the method getEmployerDetils:", ex);
			}
		return employer;
	 }
	

@Transactional(propagation = Propagation.REQUIRED)
public List<PreOnbordingEmployerDetials> getEmployerListByCandidate(Integer canid) {
	List<PreOnbordingEmployerDetials> employer=null;
	 try {
		 
		 String hql="from PreOnbordingEmployerDetials where candidateid="+canid+"";
		 employer= getCurrentSession().createQuery(hql).list();
	 }
	 catch (Exception ex) {
			logger.error("Exception raised in the method getEmployerDetils:", ex);
		}
	return employer;
	
}

}













	
	
	

	
	
	




