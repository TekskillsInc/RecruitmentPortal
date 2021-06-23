
package com.recruitmentportal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.recruitmentportal.DAO.MassMailingDAO;
import com.recruitmentportal.DTO.CandidateDTO;
import com.recruitmentportal.DTO.CandidateInfoDTO;
import com.recruitmentportal.DTO.CandidateStatusDTO;
import com.recruitmentportal.DTO.DisplayRequirementsDTO;
import com.recruitmentportal.DTO.ResumeDTO;
import com.recruitmentportal.DTO.UserDTO;
import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.CompanyDescription;
import com.recruitmentportal.entity.CompanyNoticePeriod;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.Tbl_RecPortal_tecpanelFeedBack;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class MassMailingController {
	@Autowired
	private MassMailingDAO massMailingDAO;
	
	private static final Logger logger = Logger.getLogger(MassMailingController.class);
	

	@RequestMapping(value = { "/getmailsbyskill" }, method = RequestMethod.GET)
	public String viewmassmailing(HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);

		String skills = req.getParameter("primaryskills");
		List<ResumeDTO> eList =massMailingDAO.getmailsbyskill(skills);

		session.setAttribute("eList", eList);
		session.setAttribute("skills", skills);

		return "ViewMassMailEmailIds";

	}
	
	@RequestMapping(value = { "/alltlslist" }, method = RequestMethod.GET) 
	public String alltlslist(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		Integer departmentId = (Integer) session.getAttribute("department");

		Integer bdempno = null;
		Integer clienid = null;

		List<CompanyNoticePeriod> ntcprdlist = null;
		if (userName != null) {
			// String client_name = null;
			List<CompanyDescription> clients =  massMailingDAO.getAllClients();

			List<RecruitmentportalLogin> bdList = massMailingDAO.getBdNames();


			List<DisplayRequirementsDTO> alljdlist =null;// massMailingDAO.AllTLRequirementsByManager(loginEmpNumber, bdempno,clienid);
				ntcprdlist = massMailingDAO.getnoticePeriodCompnyList();
				
			model.addAttribute("jobdescList", alljdlist);
			model.addAttribute("departmentId", departmentId);
			model.addAttribute("role", role);
			model.addAttribute("ntcprdlist", ntcprdlist);
			model.addAttribute("clients", clients);
			model.addAttribute("bdList", bdList);
			return "viewAllTLJd";
					} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}
	
	@RequestMapping(value = { "/searreqsbymanager" }, method = RequestMethod.GET)
	public String searreqsbymanager(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		if (userName != null) {
			String bdnames = req.getParameter("bdname");
			String clientname = req.getParameter("clientname");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			Integer clientId = null;
			Integer bdEmpNo = null;

			if (!bdnames.isEmpty()) {
				bdEmpNo = Integer.parseInt(bdnames);
			}
			if (!clientname.isEmpty()) {
				clientId = Integer.parseInt(clientname);
			}
			
				List<DisplayRequirementsDTO> jdIDList = massMailingDAO.AllTLRequirementsByManager(loginEmpNumber, bdEmpNo,
						clientId,fromdate,todate);
				model.addAttribute("jobdescList", jdIDList);
			

			List<CompanyDescription> clients = null;
			clients = massMailingDAO.getAllClients();

			List<RecruitmentportalLogin> bdList = massMailingDAO.getBdNames();

			model.addAttribute("bdnames", bdnames);
			model.addAttribute("clientname", clientname);
			model.addAttribute("fromdate", fromdate);
			model.addAttribute("todate", todate);

			model.addAttribute("clients", clients);
			model.addAttribute("bdList", bdList);

			
				return "viewAllTLJd";
			 }
		 else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}
	@RequestMapping(value = "/viewAllTLSourceProfile", method = RequestMethod.GET)
	public String getAllTLSourceProfile(Model model, HttpServletRequest req) throws HandlingException {
System.out.println("****************-----------viewAllTLSourceProfile--------**********************");
		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		logger.info("role----------------" + role);
		List<CompanyNoticePeriod> ntcprdlist = null;
		if (userName != null) {

			String jobVal = req.getParameter("jobId");
			Integer jobId = null;
			if (!jobVal.isEmpty()) {
				jobId = Integer.parseInt(jobVal);
			}
			String jobCode = req.getParameter("jobCode");

			if (jobCode == null) {
				jobCode = massMailingDAO.getJobCodeById(jobId);
			}

			String client = massMailingDAO.getCompanyIdByJobId(jobId);
			String bdName = massMailingDAO.getNameByjobId(jobId);
			
			//List<CandidateInfoDTO> AllcandidateList1 = null;
			List<CandidateInfoDTO> AllcandidateList = null;
			List<CandidateDTO> Allcandidateinfolist = new ArrayList<CandidateDTO>();
			Integer candSourceby = null;
			String recusername = null;
			if(loginEmpNumber==200698) {
				List<Integer> allocationList = massMailingDAO.getAllTlAssignToByJobID(jobId, loginEmpNumber, role);
				
				if (allocationList.size() != 0) {
					
					int[] arr=new int[]{200360,201344,200698,201117};
					
					for (Integer i  :arr ) {
						
						 for (int assignto :allocationList ) {
							 System.out.println("##################---TL-value-"+i);
							 System.out.println("@@@@@@@@@@@@@@@@@--recEmpno---"+assignto);
							 String jobType = massMailingDAO.getJobTypeByJobId(jobId);
							 AllcandidateList = massMailingDAO.getAllCandidateList(role, assignto, jobId, jobType, i);
						 
						for (CandidateInfoDTO candidateInfoDTO : AllcandidateList) {
							
							CandidateDTO candidateDtoObj = new CandidateDTO();
							CandidateStatus candiStatusOBJ = massMailingDAO.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobId);
							InterviewDetails interview = massMailingDAO.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
							CandidateStatusDTO statusObj = massMailingDAO.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(), loginEmpNumber, role, jobId);

							candSourceby = candidateInfoDTO.getRecEmpNo();
							UserDTO user = massMailingDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");
							if(user!=null) {
							recusername = user.getUserName();
							candidateDtoObj.setEmpl_lead(user.getEmp_lead());
							}
							CandidateInformation candidateInfo = massMailingDAO.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
							String sctSubmittedDate = massMailingDAO.getSCTSubmittedDate(jobId, candSourceby,candidateInfo.getCandidateid());

							candidateDtoObj.setCandidateInfo(candidateInfo);
							candidateDtoObj.setCandidateStatus(statusObj);
							candidateDtoObj.setSourcedBy(candidateInfoDTO.getRecEmpNo());
							candidateDtoObj.setTlName(candidateDtoObj.getTlName());
							candidateDtoObj.setInterevieDetails(interview);
							candidateDtoObj.setUserName(recusername);
							candidateDtoObj.setCandidateStatusObj(candiStatusOBJ);
							candidateDtoObj.setSctSubmissionDate(sctSubmittedDate);
							Tbl_RecPortal_tecpanelFeedBack clientsavailable = massMailingDAO.getInterviewByJobId(jobId);
							if(clientsavailable!=null) {
							candidateDtoObj.setClientAvaiableFromTime(clientsavailable.getClavalabletime());
							candidateDtoObj.setClientAvaiableToTime(clientsavailable.getClavailabletimeto());
							}
							Allcandidateinfolist.add(candidateDtoObj);
							model.addAttribute("Allcandidateinfolist", Allcandidateinfolist);
						}
					}
					}
		}

			}else {
		            List<Integer> allocationList = massMailingDAO.getAllTlAssignToByJobID(jobId, loginEmpNumber, role);
				
				if (allocationList.size() != 0) {
					
					int[] arr=new int[]{201432,202123,201434};
					
					for (Integer i  :arr ) {
						
						 for (int assignto :allocationList ) {
							
							 String jobType = massMailingDAO.getJobTypeByJobId(jobId);
							 AllcandidateList = massMailingDAO.getAllCandidateList(role, assignto, jobId, jobType, i);
						 
						for (CandidateInfoDTO candidateInfoDTO : AllcandidateList) {
							
							CandidateDTO candidateDtoObj = new CandidateDTO();
							CandidateStatus candiStatusOBJ = massMailingDAO.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobId);
							InterviewDetails interview = massMailingDAO.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
							CandidateStatusDTO statusObj = massMailingDAO.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(), loginEmpNumber, role, jobId);

							candSourceby = candidateInfoDTO.getRecEmpNo();
							UserDTO user = massMailingDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");
							if(user!=null) {
							recusername = user.getUserName();
							candidateDtoObj.setEmpl_lead(user.getEmp_lead());
							}
							CandidateInformation candidateInfo = massMailingDAO.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
							String sctSubmittedDate = massMailingDAO.getSCTSubmittedDate(jobId, candSourceby,candidateInfo.getCandidateid());

							candidateDtoObj.setCandidateInfo(candidateInfo);
							candidateDtoObj.setCandidateStatus(statusObj);
							candidateDtoObj.setSourcedBy(candidateInfoDTO.getRecEmpNo());
							candidateDtoObj.setTlName(candidateDtoObj.getTlName());
							candidateDtoObj.setInterevieDetails(interview);
							candidateDtoObj.setUserName(recusername);
							candidateDtoObj.setCandidateStatusObj(candiStatusOBJ);
							candidateDtoObj.setSctSubmissionDate(sctSubmittedDate);
							Tbl_RecPortal_tecpanelFeedBack clientsavailable = massMailingDAO.getInterviewByJobId(jobId);
							if(clientsavailable!=null) {
							candidateDtoObj.setClientAvaiableFromTime(clientsavailable.getClavalabletime());
							candidateDtoObj.setClientAvaiableToTime(clientsavailable.getClavailabletimeto());
							}
							Allcandidateinfolist.add(candidateDtoObj);
							model.addAttribute("Allcandidateinfolist", Allcandidateinfolist);
						}
					}
					}
		}
			}
			
				
			model.addAttribute("jobId", jobId);
			model.addAttribute("candSourceby", candSourceby);
			model.addAttribute("role", role);

			model.addAttribute("recusername", recusername);
			model.addAttribute("jobCode", jobCode);
			model.addAttribute("ntcprdlist", ntcprdlist);
			model.addAttribute("client", client);
			model.addAttribute("bdName", bdName);
			
			
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
		return "viewAllSourcedProfiles";
	}

}
