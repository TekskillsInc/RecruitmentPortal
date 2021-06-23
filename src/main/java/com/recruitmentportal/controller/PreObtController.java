package com.recruitmentportal.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.recruitmentportal.DAO.RecruitmentPortalDAO;
import com.recruitmentportal.DAO.ReportsDao;
import com.recruitmentportal.DTO.AttachmentsDTO;
import com.recruitmentportal.DTO.CandidateInfoViewForNegotiation;
import com.recruitmentportal.DTO.CandidatePersonnelInfoDTO;
import com.recruitmentportal.DTO.PreObtVerifyDocsDTO;
import com.recruitmentportal.DTO.UserDTO;
import com.recruitmentportal.Service.EmailSender;
import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.DocVerifierComments;
import com.recruitmentportal.entity.PreObtNegotiationTeamStatus;
import com.recruitmentportal.entity.PreOnboardingPayslipDetails;
import com.recruitmentportal.entity.PreOnbordingEmployerDetials;
import com.recruitmentportal.entity.PreOnbordingPersonnelDetails;
import com.recruitmentportal.entity.PreonboardingEducationDetails;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.TBL_PREOBT_CANDIDATE_EDUCATIONAL_DETAILS;
import com.recruitmentportal.entity.TBL_RECPORTAL_PREOBT_ATTACHMENTS;
import com.recruitmentportal.entity.Tbl_RecPortal_CandidateAdditionalComments;
import com.recruitmentportal.entity.Tbl_RecPortal_CandidateAdditionalInfo;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;
import com.recruitmentportal.entity.Tbl_RecPortal_PreobtStatus;
import com.recruitmentportal.entity.Tbl_RecPortal_candidateAttachments;
import com.recruitmentportal.util.StatusEnum;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class PreObtController {

	@Autowired
	private RecruitmentPortalDAO recruitmentDAO;
	
	@Autowired
	private ReportsDao reportDao;
	@Autowired
	private Environment env;
	@Autowired
	private EmailSender newEmail;
	private static final Logger logger = Logger.getLogger(PreObtController.class);

	// by Rasheeda
	@RequestMapping(value = { "candidatelist" }, method = RequestMethod.GET)
	public String candidateList(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {

		String userName = (String) req.getSession().getAttribute("username");
		String empRole = (String) req.getSession().getAttribute("role");

		if (userName != null) {
			// LinkedList<CandidateStatusView> candiview=new LinkedList<>();
			List<CandidateInfoViewForNegotiation> candidateList = reportDao.getcandiListByClientSelected(empRole);

			String pattern = "yyyy-MM-dd";
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

			if (empRole != null) {
				model.addAttribute("role", empRole);
			}
			model.addAttribute("candList", candidateList);
			return "ClientSelectedCandidates";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	// Done By Prashant M
	@RequestMapping(value = { "docuploadpreonboard" }, method = RequestMethod.POST)
	public String PreOnboardUploadDocs(Model model, HttpServletRequest req, HttpServletResponse res,
			@RequestParam("EducationDocs") CommonsMultipartFile edufile,
			@RequestParam("IdProofDocs") CommonsMultipartFile idfile,
			@RequestParam("currOrgDocs") CommonsMultipartFile curorgfile,
			@RequestParam("pendingDocs") CommonsMultipartFile pendingfile,
			@RequestParam(value = "prevOrgDocs[]", required = false) CommonsMultipartFile newDoc[])
			throws HandlingException, IOException, ParseException, ServletException {

		Integer canid = Integer.parseInt(req.getParameter("candid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		int jobid = Integer.parseInt(req.getParameter("jobid"));
		Integer uploadedBy = (Integer) req.getSession().getAttribute("empNumber");
		String userName = (String) req.getSession().getAttribute("username");
		String docObj = null;
		File dest = null;
		String status = "Not Verified";
		if (userName != null) {
			String directorypath = env.getProperty("PreOBTCandidateAttachments");
			String finaldirectorypath = directorypath + File.separator + canid;
			if (!new File(directorypath).exists()) {
				new File(directorypath).mkdir();
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
				}
			} else {
				if (!new File(finaldirectorypath).exists()) {
					new File(finaldirectorypath).mkdir();
				}
			}

			if (!edufile.getOriginalFilename().isEmpty()) {
				String EducationDoc = req.getParameter("EducationDoc");
				TBL_RECPORTAL_PREOBT_ATTACHMENTS documents1 = new TBL_RECPORTAL_PREOBT_ATTACHMENTS();
				documents1.setFileName(edufile.getOriginalFilename());
				documents1.setFileType(EducationDoc);
				documents1.setCandidate_id(canid);
				documents1.setUploadedDate(new Date());
				documents1.setUploadedBy(uploadedBy);
				documents1.setStatus(status);
				docObj = reportDao.savePreObtOtherFiles(documents1);
			} else {
			}

			if (!idfile.getOriginalFilename().isEmpty()) {
				String Idproof = "IdProof";
				TBL_RECPORTAL_PREOBT_ATTACHMENTS documents1 = new TBL_RECPORTAL_PREOBT_ATTACHMENTS();
				documents1.setFileName(idfile.getOriginalFilename());
				documents1.setFileType(Idproof);
				documents1.setCandidate_id(canid);
				documents1.setUploadedDate(new Date());
				documents1.setUploadedBy(uploadedBy);
				documents1.setStatus(status);
				docObj = reportDao.savePreObtOtherFiles(documents1);
			} else {
			}

			if (!curorgfile.getOriginalFilename().isEmpty()) {
				String currOrgDoc = req.getParameter("currOrgDoc");
				TBL_RECPORTAL_PREOBT_ATTACHMENTS documents1 = new TBL_RECPORTAL_PREOBT_ATTACHMENTS();
				documents1.setFileName(curorgfile.getOriginalFilename());
				documents1.setFileType(currOrgDoc);
				documents1.setCandidate_id(canid);
				documents1.setUploadedDate(new Date());
				documents1.setUploadedBy(uploadedBy);
				documents1.setStatus(status);
				docObj = reportDao.savePreObtOtherFiles(documents1);
			} else {
			}

			if (!pendingfile.getOriginalFilename().isEmpty()) {
				String pendingDoc = req.getParameter("pendingDoc");

				TBL_RECPORTAL_PREOBT_ATTACHMENTS documents1 = new TBL_RECPORTAL_PREOBT_ATTACHMENTS();
				documents1.setFileName(pendingfile.getOriginalFilename());
				documents1.setFileType(pendingDoc);
				documents1.setCandidate_id(canid);
				documents1.setUploadedDate(new Date());
				documents1.setUploadedBy(uploadedBy);
				documents1.setStatus(status);
				docObj = reportDao.savePreObtOtherFiles(documents1);
			} else {
			}

			if (!edufile.isEmpty()) {
				dest = new File(finaldirectorypath + File.separator + edufile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						edufile.transferTo(dest);
					} catch (Exception e) {
						logger.error("Exception raised when education docs file adding to folder:", e);
					}
				}
			}

			if (!idfile.isEmpty()) {
				dest = new File(finaldirectorypath + File.separator + idfile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						idfile.transferTo(dest);
					} catch (Exception e) {
						logger.error("Exception raised when idproof docs file adding to folder:", e);
					}
				}
			}

			if (!curorgfile.isEmpty()) {
				dest = new File(finaldirectorypath + File.separator + curorgfile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						curorgfile.transferTo(dest);
					} catch (Exception e) {
						logger.error("Exception raised when curorg docs file adding to folder:", e);
					}
				}
			}

			if (!pendingfile.isEmpty()) {
				dest = new File(finaldirectorypath + File.separator + pendingfile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						pendingfile.transferTo(dest);
					} catch (Exception e) {
						logger.error("Exception raised when pending docs file adding to folder:", e);
					}
				}
			}

			if (newDoc != null) {
				for (int i = 0; i < newDoc.length; i++) {

					TBL_RECPORTAL_PREOBT_ATTACHMENTS documents1 = new TBL_RECPORTAL_PREOBT_ATTACHMENTS();
					String[] newDocType = req.getParameterValues("prevOrgName[]");
					documents1.setFileName(newDoc[i].getOriginalFilename());
					documents1.setFileType(newDocType[i]);
					documents1.setCandidate_id(canid);
					documents1.setUploadedDate(new Date());
					documents1.setUploadedBy(uploadedBy);
					documents1.setStatus(status);
					docObj = reportDao.savePreObtOtherFiles(documents1);

					if (newDoc[i] != null) {
						if (!newDoc[i].getOriginalFilename().isEmpty()) {
							dest = new File(finaldirectorypath + File.separator + newDoc[i].getOriginalFilename());
							if (!dest.exists()) {
								try {
									newDoc[i].transferTo(dest);
								} catch (Exception ex) {
									logger.error("Exception due prev org docs to:", ex);
									String content = ex.toString();
									StringWriter errors = new StringWriter();
									ex.printStackTrace(new PrintWriter(errors));
									throw new HandlingException("Exception due to", errors.toString(), content);
								}
							}
						}
					}
				}
			} else {

			}
			PrintWriter out = res.getWriter();
			if (docObj.equalsIgnoreCase("saved")) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Documents added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + canid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Documents not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + canid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";

		}
		return null;
	}

	@RequestMapping(value = { "negotiateCandidate" }, method = RequestMethod.GET)
	public String negotiateCandidateDetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		String role = (String) req.getSession().getAttribute("role");
		String userName = (String) req.getSession().getAttribute("username");
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		String candidateid = req.getParameter("canid");
		String jobId = req.getParameter("jobid");
		Integer canid = null;

		if (userName != null) {
			if (candidateid != null) {
				canid = Integer.parseInt(candidateid);
			}

			Integer jobid = null;
			if (jobId != null) {

				jobid = Integer.parseInt(jobId);
			}

			
			List<Tbl_RecPortal_CandidateAdditionalComments> viewEducationAddcomObj = recruitmentDAO.viewCandidateEducationAdditionalComments(canid);
			List<Tbl_RecPortal_CandidateAdditionalComments> viewEmploymentAddcomObj = recruitmentDAO.viewCandidateEmploymentAdditionalComments(canid);
			CandidateInformation candidateInfo = recruitmentDAO.getCandidateInfoByCandidateID(canid);
			List<PreOnbordingEmployerDetials> employerList=reportDao.getEmployerListByCandidate(canid);
			Tbl_RecPortal_CandidateAdditionalInfo candiaddtnlinfo = reportDao.getcanidateAdditionDetailsByCanId(canid);
			Tbl_RecPortal_PreobtStatus canStatus = reportDao.getpreobtStatusByCanId(canid);
			PreonboardingEducationDetails candEducainfo = recruitmentDAO.getEducationDetailsByCanId(canid);
			List<PreOnboardingPayslipDetails> payslipList = recruitmentDAO.getPayslipDetailsByCanId(canid);
			Integer documentCountbycandidateid=recruitmentDAO.getDocumentCountbycandidateid(canid);
			List<PreOnbordingPersonnelDetails> personadetillsList = recruitmentDAO.getPersonalDetailsByCanId(canid);

			List<String> docStatus = recruitmentDAO.getcandidateDocStatus(canid);
			String dcstatus = "";
			// ArrayList<String> intArray =new ArrayList<String>();
			List<StatusEnum> statusenumList;
			boolean allSameName = docStatus.stream().allMatch(x -> x.equals("Approved"));
			
			if (allSameName == true) {
				statusenumList = Arrays.asList(StatusEnum.values());
			} else {
				// dcstatus="Approved";
				statusenumList = new ArrayList<>(Arrays.asList(StatusEnum.values()));
				statusenumList.remove(StatusEnum.Approved);
			}
			String[] statusArr = { "Negotiation Pending", "Negotiation InProgress", "Negotiation Completed","Negotiation Rejected" };
			List<String> negotiationStatusList = Stream.of(statusArr).collect(Collectors.toCollection(ArrayList::new));

			String worklocation = recruitmentDAO.getclientPrjlocByjobId(jobid);
			model.addAttribute("candidateInfo", candidateInfo);
			model.addAttribute("role", role);
			model.addAttribute("jobid", jobid);
			model.addAttribute("bdname", bdname);
			model.addAttribute("recname", recname);
			model.addAttribute("clientname", clientname);
			model.addAttribute("worklocation", worklocation);
			model.addAttribute("employerList",employerList);
			model.addAttribute("payslipList",payslipList);
			model.addAttribute("personadetillsList",personadetillsList);
			
			
			
			
			model.addAttribute("viewEmploymentAddcomObj", viewEmploymentAddcomObj);
			model.addAttribute("viewEducationAddcomObj", viewEducationAddcomObj);
			
			model.addAttribute("canid", canid);
			model.addAttribute("candiaddtnlinfo", candiaddtnlinfo);
			model.addAttribute("canStatus", canStatus);
			// model.addAttribute("dcstatus", docStatus);
			model.addAttribute("dcstatus", dcstatus);
			model.addAttribute("candEducainfo", candEducainfo);
			model.addAttribute("statusenumList", statusenumList);
			model.addAttribute("negotiationStatusList", negotiationStatusList);
			model.addAttribute("documentCountbycandidateid", documentCountbycandidateid);
			if (role.equals("HRUSER")) {
				List<DocVerifierComments> docCommentList = recruitmentDAO.viewDocumentVerifierComments(canid);
				model.addAttribute("viewcomObj", docCommentList);
				return "CandidateDocVerification"; 
			}
			else if(role.equals("NEGOTIATOR")) {
				List<DocVerifierComments> docCommentList = recruitmentDAO.viewDocumentVerifierComments(canid);
				model.addAttribute("docCommentList", docCommentList);
				List<PreObtNegotiationTeamStatus> viewcomList = reportDao.viewNegotiateComments(canid);
				model.addAttribute("viewcomObj", viewcomList);
				return "CandidateNegotiation"; 
			}else if(role.equals("HRMANAGER")) {
				return "CandidateLOI"; 
			}
			else if (role.equals("SCT")) {
				return "viewSourcedProfilesSct";
			}else {
				return "NegotiateCandidateDetails";
			}
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
		
	}

	
	
	
	@RequestMapping(value = { "DocVerifierComments" }, method = RequestMethod.POST)
	public String docVerifierComments(Model model, HttpServletRequest req, HttpServletResponse res)
			
			throws HandlingException, IllegalStateException, IOException {
		String empRole = req.getParameter("empRole");

		PrintWriter out = res.getWriter();
		String userName = (String) req.getSession().getAttribute("username");
		String negcomment = req.getParameter("negcomment");
		String negstatus = req.getParameter("statusid");
		String candidate=req.getParameter("canid");
		int candidateid=0;
		if(!candidate.isEmpty()) {
			candidateid = Integer.parseInt(candidate);
		}
		 Date date=new Date();
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 String updatedDate=sdf.format(date);
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		if (userName != null) {
			DocVerifierComments docObj = new DocVerifierComments();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
			 LocalDateTime now = LocalDateTime.now();
			
			docObj.setCandidateid(candidateid);
			docObj.setComments(negcomment);
			docObj.setUpdateDate(dtf.format(now).toString());
			docObj.setVerifiedBy(loginEmpNumber);
			
try {
			recruitmentDAO.saveVerificationComments(docObj);
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Details added successfully!!');");
			out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
					+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
			out.println("</script>");
}catch(Exception e) {
	logger.error(e.getMessage(),e);
	out.println("<script type=\"text/javascript\">");
	out.println("alert('Details not added !!');");
	out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
			+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
	out.println("</script>");
}
			
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
		return null;

	}
	
	@RequestMapping(value = { "negotiationComments" }, method = RequestMethod.POST)
	public String negotiationComments(Model model, HttpServletRequest req, HttpServletResponse res)
			// public String negotiationComments(Model model,HttpServletRequest
			// req,HttpServletResponse res,@RequestParam("file") CommonsMultipartFile
			// filename)
			throws HandlingException, IllegalStateException, IOException {
		String empRole = req.getParameter("empRole");

		PrintWriter out = res.getWriter();
		String userName = (String) req.getSession().getAttribute("username");
		String negcomment = req.getParameter("negcomment");
		String negstatus = req.getParameter("statusid");
		Integer candidateid = Integer.parseInt(req.getParameter("canid"));
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		if (userName != null) {
			PreObtNegotiationTeamStatus negObj = new PreObtNegotiationTeamStatus();

			negObj.setCandidate_id(candidateid);
			negObj.setComments(negcomment);
			negObj.setUpdateDate(new Date());
			negObj.setVerifiedBy(loginEmpNumber);
			negObj.setNegStatus(negstatus);

			String message = reportDao.saveNegotiationComments(negObj);
			if (message.equalsIgnoreCase("saved")) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
		return null;

	}

	@RequestMapping(value = { "downloadNegMailApprove" }, method = RequestMethod.GET)
	public String downloadNegMailApprove(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {

		String filename = req.getParameter("filename");
		Integer candidateid = Integer.parseInt(req.getParameter("canid"));

		String workingDir = env.getProperty("NegMailApprove");
		String directorypath = workingDir + File.separator + candidateid;
		String filepath = directorypath + File.separator + filename;
		File ff = new File(filepath);
		FileInputStream fis = new FileInputStream(ff);
		byte[] inputBytes = new byte[(int) ff.length()];
		fis.read(inputBytes);
		response.setContentType("application/octet-stream;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
		OutputStream os = response.getOutputStream(); // file output stream
		os.write(inputBytes);
		os.close();
		fis.close();

		return null;
	}

	@RequestMapping(value = {
			"saveCandidatePersonnelInfo" }, method = RequestMethod.POST, consumes = "application/json")
	@ResponseBody
	public String saveCandidatePersonnelInfo(Model model, HttpServletRequest req, HttpServletResponse response,
			@RequestBody CandidatePersonnelInfoDTO dataobj) throws HandlingException, IOException, ParseException {

		System.out.println("controleer");
		String candidateid = req.getParameter("candidateid");

		/*
		 * Gson g = new Gson(); CandidatePersonnelInfoDTO info = g.fromJson(jsonString,
		 * CandidatePersonnelInfoDTO.class);
		 */

		String message = null;
		try {
			message = recruitmentDAO.savePersonnelDetails(dataobj, candidateid);
		} catch (Exception e) {

		}

		return message;

	}

	// end
	// By Shravani
	@RequestMapping(value = { "viewCandidateDocs" }, method = RequestMethod.GET)
	@ResponseBody
	public PreObtVerifyDocsDTO canDocs(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> canDocs = null;
		List<DocVerifierComments> docList = null;
		PreObtVerifyDocsDTO nObj = new PreObtVerifyDocsDTO();
		String role = (String) req.getSession().getAttribute("role");
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		canDocs = reportDao.getcandidateDocInfo(candidateid);
		//docList = recruitmentDAO.getVerifyDocs(candidateid);
		nObj.setCanDocs(canDocs);
		//nObj.setDocList(docList);
		nObj.setRole(role);
		return nObj;

	}

	
	
	 
	// save verifyd docs
	@RequestMapping(value = { "saveVerifyDocs" }, method = RequestMethod.GET)
	@ResponseBody
	public String submitVerifyDocs(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {
		/* int candidateid=Integer.parseInt(req.getParameter("candidateid")); */
		String status = req.getParameter("status");
		String comments = req.getParameter("comments");
		int tbl_pk = Integer.parseInt(req.getParameter("tbl_pk"));
		String message = null;
		
		try {
			reportDao.saveVerifyDocs(tbl_pk, status, comments);
			message = "Success";
		} catch (Exception e) {
			logger.error("Exception raised in the method submitVerifyDocs:" + e.getCause().getMessage());
		}

		return message;
	}

	@RequestMapping(value = { "/docPageSubmit" }, method = RequestMethod.POST)
	@ResponseBody
	public String docPageSubmit(HttpServletResponse response, HttpServletRequest req,
			@RequestParam("prefile") CommonsMultipartFile prefile,@RequestParam("prefile2") CommonsMultipartFile prefile2)
			throws ParseException, HandlingException, IOException, Exception {

		String ajaxReturn = null;
		try {

			Integer candidateid = Integer.parseInt(req.getParameter("candidate_id"));
			String candidatename = req.getParameter("candidatename");
			Integer EmpNumber = (Integer) req.getSession().getAttribute("empNumber");
			String role = (String) req.getSession().getAttribute("role");

			String bdname = req.getParameter("bdname");
			String recname = req.getParameter("recname");
			String clientname = req.getParameter("clientname");
			int jobid = Integer.parseInt(req.getParameter("jobid"));
			String jobCode = recruitmentDAO.getJobCodeById(jobid);

			String status = req.getParameter("status");
			String usernames = (String) req.getSession().getAttribute("username");
			Tbl_RecPortal_PreobtStatus canObj1 = null;

			String candidateName = "<html><span style='color:red;'>" + candidatename + "</span></html>";

			if (usernames != null) {
				UserDTO userdetails = recruitmentDAO.getUserNameByEmpNo(EmpNumber, role);
				String fromemail = null;
				if (userdetails != null) {
					fromemail = userdetails.getEmail();
				}
				Tbl_RecPortal_PreobtStatus candiaddtnlinfo = reportDao.getpreobtStatusByCanId(candidateid);
				if (candiaddtnlinfo != null) {
					String workingDir = env.getProperty("PreOBTCandidateAttachments");
					String directorypath = workingDir + File.separator + candidateid;
					if (!new File(workingDir).exists()) {
						new File(workingDir).mkdir();

						if (!new File(directorypath).exists()) {
							new File(directorypath).mkdir();
						}

					} else {
						if (!new File(directorypath).exists()) {
							new File(directorypath).mkdir();
						}
					}
					candiaddtnlinfo.setCandidate_id(candidateid);
					candiaddtnlinfo.setDoc_verify_uploadedBy(EmpNumber);
					candiaddtnlinfo.setDoc_verify_date(new Date());
					candiaddtnlinfo.setDoc_verify_status(status);
					if (status.equalsIgnoreCase("ApprovedByManagement")) {
						if(!prefile.getOriginalFilename().isEmpty()) {
					candiaddtnlinfo.setDoc_verify_mgmt_filename(prefile.getOriginalFilename());
					File dest = new File(directorypath + File.separator + prefile.getOriginalFilename());
					  try {
					        prefile.transferTo(dest);
					   }catch(Exception e) {
						    System.out.println("error while writing to file----"+e.toString());
					   }
					}
					if(!prefile2.getOriginalFilename().isEmpty()) {
						candiaddtnlinfo.setDoc_verify_mgmt_filename2(prefile2.getOriginalFilename());
						File dest2 = new File(directorypath + File.separator + prefile2.getOriginalFilename());
						try {
							prefile2.transferTo(dest2);
						}catch(Exception e) {
							System.out.println("error while writing to file2----"+e.toString());
						 }
					}
					}
					canObj1=recruitmentDAO.updateDocSubmitStatus(candiaddtnlinfo);
					ajaxReturn = "Success";	

				} else {
					Tbl_RecPortal_PreobtStatus docsstatus = new Tbl_RecPortal_PreobtStatus();
					docsstatus.setCandidate_id(candidateid);
					docsstatus.setDoc_verify_uploadedBy(EmpNumber);
					docsstatus.setDoc_verify_date(new Date());
					docsstatus.setDoc_verify_status(status);
					Integer docObj = null;

					String workingDir = env.getProperty("PreOBTCandidateAttachments");
					String directorypath = workingDir + File.separator + candidateid;

					if (!new File(workingDir).exists()) {
						new File(workingDir).mkdir();
						if (!new File(directorypath).exists()) {
							new File(directorypath).mkdir();
						}

					} else {
						if (!new File(directorypath).exists()) {
							new File(directorypath).mkdir();
						}
					}

					if (prefile!=null && status.equalsIgnoreCase("ApprovedByManagement") || prefile2!=null) {
						if(!prefile.getOriginalFilename().isEmpty()) {
						File dest = new File(directorypath + File.separator + prefile.getOriginalFilename());
						  try {
							prefile.transferTo(dest);
							}catch(Exception e) {
								System.out.println("error while writing to file1----"+e.toString());
							 }
						   docsstatus.setDoc_verify_mgmt_filename(prefile.getOriginalFilename());
						}
						if(!prefile2.getOriginalFilename().isEmpty()) {
							docsstatus.setDoc_verify_mgmt_filename2(prefile2.getOriginalFilename());
							File dest2 = new File(directorypath + File.separator + prefile2.getOriginalFilename());
							try {
							prefile.transferTo(dest2);
							}catch(Exception e) {
								System.out.println("error while writing to file2----"+e.toString());
							 }
						}
					}
						
						docObj = reportDao.savePreOBTVerifyDocs(docsstatus);
						if(docObj!=null) {
							ajaxReturn = "Success";	
						}else {
							ajaxReturn = "Failure";	
						}
						
				}
				
				String toName = "Hi Team";

				String toemailbd = bdname;
				String toemailrec = recname;
				RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
				RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
				UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

				List<String> toList = new ArrayList<>();
				toList.add(bdemail.getEmail());
				toList.add(recemail.getEmail());
				toList.add(tlemail.getEmail());

				List<RecruitmentportalLogin> negolosit = recruitmentDAO.getEamilbyNegorole();

				List<String> ccList = new ArrayList<>();

				for (RecruitmentportalLogin recruitmentportalLogin : negolosit) {
					ccList.add(recruitmentportalLogin.getEmail());
					String subject = jobCode;
					String message = "Documents verification has been" + "  " + status + "  " + "for candidate "
							+ "  " + candidateName;
					try {
						newEmail.sendDocApproved(fromemail, toList, subject, toName, message, ccList);
						ajaxReturn = "Success";	
					} catch (Exception ex) {
						ajaxReturn = "Failure";	
						logger.error("Exception due to:", ex);
					}
				}
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return ajaxReturn;
	}

	// preobt docs download
	@RequestMapping(value = { "/preObtFiledownload" }, method = RequestMethod.GET)
	public String preObtfiledownload(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		try {
			String filepath = null;
			Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
			String filename = req.getParameter("filename");
			String fileType = req.getParameter("fileType");
			System.out.println("--------------------" + filename);

			String workingDir1 = env.getProperty("PreOBTCandidateAttachments");
			String directorypath2 = workingDir1 + File.separator + candidateid;
			if (fileType.equalsIgnoreCase("LOI")) {
				String directorypath3 = directorypath2 + File.separator + "LOI";
				filepath = directorypath3 + File.separator + filename;
			} else if (fileType.equalsIgnoreCase("mail")) {

				String workingDir = env.getProperty("NegMailApprove");
				String directorypath = workingDir + File.separator + candidateid;

				filepath = directorypath + File.separator + filename;
				System.out.println("--------filepath------------" + filepath);
			} else if (fileType.equalsIgnoreCase("docmail")) {

				String workingDir = env.getProperty("PreOBTCandidateAttachments");
				String directorypath = workingDir + File.separator + candidateid;

				filepath = directorypath + File.separator + filename;
				System.out.println("--------filepath------------" + filepath);
			} else {
				filepath = directorypath2 + File.separator + filename;
			}
			File ff = new File(filepath);
			if (ff.exists() == true) {
				FileInputStream fis = new FileInputStream(ff);
				byte[] inputBytes = new byte[(int) ff.length()];
				fis.read(inputBytes);
				response.setContentType("application/.pdf;");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
				OutputStream os = response.getOutputStream(); // file output stream
				os.write(inputBytes);
				os.close();
				fis.close();
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

	@RequestMapping(value = { "/preObtFiledownloadAll" }, method = RequestMethod.GET)
	public String preObtFiledownloadAll(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String candname = req.getParameter("candname");
		String candphone = req.getParameter("candphone");
		String filename = candphone + (candname);

		String workingDir1 = env.getProperty("PreOBTCandidateAttachments");
		String directorypath2 = workingDir1 + File.separator + candidateid;

		File dir = new File(directorypath2);
		String zipDirName = directorypath2 + ".zip";

		// zipSingleFile(file, zipFileName);

		zipDirectory(dir, zipDirName);
		File ff = new File(zipDirName);
		if (ff.exists()) {
			FileInputStream fis = new FileInputStream(ff);
			byte[] inputBytes = new byte[(int) ff.length()];
			fis.read(inputBytes);
			response.setContentType("application/.zip;");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
			OutputStream os = response.getOutputStream(); // file output stream
			os.write(inputBytes);
			os.close();
			fis.close();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('No file available');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();

		}
		return null;

	}

	private void zipDirectory(File dir, String zipDirName) {
		try {
			List<String> filesListInDir = populateFilesList(dir);
			// now zip files one by one
			// create ZipOutputStream to write to the zip file
			FileOutputStream fos = new FileOutputStream(zipDirName);
			ZipOutputStream zos = new ZipOutputStream(fos);
			for (String filePath : filesListInDir) {

				// for ZipEntry we need to keep only relative file path, so we used substring on
				// absolute path
				ZipEntry ze = new ZipEntry(filePath.substring(dir.getAbsolutePath().length() + 1, filePath.length()));
				zos.putNextEntry(ze);
				// read the file and write to ZipOutputStream
				FileInputStream fis = new FileInputStream(filePath);
				byte[] buffer = new byte[1024];
				int len;
				while ((len = fis.read(buffer)) > 0) {
					zos.write(buffer, 0, len);
				}
				zos.closeEntry();
				fis.close();
			}
			zos.close();
			fos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "previewLOI" }, method = RequestMethod.GET)
	@ResponseBody
	public String canDocs1(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		String filepath = null;
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String workingDir1 = env.getProperty("PreOBTCandidateAttachments");
		String directorypath2 = workingDir1 + File.separator + candidateid;
		String fileType = req.getParameter("fileType");
		String filename =recruitmentDAO.getFilenameByCandidateId(candidateid);
		if (fileType.equalsIgnoreCase("LOI")) {
			String directorypath3 = directorypath2 + File.separator + "LOI";
			filepath = directorypath3 + File.separator + filename;
		}
		File ff = new File(filepath);
		if (ff.exists() == true) {
			FileInputStream	fis = new FileInputStream(ff);
			byte[] inputBytes = new byte[(int) ff.length()];
			fis.read(inputBytes);
		}
		return null;
	}

	private List<String> populateFilesList(File dir) throws IOException {
		List<String> filesListInDir = new ArrayList<String>();
		File[] files = dir.listFiles();
		for (File file : files) {
			if (file.isFile())
				filesListInDir.add(file.getAbsolutePath());
			else
				populateFilesList(file);
		}
		return filesListInDir;
	}

	@RequestMapping(value = { "canAddtnlPersonalDetails" }, method = RequestMethod.GET)
	public String canAddtnlPersonalDetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));

		String fathername = req.getParameter("fathername");
		String mothername = req.getParameter("mothername");
		String familyDetails = req.getParameter("familyDetails");

		
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");

		Tbl_RecPortal_CandidateAdditionalInfo checkcandiIdObj = reportDao
				.getcanidateAdditionDetailsByCanId(candidateid);
		if (checkcandiIdObj != null) {

			Integer tblpk = checkcandiIdObj.getTbl_pk();
			Tbl_RecPortal_CandidateAdditionalInfo canObj1 = reportDao.updatecanPersonalDetails(fathername,
					mothername, familyDetails, null, null, null, null, tblpk);

			if (canObj1 == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		} else {
			Tbl_RecPortal_CandidateAdditionalInfo canaddObj = new Tbl_RecPortal_CandidateAdditionalInfo();
			canaddObj.setCandidateid(candidateid);
			canaddObj.setFathername(fathername);
			canaddObj.setMothername(mothername);
			canaddObj.setFamilyDetails(familyDetails);
			/*
			 * canaddObj.setCtc_pm(ctc_pm); canaddObj.setEctc_pm(ectc_pm);
			 * canaddObj.setNegratePM(negratePM); canaddObj.setNegratePA(negratePA);
			 */

			String canObj = reportDao.addCandiAddtnlDetails(canaddObj);
			if (canObj.equalsIgnoreCase("saved")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		}
		return null;
	}
	
	@RequestMapping(value = { "canAddtionalComments" }, method = RequestMethod.GET)
	public String canAddtionalComments(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));

		String commentType = req.getParameter("commentType");
		String addcomments = req.getParameter("addcomments");

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");

		Tbl_RecPortal_CandidateAdditionalComments canaddObj = new Tbl_RecPortal_CandidateAdditionalComments();
			canaddObj.setCandidateid(candidateid);
			canaddObj.setComment(addcomments);
			canaddObj.setCommentType(commentType);
			canaddObj.setCommentedDate(new Date());
			canaddObj.setCommentedBy(loginEmpNumber);

			String canObj = recruitmentDAO.addCandidateAdditionalComments(canaddObj);
			if (canObj.equalsIgnoreCase("saved")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		
		return null;
	}

	@RequestMapping(value = { "managementReservationPrice" }, method = RequestMethod.GET)
	public String managementReservationPrice(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {

		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String mgmtAppctcPA = req.getParameter("mgmtAppctcPA");
		String mgmtAppctcPM = req.getParameter("mgmtAppctcPM");
		// String offeredctcPM=req.getParameter("offeredctcPM");
		String MgmtComments = req.getParameter("MgmtComments");
		String addtnlbenifits = req.getParameter("addtnlbenifits");
		String canObj = null;

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		Tbl_RecPortal_CandidateAdditionalInfo checkcandiIdObj = reportDao
				.getcanidateAdditionDetailsByCanId(candidateid);

		if (checkcandiIdObj != null) {
			Integer tblpk = checkcandiIdObj.getTbl_pk();
			Tbl_RecPortal_CandidateAdditionalInfo canObj1 = recruitmentDAO.updatemgmtReservationDetails(mgmtAppctcPA,
					mgmtAppctcPM, MgmtComments, addtnlbenifits, tblpk);

			if (canObj1 == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
				out.close();
			}
		} else {
			Tbl_RecPortal_CandidateAdditionalInfo canaddObj = new Tbl_RecPortal_CandidateAdditionalInfo();
			canaddObj.setCandidateid(candidateid);
			canaddObj.setMgmtAppctcPA(mgmtAppctcPA);
			canaddObj.setMgmtAppctcPM(mgmtAppctcPM);
			canaddObj.setMgmtComments(MgmtComments);
			canaddObj.setAddtnlbenifits(addtnlbenifits);
		//	canaddObj.setOfferedDesignation(offeredDesignation);
			canObj = reportDao.addCandiAddtnlDetails(canaddObj);
			if (canObj != null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}

		}
		return null;
	}

	@RequestMapping(value = { "negteamcanExpectationDetails" }, method = RequestMethod.GET)
	public String negteamcanExpectationDetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String nego_rate_pm = req.getParameter("nego_rate_pm");
		String nego_rate_pa = req.getParameter("nego_rate_pa");
		String rec_rate_pa = req.getParameter("rec_rate_pa");
		String rec_rate_pm = req.getParameter("rec_rate_pm");
		String rec_np = req.getParameter("rec_np");
		String negcandcomments = req.getParameter("comments");
		
		String offeredDesignation = req.getParameter("offeredDesignation");
		String doj = req.getParameter("doj");
		Date dojDate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (!doj.equals("") && doj != null) {
			dojDate = sdf.parse(doj);
		}
		String canObj = null;

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		Tbl_RecPortal_CandidateAdditionalInfo candiaddtnlinfo = reportDao.getcanidateAdditionDetailsByCanId(candidateid);
		//rec_np
		CandidateInformation caninfo=recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
		caninfo.setNoticeperiod(rec_np);
		recruitmentDAO.updateCandidate(caninfo);
		System.out.println("-------candiaddtnlinfo in ---"+candiaddtnlinfo);
		
		if (candiaddtnlinfo != null) {
			Integer tblpk = candiaddtnlinfo.getTbl_pk();
			Tbl_RecPortal_CandidateAdditionalInfo canObj1 = recruitmentDAO.updatenegcanExpecDetails(nego_rate_pm,
					nego_rate_pa, offeredDesignation, tblpk,dojDate,rec_rate_pa,rec_rate_pm,negcandcomments);

			if (canObj1 == null) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not updated !!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}
		} else {
			Tbl_RecPortal_CandidateAdditionalInfo canaddObj = new Tbl_RecPortal_CandidateAdditionalInfo();
			canaddObj.setNego_rate_pa(nego_rate_pa);
			canaddObj.setNego_rate_pm(nego_rate_pm);
			canaddObj.setOfferedDesignation(offeredDesignation);
			canaddObj.setDojDate(dojDate);
			canaddObj.setCandidateid(candidateid);
			canaddObj.setNegratePA(rec_rate_pa);
			canaddObj.setNegratePM(rec_rate_pm);
			canaddObj.setCan_ExpecComments(negcandcomments);
			

			canObj = reportDao.addCandiExpecDetails(canaddObj);

			if (canObj.equalsIgnoreCase("saved")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}

		}
		model.addAttribute("candiaddtnlinfo", candiaddtnlinfo);
		return null;
	}

	@RequestMapping(value = { "negotiationTeamStatus" }, method = RequestMethod.POST)
	@ResponseBody
	public String negotiationTeamStatus(Model model, HttpServletRequest req, HttpServletResponse res)
			throws HandlingException, IllegalStateException, IOException {
		String ajaxesponse;
		String userName = (String) req.getSession().getAttribute("username");
		String role = (String) req.getSession().getAttribute("role");
		String negstatus = req.getParameter("statusid");
		Integer candidateid = Integer.parseInt(req.getParameter("canid"));
		String candidatename = req.getParameter("candidatename");
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		String jobCode = recruitmentDAO.getJobCodeById(jobid);

		String candidateName = "<html><span style='color:red;'>" + candidatename + "</span></html>";

		Tbl_RecPortal_PreobtStatus canObj1 = null;
		if (userName != null) {
			Tbl_RecPortal_PreobtStatus negObj = new Tbl_RecPortal_PreobtStatus();
			Tbl_RecPortal_PreobtStatus candiaddtnlinfo = reportDao.getpreobtStatusByCanId(candidateid);
			if (candiaddtnlinfo != null) {

				String workingDir = env.getProperty("NegMailApprove");
				String directorypath = workingDir + File.separator + candidateid;

				if (!new File(workingDir).exists()) {
					new File(workingDir).mkdir();
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();
					}

				} else {
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();
					}
				}
				Integer tblpk = candiaddtnlinfo.getTBL_PK();
				if (negstatus.equalsIgnoreCase("Approved By Management")) {
					negObj.setCandidate_id(candidateid);
					negObj.setNego_uploadedBy(loginEmpNumber);
					negObj.setNego_subdate(new Date());
					negObj.setNego_status(negstatus);
					canObj1 = recruitmentDAO.updateNegPageStatus(negstatus, loginEmpNumber, new Date(),tblpk);

					UserDTO userdetails = new UserDTO();
					String fromemail = userdetails.getEmail();
					String toName = "Hi Team";
					String fromMail = "suryaprabha.k@tekskills.in";
					String toemailbd = bdname;
					String toemailrec = recname;
					RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
					RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
					UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

					List<String> toList = new ArrayList<>();
					toList.add(bdemail.getEmail());
					toList.add(recemail.getEmail());
					toList.add(tlemail.getEmail());

					List<RecruitmentportalLogin> hrList = recruitmentDAO.getEamilbyHrList();

					List<String> ccList = new ArrayList<>();

					for (RecruitmentportalLogin recruitmentportalLogin : hrList) {
						ccList.add(recruitmentportalLogin.getEmail());
						String subject = jobCode;
						String message1 = "Negotation status has been changed" + "  " + negstatus + "  "
								+ "for candidate " + "  " + candidateName;
						try {
							newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, ccList);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					}

				} else {
					negObj.setCandidate_id(candidateid);
					negObj.setNego_uploadedBy(loginEmpNumber);
					negObj.setNego_subdate(new Date());
					negObj.setNego_status(negstatus);
					canObj1 = recruitmentDAO.updateNegPageStatus(negstatus, loginEmpNumber, new Date(), tblpk);

					if (negstatus.equalsIgnoreCase("Rejected") || negstatus.equalsIgnoreCase("Pending")
							|| negstatus.equalsIgnoreCase("In Progress")) {
						UserDTO userdetails = new UserDTO();
						String fromemail = userdetails.getEmail();
						String toName = "Hi Team";
						String fromMail = "suryaprabha.k@tekskills.in";
						String toemailbd = bdname;
						String toemailrec = recname;
						RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
						RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
						UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

						List<String> toList = new ArrayList<>();
						toList.add(bdemail.getEmail());
						toList.add(recemail.getEmail());
						toList.add(tlemail.getEmail());

						String subject = jobCode;
						String message1 = "Negotation status has been changed" + "  " + negstatus + "  "
								+ "for candidate " + "  " + candidateName;
						try {
							newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, null);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					} else if (negstatus.equalsIgnoreCase("Approved")) {
						UserDTO userdetails = new UserDTO();
						String fromemail = userdetails.getEmail();
						String toName = "Hi Team";
						String fromMail = "suryaprabha.k@tekskills.in";
						String toemailbd = bdname;
						String toemailrec = recname;
						RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
						RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
						UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

						List<String> toList = new ArrayList<>();
						toList.add(bdemail.getEmail());
						toList.add(recemail.getEmail());
						toList.add(tlemail.getEmail());

						List<RecruitmentportalLogin> hrList = recruitmentDAO.getEamilbyHrList();

						List<String> ccList = new ArrayList<>();

						for (RecruitmentportalLogin recruitmentportalLogin : hrList) {
							ccList.add(recruitmentportalLogin.getEmail());
							String subject = jobCode;
							String message1 = "Negotation status has been changed" + "  " + negstatus + "  "
									+ "for candidate " + "  " + candidateName;
							try {
								newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, ccList);
							} catch (Exception ex) {
								logger.error("Exception due to:", ex);
							}
						}
					} else {

					}
				}
				if (canObj1 == null) {
					ajaxesponse = "Success";
				} else {
					ajaxesponse = "Failure";
				}

			} else {
				String message = null;

				String workingDir = env.getProperty("NegMailApprove");

				String directorypath = workingDir + File.separator + candidateid;

				if (!new File(workingDir).exists()) {
					new File(workingDir).mkdir();
					// directorypath = workingDir + File.separator + candidateid;
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();
					}

				} else {
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();
					}
				}

				if (negstatus.equalsIgnoreCase("Approved By Management")) {
					negObj.setCandidate_id(candidateid);
					negObj.setNego_uploadedBy(loginEmpNumber);
					negObj.setNego_subdate(new Date());
					negObj.setNego_status(negstatus);
					message = reportDao.saveNegotiationStatus(negObj);

					UserDTO userdetails = new UserDTO();
					// String fromemail=userdetails.getEmail();
					String toName = "Hi Team";
					String fromMail = "suryaprabha.k@tekskills.in";
					String toemailbd = bdname;
					String toemailrec = recname;
					RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
					RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
					UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

					List<String> toList = new ArrayList<>();
					toList.add(bdemail.getEmail());
					toList.add(recemail.getEmail());
					toList.add(tlemail.getEmail());

					List<RecruitmentportalLogin> hrList = recruitmentDAO.getEamilbyHrList();

					List<String> ccList = new ArrayList<>();

					for (RecruitmentportalLogin recruitmentportalLogin : hrList) {
						ccList.add(recruitmentportalLogin.getEmail());
						String subject = jobCode;
						String message1 = "Negotation status has been changed" + "  " + negstatus + "  "
								+ "for candidate " + "  " + candidateName;
						try {
							newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, ccList);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					}

				} else {
					negObj.setCandidate_id(candidateid);
					negObj.setNego_uploadedBy(loginEmpNumber);
					negObj.setNego_subdate(new Date());
					negObj.setNego_status(negstatus);
					message = reportDao.saveNegotiationStatus(negObj);

					if (negstatus.equalsIgnoreCase("Rejected") || negstatus.equalsIgnoreCase("Pending")
							|| negstatus.equalsIgnoreCase("In Progress")) {
						UserDTO userdetails = new UserDTO();
						String fromemail = userdetails.getEmail();
						String toName = "Hi Team";
						String fromMail = "suryaprabha.k@tekskills.in";
						String toemailbd = bdname;
						String toemailrec = recname;
						RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
						RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
						UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

						List<String> toList = new ArrayList<>();
						toList.add(bdemail.getEmail());
						toList.add(recemail.getEmail());
						toList.add(tlemail.getEmail());

						String subject = jobCode;
						String message1 = "Negotation status has been changed" + "  " + negstatus;
						try {
							newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, null);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					} else if (negstatus.equalsIgnoreCase("Approved")) {
						UserDTO userdetails = new UserDTO();
						String fromemail = userdetails.getEmail();
						String toName = "Hi Team";
						String fromMail = "suryaprabha.k@tekskills.in";
						String toemailbd = bdname;
						String toemailrec = recname;
						RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
						RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
						UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

						List<String> toList = new ArrayList<>();
						toList.add(bdemail.getEmail());
						toList.add(recemail.getEmail());
						toList.add(tlemail.getEmail());

						List<RecruitmentportalLogin> hrList = recruitmentDAO.getEamilbyHrList();

						List<String> ccList = new ArrayList<>();

						for (RecruitmentportalLogin recruitmentportalLogin : hrList) {
							ccList.add(recruitmentportalLogin.getEmail());
							String subject = jobCode;
							String message1 = "Negotation status has been changed" + "  " + negstatus + "  "
									+ "for candidate " + "  " + candidateName;
							try {
								newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, ccList);
							} catch (Exception ex) {
								logger.error("Exception due to:", ex);
							}
						}
					} else {

					}

				}
				if (message.equalsIgnoreCase("saved")) {
					ajaxesponse = "Success";
				} else {
					ajaxesponse = "Failure";
				}
			}
			return ajaxesponse;
		} else {

			// model.addAttribute("sessionmsg", "Session Expired");
			// return "redirect:/loginpage";
		}
		return null;

	}

	// by Prashanth

	@RequestMapping(value = { "viewUploadedDocs" }, method = RequestMethod.GET)
	@ResponseBody
	public PreObtVerifyDocsDTO canPreObtDocs(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		List<TBL_RECPORTAL_PREOBT_ATTACHMENTS> canDocs = null;
		PreObtVerifyDocsDTO nObj = new PreObtVerifyDocsDTO();

		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		canDocs = reportDao.getcandidateDocInfo(candidateid);
		nObj.setCanDocs(canDocs);

		return nObj;
	}

	@RequestMapping(value = "/checkSelectedDoc", method = RequestMethod.GET)
	@ResponseBody
	public String checkSelectedDoc(HttpServletRequest req) throws HandlingException {

		Integer canid = Integer.parseInt(req.getParameter("candidateid"));
		String filename = req.getParameter("filename");
		String ftype = reportDao.getFilenameByType(canid, filename);
		return ftype;
	}

	@RequestMapping(value = "/preObtFiledelete", method = RequestMethod.GET)
	@ResponseBody
	public String preObtFiledelete(HttpServletRequest req) throws HandlingException {
		String msg = "";
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		Integer tblpk = Integer.parseInt(req.getParameter("tblpk"));

		msg = reportDao.deleteFilenameById(tblpk, candidateid);

		return msg;
	}

	@RequestMapping(value = { "docuploadloi" }, method = RequestMethod.POST)
	public String docuploadloi(Model model, HttpServletRequest req, HttpServletResponse res,
			@RequestParam("loifile") CommonsMultipartFile loifile)
			throws HandlingException, IOException, ParseException, ServletException {

		Integer canid = null;
		String candidateid = req.getParameter("candidateid");
		if (!candidateid.isEmpty()) {
			canid = Integer.parseInt(req.getParameter("candidateid"));
		}
		System.out.println("canid----" + canid);
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		String candidatename = req.getParameter("candidatename");
		int jobid = Integer.parseInt(req.getParameter("jobid"));
		String jobCode = recruitmentDAO.getJobCodeById(jobid);
		String loistatus = "Released";
		String loiComments = req.getParameter("loiComments");
		Integer uploadedBy = (Integer) req.getSession().getAttribute("empNumber");
		String candidateName = "<html><span style='color:red;'>" + candidatename + "</span></html>";
		String workingDir1 = env.getProperty("PreOBTCandidateAttachments");
		Tbl_RecPortal_PreobtStatus candiaddtnlinfo = reportDao.getpreobtStatusByCanId(canid);
		Integer tblpk = candiaddtnlinfo.getTBL_PK();
		Tbl_RecPortal_PreobtStatus updateloiObj = null;
		String directorypath1 = workingDir1 + File.separator + canid;
		String directorypath2 = directorypath1 + File.separator + "LOI";
		if (!new File(workingDir1).exists()) {
			new File(workingDir1).mkdir();
			if (!new File(directorypath1).exists()) {
				new File(directorypath1).mkdir();
				if (!new File(directorypath2).exists()) {
					new File(directorypath2).mkdir();
				}
			}
		} else {
			if (!new File(directorypath1).exists()) {
				new File(directorypath1).mkdir();
				if (!new File(directorypath2).exists()) {
					new File(directorypath2).mkdir();
				}
			}else {
				if (!new File(directorypath2).exists()) {
					new File(directorypath2).mkdir();
				}
			}
		}
		File dest = null;

		if (loifile != null) {

			if (!loifile.getOriginalFilename().isEmpty()) {
				dest = new File(directorypath2 + File.separator + loifile.getOriginalFilename());
				if (!dest.exists()) {
					try {
						loifile.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to:", ex);

						String content = ex.toString();
						StringWriter errors = new StringWriter();
						ex.printStackTrace(new PrintWriter(errors));
						throw new HandlingException("Exception due to", errors.toString(), content);
					}

					if (loistatus.equalsIgnoreCase("Released")) {

						UserDTO userdetails = new UserDTO();
						// String fromemail=userdetails.getEmail();
						String fromMail = "suryaprabha.k@tekskills.in";
						String toemailbd = bdname;
						String toemailrec = recname;
						RecruitmentportalLogin bdemail = recruitmentDAO.getEamilbyName(toemailbd);
						RecruitmentportalLogin recemail = recruitmentDAO.getEamilbyName(toemailrec);
						UserDTO tlemail = recruitmentDAO.getUserNameByEmpNo(recemail.getEmp_lead(),"TEAMLEAD");

						List<String> toList = new ArrayList<>();
						toList.add(bdemail.getEmail());
						toList.add(recemail.getEmail());
						toList.add(tlemail.getEmail());

						List<RecruitmentportalLogin> hrUserList = recruitmentDAO.getEamilbyHrUserList();

						List<RecruitmentportalLogin> negList = recruitmentDAO.getEamilbyNegorole();

						List<String> ccList = new ArrayList<>();

						for (RecruitmentportalLogin recruitmentportalLogin : negList) {
							ccList.add(recruitmentportalLogin.getEmail());

						}
						for (RecruitmentportalLogin recruitmentportalLogin : hrUserList) {
							ccList.add(recruitmentportalLogin.getEmail());
						}
						String toName = "Hi Team";
						String subject = jobCode;
						String message1 = "LOI status has been" + "  " + loistatus + "  " + "for candidate " + "  "
								+ candidateName;
						try {
							newEmail.sendDocApproved(fromMail, toList, subject, toName, message1, ccList);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);
						}
					} else {

					}
				}

				else {

				}

			}

			else {
				PrintWriter out = res.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('file already exists');");
				out.println("window.location.href='negotiateCandidate?canid=" + canid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				// out.println("window.location='HolidaysCalendar?action=view';");
				out.println("</script>");
			}
		}
		Date subdate = new Date();
		updateloiObj = reportDao.updateLoicanDetails(tblpk, canid, loistatus, loiComments, uploadedBy, subdate,
				loifile.getOriginalFilename());

		PrintWriter out = res.getWriter();
		if (updateloiObj == null) {

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Details updated successfully!!');");
			out.println("window.location.href='candidatelist'");
			out.println("</script>");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Documents not added !!');");
			out.println("window.location.href='negotiateCandidate?canid=" + canid + "&bdname=" + bdname + "&recname="
					+ recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
			out.println("</script>");
		}
		return null;
	}

	@RequestMapping(value = { "addeducationdetails" }, method = RequestMethod.GET)
	public String addeducationdetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String ssc = req.getParameter("ssc");
		String sscperc = req.getParameter("sscperc");
		String intermediate = req.getParameter("intermediate");
		String interperc = req.getParameter("interperc");
		String graduation = req.getParameter("graduation");
		String gradperc = req.getParameter("gradperc");
		String post_graduation = req.getParameter("post_graduation");
		String pgperc = req.getParameter("pgperc");
		
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String canObj = null;

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		int sscpercentage=0,interpercentage=0,degreeperc=0,pgpercent=0;
		if(!sscperc.isEmpty()) {
			sscpercentage=Integer.parseInt(sscperc);
		}
		if(!interperc.isEmpty()) {
			interpercentage=Integer.parseInt(interperc);
		}
		if(!gradperc.isEmpty()) {
			degreeperc=Integer.parseInt(gradperc);
		}
		if(!pgperc.isEmpty()) {
			pgpercent=Integer.parseInt(pgperc);
		}
		PreonboardingEducationDetails candEducainfo = recruitmentDAO.getEducationDetailsByCanId(candidateid);
		PreonboardingEducationDetails canaddObj = new PreonboardingEducationDetails();
		if (candEducainfo != null) {
			
		} else {
			canaddObj.setCandidateid(candidateid);
			canaddObj.setSsc(ssc);
			canaddObj.setSscperc(sscpercentage);
			canaddObj.setInter(intermediate);
			canaddObj.setInterperc(interpercentage);
			canaddObj.setDegree(graduation);
			canaddObj.setDegree_perc(degreeperc);
			canaddObj.setPg(post_graduation);
			canaddObj.setPgperc(pgpercent);

			canObj = recruitmentDAO.addEducationDetails(canaddObj);

			if (canObj.equalsIgnoreCase("saved")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Added successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			}

		}
		model.addAttribute("candEducainfo", candEducainfo);
		return null;
	}

	// Done By Shravani R
	@RequestMapping(value = { "uploadFiles" }, method = RequestMethod.POST)
	public String UploadFiles(HttpServletRequest req, HttpServletResponse res,
			@RequestParam(value = "othr_doc[]", required = false) CommonsMultipartFile newDoc[])
			throws HandlingException, IOException, ParseException, ServletException {

		String role = (String) req.getSession().getAttribute("role");

		String jobid = req.getParameter("jobid");
		String candid = req.getParameter("candid");
		Integer candidateid = null;
		if (!candid.isEmpty()) {
			candidateid = Integer.parseInt(candid);
		}

		String workingDir1 = env.getProperty("UploadFiles");
		String directorypath2 = workingDir1 + File.separator + candidateid;
		if (!new File(workingDir1).exists()) {
			new File(workingDir1).mkdir();

			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();

			}

		} else {
			if (!new File(directorypath2).exists()) {
				new File(directorypath2).mkdir();
			}
		}
		File dest = null;

		String docobj = null;

		if (newDoc != null) {
			for (int i = 0; i < newDoc.length; i++) {

				Tbl_RecPortal_candidateAttachments documents1 = new Tbl_RecPortal_candidateAttachments();
				String[] newDocType = req.getParameterValues("other_doc[]");

				CandidateInformation candidateInfo = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
				documents1.setAttachmentname(newDoc[i].getOriginalFilename());
				documents1.setAttachmentType(newDocType[i]);
				documents1.setCandidateid(candidateInfo);
				documents1.setAttachedDate(new Date());

				docobj = recruitmentDAO.saveOtherFiles(documents1);

				if (newDoc[i] != null) {
					if (!newDoc[i].getOriginalFilename().isEmpty()) {
						dest = new File(directorypath2 + File.separator + newDoc[i].getOriginalFilename());
						if (!dest.exists()) {
							try {
								newDoc[i].transferTo(dest);
							} catch (Exception ex) {
								logger.error("Exception due to:", ex);

								String content = ex.toString();
								StringWriter errors = new StringWriter();
								ex.printStackTrace(new PrintWriter(errors));
								throw new HandlingException("Exception due to", errors.toString(), content);
							}

						}
					}
				}
			}
		}

		if (role.equals("RECRUITER")) {
			return "redirect:/displaySourcedProfiles?jobId=" + jobid + "";
		} else {
			return "redirect:/view_Profiles_JD?jobId=" + jobid + "";
		}

	}

	// docs download(done by shravani)
	@RequestMapping(value = { "/CandidateAttachmentFiledownload" }, method = RequestMethod.GET)
	public String CandidiateFiledownload(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String filename = req.getParameter("filename");
		String fileType = req.getParameter("fileType");

		List<String> attachmentNames = recruitmentDAO.fileDownloadByName(candidateid, filename);

		// String uploadsDir = "/UploadFiles";
		// String workingDir = req.getServletContext().getRealPath(uploadsDir);
		String workingDir = env.getProperty("UploadFiles");

		String directorypath = workingDir + File.separator + candidateid;
		File ff = new File(directorypath + File.separator + filename);
		if (ff.exists() == true) {
			FileInputStream fis = new FileInputStream(ff);
			byte[] inputBytes = new byte[(int) ff.length()];
			fis.read(inputBytes);
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + filename);
			OutputStream os = response.getOutputStream(); // file output stream
			os.write(inputBytes);
			os.close();
			fis.close();
		} else {
			PrintWriter out2 = response.getWriter();
			out2.println("<script type=\"text/javascript\">");
			out2.println("alert('No file available');");
			out2.println("window.history.back();");
			out2.println("</script>");
			out2.close();

		}

		return null;
	}

	// jobdocs download(done by shravani)
	@RequestMapping(value = { "/JobAttachmentFiledownload" }, method = RequestMethod.GET)
	public String jobFiledownload(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		// Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String filename = req.getParameter("filename");
		String fileType = req.getParameter("fileType");

		String role = (String) req.getSession().getAttribute("role");

		String jobcode = req.getParameter("jobcode");
		String attchmentType = "Jd_Doc";
		String attachmentName = recruitmentDAO.fileDownloadByType(jobid, attchmentType);

		if (attachmentName != null) {

			// String uploadsDir = "/uploads";
			String workingDir = env.getProperty("JDuploads");

			String directorypath = workingDir + File.separator + jobcode;
			File ff = new File(directorypath + File.separator + attachmentName);
			if (ff.exists() == true) {
				FileInputStream fis = new FileInputStream(ff);
				byte[] inputBytes = new byte[(int) ff.length()];
				fis.read(inputBytes);
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + attachmentName);
				OutputStream os = response.getOutputStream(); // file output stream
				os.write(inputBytes);
				os.close();
				fis.close();
			} else {
				PrintWriter out2 = response.getWriter();
				out2.println("<script type=\"text/javascript\">");
				out2.println("alert('No file available');");
				out2.println("window.history.back();");
				out2.println("</script>");
				out2.close();

			}

		}
		return null;
	}

	// resume path(done by shravani)
	@RequestMapping(value = { "/ResumeFiledownload" }, method = RequestMethod.GET)
	public String ResumeFiledownload(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {

		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String filename = req.getParameter("filename");
		String fileType = req.getParameter("fileType");
		CandidateInformation candidateinfo = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
		if (candidateinfo != null) {
			if (candidateinfo.getFile_upload_name() != null) {
				// String uploadsDir = "/Resumes";
				String workingDir = env.getProperty("Resumes");
				String directorypath = workingDir + File.separator + candidateinfo.getFile_upload_name();
				File ff = new File(directorypath);
				if (ff.exists() == true) {
					FileInputStream fis = new FileInputStream(ff);
					byte[] inputBytes = new byte[(int) ff.length()];
					fis.read(inputBytes);
					response.setContentType("application/pdf");
					response.setHeader("Content-Disposition",
							"attachment; filename=\"" + candidateinfo.getFile_upload_name());
					OutputStream os = response.getOutputStream(); // file output stream
					os.write(inputBytes);
					os.close();
					fis.close();

				}

				else {
					PrintWriter out2 = response.getWriter();
					out2.println("<script type=\"text/javascript\">");
					out2.println("alert('No file available');");
					out2.println("window.history.back();");
					out2.println("</script>");
					out2.close();

				}

			}
		}
		return null;
	}
	// by shravani

	@RequestMapping(value = { "viewAttachedDocs" }, method = RequestMethod.GET)
	@ResponseBody
	public AttachmentsDTO viewAttachedDocs(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {

		AttachmentsDTO nObj = new AttachmentsDTO();

		String canDocs = null;
		List<Tbl_RecPortal_candidateAttachments> docList = null;
		List<Tbl_RecPortal_JobAttachments> jobattachments = null;

		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		int jobid = Integer.parseInt(req.getParameter("jobid"));
		docList = recruitmentDAO.getAllCandiateList(candidateid);

		canDocs = recruitmentDAO.getAllCanInfo(candidateid);
		jobattachments = recruitmentDAO.getAllJobList(jobid);

		nObj.setCanDocs(canDocs);
		nObj.setDocList(docList);
		nObj.setJobattachments(jobattachments);

		return nObj;

	}

	@RequestMapping(value = "/checkSelectedFiles", method = RequestMethod.GET)
	@ResponseBody
	public String checkSelectedFiles(HttpServletRequest req) throws HandlingException {

		Integer canid = Integer.parseInt(req.getParameter("candidateid"));
		String filename = req.getParameter("filename");

		String ctype = recruitmentDAO.getCanAttachFilenameByType(canid, filename);

		return ctype;
	}

	// done by shravani
	@RequestMapping(value = "/checkJobCodeExists", method = RequestMethod.GET)
	@ResponseBody
	public String checkJobCodeExists(HttpServletRequest req) throws HandlingException {

		String jobCode = req.getParameter("jc");

		String jobcodes = recruitmentDAO.checkJobCodeExist(jobCode);

		return jobcodes;
	}
	@RequestMapping(value = "/saveCandidateEmployers", method = RequestMethod.POST)
	public String saveEmployerDetails(HttpServletRequest request) throws HandlingException {
try {
	
	String role = (String) request.getSession().getAttribute("role");
	String bdname = request.getParameter("bdname");
	String recname = request.getParameter("recname");
	String clientname = request.getParameter("clientname");
	String jobId = request.getParameter("jobid");
	
	
		String employer = request.getParameter("employer");
		String tenure = request.getParameter("tenure");
		String ctc = request.getParameter("ctc");
		String ldctc = request.getParameter("txtldctc");
		String reasonforchange = request.getParameter("changereason");
		String candidateid = request.getParameter("candidateid");
		String commnets =  request.getParameter("comments");
		
		int candidate=0;
		if(!candidateid.isEmpty()) {
			candidate=Integer.parseInt(candidateid);
		}
		String message=null;
		Integer employerDetails=reportDao.getEmployerDetils(candidate);
		PreOnbordingEmployerDetials employerObject=new PreOnbordingEmployerDetials();
		employerObject.setEmployername(employer);
		employerObject.setCandidateid(candidate);
		employerObject.setTenureresume(tenure);
		//HRUSER  NEGOTIATOR HRMANAGER
		if(!commnets.isEmpty()) {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
			 LocalDateTime now = LocalDateTime.now();//" - "+dtf.format(now);
			String commnetsdb=commnets+" - "+dtf.format(now);
			if(role.equalsIgnoreCase("HRUSER")) {
				employerObject.setVerifiercomments(commnetsdb);
			}else if(role.equalsIgnoreCase("NEGOTIATOR")) {
				employerObject.setNegcomments(commnetsdb);
			}else if(role.equalsIgnoreCase("RECRUITER") || role.equalsIgnoreCase("TEAMLEAD")) {
				employerObject.setReccomments(commnetsdb);
			}else {}
		}
		employerObject.setCtc(ctc);
		employerObject.setLdctc(ldctc);
		employerObject.setReasonforchange(reasonforchange);
		message=reportDao.saveCandidateEmployers(employerObject);
		//}
		
		if (request.getParameterValues("btncount")!=null) {
			String bankBtnVal[] = request.getParameterValues("btncount");
			for (int i = 1; i <= bankBtnVal.length; i++) {
				String employer11 = request.getParameter("employer"+i);
				String tenure1 = request.getParameter("tenure"+i);
				String ctc1 = request.getParameter("ctc"+i);
				String ldctc1 = request.getParameter("ldctc"+i);
				String reasonforchange1 = request.getParameter("changereason"+i);
				String commnets1 =  request.getParameter("comments"+i);
				
				PreOnbordingEmployerDetials employerObjectnew=new PreOnbordingEmployerDetials();
				
				employerObjectnew.setEmployername(employer11);
				employerObjectnew.setCandidateid(candidate);
				employerObjectnew.setTenureresume(tenure1);
				if(!commnets1.isEmpty()) {
					DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
					 LocalDateTime now1 = LocalDateTime.now();//" - "+dtf.format(now);
				String commnetsdb1=commnets1+" - "+dtf1.format(now1);
				if(role.equalsIgnoreCase("HRUSER")) {
					employerObjectnew.setVerifiercomments(commnetsdb1);
				}else if(role.equalsIgnoreCase("NEGOTIATOR")) {
					employerObjectnew.setNegcomments(commnetsdb1);
				}else if(role.equalsIgnoreCase("RECRUITER") || role.equalsIgnoreCase("TEAMLEAD")) {
					System.out.println("------------------->>>>>"+commnetsdb1);
					employerObjectnew.setReccomments(commnetsdb1);
				}
				}
				
				//employerObjectnew.setReccomments(commnets1);
				employerObjectnew.setCtc(ctc1);
				employerObjectnew.setLdctc(ldctc1);
				employerObjectnew.setReasonforchange(reasonforchange1);
				message=reportDao.saveCandidateEmployers(employerObjectnew);
				
				//}
			}
		}
		return "redirect:/negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname +"&recname=" + recname + "&jobid=" + jobId + "&clientname=" + clientname + "'";

}catch(Exception e) {logger.error(e.getMessage(),e);}

		
return null;
	
	}
	
	
	@RequestMapping(value = { "/verifierEmployerDetails" }, method = RequestMethod.POST)
	public void verifierEmployerDetails(HttpServletRequest request, Model model, HttpServletResponse response) {
		try {
			
			Integer candidate_Id =null;
			String candidate_id = request.getParameter("candidateid");
			if(candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer loginEmpNumber = (Integer) request.getSession().getAttribute("empNumber");
			String ver_employername = request.getParameter("ver_employername");
			String ver_id = request.getParameter("ver_id");
			String appointmentletter = request.getParameter("appointmentletter");
			String relievingletter = request.getParameter("relievingletter");
			String bankstmt = request.getParameter("bankstmt");
			String payslip = request.getParameter("payslip");
			String comments = request.getParameter("comments");
			String message = recruitmentDAO.saveverifierEmployerDetails(appointmentletter, relievingletter,bankstmt, payslip, comments,
					candidate_Id,ver_employername,ver_id,loginEmpNumber);
			String bdname = request.getParameter("bdname");
			String recname = request.getParameter("recname");
			String jobid = request.getParameter("jobid");
			String clientname = request.getParameter("clientname");
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+message+"');");
			out.println("location='candidatelist'");
			out.println("location='negotiateCandidate?canid="+candidate_Id+"&bdname="+bdname+"&recname="+recname+"&jobid="+jobid+"&clientname="+clientname+"'");
			out.println("</script>");
			out.close();	
		} catch (Exception e) {
			logger.error("Error occured in verifierEmployerDetails ---", e);
		}
	}
	@RequestMapping(value = { "/saveCandidatePayslip" }, method = RequestMethod.POST)
	public void saveCandidatePayslip(HttpServletRequest request, Model model, HttpServletResponse response) {
		try {String message =null;
			Integer candidate_Id =null;
			String candidate_id = request.getParameter("candidateid");
			if(candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer loginEmpNumber = (Integer) request.getSession().getAttribute("empNumber");
			int temp=6;
			for (int i = 1; i <= temp; i++) {
				String months = request.getParameter("months"+i);
				String payslips = request.getParameter("payslip"+i);
				String bankstmt = request.getParameter("bankstmt"+i);
				String comments = request.getParameter("comments"+i);
				 message = recruitmentDAO.saveCandidatePayslip(months, payslips,bankstmt, comments,candidate_Id,loginEmpNumber);
				
			}
			
			String bdname = request.getParameter("bdname");
			String recname = request.getParameter("recname");
			String jobid = request.getParameter("jobid");
			String clientname = request.getParameter("clientname");
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+message+"');");
			out.println("location='negotiateCandidate?canid="+candidate_Id+"&bdname="+bdname+"&recname="+recname+"&jobid="+jobid+"&clientname="+clientname+"'");
			out.println("</script>");
			out.close();	
		} catch (Exception e) {
			logger.error("Error occured in saveCandidatePayslip ---", e);
		}
	}
	@RequestMapping(value = { "/saveCandidateProofs" }, method = RequestMethod.POST)
	public void saveCandidateProofs(HttpServletRequest request, Model model, HttpServletResponse response) {
		try {String message =null;
			Integer candidate_Id =null;
			int id=0;
			String candidate_id = request.getParameter("candidateid");
			if(candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer loginEmpNumber = (Integer) request.getSession().getAttribute("empNumber");
				String idproof = request.getParameter("idproof");
				String idproofRN = request.getParameter("idproofRN");
				String addressproof = request.getParameter("addressproof");
				String addressproofRN = request.getParameter("addressproofRN");
				String photoRN = request.getParameter("photoRN");
				String pers_id = request.getParameter("pers_id");
				if(pers_id!="") {
					id = Integer.parseInt(pers_id);
				}
				if(id!=0) {
					PreOnbordingPersonnelDetails persnelObj=recruitmentDAO.getPersonaDetailById(id);
					persnelObj.setIdproof(idproof);
					persnelObj.setIsreceived(idproofRN);
					persnelObj.setAddressproof(addressproof);
					persnelObj.setIsadproffreceived(addressproofRN);
					persnelObj.setPhoto(photoRN);
					persnelObj.setCandidateid(candidate_Id);
							recruitmentDAO.updateCandidateProofsById(persnelObj);
							message = "Details Updated Successfully";
				}else {
					message = recruitmentDAO.saveCandidateProofs(idproof, idproofRN,addressproof, addressproofRN,photoRN,candidate_Id,loginEmpNumber);
				}
				 
				
			
			String bdname = request.getParameter("bdname");
			String recname = request.getParameter("recname");
			String jobid = request.getParameter("jobid");
			String clientname = request.getParameter("clientname");
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+message+"');");
			out.println("location='negotiateCandidate?canid="+candidate_Id+"&bdname="+bdname+"&recname="+recname+"&jobid="+jobid+"&clientname="+clientname+"'");
			out.println("</script>");
			out.close();	
		} catch (Exception e) {
			logger.error("Error occured in saveCandidateProofs ---", e);
		}
	}
	
	@RequestMapping(value = { "/editCourse" }, method = RequestMethod.POST)
	public void editCourse(HttpServletRequest request, Model model, HttpServletResponse response) {
		try {
			
			Integer candidate_Id =null;
			String candidate_id = request.getParameter("candidateid");
			if(candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer loginEmpNumber = (Integer) request.getSession().getAttribute("empNumber");
			String course_id = request.getParameter("course_id");
			String postgraduate = request.getParameter("postgraduate");
			String graduate = request.getParameter("graduate");
			String intermediate = request.getParameter("intermediate");
			String ssc = request.getParameter("ssc");
			String message = recruitmentDAO.editCourse(course_id, postgraduate, graduate, intermediate,
					candidate_Id,ssc,loginEmpNumber);
			String bdname = request.getParameter("bdname");
			String recname = request.getParameter("recname");
			String jobid = request.getParameter("jobid");
			String clientname = request.getParameter("clientname");
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+message+"');");
			out.println("location='candidatelist'");
			out.println("location='negotiateCandidate?canid="+candidate_Id+"&bdname="+bdname+"&recname="+recname+"&jobid="+jobid+"&clientname="+clientname+"'");
			out.println("</script>");
			out.close();	
		} catch (Exception e) {
			logger.error("Error occured in editCourse ---", e);
		}
	}
	
	@RequestMapping(value = { "/editPercentage" }, method = RequestMethod.POST)
	public void editPercentage(HttpServletRequest request, Model model, HttpServletResponse response) {
		try {
			
			Integer candidate_Id =null;
			String candidate_id = request.getParameter("candidateid");
			if(candidate_id!="") {
				candidate_Id = Integer.parseInt(candidate_id);
			}
			Integer loginEmpNumber = (Integer) request.getSession().getAttribute("empNumber");
			String course_id = request.getParameter("perc_id");
			String postgraduate = request.getParameter("postgraduateperc");
			String graduate = request.getParameter("graduateperc");
			String intermediate = request.getParameter("intermediateperc");
			String ssc = request.getParameter("sscperc");
			String message = recruitmentDAO.editPercentage(course_id, postgraduate, graduate, intermediate,
					candidate_Id,ssc,loginEmpNumber);
			String bdname = request.getParameter("bdname");
			String recname = request.getParameter("recname");
			String jobid = request.getParameter("jobid");
			String clientname = request.getParameter("clientname");
			
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('"+message+"');");
			out.println("location='candidatelist'");
			out.println("location='negotiateCandidate?canid="+candidate_Id+"&bdname="+bdname+"&recname="+recname+"&jobid="+jobid+"&clientname="+clientname+"'");
			out.println("</script>");
			out.close();	
		} catch (Exception e) {
			logger.error("Error occured in editCourse ---", e);
		}
	}
	@RequestMapping(value = { "updateeducationdetails" }, method = RequestMethod.GET)
	public String updateeducationdetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String role = (String) req.getSession().getAttribute("role");
		String ssc = req.getParameter("ssc");
		String sscperc = req.getParameter("sscperc");
		String intermediate = req.getParameter("intermediate");
		String interperc = req.getParameter("interperc");
		String graduation = req.getParameter("graduation");
		String gradperc = req.getParameter("gradperc");
		String post_graduation = req.getParameter("post_graduation");
		String pgperc = req.getParameter("pgperc");
		String addcomments = req.getParameter("addcomments");
		
		
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String canObj = null;

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		int sscpercentage=0,interpercentage=0,degreeperc=0,pgpercent=0;
		if(!sscperc.isEmpty()) {
			sscpercentage=Integer.parseInt(sscperc);
		}
		if(!interperc.isEmpty()) {
			interpercentage=Integer.parseInt(interperc);
		}
		if(!gradperc.isEmpty()) {
			degreeperc=Integer.parseInt(gradperc);
		}
		if(!pgperc.isEmpty()) {
			pgpercent=Integer.parseInt(pgperc);
		}
		PreonboardingEducationDetails canaddObj = recruitmentDAO.getEducationDetailsByCanId(candidateid);
		if (canaddObj != null) {
			canaddObj.setSsc(ssc);
			canaddObj.setSscperc(sscpercentage);
			canaddObj.setInter(intermediate);
			canaddObj.setInterperc(interpercentage);
			canaddObj.setDegree(graduation);
			canaddObj.setDegree_perc(degreeperc);
			canaddObj.setPg(post_graduation);
			canaddObj.setPgperc(pgpercent);
			
			if(!addcomments.isEmpty()) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
				 LocalDateTime now = LocalDateTime.now();//" - "+dtf.format(now);
				String commnetsdb1=addcomments+" - "+dtf.format(now);
				if(role.equalsIgnoreCase("HRUSER")) {
					canaddObj.setVerifier_comments(commnetsdb1);
				}else if(role.equalsIgnoreCase("NEGOTIATOR")) {
					canaddObj.setNeg_comments(commnetsdb1);
				}
				}
			canObj = recruitmentDAO.updateeducationdetails(canaddObj);
			if (canObj.equalsIgnoreCase("updated")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details not added!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
		}
		}else {
			PreonboardingEducationDetails canaddObj1= new PreonboardingEducationDetails();
			canaddObj1.setCandidateid(candidateid);
			canaddObj1.setSsc(ssc);
			canaddObj1.setSscperc(sscpercentage);
			canaddObj1.setInter(intermediate);
			canaddObj1.setInterperc(interpercentage);
			canaddObj1.setDegree(graduation);
			canaddObj1.setDegree_perc(degreeperc);
			canaddObj1.setPg(post_graduation);
			canaddObj1.setPgperc(pgpercent);
			if(!addcomments.isEmpty()) {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
			 LocalDateTime now = LocalDateTime.now();//" - "+dtf.format(now);
			String commnetsdb=addcomments+" - "+dtf.format(now);
			if(role.equalsIgnoreCase("HRUSER")) {
				canaddObj1.setVerifier_comments(commnetsdb);
			}else if(role.equalsIgnoreCase("NEGOTIATOR")) {
				canaddObj1.setNeg_comments(commnetsdb);
			}
			}
			String msg=recruitmentDAO.addEducationDetails(canaddObj1);
			
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
		}
		model.addAttribute("candEducainfo", canaddObj);
		return null;
	}
	
	@RequestMapping(value = { "updatepersonaldetails" }, method = RequestMethod.GET)
	public String updatepersonaldetails(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		 //fnametd  mnametd maritaltd nativetd spousetd  wltd  addnlfmaily -->
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String father = req.getParameter("fnametd");
		String mother = req.getParameter("mnametd");
		String marital = req.getParameter("maritaltd");
		String nativelocation = req.getParameter("nativetd");
		String spouse = req.getParameter("spousetd");
		String worklocation = req.getParameter("wltd");
		String addnlfmailys = req.getParameter("addnlfmailys");
		
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		
		CandidateInformation canaddObj = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
		canaddObj.setCan_native_loc(nativelocation);
		canaddObj.setWorkLocation(worklocation);
		canaddObj.setSpouse_wrk(spouse);
		canaddObj.setFamily_bckgrund(marital);
		recruitmentDAO.updateCandidate(canaddObj);
		
		Tbl_RecPortal_CandidateAdditionalInfo canadditionalInfo=recruitmentDAO.getcandidateAdditionalInfoById(candidateid);
		String message="";
		if(canadditionalInfo!=null) {
		canadditionalInfo.setFathername(father);
		canadditionalInfo.setMothername(mother);
		canadditionalInfo.setFamilyDetails(addnlfmailys);
		
		recruitmentDAO.updateCandidateAdditionalDetails(canadditionalInfo);
		message="Personal details updated successfully!!";
		}else {
			Tbl_RecPortal_CandidateAdditionalInfo canaddtnObj=new Tbl_RecPortal_CandidateAdditionalInfo();
			canaddtnObj.setCandidateid(candidateid);
			canaddtnObj.setFathername(father);
			canaddtnObj.setMothername(mother);
			canaddtnObj.setFamilyDetails(addnlfmailys);
			String canObj =reportDao.addCandiAddtnlDetails(canaddtnObj);
			message="Personal details added successfully!!";
		}
			
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('"+message+"');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
			
		
		model.addAttribute("candEducainfo", canaddObj);
		return null;
	}
	
	@RequestMapping(value = { "updateEmploymentNeg" }, method = RequestMethod.POST)
	public String updateEmploymentNeg(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		 //fnametd  mnametd maritaltd nativetd spousetd  wltd  addnlfmaily -->
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String neg_id = req.getParameter("neg_id");
		String empr_tds = req.getParameter("empr_tds");
		String ten_tds = req.getParameter("ten_tds");
		String c_ctc = req.getParameter("c_ctc");
		String ld_ctc = req.getParameter("ld_ctc");
		String neg_reasonchange = req.getParameter("neg_reasonchange");
		String negcomments_td = req.getParameter("negcomments_tds");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		
		PreOnbordingEmployerDetials canaddObj = recruitmentDAO.getEmployerDetailsByid(neg_id);
		if(canaddObj!=null) {
			canaddObj.setEmployername(empr_tds);
			canaddObj.setTenureresume(ten_tds);
			canaddObj.setCtc(c_ctc);
			canaddObj.setLdctc(ld_ctc);
			if(!negcomments_td.isEmpty()) {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy HH:mm:ss");
				 LocalDateTime now = LocalDateTime.now();//dtf.format(now)
				canaddObj.setNegcomments(negcomments_td+" - "+dtf.format(now));
			}
			
			canaddObj.setReasonforchange(neg_reasonchange);
			recruitmentDAO.updateEmployerDetails(canaddObj);
		

			
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
		}
		
		model.addAttribute("candEducainfo", canaddObj);
		return null;
	}
	
	@RequestMapping(value = { "updateCandidatePayslips" }, method = RequestMethod.POST)
	public String updateCandidatePayslips(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		int candidateid = Integer.parseInt(req.getParameter("candidateid"));
		
		String months = req.getParameter("months");
		String bankstmt = req.getParameter("bankstmt");
		String payslip = req.getParameter("payslip");
		String comments = req.getParameter("comments");
		String pay_id = req.getParameter("pay_id");
		int id=0;
		if(!pay_id.isEmpty()) {
			id=Integer.parseInt(pay_id);
		}

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String bdname = req.getParameter("bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("clientname");
		
		PreOnboardingPayslipDetails payslipObj = recruitmentDAO.getpaySlipDetailsBytableId(id);
		if (payslipObj != null) {
			
			payslipObj.setBank_stmt(bankstmt);
			payslipObj.setPayslip(payslip);
			payslipObj.setMonth(months);
			payslipObj.setPayslip(payslip);
			payslipObj.setComments(comments);
			
			recruitmentDAO.updatePayslipDetails(payslipObj);
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Details Updated successfully!!');");
				out.println("window.location.href='negotiateCandidate?canid=" + candidateid + "&bdname=" + bdname
						+ "&recname=" + recname + "&jobid=" + jobid + "&clientname=" + clientname + "'");
				out.println("</script>");
		}	
		
		return null;
	}

}
