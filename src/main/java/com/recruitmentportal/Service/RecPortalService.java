package com.recruitmentportal.Service;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.recruitmentportal.DAO.RecruitmentPortalDAO;
import com.recruitmentportal.controller.HandlingException;
import com.recruitmentportal.entity.Jobdescription;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;

@Service
public class RecPortalService {
	@Autowired
	private RecruitmentPortalDAO recruitmentDAO;
	private static final Logger logger = Logger.getLogger(RecPortalService.class);
	@Transactional(propagation = Propagation.REQUIRED)
	 public void saveMultipleFiles(Integer jobDescId,String filename,Date attachedDate, String attachementType) throws HandlingException {
		 logger.info("came to servie");
		  Tbl_RecPortal_JobAttachments files_upload=new Tbl_RecPortal_JobAttachments();
		  try {
			  Jobdescription jd=new Jobdescription();
			  jd.setJobdescid(jobDescId);
          files_upload.setJobDesc(jd);
          files_upload.setAttachmentname(filename);
          files_upload.setAttachedDate(attachedDate);
          files_upload.setAttachmentType(attachementType);
			 recruitmentDAO.saveMultipleFiles(files_upload);
		}catch(Exception e) {
			logger.error("Exception raised in saveMultipleFiles", e);
		}
	 }

	
	@Transactional(propagation = Propagation.REQUIRED)
	public void updateMultipleFiles(Jobdescription jd, String originalFilename, Date attcahedDate, String attachementType) {
		Tbl_RecPortal_JobAttachments jaObj=null;
		
		 try {
			 jaObj=recruitmentDAO.MultiplefileDownloadByType(jd.getJobdescid(),attachementType);
			 if(jaObj!=null) {
				
					 //Tbl_RecPortal_JobAttachments jaObj1= recruitmentDAO.getAtchmetbyTblPk(jaObj.getTblpk());
					 jaObj.setAttachedDate(attcahedDate);
					 jaObj.setAttachmentname(originalFilename);
					 jaObj.setJobDesc(jd);
					 recruitmentDAO.updateJdDoc(jaObj);
				
				 
			 }
	}
		 catch(Exception e) {
				logger.error("Exception raised in getAttachmentsByJob", e);
			}
	}
}
