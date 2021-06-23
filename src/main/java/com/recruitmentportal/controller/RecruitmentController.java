
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
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.recruitmentportal.DAO.RecruitmentPortalDAO;
import com.recruitmentportal.DAO.loginDao;
import com.recruitmentportal.DTO.CCategoryReportDTO;
import com.recruitmentportal.DTO.CandidateDTO;
import com.recruitmentportal.DTO.CandidateFeedBackDTO;
import com.recruitmentportal.DTO.CandidateInfoDTO;
import com.recruitmentportal.DTO.CandidateInfoDTONew;
import com.recruitmentportal.DTO.CandidatePercentDTO;
import com.recruitmentportal.DTO.CandidateStatusDTO;
import com.recruitmentportal.DTO.DisplayRequirementsDTO;
import com.recruitmentportal.DTO.InterviewDetailsDto;
import com.recruitmentportal.DTO.JobAllocationDTO;
import com.recruitmentportal.DTO.JobDTO;
import com.recruitmentportal.DTO.JobProfileCountDto;
import com.recruitmentportal.DTO.JsonResponse;
import com.recruitmentportal.DTO.RecruiterPerformanceDTO;
import com.recruitmentportal.DTO.ResumeDTO;
import com.recruitmentportal.DTO.ScheduledCandidatesDTO;
import com.recruitmentportal.DTO.SctReportDto;
import com.recruitmentportal.DTO.SecurityBean;
import com.recruitmentportal.DTO.TLDAshboardCountDTO;
import com.recruitmentportal.DTO.TL_Dashboard_DTO;
import com.recruitmentportal.DTO.UserDTO;
import com.recruitmentportal.DTO.ViewUserProfilesSCTStatusDTO;
import com.recruitmentportal.DTO.WorkLoadDTO;
import com.recruitmentportal.DTO.mailBean;
import com.recruitmentportal.DTO.tlhelper;
import com.recruitmentportal.Service.CandidateMailConfirmation;
import com.recruitmentportal.Service.EmailSender;
import com.recruitmentportal.Service.RecPortalService;
import com.recruitmentportal.entity.CandidateFeedBack;
import com.recruitmentportal.entity.CandidateInformation;
import com.recruitmentportal.entity.CandidateJobs;
import com.recruitmentportal.entity.CandidateStatus;
import com.recruitmentportal.entity.CompanyDescription;
import com.recruitmentportal.entity.CompanyNoticePeriod;
import com.recruitmentportal.entity.DepartmentTable;
import com.recruitmentportal.entity.InterviewDetails;
import com.recruitmentportal.entity.JobAllocation;
import com.recruitmentportal.entity.JobAllocationRecruiter;
import com.recruitmentportal.entity.JobAllocationTL;
import com.recruitmentportal.entity.JobMandatorySkills;
import com.recruitmentportal.entity.JobStatus;
import com.recruitmentportal.entity.Jobdescription;
import com.recruitmentportal.entity.RecruiterDailySubmissions;
import com.recruitmentportal.entity.RecruitmentportalLogin;
import com.recruitmentportal.entity.Tbl_RecPortal_JobAttachments;
import com.recruitmentportal.entity.Tbl_RecPortal_SCTComments;
import com.recruitmentportal.entity.Tbl_RecPortal_tecpanelFeedBack;
import com.recruitmentportal.entity.Users;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

@Controller
@PropertySource("/WEB-INF/Mail.properties")
public class RecruitmentController {
	@Autowired
	private loginDao logindao;
	@Autowired
	private RecruitmentPortalDAO recruitmentDAO;
	@Autowired
	private Environment env;
	@Autowired
	private RecPortalService recService;
	@Autowired
	private EmailSender newEmail;
	@Autowired
	private CandidateMailConfirmation candidateMail;
	private static final Logger logger = Logger.getLogger(RecruitmentController.class);
	/*
	 * 
	 * to set link to mail sb.append("<a href='"+link+"'>click,here to login</a>");
	 */

	/**
	 * view Displaying Login Page
	 */
	@RequestMapping(value = { "/loginpage" }, method = RequestMethod.GET)
	public String Loginform() {
		return "loginform";
	}

	/**
	 * Login request.
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = { "/login" }, method = RequestMethod.POST)
	public String loginvalidate(HttpServletRequest req, Model model, HttpServletResponse response) throws Exception {
		HttpSession session = req.getSession(true);
		String password = "";
		String username = req.getParameter("username").trim();
		String rpassword = req.getParameter("password").trim();
		if (!rpassword.isEmpty()) {
			password = rpassword;
		} else {
			String epwd = req.getParameter("pwd").trim();
			password = epwd;
		}
		try {
			mailBean.setMail_Host(env.getProperty("mailhost"));
			mailBean.setMail_link(env.getProperty("link"));
			RecruitmentportalLogin userInfo = logindao.validateUser(username, password);
			List<CompanyDescription> clients;
			List<RecruitmentportalLogin> bdList;
			if (userInfo != null) {
				clients = recruitmentDAO.getAllClients();
				bdList = recruitmentDAO.getBdNames();
				SecurityBean sbean = logindao.getAllSecuredPwd();
				if (sbean != null) {
					mailBean.setMail_User(sbean.getName());
					mailBean.setMail_password(Jsecurity.decipher(sbean.getPwd()));
				}
				byte[] valueDecoded1 = Base64.decode(userInfo.getPwd());
				String decPwd = new String(valueDecoded1);
				if (username.equalsIgnoreCase(userInfo.getUserName()) && (password.equals(decPwd))) {
					session.setAttribute("department", userInfo.getDepartment().getDept_ID());
					session.setAttribute("username", userInfo.getUserName());
					session.setAttribute("role", userInfo.getEmployee_role());
					session.setAttribute("empNumber", userInfo.getEmp_number());
				}
				model.addAttribute("clients", clients);
				model.addAttribute("bdList", bdList);
				if (userInfo.getEmployee_role().equalsIgnoreCase("Admin")) {
					return "redirect:/Employee";
				} else {

					return "LandingPage";
				}
			} else {
				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid Creditails....!!');");
				out.println("location='loginpage';");
				out.println("</script>");
				out.close();

			}
		} catch (Exception e) {
			logger.error("Ecxception occured while logi---" + e);
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Database Exception Occured!!');");
			out.println("location='loginpage';");
			out.println("</script>");
			out.close();
			// e.printStackTrace();
		}
		return "redirect:/loginpage";

	}

	/**
	 * Logout request.
	 */
	@RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(true);
		session.removeAttribute("username");
		session.invalidate();
		return "redirect:/loginpage";
	}

	/**
	 * Display page to add role for already existing employee in Users Table to
	 * access portal.
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/Employee" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String displayEmployeePage(Model model, HttpServletRequest req) throws HandlingException {

		String username = (String) req.getSession().getAttribute("username");
		String designation = (String) req.getSession().getAttribute("role");

		if (username != null) {
			List<DepartmentTable> departmentList = recruitmentDAO.getDepartments(designation);
			model.addAttribute("departmentList", departmentList);
			return "AddEmployee";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	/**
	 * To retrieve employees based department.
	 */
	@RequestMapping(value = { "/getUsersByDepartment" }, method = RequestMethod.GET)
	@ResponseBody
	public List<Users> getUsersByDepartment(HttpServletRequest req) throws HandlingException {
		Integer departmentId = Integer.parseInt(req.getParameter("departmentid"));
		List<Users> userList = logindao.getAllUsers(departmentId);
		List<Users> activeUserslist = new ArrayList<>();

		for (Users users : userList) {
			RecruitmentportalLogin rObj = logindao.getActiveUsers(departmentId, users.getEmp_number());
			if (rObj == null) {
				activeUserslist.add(users);
			}

		}
		return activeUserslist;

	}

	/**
	 * To retrieve employees based department.
	 */
	@RequestMapping(value = { "/getTeamLeadsByDepartment" }, method = RequestMethod.GET)
	@ResponseBody
	public List<RecruitmentportalLogin> getTeamLeadsByDepartment(HttpServletRequest req) throws HandlingException {
		Integer departmentId = Integer.parseInt(req.getParameter("departmentid"));
		String empRole = req.getParameter("empRole");

		List<RecruitmentportalLogin> tlList = logindao.getALLTeamLeads(departmentId, empRole);

		return tlList;

	}

	/**
	 * To Define employee role to access recruitment portal for departments
	 * BDM,Domestic Recruitment,us-staffing and bench sales .
	 */
	@RequestMapping(value = { "/addEmployee" }, method = RequestMethod.POST)
	public String addEmployee(Model model, HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		if (username != null) {
			String designation = req.getParameter("designation");
			String employlead = req.getParameter("employlead");
			Integer userLead = null;
			if (employlead != null) {
				userLead = Integer.parseInt(employlead);
			} else {
				userLead = null;
			}

			Integer generatedValue = null;

			String[] employeeNumArr = req.getParameterValues("employeeid");

			if (employeeNumArr.length != 0) {

				for (int i = 0; i < employeeNumArr.length; i++) {
					// if(employeeNumArr[i]!="0") {

					RecruitmentportalLogin rclogin = recruitmentDAO.checkEmployee(Integer.parseInt(employeeNumArr[i]));
					if (rclogin == null) {
						Users userData = logindao.getUserData(employeeNumArr[i]);
						String email = logindao.getEmailbyEmpno(Integer.parseInt(employeeNumArr[i]));
						RecruitmentportalLogin reclogin = new RecruitmentportalLogin();
						DepartmentTable department = new DepartmentTable();
						department.setDept_ID(userData.getDept_id());
						reclogin.setEmp_number(userData.getEmp_number());
						reclogin.setUserName(userData.getUserName());
						reclogin.setPwd(userData.getPwd());
						reclogin.setEmployee_role(designation);
						reclogin.setDepartment(department);
						reclogin.setEmp_lead(userLead);
						reclogin.setEmail(email);
						reclogin.setCreatedDate(new Date());
						String status = "Active";
						reclogin.setEmpStatus(status);
						generatedValue = recruitmentDAO.saveLoginUserData(reclogin);
						String fromMail = "NOC@tekskills.in";
						String subject = "Recruitment Portal";
						String message = "RecruitmentPortal access given to you with role:" + designation
								+ " Kindly login with eportal credentials, please check in portal";
						try {
							newEmail.sendMail(fromMail, email, subject, message.toString(), null,
									userData.getUserName(), null, null);
						} catch (Exception ex) {
							logger.error("Exception due to:", ex);

						}
					}
					// }
				}
			}
			if (generatedValue != null) {
				return "redirect:/viewEmployee";
			}

		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	@RequestMapping(value = { "/checkEmployeeExists" }, method = RequestMethod.GET)
	@ResponseBody
	public String checkEmployee(HttpServletRequest req) throws HandlingException {
		String emparr = req.getParameter("empArr");
		String empname = "";
		String message = null;
		RecruitmentportalLogin rclogin = null;

		if (emparr.contains(",")) {
			String empsplit[] = emparr.split(",");

			for (int i = 0; i < empsplit.length; i++) {
				rclogin = recruitmentDAO.checkEmployee(Integer.parseInt(empsplit[i]));
				if (rclogin != null) {
					empname = rclogin.getUserName() + "&" + empname;
				}

			}
			if ((!empname.equals("")) && (empname != null)) {

				message = "Employee Already Exists" + empname;
			} else {
				message = "Employee Not Exists continue..";
			}
		}

		else {
			Integer emp = null;
			if (emparr != null) {
				emp = Integer.parseInt(emparr);
			}
			rclogin = recruitmentDAO.checkEmployee(emp);
			if (rclogin != null) {
				message = "Employee Already Exists" + rclogin.getUserName();
			} else {
				message = "Employee Not Exists continue..";
			}
		}

		return message;

	}

	/**
	 * To retrieve list of users from RecruitmentportalLogin
	 * 
	 * 
	 * @param model
	 * @param req
	 * @return Users List
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/viewEmployee" }, method = RequestMethod.GET)
	public String viewEmployee(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		String designation = (String) session.getAttribute("role");
		List<UserDTO> userList = new ArrayList<UserDTO>();
		;
		if (username != null) {
			List<DepartmentTable> departmentList = recruitmentDAO.getDepartments(designation);
			model.addAttribute("departmentList", departmentList);
			List<RecruitmentportalLogin> employeeList = recruitmentDAO.getAllUsers();
			for (RecruitmentportalLogin recruitmentportalLogin : employeeList) {

				UserDTO user = new UserDTO();

				user.setUserName(recruitmentportalLogin.getUserName());
				user.setEmail(recruitmentportalLogin.getEmail());
				user.setEmp_lead(recruitmentportalLogin.getEmp_lead());
				user.setEmpRole(recruitmentportalLogin.getEmployee_role());
				if (recruitmentportalLogin.getEmp_lead() != null) {
					UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(recruitmentportalLogin.getEmp_lead(),"TEAMLEAD");
					if(leadObj!=null) {
					user.setLeadName(leadObj.getUserName());
					}
				}
				user.setEmpStatus(recruitmentportalLogin.getEmpStatus());
				user.setEmp_number(recruitmentportalLogin.getEmp_number());
				String fName = recruitmentDAO.getFullNameByEmpNo(recruitmentportalLogin.getEmp_number());
				user.setFullname(fName);
				user.setDate(recruitmentportalLogin.getCreatedDate());
				user.setDepertment(recruitmentportalLogin.getDepartment().getDept_name());
				user.setDeptId(recruitmentportalLogin.getDepartment().getDept_ID());
				userList.add(user);
			}

			model.addAttribute("employeeList", userList);
			return "ViewEmployee";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	/**
	 * To display Job description page for saving job description
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/displayJobDescPage" }, method = RequestMethod.GET)
	public String addDescription(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");

		if (username != null) {
			// We are getting all Team leads not managers based on updated requirement.dont
			// confuse but name not changed..
			List<RecruitmentportalLogin> managerList = recruitmentDAO.getManagers();
			List<WorkLoadDTO> mgrworkloadList = new ArrayList<>();
			model.addAttribute("managerList", managerList);
			/*
			 * for (RecruitmentportalLogin list : managerList) { WorkLoadDTO workload = new
			 * WorkLoadDTO(); int reqcount =
			 * recruitmentDAO.getWorkLoadCount(list.getEmp_number());
			 * workload.setCount(reqcount);
			 * workload.setEmployeeNumber(list.getEmp_number());
			 * workload.setEmployeeName(list.getUserName()); mgrworkloadList.add(workload);
			 * } model.addAttribute("mgrworkloadList", mgrworkloadList);
			 */

			model.addAttribute("managerList", managerList);
			List<CompanyDescription> clientList = recruitmentDAO.getAllClients();

			model.addAttribute("clientList", clientList);
			return "jobdescription";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	/**
	 * To get List users from recruitment login table based on designation.
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/getUsersByDesignation" }, method = RequestMethod.GET)
	@ResponseBody
	public List<RecruitmentportalLogin> getUserssByDesignation(Model model, HttpServletRequest req)
			throws HandlingException {

		String designation = req.getParameter("designation");

		List<RecruitmentportalLogin> leadList = recruitmentDAO.getUsersByDesignation(designation);
		return leadList;

	}

	/**
	 * To update Employee role and department in recruitment login Table
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/updateEmployee" }, method = RequestMethod.GET)
	public String editEmployee(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		if (username != null) {
			Integer emp_Number = null;
			Integer department_Id = null;
			String empNumber = req.getParameter("empnumber_edit");
			String departmentId = req.getParameter("departmentid");
			String designation = req.getParameter("designation");
			String employlead = req.getParameter("employlead");
			String Status_edit = req.getParameter("employeeStatus_edit");

			if (empNumber != null) {
				emp_Number = Integer.parseInt(empNumber);
			}
			if (departmentId != null) {
				department_Id = Integer.parseInt(departmentId);
			}
			if (!Status_edit.isEmpty()) {

				recruitmentDAO.updateEmploye(emp_Number, department_Id, designation, employlead, Status_edit);
				UserDTO userData = recruitmentDAO.getUserNameByEmpNo(emp_Number,role);
				if(userData!=null) {
				String fromMail = "NOC@tekskills.in";
				String subject = "Recruitment Portal";
				String message = "RecruitmentPortal access given to you with role:" + designation
						+ " Kindly login with eportal credentials, please check in portal";
				try {
					if (Status_edit == "Active") {
						newEmail.sendMail(fromMail, userData.getEmail(), subject, message.toString(), null,
								userData.getUserName(), null, null);
					}
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);

				}
				}
			}
			return "redirect:/viewEmployee";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	/**
	 * To display Add client page
	 * 
	 * @param HttpServletRequest
	 * @return null
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/addClients" }, method = RequestMethod.GET)
	public String addclients(HttpServletRequest req, Model model) throws HandlingException {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		// String username = (String) req.getSession().getAttribute("username");

		if (username != null) {
			return "addClients";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	/**
	 * To save new client details.
	 * 
	 * @param model
	 * @param req
	 * @return null
	 * @throws Exception
	 */
	@RequestMapping(value = { "/saveClient" }, method = RequestMethod.POST)
	public String addClient(Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");

		if (username != null) {

			String companyName = req.getParameter("company_name");
			CompanyDescription company = new CompanyDescription();
			try {
				boolean cmpny_existornot = checkExist(companyName);
				if (!cmpny_existornot) {
					company.setCmpny_name(companyName);
					Date dateobj = new Date();
					company.setSubmit_date(dateobj);
					recruitmentDAO.addClients(company);
					return "redirect:/viewClients";
				}
				return "redirect:/viewClients";
			} catch (Exception ex) {
				logger.error("Exception due to:", ex);

			}
			return "home";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	/**
	 * To check given company exist or not
	 */
	private boolean checkExist(String companyName) throws HandlingException {

		CompanyDescription company = recruitmentDAO.findBycompanyname(companyName);
		if (company != null) {
			return true;
		}
		return false;

	}

	/**
	 * To get all clients saved in Company Description table
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/viewClients" }, method = RequestMethod.GET)
	public String Viewcompany(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");

		if (username != null) {
			List<CompanyDescription> clientList = recruitmentDAO.getAllClients();
			model.addAttribute("clientList", clientList);
			return "viewClients";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	/**
	 * Bdm will save job description given by client .
	 */
	@RequestMapping(value = { "/storeJobDesc" }, headers = { "content-type=multipart/*" }, method = RequestMethod.POST)
	public String storeDescription(Model model, HttpServletRequest req, @RequestParam("file1") MultipartFile file1,
			@RequestParam("file2") MultipartFile file2) throws Exception {
		HttpSession session = req.getSession(true);

		Integer empNumber = (Integer) session.getAttribute("empNumber");
		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		String fromMail = null;
		String fromUser = null;

		if (username != null) {
			String jobCode = req.getParameter("jobCode").trim();
			String mandatoryskills[] = req.getParameterValues("manskills[]");

			String jobDescription = req.getParameter("jobdescription");
			String technology = req.getParameter("Technology");
			String jobGivenBy = req.getParameter("jobGivenBy");
			String intORext = req.getParameter("intORext");
			String jobCloseDate = req.getParameter("jobCloseDate");
			String companyId = req.getParameter("company");
			String account = req.getParameter("account");
			String segment = req.getParameter("segment");
			Integer totalpositions = Integer.parseInt(req.getParameter("totalpositions"));
			String durationProject = req.getParameter("durationProject");
			String locationProject = req.getParameter("locationProject");
			String priority = req.getParameter("jd_priority");
			String jdStatus = req.getParameter("jd_status");
			String jdlabel = req.getParameter("jd_label");
			String[] employeeArr = req.getParameterValues("assignTo");
			String jobreceivedtime = req.getParameter("jobreceivedTime");
			String jdCategory = req.getParameter("jdcategory");

			SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:Ss");
			Date jobsdfTime = null;
			if (!jobreceivedtime.equals("") && jobreceivedtime != null) {
				jobsdfTime = sdfTime.parse(jobreceivedtime);
			}
			Jobdescription jobDesc = new Jobdescription();
			UserDTO loginUserDetails = recruitmentDAO.getUserNameByEmpNo(empNumber,role);
			if (loginUserDetails != null) {
				fromMail = loginUserDetails.getEmail();
				fromUser = loginUserDetails.getUserName();
			}

			Date posEndDate = null;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!jobCloseDate.equals("") && jobCloseDate != null) {
				posEndDate = sdf.parse(jobCloseDate);
			}
			String allocatedBudget = req.getParameter("allocated_budget");

			Date jobCreatedDate = new Date();
			int flag = 0;

			Integer companyid = null;

			Jobdescription jd = recruitmentDAO.checkJobDescExistOrNot(jobCode);
			if (jd == null) {
				CompanyDescription company = new CompanyDescription();
				if (companyId != null) {
					companyid = Integer.parseInt(companyId);
					company.setCmpny_id(companyid);
				}

				jobDesc.setCompany(company);
				jobDesc.setAllocatedBudget(allocatedBudget);
				jobDesc.setJobCode(jobCode);
				jobDesc.setCreatedby(empNumber);
				jobDesc.setJobDescription(jobDescription);
				jobDesc.setJobDescGiven(jobGivenBy);
				jobDesc.setTechnology(technology);
				jobDesc.setExternal_internal(intORext);
				if (priority != null) {
					jobDesc.setJdPriority(priority);
				}
				jobDesc.setPosEndDate(posEndDate);
				jobDesc.setAcc_name(account);
				jobDesc.setSegment(segment);
				jobDesc.setJobstatus(jdStatus);
				jobDesc.setNo_of_positions(totalpositions);
				jobDesc.setDuration_project(durationProject);
				jobDesc.setLocation_project(locationProject);
				jobDesc.setCreatedDate(jobCreatedDate);
				jobDesc.setJobrecieved_time(jobsdfTime);
				jobDesc.setFlag(Integer.valueOf(flag));
				jobDesc.setJoblabel(jdlabel);
				jobDesc.setJdCategory(jdCategory);

				Integer jobDescId = recruitmentDAO.addjobDesc(jobDesc);

				JobStatus jdstatus = new JobStatus();
				jdstatus.setJobdesc(jobDesc);
				jdstatus.setJdStatus("No Submission");
				recruitmentDAO.saveJobStatus(jdstatus);
				Tbl_RecPortal_tecpanelFeedBack tecpanelFeedBack = new Tbl_RecPortal_tecpanelFeedBack();
				tecpanelFeedBack.setJobDesc(jobDesc);
				recruitmentDAO.save_tl_insert(tecpanelFeedBack);
				if (mandatoryskills.length != 0) {
					for (int i = 0; i < mandatoryskills.length; i++) {
						JobMandatorySkills jdRequiredSkills = new JobMandatorySkills();
						jdRequiredSkills.setReqskill(mandatoryskills[i]);
						jdRequiredSkills.setJobdesc(jobDesc);
						recruitmentDAO.saveJdMandatorySkills(jdRequiredSkills);
					}

				}

				Date assignedDate = new Date();
				saveJobAllocation(jobDescId, employeeArr, empNumber, fromMail, assignedDate, jobCode, role, fromUser,
						companyid, intORext);

				Date attcahedDate = new Date();

				String filepath = null;

				if (file1.getOriginalFilename() != null) {
					String attachementType = req.getParameter("JdDescription");
					filepath = file1.getOriginalFilename();

					recService.saveMultipleFiles(jobDescId, filepath, attcahedDate, attachementType);
				}
				if (file2.getOriginalFilename() != null) {
					String attachementType = req.getParameter("Mailproof");
					filepath = file2.getOriginalFilename();
					recService.saveMultipleFiles(jobDescId, filepath, attcahedDate, attachementType);
				}

				// String uploadsDir = "/JDuploads";

				String workingDir = env.getProperty("JDuploads");

				String directorypath = workingDir + File.separator + jobCode;

				if (!new File(workingDir).exists()) {
					new File(workingDir).mkdir();
					// directorypath = workingDir + File.separator + jobCode;
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();

					}

				} else {
					if (!new File(directorypath).exists()) {
						new File(directorypath).mkdir();
					}
				}
				File dest = null;
				if (file1 != null) {
					dest = new File(directorypath + File.separator + file1.getOriginalFilename());
					try {

						file1.transferTo(dest);

					} catch (Exception ex) {
						logger.error("Exception due to:", ex);

					}
				}

				if (file2 != null) {
					dest = new File(directorypath + File.separator + file2.getOriginalFilename());
					try {
						file2.transferTo(dest);
					} catch (Exception ex) {
						logger.error("Exception due to:", ex);
					}
				}

				return "redirect:/displayRequirements";
			} else {
				return "jobdescription";
			}
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}
	/*
	 * @RequestMapping(value = "/as", method = RequestMethod.GET)
	 * 
	 * @ResponseBody public String saveAssignee( HttpServletRequest req) throws
	 * HandlingException { return null;
	 * 
	 * }
	 */

	@RequestMapping(value = "/displayMandatorySkillsByJobid", method = RequestMethod.GET)
	@ResponseBody
	public List<JobMandatorySkills> displayJobMandtorySkills(HttpServletRequest req) throws HandlingException {
		String jobid = req.getParameter("jobdescid");

		if (jobid != null) {
			List<JobMandatorySkills> mskills = recruitmentDAO.getMandatorySkillsByJobid(Integer.parseInt(jobid));
			return mskills;
		}
		return null;

	}

	/**
	 * To save assign to details in Job allocation table when job assigned to user.
	 * 
	 * @param jobDescId
	 * @param employeeArr
	 * @param empNumber
	 * @param intORext
	 * @param jobCode2
	 * @param departmentId
	 * @param password
	 * @param email
	 * @throws HandlingException
	 */

	private void saveJobAllocation(Integer jobDescId, String[] employeeArr, Integer empNumber, String fromMail,
			Date assignedDate, String jobCode, String role, String fromUser, Integer cId, String intORext)
			throws HandlingException {
		UserDTO userDetails = null;
		Jobdescription jobDesc = new Jobdescription();
		String jobType = recruitmentDAO.getJobTypeByJobId(jobDescId);
		jobDesc.setJobdescid(jobDescId);

		/* saving into job allocation table */
		JobAllocation jobAllocation = new JobAllocation();

		jobAllocation.setAssignedby(empNumber);
		jobAllocation.setJobDesc(jobDesc);
		jobAllocation.setAssigneddate(assignedDate);

		/* saving into Tl allocation table */
		JobAllocationTL tlAllocation = new JobAllocationTL();

		tlAllocation.setBdempno(empNumber);
		tlAllocation.setJobdescid(jobDescId);
		tlAllocation.setBdassigneddate(assignedDate);
		String compnyName = recruitmentDAO.getCompanyNameByjobId(cId);

		// String jobcode=recruitmentDAO.getJobCodeById(jobDescId);

		if (employeeArr != null) {
			for (int i = 0; i < employeeArr.length; i++) {
				Integer assignedTo = Integer.parseInt(employeeArr[i]);
				Integer departmentId = recruitmentDAO.getDepatNoByEmpNo(assignedTo);
				jobAllocation.setDepartmentid(departmentId);
				jobAllocation.setAssignedto(assignedTo);
				jobAllocation.setEmpstatus("Active");
				recruitmentDAO.saveJobAllocation(jobAllocation);
				tlAllocation.setDepartmentid(departmentId);
				tlAllocation.setTlempno(assignedTo);
				tlAllocation.setTlstatus("Active");
				recruitmentDAO.saveTLAllocation(tlAllocation);
				List<String> ccList = new LinkedList<>();
				String ccRequirements = "requirements@tekskills.in";
				String ccSct = null;
				if (!jobType.equalsIgnoreCase("External Fulltime")) {
					ccSct = env.getProperty("SctMail");
					ccList.add(ccSct);
				}

				ccList.add(ccRequirements);

				List<String> ccDeliveryMail = recruitmentDAO.getEmailByRole("DELIVERYTEAM");
				for (String email : ccDeliveryMail) {
					ccList.add(email);
				}
				userDetails = recruitmentDAO.getUserNameByEmpNo(assignedTo,"TEAMLEAD");
				if(userDetails!=null) {
				String toEmail1 = userDetails.getEmail();
				String subject = jobCode;

				String status = "Assigned";
				try {
					newEmail.sendMailBD_RecUser(fromMail, toEmail1, subject, null, userDetails.getUserName(), ccList,
							role, jobCode, compnyName, userDetails.getUserName(), fromUser, status);
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);

				}
				}
			}
		}

	}

	/**
	 * To view all requirements created by BDM
	 * 
	 * @param model
	 * @param req
	 * @return List of Requirements
	 * @throws HandlingException
	 */
	@RequestMapping(value = "/displayRequirements", method = RequestMethod.GET)
	public String displayRequirements(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String username = (String) session.getAttribute("username");
		// String role = (String) session.getAttribute("role");
		if (username != null) {
			try {
				// String designation = (String) req.getSession().getAttribute("role");

				List<DisplayRequirementsDTO> jobList = recruitmentDAO.getDisplayRequirements(loginEmpNumber);

				List<CompanyDescription> clientList = recruitmentDAO.getAllClients();
				Integer departmentId = (Integer) req.getSession().getAttribute("department");
				List<RecruitmentportalLogin> managerList = recruitmentDAO.getManagers();

				model.addAttribute("clientList", clientList);
				model.addAttribute("departmentId", departmentId);
				model.addAttribute("managerList", managerList);
				model.addAttribute("jobList", jobList);

			}

			catch (Exception ex) {
				logger.error("Exception due to:", ex);
			}
			return "viewJD";
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	/**
	 * To get the requirement details based on job description id for editing.
	 * 
	 * @throws HandlingException
	 * @throws IOException
	 */

	@RequestMapping(value = "/getJobDescByJobID", method = RequestMethod.GET)
	@ResponseBody
	public JobDTO getJobDescByJobID(HttpServletRequest req) throws HandlingException, IOException {

		HttpSession session = req.getSession(true);
		Integer emp_number = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		// Integer emp_number = (Integer) req.getSession().getAttribute("empNumber");
		String jobid = req.getParameter("jobId");
		JobDTO jobDto = new JobDTO();

		Jobdescription jobDesc = recruitmentDAO.findJobDescById(jobid);

		jobDto.setJobdesc(jobDesc);
		List<JobAllocation> jobAllocation = recruitmentDAO.findJobAllocationById(jobid, emp_number);
		for (JobAllocation jobAllocation2 : jobAllocation) {
			UserDTO user = recruitmentDAO.getUserNameByEmpNo(jobAllocation2.getAssignedto(),role);
			String assignName = "";
			if(user!=null) {
			assignName = user.getUserName() + "" + assignName;
			jobDto.setAssignName(assignName);
			}
		}

		List<Tbl_RecPortal_JobAttachments> downloadinfo = recruitmentDAO
				.MultiplefileDownloadByID(Integer.parseInt(jobid));

		jobDto.setZipfile(downloadinfo);
		return jobDto;

	}

	@ResponseBody
	@RequestMapping(value = "/getJobAllocationByJobID", method = RequestMethod.GET)
	public List<UserDTO> getJobAllocationByJobID(HttpServletRequest req) throws HandlingException {

		String jobid = req.getParameter("jobId");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");
		
		List<UserDTO> userlist = new ArrayList<>();

		List<JobAllocation> jobAllocation = recruitmentDAO.findJobAllocationById(jobid, loginEmpNumber);
		for (JobAllocation jobAllocation2 : jobAllocation) {

			UserDTO user = recruitmentDAO.getUserNameByEmpNo(jobAllocation2.getAssignedto(),role);
if(user!=null) {
			userlist.add(user);
		}
		}
		return userlist;

	}

	/**
	 * To get all profiles matched to particular job requirement who are selected
	 * for that requirement.
	 * 
	 * @param model
	 * @param req
	 * @return list of profiles
	 * @throws HandlingException
	 */
	@RequestMapping(value = "/view_Profiles_JD", method = RequestMethod.GET)
	public String getProfilesByJobID(Model model, HttpServletRequest req) throws HandlingException {

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
				jobCode = recruitmentDAO.getJobCodeById(jobId);
			}

			String client = recruitmentDAO.getCompanyIdByJobId(jobId);
			String bdName = recruitmentDAO.getNameByjobId(jobId);

			List<CandidateInfoDTO> candidateList = null;
			List<CandidateDTO> candidateinfolist = new ArrayList<CandidateDTO>();
			Integer candSourceby = null;
			String recusername = null;
			if (role.equalsIgnoreCase("SCT")) {
				List<CandidateInfoDTONew> candidateList1 = recruitmentDAO.getCandidateListSCT(jobId);

				model.addAttribute("candidateinfolist", candidateList1);
				ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
			} else {
				logger.info("else not sct--------@@@@@@@@@@@--------");
				List<Integer> allocationList = recruitmentDAO.getAssignToByJobID(jobId, loginEmpNumber, role);

				if (allocationList.size() != 0) {
					for (Integer assignto : allocationList) {

						String jobType = recruitmentDAO.getJobTypeByJobId(jobId);
						candidateList = recruitmentDAO.getCandidateList(role, assignto, jobId, jobType, loginEmpNumber);
						for (CandidateInfoDTO candidateInfoDTO : candidateList) {
							CandidateDTO candidateDtoObj = new CandidateDTO();
							CandidateStatus candiStatusOBJ = recruitmentDAO.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobId);
							InterviewDetails interview = recruitmentDAO.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
							CandidateStatusDTO statusObj = recruitmentDAO.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(), loginEmpNumber, role, jobId);

							candSourceby = candidateInfoDTO.getRecEmpNo();
							UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");
							if(user!=null) {
							recusername = user.getUserName();
							candidateDtoObj.setEmpl_lead(user.getEmp_lead());
							}
							CandidateInformation candidateInfo = recruitmentDAO.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
							String sctSubmittedDate = recruitmentDAO.getSCTSubmittedDate(jobId, candSourceby,candidateInfo.getCandidateid());

							candidateDtoObj.setCandidateInfo(candidateInfo);
							candidateDtoObj.setCandidateStatus(statusObj);
							candidateDtoObj.setSourcedBy(candidateInfoDTO.getRecEmpNo());
							
							candidateDtoObj.setInterevieDetails(interview);
							candidateDtoObj.setUserName(recusername);
							candidateDtoObj.setCandidateStatusObj(candiStatusOBJ);
							candidateDtoObj.setSctSubmissionDate(sctSubmittedDate);
							Tbl_RecPortal_tecpanelFeedBack clientsavailable = recruitmentDAO.getInterviewByJobId(jobId);
							if(clientsavailable!=null) {
							candidateDtoObj.setClientAvaiableFromTime(clientsavailable.getClavalabletime());
							candidateDtoObj.setClientAvaiableToTime(clientsavailable.getClavailabletimeto());
							}
							candidateinfolist.add(candidateDtoObj);

							model.addAttribute("candidateinfolist", candidateinfolist);

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

			if (role.equals("BDM")) {
				return "viewProfileBDM";
			} else if (role.equals("SCT")) {
				return "viewSourcedProfilesSct";
			}
			if (role.equals("RECRUITER")) {
				return "redirect:/displaySourcedProfiles?jobId=" + jobId + "";
			}
			return "viewSourcedProfilesManager";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	/**
	 * To display list of requirements assigned to each login user.
	 * 
	 * @param model
	 * @param req
	 * @return list of requirements assigned to user
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/view_Jobdescription" }, method = RequestMethod.GET)
	public String displayJobDescription(Model model, HttpServletRequest req) throws HandlingException {

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
			List<CompanyDescription> clients = null;
			clients = recruitmentDAO.getAllClients();

			List<RecruitmentportalLogin> bdList = recruitmentDAO.getBdNames();

			if (role.equalsIgnoreCase("SCT")) {

				List<DisplayRequirementsDTO> jdList = recruitmentDAO.allJobDescription(bdempno, clienid);
				model.addAttribute("jobdescList", jdList);
			} else if (role.equalsIgnoreCase("DELIVERYTEAM")) {

				List<DisplayRequirementsDTO> jdList = recruitmentDAO.allJobDescription(bdempno, clienid);
				model.addAttribute("jobdescList", jdList);

			} else if (role.equalsIgnoreCase("TEAMLEAD")) {
				List<DisplayRequirementsDTO> jdIDList = recruitmentDAO.getTLAllJobDesc(loginEmpNumber, bdempno,
						clienid);
				ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
				model.addAttribute("jobdescList", jdIDList);
			} else {
				List<DisplayRequirementsDTO> jdIDList = recruitmentDAO.getRecAllJobDesc(loginEmpNumber, bdempno,
						clienid);
				ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
				model.addAttribute("jobdescList", jdIDList);
			}

			model.addAttribute("departmentId", departmentId);
			model.addAttribute("role", role);
			model.addAttribute("ntcprdlist", ntcprdlist);
			model.addAttribute("clients", clients);
			model.addAttribute("bdList", bdList);

			if (role.equals("RECRUITER")) {
				return "viewJD_recruiter";
			} else if (role.equals("SCT")) {
				return "viewJD_SCT";
			} else if (role.equals("DELIVERYTEAM")) {
				List<RecruitmentportalLogin> managerList = recruitmentDAO.getManagers();
				model.addAttribute("managerList", managerList);
				return "viewJD_Delivery";
			}

			else if (role.equals("HRUSER") || role.equals("HRMANAGER") || role.equals("NEGOTIATOR")) {
				return "redirect:/candidatelist";

			} else {
				return "viewJD_user";
			}
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/getSearchView" }, method = RequestMethod.GET)
	public String SearchByClient_BDM(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		List<CompanyNoticePeriod> ntcprdlist = null;
		if (userName != null) {
			String bdnames = req.getParameter("bdname");
			String clientname = req.getParameter("clientname");
			Integer clientId = null;
			Integer bdEmpNo = null;

			if (!bdnames.isEmpty()) {
				bdEmpNo = Integer.parseInt(bdnames);
			}
			if (!clientname.isEmpty()) {
				clientId = Integer.parseInt(clientname);
			}

			if (role.equalsIgnoreCase("SCT") || role.equals("DELIVERYTEAM")) {

				List<DisplayRequirementsDTO> jdList = recruitmentDAO.allJobDescription(bdEmpNo, clientId);
				model.addAttribute("jobdescList", jdList);
			}

			else if (role.equalsIgnoreCase("TEAMLEAD")) {
				List<DisplayRequirementsDTO> jdIDList = recruitmentDAO.getTLAllJobDesc(loginEmpNumber, bdEmpNo,
						clientId);
				model.addAttribute("jobdescList", jdIDList);
			} else {
				List<DisplayRequirementsDTO> jdIDList = recruitmentDAO.getRecAllJobDesc(loginEmpNumber, bdEmpNo,
						clientId);
				ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
				model.addAttribute("jobdescList", jdIDList);
			}

			List<CompanyDescription> clients = null;
			clients = recruitmentDAO.getAllClients();

			List<RecruitmentportalLogin> bdList = recruitmentDAO.getBdNames();

			model.addAttribute("bdnames", bdnames);
			model.addAttribute("clientname", clientname);

			model.addAttribute("clients", clients);
			model.addAttribute("bdList", bdList);

			if (role.equals("RECRUITER")) {
				return "viewJD_recruiter";
			} else if (role.equals("SCT")) {
				return "viewJD_SCT";
			} else if (role.equals("DELIVERYTEAM")) {
				List<RecruitmentportalLogin> managerList = recruitmentDAO.getManagers();
				model.addAttribute("managerList", managerList);
				return "viewJD_Delivery";
			}

			else {
				return "viewJD_user";
			}
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	/**
	 * Getting list of users to users under lead to assign requirement
	 * 
	 * @param model
	 * @param req
	 * @return User list by job id
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/getUserListByJobID" }, method = RequestMethod.GET)
	@ResponseBody
	public List<UserDTO> getUsersByRoleAndEmpNo(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		Integer empNumber = (Integer) session.getAttribute("empNumber");
		String role = (String) session.getAttribute("role");
		Long count = recruitmentDAO.getJobAssignedOrNot(jobid, empNumber, role);
		List<UserDTO> userList = null;
		if (count == 0) {

			userList = recruitmentDAO.getUsersByEmpNo(empNumber, role);
			return userList;
		}
		return null;

	}

	@RequestMapping(value = { "/editUserListByJobID" }, method = RequestMethod.GET)
	@ResponseBody
	public List<UserDTO> editUsersByRoleAndEmpNo(HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		Integer empNumber = (Integer) session.getAttribute("empNumber");
		String role = (String) session.getAttribute("role");
		Long count = recruitmentDAO.getJobAssignedOrNot(jobid, empNumber, role);
		List<UserDTO> userList = null;
		if (count != 0) {
			userList = recruitmentDAO.getUsersByEmpNo(empNumber, role);
			return userList;
		}
		return null;

	}

	/**
	 * Assign requirement to user
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/assignJdToRecruiter" }, method = RequestMethod.POST)
	public String saveAssignedUser(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		String role = (String) session.getAttribute("role");
		String userName = (String) session.getAttribute("username");
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String fromMail =null;
		if (userName != null) {
			UserDTO userDetails = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,"TEAMLEAD");
			if(userDetails!=null) {
			 fromMail = userDetails.getEmail();}
			String[] recruiterArr = req.getParameterValues("assignTo");
			Integer jobid = Integer.parseInt(req.getParameter("jobid"));
			String jobCode = req.getParameter("assjobCode");
			Integer deptid = Integer.parseInt(req.getParameter("deptid"));
			Date assignDate = new Date();
			Date unassigneddate = null;
			JobAllocation jobAllocation = new JobAllocation();
			Jobdescription jobdesc = new Jobdescription();
			jobAllocation.setAssignedby(loginEmpNumber);
			jobdesc.setJobdescid(jobid);
			jobAllocation.setJobDesc(jobdesc);
			jobAllocation.setAssigneddate(assignDate);
			jobAllocation.setDepartmentid(deptid);

			JobAllocationRecruiter recAllocation = new JobAllocationRecruiter();
			recAllocation.setJobdescid(jobid);
			recAllocation.setDepartmentid(deptid);
			recAllocation.setTlempno(loginEmpNumber);

			String cmpnyName = req.getParameter("cmpnyname");
			UserDTO userDatas = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
			if (recruiterArr.length != 0) {
				for (int i = 0; i < recruiterArr.length; i++) {
					Integer assigneeEmp = Integer.parseInt(recruiterArr[i]);
					JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, assigneeEmp,loginEmpNumber);
					JobAllocationRecruiter checkAllotedTORec = recruitmentDAO.checkAssignedToRecOrNot(jobid,assigneeEmp, loginEmpNumber);
					if (allotedOrNot != null) {
						if (allotedOrNot.getEmpstatus().equalsIgnoreCase("InActive")) {
							allotedOrNot.setEmpstatus("Active");
							allotedOrNot.setReassigneddate(new Date());
							recruitmentDAO.updateUnAssign(allotedOrNot);
							UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"RECRUITER");
							String toEmail =null;
							if(userData!=null) {
							 toEmail = userData.getEmail();
							}
							String subject = jobCode;
							String ccMail = "requirements@tekskills.in";
							// String message = jobdesc+" was unassigned to you ,please check in portal..";
							String status = "Assigned";
							try {
								newEmail.sendMailBD_RecUser(fromMail, toEmail, subject, ccMail, userData.getUserName(),
										null, role, jobCode, cmpnyName, userData.getUserName(), userDatas.getUserName(),
										status);
							} catch (Exception e) {
								logger.error("Exception raised due to:" + e);
							}
						}
					} else {
						jobAllocation.setAssignedto(assigneeEmp);
						jobAllocation.setEmpstatus("Active");
						recruitmentDAO.saveJobAllocation(jobAllocation);
						UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"RECRUITER");
						JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobid);
						if ((jobstatus.getJdStatus() != null)) {
							if (jobstatus.getJdStatus().equalsIgnoreCase("Idle")
									|| jobstatus.getJdStatus().equalsIgnoreCase("Working")) {

							} else {
								jobstatus.setJdStatus("NoSubmission");
								recruitmentDAO.updateJobStatusByJobId(jobstatus);
							}
						}
						String toEmail =null;
						if(userData!=null) {
						 toEmail = userData.getEmail();
						}
						String subject = jobCode;
						String ccMail = "requirements@tekskills.in";
						String status = "Assigned";
						// String message =jobCode+ " assigned to you please check in portal
						// <br><br>Regards,<br><br>"+fromMail+"";
						try {
							newEmail.sendMailBD_RecUser(fromMail, toEmail, subject, ccMail, userData.getUserName(),
									null, role, jobCode, cmpnyName, userData.getUserName(), userDatas.getUserName(),
									status);
						} catch (Exception e) {
							logger.error("Exception raised while sending mail " + e);
						}
					}
					if (checkAllotedTORec != null) {
						if (checkAllotedTORec.getRecstatus().equalsIgnoreCase("InActive")) {
							checkAllotedTORec.setRecstatus("Active");
							checkAllotedTORec.setTlassigneddate(new Date());
							checkAllotedTORec.setUnassigneddate(unassigneddate);
							recruitmentDAO.saveRecAllocation(checkAllotedTORec);

						}
					} else {
						recAllocation.setRecempno(assigneeEmp);
						recAllocation.setRecstatus("Active");
						recAllocation.setTlassigneddate(assignDate);
						recruitmentDAO.saveRecAllocation(recAllocation);

					}
				}
			} else {
			}

			return "redirect:/view_Jobdescription";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	/**
	 * Assign requirement to user
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/assignJdToTl" }, method = RequestMethod.POST)
	public String saveAssignedTl(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String userName = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		/*
		 * String role = (String) req.getSession().getAttribute("role"); String userName
		 * = (String) req.getSession().getAttribute("username"); Integer loginEmpNumber
		 * = (Integer) req.getSession().getAttribute("empNumber");
		 */
String fromMail=null;
		if (userName != null) {
			UserDTO userDetails = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,"BDM");
			if(userDetails!=null) {
			 fromMail = userDetails.getEmail();
			}
			String[] assignTo = req.getParameterValues("assignTo");
			Integer jobid = Integer.parseInt(req.getParameter("jobid"));
			String jobCode = req.getParameter("assjobCode");
			Integer deptid = Integer.parseInt(req.getParameter("deptid"));
			Date assignDate = new Date();
			Date unAssignDate = null;
			JobAllocation jobAllocation = new JobAllocation();

			Jobdescription jobdesc = new Jobdescription();
			jobAllocation.setAssignedby(loginEmpNumber);
			jobdesc.setJobdescid(jobid);
			jobAllocation.setJobDesc(jobdesc);
			jobAllocation.setAssigneddate(assignDate);
			jobAllocation.setDepartmentid(deptid);
			JobAllocationTL tlAllocation = new JobAllocationTL();
			tlAllocation.setBdassigneddate(assignDate);
			tlAllocation.setBdempno(loginEmpNumber);
			tlAllocation.setDepartmentid(deptid);
			tlAllocation.setJobdescid(jobid);
			tlAllocation.setUnassigneddate(unAssignDate);
			String cmpnyName = req.getParameter("cmpnyname");
			UserDTO loginUserData = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,"BDM");
			String userVal=null;
			if(loginUserData!=null) {
				userVal=loginUserData.getUserName();
			}
			
			if (assignTo.length != 0) {
				for (int i = 0; i < assignTo.length; i++) {
					Integer assigneeEmp = Integer.parseInt(assignTo[i]);
					JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, assigneeEmp,
							loginEmpNumber);
					JobAllocationTL checkAllotedTOTL = recruitmentDAO.checkAssignedToTLOrNot(jobid, assigneeEmp,
							loginEmpNumber);
					if (allotedOrNot != null) {
						if (allotedOrNot.getEmpstatus().equalsIgnoreCase("InActive")) {
							allotedOrNot.setEmpstatus("Active");
							allotedOrNot.setReassigneddate(new Date());
							recruitmentDAO.updateUnAssign(allotedOrNot);
							UserDTO assignedUserData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"TEAMLEAD");
							String toEmail = null;
if(assignedUserData!=null) {
	toEmail=assignedUserData.getEmail();
}
							
							String subject = jobCode;
							String ccMail = "requirements@tekskills.in";
							String status = "NA";
							try {
								newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
										assignedUserData.getUserName(), null, role, jobCode, cmpnyName,
										assignedUserData.getUserName(), userVal, status);
							} catch (Exception e) {
								logger.error("Exception raised due to:" + e);
							}
						}
					} else {
						jobAllocation.setAssignedto(assigneeEmp);
						jobAllocation.setEmpstatus("Active");
						recruitmentDAO.saveJobAllocation(jobAllocation);
						UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"TEAMLEAD");
						JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobid);
						if ((jobstatus.getJdStatus() != null)) {
							if (jobstatus.getJdStatus().equalsIgnoreCase("Idle")
									|| jobstatus.getJdStatus().equalsIgnoreCase("Working")) {

							} else {
								jobstatus.setJdStatus("NoSubmission");
								recruitmentDAO.updateJobStatusByJobId(jobstatus);
							}
						}
						String toEmail = null;
if(userData!=null) {
	 toEmail = userData.getEmail();
}
						
						String subject = jobCode;
						String ccMail = "requirements@tekskills.in";
						String status = "NA";
						try {
							newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
									userData.getUserName(), null, role, jobCode, cmpnyName, userData.getUserName(),
									loginUserData.getUserName(), status);
						} catch (Exception e) {
							logger.error("Exception raised while sending mail " + e);
						}
					}
					if (checkAllotedTOTL != null) {
						if (checkAllotedTOTL.getTlstatus().equalsIgnoreCase("InActive")) {
							checkAllotedTOTL.setTlstatus("Active");
							checkAllotedTOTL.setBdassigneddate(new Date());
							recruitmentDAO.saveTLAllocation(checkAllotedTOTL);

						}
					} else {
						tlAllocation.setTlempno(assigneeEmp);
						tlAllocation.setTlstatus("Active");
						recruitmentDAO.saveTLAllocation(tlAllocation);
					}
				}
			} else {
			}

			return "redirect:/view_Jobdescription";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	/**
	 * Updating/Edit users assigned to that requirement.
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 */
		@RequestMapping(value = { "/editAssignedJdToRecruiter" }, method = RequestMethod.POST)
	public String EditAssignedUser(Model model, HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String user = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		if (user != null) {
			UserDTO userDetails = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,"TEAMLEAD");
			String tlname =null;
			if(userDetails!=null) {
			 tlname = userDetails.getUserName();
			}
			String[] recruiterArr = req.getParameterValues("assignToedit");
			String unAssignEdit = req.getParameter("unAssignEmp");
			String jobCode = req.getParameter("jobCodeEdit");
			Integer jobid = Integer.parseInt(req.getParameter("jobIdEdit"));
			Integer deptid = Integer.parseInt(req.getParameter("deptIdEdit"));
			Date assignDate = new Date();
			String cmpnynameEdit = req.getParameter("cmpnynameEdit");

			JobAllocation jobAllocation = new JobAllocation();
			Jobdescription jobdesc = new Jobdescription();
			jobAllocation.setAssignedby(loginEmpNumber);
			jobdesc.setJobdescid(jobid);
			jobAllocation.setJobDesc(jobdesc);
			jobAllocation.setAssigneddate(assignDate);
			jobAllocation.setDepartmentid(deptid);

			JobAllocationRecruiter recAllocation = new JobAllocationRecruiter();
			recAllocation.setJobdescid(jobid);
			recAllocation.setDepartmentid(deptid);
			recAllocation.setTlempno(loginEmpNumber);

			if (recruiterArr != null) {

				for (int i = 0; i < recruiterArr.length; i++) {
					Integer assigneeEmp = Integer.parseInt(recruiterArr[i]);
					String status = "Assigned";
					JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, assigneeEmp,
							loginEmpNumber);
					JobAllocationRecruiter checkAllotedTORec = recruitmentDAO.checkAssignedToRecOrNot(jobid,
							assigneeEmp, loginEmpNumber);
					if (allotedOrNot != null) {
						if (allotedOrNot.getEmpstatus().equalsIgnoreCase("InActive")) {
							allotedOrNot.setEmpstatus("Active");
							allotedOrNot.setReassigneddate(new Date());
							recruitmentDAO.updateUnAssign(allotedOrNot);
							UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"RECRUITER");
							String assignToName =null;
							String toEmail =null;
							if(userData!=null) {
							 assignToName = userData.getUserName();
							  toEmail = userData.getEmail();
							}
							
							String subject = jobCode;
							String ccMail = "requirements@tekskills.in";
							// String message = jobdesc+" was unassigned to you ,please check in portal..";

							try {
								newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
										assignToName, null, role, jobCode, cmpnynameEdit, assignToName, tlname, status);

							} catch (Exception e) {
								logger.error("Exception raised due to:" + e);
							}
						}
					} else {
						jobAllocation.setEmpstatus("Active");
						jobAllocation.setAssignedto(assigneeEmp);
						recruitmentDAO.saveJobAllocation(jobAllocation);
						UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"RECRUITER");
						
						String toEmail =null;
						if(userData!=null) {
						 toEmail = userData.getEmail();
						 String assignToName = userData.getUserName();
						
						
						String subject = jobCode;
						String ccMail = "requirements@tekskills.in";
						try {
							newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail, assignToName,
									null, role, jobCode, cmpnynameEdit, assignToName, tlname, status);
						} catch (Exception e) {
							logger.error("Exception raised due to:" + e);
						}
						}

					}
					if (checkAllotedTORec != null) {
						if (checkAllotedTORec.getRecstatus().equalsIgnoreCase("InActive")) {
							checkAllotedTORec.setRecstatus("Active");
							checkAllotedTORec.setReassigneddate(assignDate);
							recruitmentDAO.recUnAssign(checkAllotedTORec);
						}

					} else {
						recAllocation.setRecempno(assigneeEmp);
						recAllocation.setRecstatus("Active");
						recAllocation.setTlassigneddate(assignDate);
						recruitmentDAO.saveRecAllocation(recAllocation);

					}
				}
			}

			if (unAssignEdit != null) {
				String[] unEmpArr = unAssignEdit.split(",");
				for (int i = 0; i < unEmpArr.length; i++) {
					if (unEmpArr[i].equals("")) {
					} else {
						Integer unAssigneeEmp = Integer.parseInt(unEmpArr[i]);
						JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, unAssigneeEmp,
								loginEmpNumber);
						JobAllocationRecruiter checkAllotedTORec = recruitmentDAO.checkAssignedToRecOrNot(jobid,
								unAssigneeEmp, loginEmpNumber);
						if (allotedOrNot != null) {
							if (allotedOrNot.getEmpstatus().equalsIgnoreCase("Active")) {
								allotedOrNot.setEmpstatus("InActive");
								allotedOrNot.setUnassigneddate(new Date());
								recruitmentDAO.updateUnAssign(allotedOrNot);
								UserDTO userData = recruitmentDAO.getUserNameByEmpNo(unAssigneeEmp,"RECRUITER");
								String assignToName =null;
								if(userData!=null) {
								 assignToName = userData.getUserName();
								}
								String toEmail = userData.getEmail();
								String subject = jobCode;
								String ccMail = "requirements@tekskills.in";
								String status = "Unassigned";
								try {
									newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
											assignToName, null, role, jobCode, cmpnynameEdit, assignToName, tlname,
											status);
								} catch (Exception e) {
									logger.error("Exception raised due to:" + e);
								}
							} else {

							}
							if (checkAllotedTORec != null) {
								if (checkAllotedTORec.getRecstatus().equalsIgnoreCase("Active")) {
									checkAllotedTORec.setRecstatus("InActive");
									checkAllotedTORec.setUnassigneddate(new Date());
									recruitmentDAO.recUnAssign(checkAllotedTORec);

								} else {

								}
							}
						}
					}
				}
			}
			return "redirect:/view_Jobdescription";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	/**
	 * Updating/Edit users assigned to that requirement.
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/editAssignedJdToTL" }, method = RequestMethod.POST)
	public String EditAssignedTL(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String user = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");

		if (user != null) {
			UserDTO userDetails = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,"BDM");
			
			
			String[] assignEdit = req.getParameterValues("assignToedit");
			String unAssignEdit = req.getParameter("unAssignEmp");
			String jobCode = req.getParameter("jobCodeEdit");
			Integer jobid = Integer.parseInt(req.getParameter("jobIdEdit"));
			Integer deptid = Integer.parseInt(req.getParameter("deptIdEdit"));
			Date assignDate = new Date();
			Date unAssignDate = null;
			String cmpnynameEdit = req.getParameter("cmpnynameEdit");
			JobAllocation jobAllocation = new JobAllocation();
			Jobdescription jobdesc = new Jobdescription();
			jobAllocation.setAssignedby(loginEmpNumber);
			jobdesc.setJobdescid(jobid);
			jobAllocation.setJobDesc(jobdesc);
			jobAllocation.setAssigneddate(assignDate);
			jobAllocation.setDepartmentid(deptid);
			JobAllocationTL tlAllocation = new JobAllocationTL();
			tlAllocation.setBdempno(loginEmpNumber);
			tlAllocation.setDepartmentid(deptid);
			tlAllocation.setJobdescid(jobid);

			if (assignEdit != null) {

				for (int i = 0; i < assignEdit.length; i++) {
					Integer assigneeEmp = Integer.parseInt(assignEdit[i]);
					String status = "Assigned";
					JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, assigneeEmp,
							loginEmpNumber);
					JobAllocationTL checkAllotedTOTL = recruitmentDAO.checkAssignedToTLOrNot(jobid, assigneeEmp,
							loginEmpNumber);
					if (allotedOrNot != null) {
						if (allotedOrNot.getEmpstatus().equalsIgnoreCase("InActive")) {
							allotedOrNot.setEmpstatus("Active");
							allotedOrNot.setReassigneddate(new Date());
							recruitmentDAO.updateUnAssign(allotedOrNot);
							UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"TEAMLEAD");
							String assignToName =null;
							String toEmail =null;
							if(userData!=null) {
							 assignToName = userData.getUserName();
							 toEmail = userData.getEmail();
							}
							String subject = jobCode;
							String ccMail = "requirements@tekskills.in";
							// String message = jobdesc+" was unassigned to you ,please check in portal..";

							try {
								newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
										assignToName, null, role, jobCode, cmpnynameEdit, assignToName, assignToName, status);
								// newEmail.sendMail(userDetails.getEmail(),toEmail,
								// subject,message.toString(),ccMail,userData.getUserName(),null,role);
							} catch (Exception e) {
								logger.error("Exception raised due to:" + e);
							}
						}
					} else {

						jobAllocation.setEmpstatus("Active");
						jobAllocation.setAssignedto(assigneeEmp);
						recruitmentDAO.saveJobAllocation(jobAllocation);
						UserDTO userData = recruitmentDAO.getUserNameByEmpNo(assigneeEmp,"TEAMLEAD");
						if(userData!=null)
						{
							String toEmail = userData.getEmail();
						
						String assignToName = userData.getUserName();
						String subject = jobCode;
						String ccMail = "requirements@tekskills.in";
						try {
							newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail, assignToName,
									null, role, jobCode, cmpnynameEdit, assignToName, assignToName, status);
						} catch (Exception e) {
							logger.error("Exception raised due to:" + e);
						}
						}
					}

					if (checkAllotedTOTL != null) {
						if (checkAllotedTOTL.getTlstatus().equalsIgnoreCase("InActive")) {
							checkAllotedTOTL.setTlstatus("Active");
							
							checkAllotedTOTL.setReassigneddate(assignDate);
							recruitmentDAO.tlUnAssign(checkAllotedTOTL);
						}
					} else {
						tlAllocation.setTlstatus("Active");
						tlAllocation.setTlempno(assigneeEmp);
						tlAllocation.setBdassigneddate(new Date());
						tlAllocation.setUnassigneddate(unAssignDate);
						recruitmentDAO.saveTLAllocation(tlAllocation);
					}
				}
			}
			if (unAssignEdit != null) {
				String[] unEmpArr = unAssignEdit.split(",");
				for (int i = 0; i < unEmpArr.length; i++) {
					if (unEmpArr[i].equals("")) {
					} else {
						Integer unAssigneeEmp = Integer.parseInt(unEmpArr[i]);
						JobAllocation allotedOrNot = recruitmentDAO.checkAssignedToUserOrNot(jobid, unAssigneeEmp,
								loginEmpNumber);
						JobAllocationTL checkAllotedTOTL = recruitmentDAO.checkAssignedToTLOrNot(jobid, unAssigneeEmp,
								loginEmpNumber);
						if (allotedOrNot != null) {
							if (allotedOrNot.getEmpstatus().equalsIgnoreCase("Active")) {
								allotedOrNot.setEmpstatus("InActive");
								allotedOrNot.setUnassigneddate(new Date());
								recruitmentDAO.updateUnAssign(allotedOrNot);
								UserDTO userData = recruitmentDAO.getUserNameByEmpNo(unAssigneeEmp,"TEAMLEAD");
								if(userData!=null) {
								String assignToName = userData.getUserName();
								String toEmail = userData.getEmail();
								String subject = jobCode;
								String ccMail = "requirements@tekskills.in";
								// String message = jobdesc+" was unassigned to you ,please check in portal..";
								String status = "UnAssigned";
								try {
									newEmail.sendMailBD_RecUser(userDetails.getEmail(), toEmail, subject, ccMail,
											assignToName, null, role, jobCode, cmpnynameEdit, assignToName, assignToName,
											status);
								} catch (Exception e) {
									logger.error("Exception raised due to:" + e);
								}
								}
							} else {

							}
						}
						if (checkAllotedTOTL != null) {
							if (checkAllotedTOTL.getTlstatus().equalsIgnoreCase("Active")) {
								// checkAllotedTOTL.setTlstatus("InActive");
								checkAllotedTOTL.setUnassigneddate(new Date());
								recruitmentDAO.tlUnAssign(checkAllotedTOTL);

							} else {

							}
						}
					}
				}
			}
			if (role.equalsIgnoreCase("BDM")) {
				return "redirect:/displayRequirements";
			} else {
				return "redirect:/view_Jobdescription";
			}
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	/**
	 * To get the list of users who assigned to requirement based on job id
	 * 
	 * @param model
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/getAssignedUserByJobID" }, method = RequestMethod.GET)
	@ResponseBody
	public List<tlhelper> getAssignedUserByJobID(Model model, HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		Integer empNumber = (Integer) session.getAttribute("empNumber");

		List<tlhelper> tpInvolve = new ArrayList<>();
		String role = (String) req.getSession().getAttribute("role");
		String newRole=null;
		if(role.equalsIgnoreCase("BDM")) {
			newRole="TEAMLEAD";
		}else if(role.equalsIgnoreCase("TEAMLEAD")) {
			newRole="RECRUITER";
	}
	List<JobAllocation> joballocationList = recruitmentDAO.getAllocationListByJobID(jobid, empNumber, role);
		logger.info("empNumber----"+empNumber+"----role--"+role+"---new--"+newRole);
		for (JobAllocation job : joballocationList) {
			if (job.getEmpstatus().equalsIgnoreCase("Active")) {
				UserDTO user = recruitmentDAO.getUserNameByEmpNo(job.getAssignedto(),newRole);
				logger.info(user.getUserName());
				if(user!=null) {
				tlhelper tldto = new tlhelper();
				tldto.setUser(user);
				tpInvolve.add(tldto);
			}
			}
		}
		return tpInvolve;

	}

	/**
	 * To get the Percentage details of candidate
	 * 
	 * @param req
	 * @return DTO of percentage
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/getCandidatePercentage" }, method = RequestMethod.GET)
	@ResponseBody
	public CandidatePercentDTO getCandidatePercentageByCandidateID(HttpServletRequest req) throws HandlingException {
		CandidatePercentDTO candiPercOBJ = null;
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));

		candiPercOBJ = recruitmentDAO.getPercentageByCandidateID(candidateid);
		return candiPercOBJ;

	}

	/**
	 * To get the Interview status of candidate at various levels.
	 * 
	 * @param req
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/getCandidateStatusByCandidateID" }, method = RequestMethod.GET)
	@ResponseBody
	public CandidateStatus getCandidateStatusByCandidateID(HttpServletRequest req) throws HandlingException {
		CandidateStatus candiStatusOBJ = null;
		// Integer empNumber = (Integer) req.getSession().getAttribute("empNumber");

		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		Integer jobId = Integer.parseInt(req.getParameter("jobId"));
		candiStatusOBJ = recruitmentDAO.getStatusByCandidateID(candidateid, jobId);
		return candiStatusOBJ;

	}

	@RequestMapping(value = { "/update_BdmStatus" }, method = RequestMethod.POST)
	public RedirectView update_BdmStatus(HttpServletRequest req, Model model) throws HandlingException, ParseException {
		HttpSession session = req.getSession(true);
		String role = (String) session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		RedirectView rv = new RedirectView();
		rv.setContextRelative(true);
		if (username != null) {
			UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
			String fromMail=null;
			if(fromUserObj!=null) {
				fromMail=fromUserObj.getEmail();
			}
			String candidateid1 = req.getParameter("candidateid");
			String jobid = req.getParameter("jobid");
			String empLead = req.getParameter("empLead");
			String sourcedBy = req.getParameter("sourcedBy");
			String bdclientname = req.getParameter("bdclientname");
			String bdName = req.getParameter("bdName");
			Integer candidateid = null;
			if (candidateid1 != null) {
				candidateid = Integer.parseInt(candidateid1);
			}
			Integer jobId = null;
			if (jobid != null) {
				jobId = Integer.parseInt(jobid);
			}
			Integer leadEmp = null;
			Integer sourcedByEmp = null;
			if (sourcedBy != null) {
				sourcedByEmp = Integer.parseInt(sourcedBy);
			}
			if (empLead != null) {
				leadEmp = Integer.parseInt(empLead);
			}

			String candidateName = req.getParameter("candidateName");
			String comment = req.getParameter("comment");
			String status = req.getParameter("bdResltStatus");
			String jobCode = recruitmentDAO.getJobCodeById(jobId);
			Date bdSubmitDate = new Date();
			CandidateStatus candidateStatus = recruitmentDAO.getCandidateStatusTableByCandidateId(candidateid, jobId);
			if (candidateStatus != null) {
				candidateStatus.setBdmStatus(status);
				candidateStatus.setBdmComment(comment);
				candidateStatus.setBdmSubmitDate(bdSubmitDate);
				candidateStatus.setBdmEmpNo(loginEmpNumber);

				recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);

			}
			if (status.equalsIgnoreCase("To Client")) {
				JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobId);
				if (jobstatus.getJdStatus() != null && jobstatus.getJdStatus().equalsIgnoreCase("Idle")) {
					jobstatus.setJdStatus("Working");
					recruitmentDAO.updateJobStatusByJobId(jobstatus);
				}
			} else {

			}

			// mail functionality
			String ccMail = "requirements@tekskills.in";

			List<String> ccList = new ArrayList<>();
			ccList.add(ccMail);

			UserDTO sourcedbyObj = recruitmentDAO.getUserNameByEmpNo(sourcedByEmp,"RECRUITER");
			String recruitername = null;
			if (sourcedbyObj != null) {
				recruitername = sourcedbyObj.getUserName();
				String recEmail = sourcedbyObj.getEmail();
				ccList.add(recEmail);
			}

			String bduName = recruitmentDAO.getUserNameByBdName(bdName);
			String bdmdetails = recruitmentDAO.getBdEmailByBdName(bduName);
			if (status.equalsIgnoreCase("Selected")) {
				ccList.add(bdmdetails);
			} else {
			}

			UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");
			if (leadObj != null) {
				String leadEmail = leadObj.getEmail();
				
				logger.info("leadObj---leadEmail----"+leadEmail+"----fromMail----"+fromMail);
				String leadName = leadObj.getUserName();
				String subject = jobCode;
				String name = "Team";
				String message = "";

				try {
					newEmail.sendMailRectoTL(fromMail, leadEmail, subject, message, null, name, leadName,
							ccList, role, candidateName, jobCode, recruitername, status, null, null);

				} catch (Exception e) {
					logger.error("Exception raised due to:" + e);
				}
			}

			rv.setUrl("view_Profiles_JD?jobId=" + jobId);

			return rv;

		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			rv.setUrl("loginpage");
			return rv;

		}
	}

	@RequestMapping(value = { "/bdmUpdate_ClientStatus" }, method = RequestMethod.POST)
	public String bdmUpdate_ClientStatus(HttpServletRequest req, Model model) throws HandlingException, ParseException {
		HttpSession session = req.getSession(true);
		String role = (String) session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		if (username != null) {
			
			String candidateid1 = req.getParameter("candidateid");
			String jobid = req.getParameter("jobid");
			String empLead = req.getParameter("cempLead");
			String sourcedBy = req.getParameter("sourcedBy");
			String bdStatus = req.getParameter("bdStatus");

			Integer candidateid = null;
			if (candidateid1 != "") {
				candidateid = Integer.parseInt(candidateid1);
			}
			Integer jobId = null;
			if (jobid != "") {
				jobId = Integer.parseInt(jobid);
			}
			Integer leadEmp = null;
			Integer sourcedByEmp = null;
			if (sourcedBy != null) {
				sourcedByEmp = Integer.parseInt(sourcedBy);
			}
			if (empLead != null) {
				leadEmp = Integer.parseInt(empLead);
			}
			String cclientname = req.getParameter("cclientname");
			String clicomment = req.getParameter("clientcoment");
			String candidateName = req.getParameter("candidateName");
			// String reject_reason = req.getParameter("reject_reason");
			String choosereject_reason = req.getParameter("choosereject_reason");

			String jobCode = recruitmentDAO.getJobCodeById(jobId);
			String clistatus = req.getParameter("cliStatus");
			String obDate = req.getParameter("onBoardDate");

			String ccMail = "requirements@tekskills.in";
			Date clientSubmitDate = new Date();
			CandidateStatus candidateStatus = recruitmentDAO.getCandidateStatusTableByCandidateId(candidateid, jobId);
			List<String> ccList = new ArrayList<>();
			// ccList.add(ccMail);
			String jobtype = recruitmentDAO.getJobTypeByJobId(jobId);
			if (jobtype.equalsIgnoreCase("External")) {
				String sat = env.getProperty("SctMail");
				;
				ccList.add(sat);
			}
			UserDTO sourcedbyObj = recruitmentDAO.getUserNameByEmpNo(sourcedByEmp,"RECRUITER");
			String recruitername = null;
			if (sourcedbyObj != null) {
				recruitername = sourcedbyObj.getUserName();
				String recEmail = sourcedbyObj.getEmail();
				ccList.add(recEmail);
			}
			String bdName = req.getParameter("bdName");
			String bduName = recruitmentDAO.getUserNameByBdName(bdName);
			String bdmdetails = recruitmentDAO.getBdEmailByBdName(bduName);
			// if(status.equalsIgnoreCase("Selected")){
			ccList.add(bdmdetails);

			/*
			 * } else{ }
			 */

			// if (status.equalsIgnoreCase("To Client")) {
			JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobId);
			if (jobstatus.getJdStatus() != null && jobstatus.getJdStatus().equalsIgnoreCase("Idle")) {
				jobstatus.setJdStatus("Working");
				recruitmentDAO.updateJobStatusByJobId(jobstatus);
			}
			/*
			 * } else {
			 * 
			 * }
			 */

			Date onBoardDate = null;
			if (!obDate.isEmpty()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				onBoardDate = sdf.parse(obDate);
				candidateStatus.setRejectReason("");
			} else {
			}

			// candidateStatus.setBdmSubmitDate(recSubmitDate);
			candidateStatus.setClientresponsedate(clientSubmitDate);
			candidateStatus.setBdmEmpNo(loginEmpNumber);
			candidateStatus.setClientStatus(clistatus);
			if (clicomment != "") {
				candidateStatus.setClientComment(clicomment);
			}
			candidateStatus.setOnBoardDate(onBoardDate);
			if (choosereject_reason != "") {
				candidateStatus.setRejectReason(choosereject_reason);
			} else {
				candidateStatus.setRejectReason(choosereject_reason);
			}

			recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);
			UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
			UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");
			String leadEmail = null;
			if (fromUserObj!=null && leadObj != null) {
				leadEmail = leadObj.getEmail();
				String leadName = leadObj.getUserName();
				String subject = jobCode;
				String name = "Team";
				String message = "";
				ccList.add(leadEmail);
				
				logger.info("leadObj---leadEmail----"+leadEmail+"----fromMail----"+fromUserObj.getEmail());
				try {
					
					newEmail.sendMailRectoTL(fromUserObj.getEmail(), ccMail, subject, message, null, name, leadName,
							ccList, role, candidateName, jobCode, recruitername, bdStatus, null, clistatus);

				} catch (Exception e) {
					logger.info("Exception raised due to:" + e);

				}
			}

			return "redirect:/view_Profiles_JD?jobId=" + jobId;

		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	/**
	 * To save the status of candidate at various levels.
	 * 
	 * @param req
	 * @return
	 * @throws HandlingException
	 * @throws ParseException
	 */
	@RequestMapping(value = { "/saveCandidateStatusByCandidateID" }, method = RequestMethod.POST)
	@ResponseBody
	public String saveCandidateStatusByCandidateID(HttpServletRequest req) throws HandlingException, ParseException {
		HttpSession session = req.getSession(true);
		String role = (String) session.getAttribute("role");
		String username = (String) session.getAttribute("username");
		Integer loginEmpNumber = (Integer) session.getAttribute("empNumber");
		String response = null;
		logger.info("saveCandidateStatusByCandidateID---username----"+username+"------loginEmpNumber----"+loginEmpNumber);
		if (username != null) {
			
			Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
			String jobid = req.getParameter("jobid");
			String empLead = req.getParameter("empLead");
			String sourcedBy = req.getParameter("sourcedBy");

			Integer jobId = null;

			if (jobid != null) {
				jobId = Integer.parseInt(jobid);
			}
			Integer leadEmp = null;
			Integer sourcedByEmp = null;
			if (sourcedBy != null) {
				sourcedByEmp = Integer.parseInt(sourcedBy);
			}
			if (empLead != null) {
				leadEmp = Integer.parseInt(empLead);
			}

			/* String comment=""; */
			String clicomment = req.getParameter("clicomment");
			String candidateName = req.getParameter("candidateName");
			String comment = req.getParameter("comment");
			String status = req.getParameter("status");
			String reject_reason = req.getParameter("reject_reason");
			String jobCode = recruitmentDAO.getJobCodeById(jobId);
			String clistatus = req.getParameter("cliStatus");
			String obDate = req.getParameter("onBoardDate");
			String tlrejcomment = req.getParameter("tlrejcomment");
			Date onBoardDate = null;

			//String ccMail = "requirements@tekskills.in";
			Date recSubmitDate = new Date();
			CandidateStatus candidateStatus = recruitmentDAO.getCandidateStatusTableByCandidateId(candidateid, jobId);
			String jobType = recruitmentDAO.getJobTypeByJobId(jobId);
			List<String> ccList = new ArrayList<>();

			//ccList.add(ccMail);

			UserDTO sourcedbyObj = recruitmentDAO.getUserNameByEmpNo(sourcedByEmp,"RECRUITER");
			String recruitername = null;
			if (sourcedbyObj != null) {
				recruitername = sourcedbyObj.getUserName();
				String recEmail = sourcedbyObj.getEmail();
				ccList.add(recEmail);
			}
			String bdmdetails = null;
			String bdName = req.getParameter("bdName");
			logger.info("bdName------"+bdName);
			if(!bdName.isEmpty()) {
			if (bdName.equalsIgnoreCase("Internal BD")) {

				bdmdetails = env.getProperty("interanlBD");
				ccList.add(bdmdetails);
			} else {
				String bduName = recruitmentDAO.getUserNameByBdName(bdName);
				bdmdetails = recruitmentDAO.getBdEmailByBdName(bduName);
				if (status.equalsIgnoreCase("Selected")) {
					ccList.add(bdmdetails);
				} else {

				}
			}}
			else {
				String bduName = recruitmentDAO.getNameByjobId(jobId);
				bdmdetails = recruitmentDAO.getBdEmailByBdName(bduName);
				if (status.equalsIgnoreCase("Selected")) {
					ccList.add(bdmdetails);
				} else {

				}
			}
				
			
			String newRole=null;
			if(role.equalsIgnoreCase("TEAMLEAD")) {
				newRole="TEAMLEAD";
			}else if(role.equalsIgnoreCase("SCT")) {
				newRole="SCT";
			}
			
			String tlName =null;
			UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,newRole);
			if (role.equalsIgnoreCase("TEAMLEAD")) {
				candidateStatus.setTlStatus(status);
				candidateStatus.setTlComment(comment);
				candidateStatus.setTlEmpNo(loginEmpNumber);
				candidateStatus.setTlSubmitDate(recSubmitDate);
				candidateStatus.setTlrejectedcomments(tlrejcomment);

				recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);
				
				
				if(fromUserObj!=null) {
				 tlName = fromUserObj.getUserName();
				if (jobType.equalsIgnoreCase("External")) {
					if (status.equalsIgnoreCase("TL reject") || status.equalsIgnoreCase("On Hold")) {
						String toEmail = sourcedbyObj.getEmail();
						String subject = jobCode;
						String message = "";
						logger.info("leadObj---toEmail----"+toEmail+"----fromMail----"+fromUserObj.getEmail());
						try {
							newEmail.sendMailRectoTL(fromUserObj.getEmail(), toEmail, subject, message, null,
									recruitername, tlName, ccList, role, candidateName, jobCode, recruitername, status,
									null, "NA");
						} catch (Exception e) {
							logger.error("Exception raised due to:" + e);
						}
					} else {

						String toEmail = env.getProperty("SctMail");
						String subject = jobCode;
						String name = "Team";
						String message = "";

						try {
							logger.info("---toEmail----"+toEmail+"----fromMail----"+fromUserObj.getEmail());
							newEmail.sendMailRectoTL(fromUserObj.getEmail(), toEmail, subject, message, null, name,
									tlName, ccList, role, candidateName, jobCode, recruitername, status, null, "NA");

						} catch (Exception e) {
							logger.error("Exception raised due to:" + e);
						}

					}
				}
				 else {
					JobAllocation assignByObj = recruitmentDAO.getAssigneeDataByJobID(jobId, loginEmpNumber);

					if (assignByObj != null) {
						UserDTO toUserObj = recruitmentDAO.getUserNameByEmpNo(assignByObj.getAssignedby(),"RECRUITER");
						if(toUserObj!=null) {
						String toEmail = toUserObj.getEmail();
						String bdname = toUserObj.getUserName();
						String subject = jobCode;
						String message = "";
						logger.info("leadObj---toEmail----"+toEmail+"----fromMail----"+fromUserObj.getEmail());
						try {

							newEmail.sendMailRectoTL(fromUserObj.getEmail(), toEmail, subject, message, null, bdname,
									tlName, ccList, role, candidateName, jobCode, recruitername, status, null, "NA");

						} catch (Exception e) {
							logger.error("Exception raised due to:" + e);
						}
						}
					}

				}
				}

			} else if (role.equalsIgnoreCase("SCT")) {
				candidateStatus.setSctStatus(status);
				candidateStatus.setSctComment(comment);
				candidateStatus.setSctempno(loginEmpNumber);
				candidateStatus.setSctSubmitDate(recSubmitDate);
				Integer createdBy = recruitmentDAO.getCreatedByJobId(jobId);
				UserDTO toUserObj = recruitmentDAO.getUserNameByEmpNo(createdBy,"BDM");
				String bdname =null;
				if(toUserObj!=null) {
				 bdname = toUserObj.getUserName();
				}
				recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);
				UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");
				String leadanme = null;
				if (leadObj != null) {
					String leadEmail = leadObj.getEmail();
					leadanme = leadObj.getUserName();
					ccList.add(leadEmail);
				}
				String ccSct = env.getProperty("SctMail");
				;
				ccList.add(ccSct);
				String toEmail = toUserObj.getEmail();
				String subject = jobCode;
				String message = "";
				if (comment.isEmpty() || comment == "") {
					comment = "NA";
				} else {
					candidateStatus.setSctComment(comment);
				}
				
				try {
					newEmail.sendMailRectoTL(fromUserObj.getEmail(), toEmail, subject, message, null, bdname, leadanme,
							ccList, role, candidateName, jobCode, recruitername, status, comment, "NA");

				} catch (Exception e) {
					logger.error("Exception raised due to:" + e);
				}

			} else if (role.equalsIgnoreCase("BDM")) {
				if (obDate != null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					onBoardDate = sdf.parse(obDate);
				} else {
				}

				candidateStatus.setBdmStatus(status);
				candidateStatus.setBdmComment(comment);
				candidateStatus.setBdmSubmitDate(recSubmitDate);
				candidateStatus.setBdmEmpNo(loginEmpNumber);
				if (status.equalsIgnoreCase("To Client")) {
					JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobId);
					if (jobstatus.getJdStatus() != null && jobstatus.getJdStatus().equalsIgnoreCase("Idle")) {
						jobstatus.setJdStatus("Working");
						recruitmentDAO.updateJobStatusByJobId(jobstatus);
					}
				} else {

				}

				candidateStatus.setClientStatus(clistatus);
				candidateStatus.setClientComment(clicomment);
				candidateStatus.setOnBoardDate(onBoardDate);
				candidateStatus.setRejectReason(reject_reason);
				recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);

				UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");
				if (leadObj != null) {
					String leadEmail = leadObj.getEmail();
					String leadName = leadObj.getUserName();
					String subject = jobCode;
					String name = "Team";
					String message = "";

					try {
						newEmail.sendMailRectoTL(fromUserObj.getEmail(), leadEmail, subject, message, null, name,
								leadName, ccList, role, candidateName, jobCode, recruitername, status, null, clistatus);

					} catch (Exception e) {
						logger.error("Exception raised due to:" + e);
					}
				}
				// }

			}
			/*
			 * if (status == null && clistatus != null) { response = clistatus; } else
			 */ if (status != null && clistatus == null) {
				response = status;
			}
			return response;
		} else {
			return "redirect:/loginpage";
		}

	}

	/**
	 * To save candidate information submitted by recruiter for particular job.
	 * 
	 * @param model
	 * @param req
	 * @param file
	 * @return
	 * @throws ParseException
	 * @throws HandlingException
	 * @throws IOException
	 * 
	 * 
	 * 
	 */

	@RequestMapping(value = { "/storeCandidateInfo" }, method = RequestMethod.POST)
	public String saveCandidateInformation(Model model, HttpServletRequest req, HttpServletResponse res,
			@RequestParam("file") CommonsMultipartFile file) throws ParseException, HandlingException, IOException {
		HttpSession session = req.getSession(true);
		String username = (String) session.getAttribute("username");
		String role = (String) session.getAttribute("role");
		if (username != null) {
			Integer jobDescId = Integer.parseInt(req.getParameter("jobDescId"));
			String clientName_Req = req.getParameter("clientName_Req");
			String jobCode = req.getParameter("jobCode");
			Integer recEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

			/*
			 * Candidate Information
			 */
			String hbstartdate = req.getParameter("h1bstart");

			String hbenddate = req.getParameter("h1bend");
			String phnNumber = req.getParameter("phnNumber");
			String relevant_exp = req.getParameter("revalentExp");
			String expctc = req.getParameter("expectedctc");
			String total_exp = req.getParameter("totalExp");
			String curctc = req.getParameter("currentctc");
			String notice_period = req.getParameter("noticePeriod");
			String fname = req.getParameter("txtFirstName");
			String mname = req.getParameter("txtMiddleName");
			String lname = req.getParameter("txtLastName");
			String email = req.getParameter("email");
			String pan_num = req.getParameter("panID");
			String basic_qul = req.getParameter("basic_qual");
			String curr_org = req.getParameter("currentOrg");
			String candidatedesg = req.getParameter("candidatedesg");
			String DOB = req.getParameter("dob");
			String high_qual = req.getParameter("highest_qual");
			String priSkill = req.getParameter("priSkill");
			String secSkill = req.getParameter("secSkill");
			String altNumber = req.getParameter("altNumber");
			String location = req.getParameter("location");
			String sscPerc = req.getParameter("sscPerc");
			String plus2Perc = req.getParameter("plus2Perc");
			String ugPerc = req.getParameter("ugPerc");
			String pgPerc = req.getParameter("pgPerc");
			String min_timereq_join = req.getParameter("min_timereq_join");
			String skypeid = req.getParameter("skypeid");

			String idProofDetails = req.getParameter("idProofDetails");
			String professional_Refrnces = req.getParameter("professional_Refrnces");
			String comskillsRatig = req.getParameter("comskillsRatig");
			String intrstlevlworkLoc = req.getParameter("intrstlevlworkLoc");

			Double pgpercentage = null, ugpercentage = null, sscprercentage = null, plus2percentage = null;
			if ((!ugPerc.equals("") && (!ugPerc.isEmpty()) && (ugPerc != null))) {
				ugpercentage = Double.parseDouble(ugPerc);
			}
			if ((!pgPerc.equals("") && (!pgPerc.isEmpty()) && (pgPerc != null))) {
				pgpercentage = Double.parseDouble(pgPerc);
			}
			if ((!plus2Perc.equals("") && (!plus2Perc.isEmpty()) && (plus2Perc != null))) {
				plus2percentage = Double.parseDouble(plus2Perc);
			}
			if ((!sscPerc.equals("") && (!sscPerc.isEmpty()) && (sscPerc != null))) {
				sscprercentage = Double.parseDouble(sscPerc);
			}

			/* Candidate Adiditional Details */

			String curcname = "";
			String duration = "";
			String prev_std = "";
			String prev_Rld = "";
			String bankname = "";
			String bLocation = "";
			String spouse_work = "";
			String hav_kids = "";
			String com_name = "";
			String npn_r = "";

			String candNlocation = req.getParameter("txtNlocation");
			String priSkillRating = req.getParameter("priSkillRating");
			String secSkillRating = req.getParameter("secSkillRating");
			String commSkillRating = req.getParameter("commSkillRating");
			String doj_cur_org = req.getParameter("doj");
			String RptMgrname = req.getParameter("txtRMgrname");
			String Rptoffemail = req.getParameter("offemail");
			String tek_payroll = req.getParameter("work_on_tek_payroll");
			String isPerm = req.getParameter("curr_work_isPerm");
			if (isPerm.equalsIgnoreCase("YES")) {
				curcname = req.getParameter("curcompname");
				duration = req.getParameter("duration");
			}

			String prvcname = req.getParameter("prvcname");
			if (prvcname.equalsIgnoreCase("YES")) {
				prev_std = req.getParameter("std");
				prev_Rld = req.getParameter("Rld");
			}

			String ltbnkstmt = req.getParameter("ltbnkstmt");
			if (ltbnkstmt.equalsIgnoreCase("YES")) {
				bankname = req.getParameter("bankname");
				bLocation = req.getParameter("bLocation");
			}
			String hav_all_doc = req.getParameter("hav_all_doc");
			String reason_reloc = req.getParameter("reason_reloc");
			String reason_job_change = req.getParameter("reason_job_change");
			String any_intervw = req.getParameter("any_intervw");
			if (any_intervw.equalsIgnoreCase("YES")) {
				com_name = req.getParameter("com_name");

			}
			String any_offer = req.getParameter("any_offer");
			String fmbcground = req.getParameter("fmbcground");
			if (fmbcground.equalsIgnoreCase("YES")) {
				spouse_work = req.getParameter("is_spouse_work");
				hav_kids = req.getParameter("is_hav_kids");
			}

			String npn = req.getParameter("npn");

			if (npn.equalsIgnoreCase("YES")) {
				npn_r = req.getParameter("npn_reason");

			}
			String f2f_WE = req.getParameter("f2f_WE");

			if (pan_num == null) {
				pan_num = "N/A";
			}

			String jobcode = recruitmentDAO.getJobCodeById(jobDescId);
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

			Date submitdate = new Date();
			Date dateOfbirth = null;

			Date hb_end = null;
			Date hb_start = null;

			if ((hbenddate != null) && (hbstartdate != null)) {
				try {
					hb_start = sdf.parse(hbstartdate);
					hb_end = sdf.parse(hbenddate);
				} catch (NullPointerException e) {
					logger.error("Exception due to:", e);

				}
			} else {

			}
			Date prev_std1 = null;
			Date prev_rld1 = null;
			Date cur_doj = null;

			try {
				if (!prev_std.isEmpty()) {
					prev_std1 = sdf.parse(prev_std);
				}
				if (!prev_Rld.isEmpty()) {
					prev_rld1 = sdf.parse(prev_Rld);
				}
				if ((!doj_cur_org.isEmpty() || doj_cur_org != null)) {
					cur_doj = sdf.parse(doj_cur_org);
				}

			} catch (NullPointerException e) {
				logger.error("Exception raised due to:" + e);

			}

			if (!DOB.equals("")) {
				try {

					dateOfbirth = sdf.parse(DOB);
				} catch (NullPointerException e) {
					logger.error("Exception raised due to:" + e);
				}

			} else {

			}
			Jobdescription jobdesc = new Jobdescription();
			jobdesc.setJobdescid(jobDescId);
			Integer assignedTl = recruitmentDAO.getAssignedTl(jobDescId, recEmpNumber);
			CandidateInformation candidateInfo = new CandidateInformation();
			CandidateStatus candidatestatus = new CandidateStatus();
			candidatestatus.setRecComment("Profile matched to requirement");
			candidatestatus.setRecEmpNo(recEmpNumber);
			candidatestatus.setRecSubmitDate(submitdate);
			candidatestatus.setAssignedTl(assignedTl);
			candidatestatus.setRecStatus("Selected");
			candidatestatus.setJobdesc(jobdesc);
			candidatestatus.setProfilestatus("Active");
			// String uploadsDir = "/Resumes";

			String workingDir = env.getProperty("Resumes");

			try {
				Integer candidateid = recruitmentDAO.checkCandidateExists(email, phnNumber);
				Integer jid = null;
				if (candidateid != null) {

					jid = recruitmentDAO.getJobIdByCandidateid(candidateid, jobDescId);

					if (jid != null) {
						PrintWriter out = res.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('This Candidate already exists for this Job please source other');");
						out.println("window.location.href='view_Jobdescription'");
						out.println("</script>");
						out.close();

					}

					else {
						candidateInfo.setCnadidateid(candidateid);
						candidatestatus.setCandidate(candidateInfo);
						recruitmentDAO.saveCandidateStatus(candidatestatus);
						CandidateJobs candidateJobs = new CandidateJobs();
						candidateJobs.setJobDesc(jobdesc);
						candidateJobs.setCandidate(candidateInfo);

						InterviewDetails interviewObj = new InterviewDetails();
						interviewObj.setCandidate(candidateInfo);
						interviewObj.setJobDesc(jobdesc);
						interviewObj.setInterviewstatus(null);
						interviewObj.setClientinterview(null);
						recruitmentDAO.saveInterviewDetails(interviewObj);
						JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobDescId);
						if (jobstatus != null) {
							if (jobstatus.getJdStatus().equalsIgnoreCase("Working")) {

							} else {
								jobstatus.setJdStatus("Idle");
								recruitmentDAO.updateJobStatusByJobId(jobstatus);
							}
						}
					}
				} else {

					candidateInfo.setAltcnt_number(altNumber);
					candidateInfo.setBasic_qualification(basic_qul);
					candidateInfo.setBIEplus12(plus2percentage);
					candidateInfo.setCandDesignation(candidatedesg);
					candidateInfo.setContact_number(phnNumber);
					candidateInfo.setCurrent_org(curr_org);
					candidateInfo.setCurrentCTC(curctc);
					candidateInfo.setDob(dateOfbirth);
					candidateInfo.setEmailID(email);
					candidateInfo.setExpectedCTC(expctc);
					candidateInfo.setFirst_name(fname);
					candidateInfo.setGraduation(ugpercentage);
					candidateInfo.setHbend_date(hb_end);
					candidateInfo.setHbstart_date(hb_start);
					candidateInfo.setLast_name(lname);
					candidateInfo.setMiddle_name(mname);
					candidateInfo.setHighest_qualification(high_qual);
					candidateInfo.setNoticeperiod(notice_period);
					candidateInfo.setPancard(pan_num);
					candidateInfo.setPost_Graduation(pgpercentage);
					candidateInfo.setPrimaryskill(priSkill);
					candidateInfo.setRelevantExp(relevant_exp);
					candidateInfo.setTotal_experience(total_exp);
					candidateInfo.setSecskill(secSkill);
					candidateInfo.setSsc(sscprercentage);
					candidateInfo.setSubmit_date(submitdate);
					candidateInfo.setWorkLocation(location);
					candidateInfo.setNoticeprd_negotiable(npn);
					candidateInfo.setDesc_np_negotion(npn_r);
					candidateInfo.setInt_pipeline_com(com_name);
					candidateInfo.setF2f_intervew(f2f_WE);
					candidateInfo.setMin_timereq_join(min_timereq_join);
					candidateInfo.setSkypeid(skypeid);

					candidateInfo.setIdProofDetails(idProofDetails);
					candidateInfo.setProfessional_Refrnces(professional_Refrnces);
					candidateInfo.setComskillsRatig(comskillsRatig);
					candidateInfo.setIntrstlevlworkLoc(intrstlevlworkLoc);

					candidateInfo.setCan_native_loc(candNlocation);
					candidateInfo.setPrim_skill_rate(priSkillRating);
					candidateInfo.setSec_skill_rate(secSkillRating);
					candidateInfo.setComm_skills_rate(commSkillRating);
					candidateInfo.setIntrw_pipeline(any_intervw);
					candidateInfo.setIs_tek_payroll(tek_payroll);
					candidateInfo.setIs_working(isPerm);
					if (isPerm.equalsIgnoreCase("YES")) {
						candidateInfo.setCur_cmpny_name(curcname);
						candidateInfo.setDuration(duration);
					}
					candidateInfo.setBank_stmt(ltbnkstmt);
					if (ltbnkstmt.equalsIgnoreCase("YES")) {
						candidateInfo.setBank_name(bankname);
						candidateInfo.setBank_loc(bLocation);
					}
					candidateInfo.setCmpny_docs(hav_all_doc);
					candidateInfo.setFamily_bckgrund(fmbcground);
					if (fmbcground.equalsIgnoreCase("YES")) {
						candidateInfo.setSpouse_wrk(spouse_work);
						candidateInfo.setKids_info(hav_kids);
					}
					candidateInfo.setResn_reloc(reason_reloc);
					candidateInfo.setJob_change(reason_job_change);
					candidateInfo.setDoj_cur_org(cur_doj);
					candidateInfo.setPrev_start_date(prev_std1);
					candidateInfo.setPrev_relivd_date(prev_rld1);
					candidateInfo.setOffer_inhand(any_offer);
					candidateInfo.setMgr_official_emailid(Rptoffemail);
					candidateInfo.setRep_mgr_name(RptMgrname);
					candidateInfo.setPrev_org(prvcname);
					if (file != null) {
						try {
							candidateInfo.setFile_upload_name(file.getOriginalFilename());
						} catch (Exception e) {
							logger.error("Got exception with no file", e);
						}
					}
					recruitmentDAO.addCandidate(candidateInfo);
					candidatestatus.setCandidate(candidateInfo);
					candidateid = recruitmentDAO.saveCandidateStatus(candidatestatus);
					if (file != null) {
						// String directorypath = File.separator+file.getOriginalFilename();
						if (file != null) {
							try {
								if (!new File(workingDir).exists()) {
									new File(workingDir).mkdir();
								}

								File dest = new File(workingDir + File.separator + file.getOriginalFilename());
								if (dest.exists() != true) {
									file.transferTo(dest);
								} else {

								}
							} catch (Exception e) {
								logger.error(" exception raised with reason:", e);
							}
						}
					}

					CandidateJobs candidateJobs = new CandidateJobs();
					candidateJobs.setJobDesc(jobdesc);
					candidateJobs.setCandidate(candidateInfo);

					InterviewDetails interviewObj = new InterviewDetails();
					interviewObj.setCandidate(candidateInfo);
					interviewObj.setJobDesc(jobdesc);
					interviewObj.setInterviewstatus(null);
					interviewObj.setClientinterview(null);
					recruitmentDAO.saveInterviewDetails(interviewObj);
					JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobDescId);
					if (jobstatus.getJdStatus() != null) {
						if (jobstatus.getJdStatus().equalsIgnoreCase("Working")) {

						} else {
							jobstatus.setJdStatus("Idle");
							recruitmentDAO.updateJobStatusByJobId(jobstatus);
						}

					}
				}
				// Email Functionalitys

				UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(recEmpNumber,"RECRUITER");
				String recName = null;
				String fromEmail = null;
				if (fromUserObj != null) {
					recName = fromUserObj.getUserName();
					fromEmail = fromUserObj.getEmail();
				}
				UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(fromUserObj.getEmp_lead(),"TEAMLEAD");
				if (leadObj != null) {
					String tlName = leadObj.getUserName();
					// String ccMail ="NA";
					String toEmail = leadObj.getEmail();
					String subject = jobcode;
					String message = "New Candidate has been sourced";

					try {
						if (jid == null) {
							newEmail.sendMailRectoTL(fromEmail, toEmail, subject, message, null, tlName, tlName, null,
									role, fname, jobcode, recName, "Sourced", null, "NA");
						}

					} catch (MailException ex) {
						logger.error("Exception due to:", ex);

					}
				}
			} catch (MailException e) {
				logger.error("Exception raised due to:" + e);
			}
			return "redirect:/view_Jobdescription";
		}

		else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";

		}
	}

	/**
	 * To check candidate already exists or not in database
	 * 
	 * @param pan_num
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = "/checkPanExists", method = RequestMethod.GET)
	@ResponseBody
	public String candidatePan(HttpServletRequest req) throws HandlingException {
		String panid = req.getParameter("panId");

		String pan = recruitmentDAO.candidateExistOrNot(panid);
		String message = null;
		if (pan == null) {
			message = "Ok";
		} else {
			message = "sorry";
		}

		return message;

	}

	/**
	 * To update the requirement details.
	 * 
	 * @param model
	 * @param req
	 * @return null
	 * @throws HandlingException
	 * @throws ParseException
	 */

	@RequestMapping(value = "/updateCandidateInfo", method = RequestMethod.POST)
	public String updateCandidateInfo(Model model, HttpServletRequest req,
			@RequestParam("file") CommonsMultipartFile file) throws HandlingException, ParseException, MailException {

		String username = (String) req.getSession().getAttribute("username");
		String role = (String) req.getSession().getAttribute("role");
		if (username != null) {
			Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));

			String jobId = req.getParameter("jobDescId");
			String jobCode = req.getParameter("jobCode");

			String bdname = req.getParameter("Bdname_Req");
//String 		bdname=null;
			String clientName_Req = req.getParameter("clientName_Req");
			String hbstartdate = req.getParameter("h1bstart");
			String hbenddate = req.getParameter("h1bend");
			String phnNumber = req.getParameter("phnNumber");
			String relevant_exp = req.getParameter("revalentExp");
			String expctc = req.getParameter("expectedctc");
			String total_exp = req.getParameter("totalExp");
			String curctc = req.getParameter("currentctc");
			String notice_period = req.getParameter("noticePeriod");
			String fname = req.getParameter("txtFirstName");
			String mname = req.getParameter("txtMiddleName");
			String lname = req.getParameter("txtLastName");
			String email = req.getParameter("email");
			String pan_num = req.getParameter("panID");
			if (pan_num == null) {
				pan_num = "N/A";
			}
			String basic_qul = req.getParameter("basic_qual");
			String curr_org = req.getParameter("currentOrg");
			String candidatedesg = req.getParameter("candidatedesg");
			String DOB = req.getParameter("dob");
			String high_qual = req.getParameter("highest_qual");
			String priSkill = req.getParameter("priSkill");
			String secSkill = req.getParameter("secSkill");
			String altNumber = req.getParameter("altNumber");
			String location = req.getParameter("location");
			String sscPerc = req.getParameter("sscPerc");
			String plus2Perc = req.getParameter("plus2Perc");
			String ugPerc = req.getParameter("ugPerc");
			String pgPerc = req.getParameter("pgPerc");
			String min_timereq_join = req.getParameter("min_timereq_join");
			String skypeid = req.getParameter("skypeid");
			String idProofDetails = req.getParameter("idProofDetails");
			String professional_Refrnces = req.getParameter("professional_Refrnces");
			String comskillsRatig = req.getParameter("comskillsRatig");
			String intrstlevlworkLoc = req.getParameter("intrstlevlworkLoc");
			String sourcedBy = req.getParameter("sourcedBy");

			int canSource = 0;
			try {
				canSource = Integer.parseInt(sourcedBy);
			} catch (NumberFormatException ex) { // handle your exception
				logger.error(ex);
			}

			Double pgpercentage = null, ugpercentage = null, sscprercentage = null, plus2percentage = null;
			if ((!ugPerc.equals("") && (!ugPerc.isEmpty()) && (ugPerc != null))) {
				ugpercentage = Double.parseDouble(ugPerc);
			}
			if ((!pgPerc.equals("") && (!pgPerc.isEmpty()) && (pgPerc != null))) {
				pgpercentage = Double.parseDouble(pgPerc);
			}
			if ((!plus2Perc.equals("") && (!plus2Perc.isEmpty()) && (plus2Perc != null))) {
				plus2percentage = Double.parseDouble(plus2Perc);
			}
			if ((!sscPerc.equals("") && (!sscPerc.isEmpty()) && (sscPerc != null))) {
				sscprercentage = Double.parseDouble(sscPerc);
			}
			/* Candidate Adiditional Details */

			String curcname = "";
			String duration = "";
			String prev_std = "";
			String prev_Rld = "";
			String bankname = "";
			String bLocation = "";
			String spouse_work = "";
			String hav_kids = "";
			String com_name = "";
			String npn_r = "";

			String candNlocation = req.getParameter("txtNlocation");
			String priSkillRating = req.getParameter("priSkillRating");
			String secSkillRating = req.getParameter("secSkillRating");
			String commSkillRating = req.getParameter("commSkillRating");
			String doj_cur_org = req.getParameter("doj");
			String RptMgrname = req.getParameter("txtRMgrname");
			String Rptoffemail = req.getParameter("offemail");
			String tek_payroll = req.getParameter("work_on_tek_payroll");
			String isPerm = req.getParameter("curr_work_isPerm");
			if (isPerm.equalsIgnoreCase("YES")) {
				curcname = req.getParameter("curcompname");
				duration = req.getParameter("duration");
			}

			String prvcname = req.getParameter("prvcname");
			if (prvcname.equalsIgnoreCase("YES")) {
				prev_std = req.getParameter("std");
				prev_Rld = req.getParameter("Rld");
			}

			String ltbnkstmt = req.getParameter("ltbnkstmt");
			if (ltbnkstmt.equalsIgnoreCase("YES")) {
				bankname = req.getParameter("bankname");
				bLocation = req.getParameter("bLocation");
			}
			String hav_all_doc = req.getParameter("hav_all_doc");
			String reason_reloc = req.getParameter("reason_reloc");
			String reason_job_change = req.getParameter("reason_job_change");
			String any_intervw = req.getParameter("any_intervw");
			if (any_intervw.equalsIgnoreCase("YES")) {
				com_name = req.getParameter("com_name");

			}
			String any_offer = req.getParameter("any_offer");
			String fmbcground = req.getParameter("fmbcground");
			if (fmbcground.equalsIgnoreCase("YES")) {
				spouse_work = req.getParameter("is_spouse_work");
				hav_kids = req.getParameter("is_hav_kids");
			}

			String npn = req.getParameter("npn");

			if (npn.equalsIgnoreCase("YES")) {
				npn_r = req.getParameter("npn_reason");

			}
			String f2f_WE = req.getParameter("f2f_WE");

			boolean checkformat_dob;
			boolean checkformat_rld;
			boolean checkformat_std;
			boolean checkformat_doj;
			if (DOB.matches("([0-9]{2})/([0-9]{2})/([0-9]{4})")) {// for yyyy/MM/dd format
				checkformat_dob = true;
			} else {
				checkformat_dob = false;
			}

			if (prev_Rld.matches("([0-9]{2})/([0-9]{2})/([0-9]{4})")) {// for yyyy/MM/dd format
				checkformat_rld = true;
			} else {
				checkformat_rld = false;
			}
			if (prev_std.matches("([0-9]{2})/([0-9]{2})/([0-9]{4})")) {// for yyyy/MM/dd format
				checkformat_std = true;
			} else {
				checkformat_std = false;
			}
			if (doj_cur_org.matches("([0-9]{2})/([0-9]{2})/([0-9]{4})")) {// for yyyy/MM/dd format
				checkformat_doj = true;
			} else {
				checkformat_doj = false;
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");

			Date submitdate = new Date();
			Date dateOfbirth = null;

			Date hb_end = null;
			Date hb_start = null;
			try {
				if ((!DOB.equals("")) && (!DOB.isEmpty()) && (DOB != null)) {
					if (checkformat_dob == false) {
						dateOfbirth = sdf.parse(DOB);
					} else {
						dateOfbirth = sdf1.parse(DOB);
					}
				}

				if (hbstartdate != null && hbstartdate != "") {
					hb_start = sdf.parse(hbstartdate);
				}

				if (hbenddate != null && hbenddate != "") {
					hb_end = sdf.parse(hbenddate);
				}

			} catch (NullPointerException e) {
				logger.error("Exception raised due to:" + e);
			}
			Date prev_std1 = null;
			Date prev_rld1 = null;
			Date cur_doj = null;
			if (!prev_std.isEmpty()) {
				try {
					if (checkformat_std == false) {
						prev_std1 = sdf.parse(prev_std);
					} else {
						prev_std1 = sdf1.parse(prev_std);
					}
				} catch (NullPointerException e) {
					logger.error(e);
				}
			}
			if (!prev_Rld.isEmpty()) {
				try {
					if (checkformat_rld == false) {
						prev_rld1 = sdf.parse(prev_Rld);
					} else {
						prev_rld1 = sdf1.parse(prev_Rld);
					}
				} catch (NullPointerException e) {
					logger.error(e);
				}
			}
			if (!doj_cur_org.isEmpty()) {
				try {
					if (checkformat_doj == false) {
						cur_doj = sdf.parse(doj_cur_org);

					} else {
						cur_doj = sdf1.parse(doj_cur_org);

					}
				} catch (NullPointerException e) {
					logger.error(e);
				}
			}

			CandidateInformation candidateInfo = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);

			candidateInfo.setAltcnt_number(altNumber);
			candidateInfo.setBasic_qualification(basic_qul);
			candidateInfo.setBIEplus12(plus2percentage);
			candidateInfo.setCandDesignation(candidatedesg);
			candidateInfo.setContact_number(phnNumber);
			candidateInfo.setCurrent_org(curr_org);
			candidateInfo.setCurrentCTC(curctc);
			candidateInfo.setDob(dateOfbirth);
			candidateInfo.setEmailID(email);
			candidateInfo.setExpectedCTC(expctc);
			candidateInfo.setFirst_name(fname);
			candidateInfo.setGraduation(ugpercentage);
			candidateInfo.setHbend_date(hb_end);
			candidateInfo.setHbstart_date(hb_start);
			candidateInfo.setLast_name(lname);
			candidateInfo.setMiddle_name(mname);
			candidateInfo.setHighest_qualification(high_qual);
			candidateInfo.setNoticeperiod(notice_period);
			candidateInfo.setPancard(pan_num);
			candidateInfo.setPost_Graduation(pgpercentage);
			candidateInfo.setPrimaryskill(priSkill);
			candidateInfo.setRelevantExp(relevant_exp);
			candidateInfo.setTotal_experience(total_exp);
			candidateInfo.setSecskill(secSkill);
			candidateInfo.setSsc(sscprercentage);
			candidateInfo.setSubmit_date(submitdate);
			candidateInfo.setWorkLocation(location);

			/* candidate additional details */
			candidateInfo.setNoticeprd_negotiable(npn);
			candidateInfo.setDesc_np_negotion(npn_r);
			candidateInfo.setInt_pipeline_com(com_name);
			candidateInfo.setF2f_intervew(f2f_WE);
			candidateInfo.setMin_timereq_join(min_timereq_join);
			candidateInfo.setSkypeid(skypeid);

			candidateInfo.setCan_native_loc(candNlocation);
			candidateInfo.setPrim_skill_rate(priSkillRating);
			candidateInfo.setSec_skill_rate(secSkillRating);
			candidateInfo.setComm_skills_rate(commSkillRating);
			candidateInfo.setIntrw_pipeline(any_intervw);
			candidateInfo.setIs_tek_payroll(tek_payroll);
			candidateInfo.setIs_working(isPerm);
			if (isPerm.equalsIgnoreCase("YES")) {
				candidateInfo.setCur_cmpny_name(curcname);
				candidateInfo.setDuration(duration);
			}
			candidateInfo.setBank_stmt(ltbnkstmt);
			if (ltbnkstmt.equalsIgnoreCase("YES")) {
				candidateInfo.setBank_name(bankname);
				candidateInfo.setBank_loc(bLocation);
			}
			candidateInfo.setCmpny_docs(hav_all_doc);
			candidateInfo.setFamily_bckgrund(fmbcground);
			if (fmbcground.equalsIgnoreCase("YES")) {
				candidateInfo.setSpouse_wrk(spouse_work);
				candidateInfo.setKids_info(hav_kids);
			}
			candidateInfo.setResn_reloc(reason_reloc);
			candidateInfo.setJob_change(reason_job_change);
			candidateInfo.setDoj_cur_org(cur_doj);
			candidateInfo.setPrev_start_date(prev_std1);
			candidateInfo.setPrev_relivd_date(prev_rld1);
			candidateInfo.setOffer_inhand(any_offer);
			candidateInfo.setMgr_official_emailid(Rptoffemail);
			candidateInfo.setRep_mgr_name(RptMgrname);
			candidateInfo.setPrev_org(prvcname);
			candidateInfo.setIdProofDetails(idProofDetails);
			candidateInfo.setProfessional_Refrnces(professional_Refrnces);
			candidateInfo.setComskillsRatig(comskillsRatig);
			candidateInfo.setIntrstlevlworkLoc(intrstlevlworkLoc);

			// String uploadsDir = "/Resumes";

			String workingDir = env.getProperty("Resumes");
			if (!new File(workingDir).exists()) {
				new File(workingDir).mkdir();
			}
			if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				try {
					String directorypath = workingDir + File.separator + file.getOriginalFilename();
					String filePath = directorypath;

					File dest = new File(filePath);
					if (dest.exists() != true) {
						file.transferTo(dest);
						candidateInfo.setFile_upload_name(file.getOriginalFilename());
					}
				} catch (Exception e) {
					logger.error("Exception raised due to:" + e);
				}
			} else {
			}

			recruitmentDAO.updateCandidate(candidateInfo);

			// Email Functionalitys

			Integer loginNumber = (Integer) req.getSession().getAttribute("empNumber");

			if (role.equalsIgnoreCase("TEAMLEAD")) {

				UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginNumber,role);
				String leadName = null;
				String fromEmail = null;
				if (fromUserObj != null) {
					leadName = fromUserObj.getUserName();
					fromEmail = fromUserObj.getEmail();

				}
				UserDTO recObj = recruitmentDAO.getUserNameByEmpNo(canSource,role);
				if (recObj != null) {

					String recName = recObj.getUserName();
					String ccMail = "NA";
					String toEmail = recObj.getEmail();
					String subject = jobCode;
					String message = "Candidate Profile has been updated";

					try {

						newEmail.sendMailRectoTL(fromEmail, toEmail, subject, message, null, leadName, leadName, null,
								role, fname, jobCode, recName, "Sourced", null, "NA");

					} catch (MailException ex) {
						logger.error("Exception due to:", ex);

					}

				}
				return "redirect:/view_Profiles_JD?jobId=" + jobId + "";

			}

			else if (role.equalsIgnoreCase("RECRUITER")) {

				UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginNumber,"RECRUITER");
				String recName = null;
				String fromEmail = null;
				if (fromUserObj != null) {
					recName = fromUserObj.getUserName();
					fromEmail = fromUserObj.getEmail();
					int tlEmp = fromUserObj.getEmp_lead();
					UserDTO tlObj1 = recruitmentDAO.getUserNameByEmpNo(tlEmp,"TEAMLEAD");

					String tlName = tlObj1.getUserName();
					String ccMail = "NA";
					String toEmail = tlObj1.getEmail();
					String subject = jobCode;
					String message = "Candidate Profile has been updated";

					try {

						newEmail.sendMailRectoTL(fromEmail, toEmail, subject, message, null, recName, tlName, null,
								role, fname, jobCode, recName, "Sourced", null, "NA");

					} catch (MailException ex) {
						logger.error("Exception due to:", ex);

					}

				}

				return "redirect:/displaySourcedProfiles?jobId=" + jobId + "";
			}

			else {

				return "redirect:/view_Profiles_JD?jobId=" + jobId + "";

			}
		}

		else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";

		}
	}

	@RequestMapping(value = "/displaySourcedProfiles", method = RequestMethod.GET)
	public String showSelectedProfilesyRecruiter(Model model, HttpServletRequest req) throws HandlingException {
		String username = (String) req.getSession().getAttribute("username");

		if (username != null) {
			List<CandidateDTO> candidateinfolist = new ArrayList<CandidateDTO>();
			String jobId = req.getParameter("jobId");

			String role = (String) req.getSession().getAttribute("role");
			Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
			Integer jobDescId = null;
			List<CandidateInfoDTO> candidateList = null;
			if (jobId == null) {
				jobDescId = null;
			} else {
				jobDescId = Integer.parseInt(jobId);

			}
			String jobCode = recruitmentDAO.getJobCodeById(jobDescId);
			String bdName = recruitmentDAO.getNameByjobId(jobDescId);
			String client = recruitmentDAO.getCompanyIdByJobId(jobDescId);

			candidateList = recruitmentDAO.getCandidateListRecruiter(jobDescId, loginEmpNumber);
			for (CandidateInfoDTO candidateInfoDTO : candidateList) {
				CandidateDTO candidateDtoObj = new CandidateDTO();
				CandidateStatusDTO statusObj = recruitmentDAO
						.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(), loginEmpNumber, role, jobDescId);
				UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),role);
				CandidateInformation candidateInfo = recruitmentDAO
						.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
				InterviewDetails interview = recruitmentDAO
						.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobDescId);
				CandidateStatus candiStatusOBJ = recruitmentDAO
						.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobDescId);
				candidateDtoObj.setCandidateInfo(candidateInfo);
				candidateDtoObj.setCandidateStatus(statusObj);
				candidateDtoObj.setInterevieDetails(interview);
				candidateDtoObj.setCandidateStatusObj(candiStatusOBJ);
				if(user!=null) {
				candidateDtoObj.setUserName(user.getUserName());
				candidateDtoObj.setEmpl_lead(user.getEmp_lead());
				}
				candidateDtoObj.setCompany(client);

				Tbl_RecPortal_tecpanelFeedBack clientsavailable = recruitmentDAO.getInterviewByJobId(jobDescId);
				if(clientsavailable!=null)
				{
				candidateDtoObj.setClientAvaiableFromTime(clientsavailable.getClavalabletime());
				candidateDtoObj.setClientAvaiableToTime(clientsavailable.getClavailabletimeto());
				}
				candidateinfolist.add(candidateDtoObj);

			}
			model.addAttribute("candidateinfolist", candidateinfolist);
			model.addAttribute("jobId", jobId);
			model.addAttribute("client", client);
			model.addAttribute("bdName", bdName);
			model.addAttribute("jobCode", jobCode);

			return "viewSourcedProfiles";

		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = "/getCandidateInfoByCandidateId", method = RequestMethod.POST)
	@ResponseBody
	public JsonResponse getCandidateInfoByCandidateID(HttpServletRequest req) throws HandlingException {

		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String jobid = req.getParameter("jobid");
		JsonResponse response = new JsonResponse();
		Integer jobDescId = null;
		CandidateInformation candidate = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
		if (jobid != null) {
			jobDescId = Integer.parseInt(jobid);
			InterviewDetails interview = recruitmentDAO.getintervieDetailsByCandidateid(candidateid, jobDescId);
			response.setInterview(interview);
		} // jobid in getCandidateInfoByCandidateId

		response.setCandidateInfo(candidate);

		return response;

	}

	@RequestMapping({ "/download/{documentId}" })
	public String download(@PathVariable("documentId") Integer candidateId, HttpServletResponse response,
			HttpServletRequest req) throws HandlingException, IOException {

		CandidateInformation candidateinfo = recruitmentDAO.getCandidateInfoByCandidateID(candidateId);
		if (candidateinfo != null) {
			if (candidateinfo.getFile_upload_name() != null) {
				// String uploadsDir = "/Resumes";
				String workingDir = env.getProperty("Resumes");
				String directorypath1 = workingDir + File.separator + candidateinfo.getFile_upload_name();
				File ff = new File(directorypath1);
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

				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				}

			} else {

				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();
			}
		}

		else {

			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Candidate Not available');");
			out.println("window.history.back();");
			out.println("</script>");
			out.close();
		}

		return null;
	}

	/**
	 * To update the requirement details.
	 * 
	 * @param model
	 * @param req
	 * @return null
	 * @throws IOException
	 */
	@RequestMapping(value = "/update_JobDesc", method = RequestMethod.POST)
	public String updateJobDescription(Model model, HttpServletRequest req,

			@RequestParam("uploadfile1") CommonsMultipartFile file1,
			@RequestParam("uploadfile2") CommonsMultipartFile file2, final RedirectAttributes redirectAttributes)
			throws HandlingException, ParseException, IOException {
		Integer empNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");
		String userName = (String) req.getSession().getAttribute("username");
		if (userName != null) {
			Integer jobid = Integer.parseInt(req.getParameter("jobid"));
			String jobCode = req.getParameter("jobCode").trim();
			String actionReassign = req.getParameter("reassign");
			String jobDescription = req.getParameter("jobdescription");
			String technology = req.getParameter("Technology");
			String jobGivenBy = req.getParameter("jobGivenBy");
			String intORext = req.getParameter("intORext");
			String jobCloseDate = req.getParameter("jobCloseDate");
			String companyId = req.getParameter("company");
			String account = req.getParameter("account");
			String segment = req.getParameter("segment");
			Integer totalpositions = Integer.parseInt(req.getParameter("totalpositions"));
			String durationProject = req.getParameter("durationProject");
			String locationProject = req.getParameter("locationProject");
			String jdStatus = req.getParameter("jd_status");
			String allocatedBudget = req.getParameter("allocated_budget");
			String jdCategory = req.getParameter("jdcategory");
			// String[] employeeArr = req.getParameterValues("assignTo");

			Date fromdate1 = new Date();
			java.sql.Date jdcloseddate = new java.sql.Date(fromdate1.getTime());

			String priority = req.getParameter("jd_priority");
			String jdlabel = req.getParameter("jd_label");

			String jobreceivedtime = req.getParameter("jobreceivedTime");
			SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:S");
			Date jobsdfTime = null;
			if (!jobreceivedtime.equals("") && jobreceivedtime != null) {
				jobsdfTime = sdfTime.parse(jobreceivedtime);
			}
			Date posEndDate = null;

			Jobdescription jd = recruitmentDAO.getjobDescriptionByJobID(jobid);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (!jobCloseDate.equals("") && jobCloseDate != null) {
				posEndDate = sdf.parse(jobCloseDate);
			}
			Date jobCreatedDate = new Date();
			int flag = 0;
			Date currentDate = new Date();
			if (posEndDate == currentDate) {
				flag = 1;
			}
			UserDTO loginUser = recruitmentDAO.getUserNameByEmpNo(empNumber,role);
			String workingDir = env.getProperty("JDuploads");
			String directorypath = workingDir + File.separator + jobCode;

			if (!new File(workingDir).exists()) {
				new File(workingDir).mkdir();
				// directorypath = workingDir + File.separator + jobCode;
				if (!new File(directorypath).exists()) {
					new File(directorypath).mkdir();
				}

			} else {
				if (!new File(directorypath).exists()) {
					new File(directorypath).mkdir();
				}
			}
			Integer cmpnyid = null;
			String companyName = null;
			String[] employeeArr = req.getParameterValues("assignTo");
			if (actionReassign.equalsIgnoreCase("reassign")) {

				Jobdescription jdObj = new Jobdescription();
				CompanyDescription company = new CompanyDescription();
				if (!companyId.isEmpty()) {
					cmpnyid = Integer.parseInt(companyId);
				}
				company.setCmpny_id(cmpnyid);
				companyName = recruitmentDAO.getCompanyNameByjobId(cmpnyid);
				jdObj.setAllocatedBudget(allocatedBudget);
				if (!priority.isEmpty()) {
					jdObj.setJdPriority(priority);
				}
				jdObj.setCompany(company);
				jdObj.setJobCode(jobCode);
				jdObj.setCreatedby(empNumber);
				jdObj.setJobDescription(jobDescription);
				jdObj.setTechnology(technology);
				jdObj.setJobDescGiven(jobGivenBy);
				jdObj.setExternal_internal(intORext);
				jdObj.setPosEndDate(posEndDate);
				jdObj.setAcc_name(account);
				jdObj.setSegment(segment);
				if (!jdStatus.equalsIgnoreCase("Open")) {
					jdObj.setJobstatus(jdStatus);
				} else {
					jdObj.setJobstatus("Open");
				}

				jdObj.setNo_of_positions(totalpositions);
				jdObj.setDuration_project(durationProject);
				jdObj.setLocation_project(locationProject);
				jdObj.setCreatedDate(jobCreatedDate);
				jdObj.setJoblabel(jdlabel);
				jdObj.setFlag(Integer.valueOf(flag));
				jdObj.setJobrecieved_time(jobsdfTime);
				jdObj.setJdCategory(jdCategory);

				Integer jdid = recruitmentDAO.addjobDesc(jdObj);
				if (jdid != 0) {

					redirectAttributes.addFlashAttribute("msg", "New JobCode created successfully!" + jdid);

				}

				JobStatus jdstatus = new JobStatus();
				jdstatus.setJobdesc(jdObj);
				jdstatus.setJdStatus(jdStatus);
				recruitmentDAO.saveJobStatus(jdstatus);
				Date assignDate = new Date();
				JobAllocation jobAllocation = new JobAllocation();
				Jobdescription jobdesc = new Jobdescription();
				jobAllocation.setAssignedby(empNumber);
				jobdesc.setJobdescid(jdid);
				jobAllocation.setJobDesc(jobdesc);
				jobAllocation.setAssigneddate(assignDate);
				String mail=null;
if(loginUser!=null) {
mail=loginUser.getEmail();
}
				saveJobAllocation(jdid, employeeArr, empNumber, mail, assignDate, jobCode, role,
						loginUser.getUserName(), cmpnyid, intORext);

				Date attcahedDate = new Date();

				if (!file1.getOriginalFilename().isEmpty()) {
					String jdDoc = req.getParameter("JdDescription");
					recService.updateMultipleFiles(jd, file1.getOriginalFilename(), attcahedDate, jdDoc);
				} else {
				}

				if (!file2.getOriginalFilename().isEmpty()) {
					String mailProof = req.getParameter("Mailproof");
					recService.updateMultipleFiles(jd, file2.getOriginalFilename(), attcahedDate, mailProof);
				} else {
				}

				if (file1 != null) {
					File dest = new File(directorypath + File.separator + file1.getOriginalFilename());
					try {

						file1.transferTo(dest);

					} catch (Exception e) {
						logger.error("Exception raised when file adding to folder:", e);
					}
				}

				if (file2 != null) {
					File dest = new File(directorypath + File.separator + file2.getOriginalFilename());
					try {
						file2.transferTo(dest);
					} catch (Exception e) {
						logger.error("Exception raised when file adding to folder:", e);
					}
				}
				List<String> ccList = new LinkedList<>();
				String toEmail1 = "requirements@tekskills.in";
				String ccSct = env.getProperty("SctMail");

				ccList.add(ccSct);

				String subject = jobCode;

//String status = "Req-Recycled";
				if(loginUser!=null) {
				try {
					newEmail.sendMailBD_RecUser(loginUser.getEmail(), toEmail1, subject, null, "Team", ccList, role,
							jobCode, companyName, "DeliveryTeam", loginUser.getUserName(), jdStatus);
				} catch (Exception ex) {
					logger.error("Exception due to:", ex);

				}
				}

			} else {
				CompanyDescription company1 = new CompanyDescription();
				if (!companyId.isEmpty()) {
					company1.setCmpny_id(Integer.parseInt(companyId));
				}
				jd.setCompany(company1);
				jd.setAllocatedBudget(allocatedBudget);
				jd.setJobCode(jobCode);
				jd.setCreatedby(empNumber);
				jd.setJobDescription(jobDescription);
				jd.setTechnology(technology);
				jd.setJobDescGiven(jobGivenBy);
				jd.setExternal_internal(intORext);
				jd.setPosEndDate(posEndDate);
				jd.setAcc_name(account);
				jd.setSegment(segment);
				if (priority != null) {
					jd.setJdPriority(priority);
				}

				String recIndia = env.getProperty("recIndia");
				List<String> ccList = new LinkedList<>();
				ccList.add(recIndia);
				String ccSct = env.getProperty("SctMail");
				ccList.add(ccSct);
				String subject = jobCode;
				String status = null;
				if (!jdStatus.equalsIgnoreCase("Open")) {
					status = jdStatus;
					if (jdStatus.equalsIgnoreCase("Req Closed") || jdStatus.equalsIgnoreCase("Req Fulfilled")
							|| jdStatus.equalsIgnoreCase("Req on Hold")) {
						jd.setJdcloseddate(jdcloseddate);
					}
				} else {
					status = "Open";
					jd.setJobstatus("Open");
				}
				jd.setJobstatus(jdStatus);
				companyName = recruitmentDAO.getCompanyNameByjobId(Integer.parseInt(companyId));

				List<Integer> ccTlList = recruitmentDAO.getAllTlsByJobid(jobid);

				for (Integer tl_No : ccTlList) {

					UserDTO tlobj = recruitmentDAO.getUserNameByEmpNo(tl_No,role);
					if(tlobj!=null) {
					String uName = tlobj.getUserName();
					String toEmail1 = tlobj.getEmail();
					if(loginUser!=null) {
					try {
						newEmail.sendMailBD_RecUser(loginUser.getEmail(), toEmail1, subject, null, "Team", ccList, role,
								jobCode, companyName, uName, loginUser.getUserName(), status);
					} catch (Exception ex) {
						logger.error("Exception due to:", ex);
					}
					}

				}
				}
				jd.setJobstatus(jdStatus);
				jd.setNo_of_positions(totalpositions);
				jd.setDuration_project(durationProject);
				jd.setLocation_project(locationProject);
				// jd.setCreatedDate(jobCreatedDate);
				jd.setJoblabel(jdlabel);
				jd.setFlag(Integer.valueOf(flag));
				jd.setJobrecieved_time(jobsdfTime);
				jd.setJdCategory(jdCategory);
				try {
					recruitmentDAO.updatejobDesc(jd);
					redirectAttributes.addFlashAttribute("msg", "Job code updated successfully!");
				} catch (Exception e) {
					logger.debug("Update JD() jobid: {}", e);
				}
				JobStatus jdstatus = recruitmentDAO.getJobStatusTableByJobId(jobid);
				jdstatus.setJobdesc(jd);
				jdstatus.setJdStatus(jdStatus);
				recruitmentDAO.updateJobStatus(jdstatus);

				// Updating job Allocation table

				Date assignDate = new Date();
				JobAllocation jobAllocation = new JobAllocation();
				Jobdescription jobdesc = new Jobdescription();
				jobAllocation.setAssignedby(empNumber);
				jobdesc.setJobdescid(jobid);
				jobAllocation.setJobDesc(jobdesc);
				jobAllocation.setAssigneddate(assignDate);

				Date attcahedDate = new Date();

				if (!file1.getOriginalFilename().isEmpty()) {
					String jdDoc = req.getParameter("JdDescription");
					recService.updateMultipleFiles(jd, file1.getOriginalFilename(), attcahedDate, jdDoc);
				} else {
				}

				if (!file2.getOriginalFilename().isEmpty()) {
					String mailProof = req.getParameter("Mailproof");

					recService.updateMultipleFiles(jd, file2.getOriginalFilename(), attcahedDate, mailProof);
				} else {
				}

				if (file1 != null) {
					if (!file1.getOriginalFilename().isEmpty()) {
						File dest = new File(directorypath + File.separator + file1.getOriginalFilename());
						try {

							file1.transferTo(dest);

						} catch (Exception e) {
							logger.error("Exception raised when file adding to folder:", e);
						}
					}
				}

				if (file2 != null) {
					if (!file2.getOriginalFilename().isEmpty()) {
						try {
							File dest = new File(directorypath + File.separator + file2.getOriginalFilename());

							file2.transferTo(dest);

						} catch (Exception e) {
							logger.error("Exception raised when file adding to folder:", e);
						}
					}
				}

			}

			return "redirect:" + "displayRequirements";
			// return "redirect:/displayRequirements";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = "/displayJobDescByJobid", method = RequestMethod.GET)
	@ResponseBody
	public String retrieveJobDescription(HttpServletRequest req) throws HandlingException {

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String jobDesc = recruitmentDAO.getJobDescById(jobid);
		return jobDesc;

	}

	@RequestMapping(value = "/Recruiter_Daily_submissions", method = RequestMethod.GET)
	public String displayDailySubmissions(Model model, HttpServletRequest req) throws HandlingException {
		Integer empNumber = (Integer) req.getSession().getAttribute("empNumber");
		String user = (String) req.getSession().getAttribute("username");

		if (user != null) {
			List<JobAllocationDTO> jdIDList = recruitmentDAO.getAllJobDesc(empNumber);
			List<RecruiterDailySubmissions> dailySubList = recruitmentDAO.getAllDailySubmissionListById(empNumber);
			model.addAttribute("jdList", jdIDList);
			model.addAttribute("dailySubList", dailySubList);
			return "RecruiterDailySubmissions";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";

	}

	@RequestMapping(value = "/save_Recruiters_submissions", method = RequestMethod.POST)
	public String saveRecSubmissions(Model model, HttpServletRequest req) throws HandlingException {
		Integer empNumber = (Integer) req.getSession().getAttribute("empNumber");

		RecruiterDailySubmissions subms = new RecruiterDailySubmissions();
		String user = (String) req.getSession().getAttribute("username");
		if (user != null) {

			Integer jid = Integer.parseInt(req.getParameter("jobid"));
			Integer ttl_dwd = Integer.parseInt(req.getParameter("no_pf_dwd"));
			Integer ttl_spoken = Integer.parseInt(req.getParameter("no_pf_spoken"));
			Integer ttl_agreed = Integer.parseInt(req.getParameter("sub_pf_ct"));

			int did = recruitmentDAO.checkDailySubmissionById(jid, empNumber);
			if (did == 0) {
				subms.setAgreed(ttl_agreed);
				subms.setContacted(ttl_spoken);
				subms.setDowloaded(ttl_dwd);

				subms.setCreatedDate(new Date());
				Jobdescription jobdesc = new Jobdescription();
				jobdesc.setJobdescid(jid);
				subms.setJobdesc(jobdesc);
				subms.setRecId(empNumber);
				recruitmentDAO.saveRecruiterDailySubmissions(subms);

			} else {
				recruitmentDAO.updateDailySubmissionById(did, ttl_dwd, ttl_spoken, ttl_agreed);
			}

			return "redirect:Recruiter_Daily_submissions";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	// jd's report
	@ResponseBody
	@RequestMapping(value = "view_JdStatus", method = RequestMethod.GET)
	public List<JobProfileCountDto> viewjd(HttpServletRequest req) throws HandlingException {
		HttpSession session = req.getSession(true);
		List<JobProfileCountDto> countList = new ArrayList<JobProfileCountDto>();

		Integer jobid = Integer.parseInt(req.getParameter("jobdescid"));

		List<String> viewleadinfo = recruitmentDAO.getRoles();

		session.setAttribute("viewleadinfo", viewleadinfo);
		for (String roleObj : viewleadinfo) {
			JobProfileCountDto view_count = this.recruitmentDAO.getRolesCount(roleObj, jobid);
			countList.add(view_count);
		}
		return countList;

	}

	@RequestMapping(value = "view_scheduledCandidates", method = RequestMethod.GET)
	@ResponseBody
	public List<ScheduledCandidatesDTO> viewScheduledCandidate(HttpServletRequest req) throws HandlingException {

		String intStatus = "Scheduled";
		List<ScheduledCandidatesDTO> candidateList = new ArrayList<>();

		String intType = req.getParameter("inttype");

		Integer jobid = Integer.parseInt(req.getParameter("jobdescid"));

		List<InterviewDetails> scheduledCandidatesList = recruitmentDAO.getCanddatesByInterviewStatus(intStatus,
				intType, jobid);
		for (InterviewDetails interviewDetails : scheduledCandidatesList) {
			ScheduledCandidatesDTO scheduledObj = new ScheduledCandidatesDTO();
			CandidateInformation candidateinfo = recruitmentDAO
					.getCandidateInfoByCandidateID(interviewDetails.getCandidate().getCandidateid());
			scheduledObj.setCandidate(candidateinfo);
			Date tpIntDate = interviewDetails.getInterviewdate();
			if (tpIntDate != null) {
				scheduledObj.setTpinterviewDate(tpIntDate.toString());
				scheduledObj.setTpinterviewMode(interviewDetails.getModeofinterview());
			}
			Date clIntDate = interviewDetails.getCliIntDate();
			if (clIntDate != null) {
				scheduledObj.setClinterviewDate(clIntDate.toString());
				scheduledObj.setClinterviewMode(interviewDetails.getClIntMode());
			}

			candidateList.add(scheduledObj);
		}
		return candidateList;

	}

	@RequestMapping(value = "checkIntervkiewTime", method = RequestMethod.GET)
	@ResponseBody
	public Boolean checkInterviewTime(HttpServletRequest req) throws HandlingException {

		String interview_time = req.getParameter("inttime");
		String interviewdate = req.getParameter("interviewdate");
		Integer jobid = null;

		String jobdescid = req.getParameter("jobdescid");

		if (!jobdescid.equals("")) {
			jobid = Integer.parseInt(jobdescid);
		}

		Boolean response = null;
		String interview_type = req.getParameter("interview_type");
		String time = interview_time.substring(0, 5);
		Integer jobdescval = recruitmentDAO.checkInterviewScheduledByTime(time, jobid, interview_type, interviewdate);

		if (jobdescval == null) {
			response = true;
		} else {
			response = false;
		}

		return response;

	}

	@RequestMapping(value = "SaveClientAvailabily", method = RequestMethod.POST)
	public String save_interview(HttpServletRequest req) throws HandlingException, ParseException, IOException {

		String role = (String) req.getSession().getAttribute("role");
		Integer empNo = (Integer) req.getSession().getAttribute("empNumber");
		String user = (String) req.getSession().getAttribute("username");
		if (user != null) {
			String interview_type = req.getParameter("interview_type");
			String interview_date = req.getParameter("interview_date");
			String interview_timeTo = req.getParameter("interview_timeTo");
			int jobid = Integer.parseInt(req.getParameter("jobsid"));
			String jobdesc = recruitmentDAO.getJobCodeById(jobid);

			String interview_time = req.getParameter("interview_time");

			SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd");
			Date datetime1 = null;
			if ((!interview_date.equals("")) && (!interview_date.isEmpty()) && (interview_date != null)) {
				datetime1 = sdfTime.parse(interview_date);
			}

			Tbl_RecPortal_tecpanelFeedBack interview = recruitmentDAO.getInterviewByJobId(jobid);
			if (interview != null) {
				interview.setClavalabletime(interview_time);
				interview.setClinterviewdate(datetime1);
				interview.setClIntMode(interview_type);
				interview.setClavailabletimeto(interview_timeTo);

				if (interview.getClinterviewdate() != null) {

					recruitmentDAO.update_tl_insert(interview);

				} else {
					recruitmentDAO.update_tl_insert(interview);
				}

				UserDTO fromObj = recruitmentDAO.getUserNameByEmpNo(empNo,role);

				List<Integer> jaList = recruitmentDAO.getAssignToByJobID(jobid, null, role);
				for (Integer assignto : jaList) {
					UserDTO assineeDetails = recruitmentDAO.getUserNameByEmpNo(assignto,"RECRUITER");
					if(assineeDetails!=null) {
					String toEmail1 = assineeDetails.getEmail();
					String subject = jobdesc;
					String ccMail = "requirements@tekskills.in";
					String message = "Client will be avialable for interview on date:" + interview_date + " at time:"
							+ interview_time + " and mode of interview should be :" + interview_type
							+ " please check in portal";
					try {
						newEmail.sendMail(fromObj.getEmail(), toEmail1, subject, message.toString(), ccMail,
								assineeDetails.getUserName(), null, role);
					} catch (Exception ex) {
						logger.error("Exception due to:", ex);

					}
				}
				}
			} else {

			}
			if (role.equalsIgnoreCase("BDM")) {
				return "redirect:/displayRequirements";
			} else {
				return "redirect:/view_Jobdescription";
			}
		} else {

			return "redirect:/loginpage";
		}

	}

	@ResponseBody
	@RequestMapping(value = "interview_view", method = RequestMethod.GET)
	public List<InterviewDetailsDto> view_interview(HttpServletRequest req)
			throws HandlingException, ParseException, IOException {

		int jobid = Integer.parseInt(req.getParameter("jobdescid"));

		List<InterviewDetailsDto> int_list = new ArrayList<InterviewDetailsDto>();

		List<InterviewDetailsDto> view_list = recruitmentDAO.Interview_view(jobid);
		Iterator itr = view_list.iterator();
		while (itr.hasNext()) {
			InterviewDetailsDto interview = new InterviewDetailsDto();
			Jobdescription jd = new Jobdescription();

			Object[] obj = (Object[]) itr.next();
			Date intDate = (Date) obj[0];
			String intMode = (String) obj[1];
			String cliIntStatus = (String) obj[2];
			int jdid = (int) obj[3];
			jd.setJobdescid(jdid);
			interview.setIntmode(intMode);
			interview.setIntdate(intDate.toString());
			interview.setCliinterview(cliIntStatus);
			interview.setJobid(jdid);

			int_list.add(interview);
		}

		return int_list;

	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "panel_availability_view", method =
	 * RequestMethod.GET) public List<Tbl_RecPortal_tecpanelFeedBack>
	 * tp_availability_view(HttpServletRequest req) throws HandlingException,
	 * ParseException, IOException { int jobid =
	 * Integer.parseInt(req.getParameter("jobdescid"));
	 * 
	 * List<Tbl_RecPortal_tecpanelFeedBack> view =
	 * recruitmentDAO.TL_Interview_view(jobid); return view;
	 * 
	 * }
	 */
	@RequestMapping(value = "/Delete_jobid", method = RequestMethod.GET)
	public String deleteInterview(HttpServletRequest req) throws HandlingException, ParseException, IOException {

		int jobid = Integer.parseInt(req.getParameter("jobsid"));
		recruitmentDAO.delete_view(jobid);

		return "redirect:/displayRequirements";

	}

	// Integration Rasheeda

	/**
	 * upload file to assigned to that requirement.
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 * @throws IOException
	 */
	@RequestMapping(value = { "/uploadAssignedJdToUser" }, method = RequestMethod.POST)
	public String UploadAssignedUser(Model model, HttpServletRequest req, HttpServletResponse response,
			@RequestParam("file") CommonsMultipartFile file) throws HandlingException, IOException {

		Integer jobid = Integer.parseInt(req.getParameter("jobdesid"));

		Tbl_RecPortal_tecpanelFeedBack feedback = recruitmentDAO.fileDownloadByID(jobid);
		Jobdescription jobdesc = new Jobdescription();
		jobdesc.setJobdescid(jobid);

		if (feedback != null) {

			if (file != null) {
				try {
					feedback.setFile_data(file.getBytes());
					feedback.setAttachmentname(file.getOriginalFilename());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			recruitmentDAO.tlFileUpload(feedback);
			return "redirect:/view_Jobdescription";
		} else {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('File already uploaded');");
			out.println("window.location.href='view_Jobdescription'");
			out.println("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = { "/exportSourcedData" }, method = RequestMethod.GET)
	public void ExportToExcel(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");

		Integer jobId = Integer.parseInt(req.getParameter("jobId"));
		String username = null;
		int i = 1;
		List<CandidateInfoDTO> candidateList = null;
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=SourcedProfile.xlsx");
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("SourceProfileList");
		XSSFRow row = spreadsheet.createRow(0);
		XSSFCell cell;
		cell = row.createCell(0);
		cell.setCellValue("EAC NO");
		cell = row.createCell(1);
		cell.setCellValue("Name");
		cell = row.createCell(2);
		cell.setCellValue("Number/Alt Number");
		cell = row.createCell(3);
		cell.setCellValue("Email ID");
		cell = row.createCell(4);
		cell.setCellValue("DOB");
		cell = row.createCell(5);
		cell.setCellValue("Basic Qulification");
		cell = row.createCell(6);
		cell.setCellValue("Highest Qulification");
		cell = row.createCell(7);
		cell.setCellValue("Skills");
		cell = row.createCell(8);
		cell.setCellValue("Total Experience");
		cell = row.createCell(9);
		cell.setCellValue("Relevant Experience");
		cell = row.createCell(10);
		cell.setCellValue("Designation");
		cell = row.createCell(11);
		cell.setCellValue("Current CTC");
		cell = row.createCell(12);
		cell.setCellValue("Expected CTC");
		cell = row.createCell(13);
		cell.setCellValue("Notice Period");
		cell = row.createCell(14);
		cell.setCellValue("Work Location");
		cell = row.createCell(15);
		cell.setCellValue("Recruiter Name");
		cell = row.createCell(16);
		cell.setCellValue("Result Status");
		cell = row.createCell(17);
		cell.setCellValue("TP Interview Status");
		cell = row.createCell(18);
		cell.setCellValue("Client Interview Status");
		cell = row.createCell(19);
		cell.setCellValue("Profile Status @Client");

		if (role.equalsIgnoreCase("SCT")) {
			String jobType = recruitmentDAO.getJobTypeByJobId(jobId);
			candidateList = recruitmentDAO.getCandidateList(role, null, jobId, jobType, null);

			for (CandidateInfoDTO candidateInfoDTO : candidateList) {
				CandidateInformation candidateInfoObj = recruitmentDAO
						.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
				CandidateStatus candiStatusOBJ = recruitmentDAO
						.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobId);
				InterviewDetails interview = recruitmentDAO
						.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
				UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");

				String statusObj = null;
				CandidateStatusDTO status = recruitmentDAO.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(),
						loginEmpNumber, role, jobId);
				if (status != null) {
					statusObj = status.getStatus();
				}
				String pancard = candidateInfoObj.getPancard();
				String firstname = candidateInfoObj.getFirst_name();
				String number = candidateInfoObj.getContact_number();
				String emailid = candidateInfoObj.getEmailID();
				Date dob = candidateInfoObj.getDob();
				String dob1 = null;
				if (dob != null) {
					dob1 = dob.toString();
				}
				String basicqual = candidateInfoObj.getBasic_qualification();
				String highestqual = candidateInfoObj.getHighest_qualification();
				String skills = candidateInfoObj.getSecskill();
				String texp = candidateInfoObj.getTotal_experience();
				String relexp = candidateInfoObj.getRelevantExp();
				String designation = candidateInfoObj.getCandDesignation();
				String cctc = candidateInfoObj.getCurrentCTC();
				String ectc = candidateInfoObj.getExpectedCTC();
				String nperiod = candidateInfoObj.getNoticeperiod();
				String wlocation = candidateInfoObj.getWorkLocation();

				String tpinterstatus = interview.getInterviewstatus();

				String clinterstatus = interview.getClientinterview();
				String profilestaus = candiStatusOBJ.getClientStatus();

				username = user.getUserName();

				row = spreadsheet.createRow(i);

				cell = row.createCell(0);
				cell.setCellValue(pancard);

				cell = row.createCell(1);
				cell.setCellValue(firstname);

				cell = row.createCell(2);
				cell.setCellValue(number);

				cell = row.createCell(3);
				cell.setCellValue(emailid);

				cell = row.createCell(4);
				cell.setCellValue(dob1);

				cell = row.createCell(5);
				cell.setCellValue(basicqual);

				cell = row.createCell(6);
				cell.setCellValue(highestqual);

				cell = row.createCell(7);
				cell.setCellValue(skills);

				cell = row.createCell(8);
				cell.setCellValue(texp);

				cell = row.createCell(9);
				cell.setCellValue(relexp);

				cell = row.createCell(10);
				cell.setCellValue(designation);

				cell = row.createCell(11);
				cell.setCellValue(cctc);

				cell = row.createCell(12);
				cell.setCellValue(ectc);

				cell = row.createCell(13);
				cell.setCellValue(nperiod);

				cell = row.createCell(14);
				cell.setCellValue(wlocation);

				cell = row.createCell(15);
				cell.setCellValue(username);

				cell = row.createCell(16);
				cell.setCellValue(statusObj);

				cell = row.createCell(17);
				cell.setCellValue(tpinterstatus);

				cell = row.createCell(18);
				cell.setCellValue(clinterstatus);

				cell = row.createCell(19);
				cell.setCellValue(profilestaus);

				i++;
			}

		} else {
			List<Integer> allocationList = recruitmentDAO.getAssignToByJobID(jobId, loginEmpNumber, role);
			if (allocationList.size() != 0) {
				for (Integer assignto : allocationList) {
					// Integer assigneeEmpNo = jobAllocation.getAssignedto();
					String jobType = recruitmentDAO.getJobTypeByJobId(jobId);
					candidateList = recruitmentDAO.getCandidateList(role, assignto, jobId, jobType, loginEmpNumber);

					for (CandidateInfoDTO candidateInfoDTO : candidateList) {
						CandidateInformation candidateInfoObj = recruitmentDAO
								.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
						CandidateStatus candiStatusOBJ = recruitmentDAO
								.getStatusByCandidateID(candidateInfoDTO.getCandidateId(), jobId);
						InterviewDetails interview = recruitmentDAO
								.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
						UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");

						String statusObj = null;

						CandidateStatusDTO status = recruitmentDAO.getCandidateStutusByUser(
								candidateInfoDTO.getCandidateId(), loginEmpNumber, role, jobId);
						if (status != null) {
							statusObj = status.getStatus();
						}
						String pancard = candidateInfoObj.getPancard();
						String firstname = candidateInfoObj.getFirst_name();
						String number = candidateInfoObj.getContact_number();
						String emailid = candidateInfoObj.getEmailID();
						Date dob = candidateInfoObj.getDob();
						String dob1 = null;
						if (dob != null) {
							dob1 = dob.toString();
						}
						String basicqual = candidateInfoObj.getBasic_qualification();
						String highestqual = candidateInfoObj.getHighest_qualification();
						String skills = candidateInfoObj.getSecskill();
						String texp = candidateInfoObj.getTotal_experience();
						String relexp = candidateInfoObj.getRelevantExp();
						String designation = candidateInfoObj.getCandDesignation();
						String cctc = candidateInfoObj.getCurrentCTC();
						String ectc = candidateInfoObj.getExpectedCTC();
						String nperiod = candidateInfoObj.getNoticeperiod();
						String wlocation = candidateInfoObj.getWorkLocation();

						String tpinterstatus = interview.getInterviewstatus();

						String clinterstatus = interview.getClientinterview();
						String profilestaus = candiStatusOBJ.getClientStatus();
if(user!=null) {
						username = user.getUserName();
}
						row = spreadsheet.createRow(i);

						cell = row.createCell(0);
						cell.setCellValue(pancard);

						cell = row.createCell(1);
						cell.setCellValue(firstname);

						cell = row.createCell(2);
						cell.setCellValue(number);

						cell = row.createCell(3);
						cell.setCellValue(emailid);

						cell = row.createCell(4);
						cell.setCellValue(dob1);

						cell = row.createCell(5);
						cell.setCellValue(basicqual);

						cell = row.createCell(6);
						cell.setCellValue(highestqual);

						cell = row.createCell(7);
						cell.setCellValue(skills);

						cell = row.createCell(8);
						cell.setCellValue(texp);

						cell = row.createCell(9);
						cell.setCellValue(relexp);

						cell = row.createCell(10);
						cell.setCellValue(designation);

						cell = row.createCell(11);
						cell.setCellValue(cctc);

						cell = row.createCell(12);
						cell.setCellValue(ectc);

						cell = row.createCell(13);
						cell.setCellValue(nperiod);

						cell = row.createCell(14);
						cell.setCellValue(wlocation);

						cell = row.createCell(15);
						cell.setCellValue(username);

						cell = row.createCell(16);
						cell.setCellValue(statusObj);

						cell = row.createCell(17);
						cell.setCellValue(tpinterstatus);

						cell = row.createCell(18);
						cell.setCellValue(clinterstatus);

						cell = row.createCell(19);
						cell.setCellValue(profilestaus);

						i++;

					}

				}

			}

		}

		FileOutputStream out = new FileOutputStream(new File("SourcedProfile.xlsx"));
		// workbook.write(out);
		workbook.write(response.getOutputStream());
		out.close();
		workbook.close();

	}

	// recruiter Sourced Profiles Export to Excel
	@RequestMapping(value = { "/recruiter_exportSourcedData" }, method = RequestMethod.GET)
	public void ExportToExcelRecruiter(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");

		Integer jobId = Integer.parseInt(req.getParameter("jobId"));
		String username = null;
		List<CandidateInfoDTO> candidateList = null;
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=SourcedProfile.xlsx");
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("SourceProfileList");
		XSSFRow row = spreadsheet.createRow(0);
		XSSFCell cell;
		cell = row.createCell(0);
		cell.setCellValue("EAC NO");
		cell = row.createCell(1);
		cell.setCellValue("Name");
		cell = row.createCell(2);
		cell.setCellValue("Number/Alt Number");
		cell = row.createCell(3);
		cell.setCellValue("Email ID");
		cell = row.createCell(4);
		cell.setCellValue("DOB");
		cell = row.createCell(5);
		cell.setCellValue("Basic Qulification");
		cell = row.createCell(6);
		cell.setCellValue("Highest Qulification");
		cell = row.createCell(7);
		cell.setCellValue("Skills");
		cell = row.createCell(8);
		cell.setCellValue("Total Experience");
		cell = row.createCell(9);
		cell.setCellValue("Relevant Experience");
		cell = row.createCell(10);
		cell.setCellValue("Designation");
		cell = row.createCell(11);
		cell.setCellValue("Current CTC");
		cell = row.createCell(12);
		cell.setCellValue("Expected CTC");
		cell = row.createCell(13);
		cell.setCellValue("Notice Period");
		cell = row.createCell(14);
		cell.setCellValue("Work Location");
		cell = row.createCell(15);
		cell.setCellValue("Recruiter Name");
		cell = row.createCell(16);
		cell.setCellValue("TP Interview Status");
		cell = row.createCell(17);
		cell.setCellValue("Client Interview Status");
		cell = row.createCell(18);
		cell.setCellValue("SCT Status");
		cell = row.createCell(19);
		cell.setCellValue("Profile Status @Client");
		String jobType = recruitmentDAO.getJobTypeByJobId(jobId);
		candidateList = recruitmentDAO.getCandidateList(role, loginEmpNumber, jobId, jobType, null);

		int i = 1;
		for (CandidateInfoDTO candidateInfoDTO : candidateList) {
			CandidateInformation candidateInfoObj = recruitmentDAO
					.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
			CandidateStatus candiStatusOBJ = recruitmentDAO.getStatusByCandidateID(candidateInfoDTO.getCandidateId(),
					jobId);
			InterviewDetails interview = recruitmentDAO
					.getintervieDetailsByCandidateid(candidateInfoDTO.getCandidateId(), jobId);
			UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");

			String statusObj = null;
			CandidateStatusDTO status = recruitmentDAO.getCandidateStutusByUser(candidateInfoDTO.getCandidateId(),
					loginEmpNumber, role, jobId);
			if (status != null) {
				statusObj = status.getStatus();
			}
			String pancard = candidateInfoObj.getPancard();
			String firstname = candidateInfoObj.getFirst_name();
			String number = candidateInfoObj.getContact_number();
			String emailid = candidateInfoObj.getEmailID();
			Date dob = candidateInfoObj.getDob();
			String dob1 = null;
			if (dob != null) {
				dob1 = dob.toString();
			}
			String basicqual = candidateInfoObj.getBasic_qualification();
			String highestqual = candidateInfoObj.getHighest_qualification();
			String skills = candidateInfoObj.getSecskill();
			String texp = candidateInfoObj.getTotal_experience();
			String relexp = candidateInfoObj.getRelevantExp();
			String designation = candidateInfoObj.getCandDesignation();
			String cctc = candidateInfoObj.getCurrentCTC();
			String ectc = candidateInfoObj.getExpectedCTC();
			String nperiod = candidateInfoObj.getNoticeperiod();
			String wlocation = candidateInfoObj.getWorkLocation();

			String tpinterstatus = interview.getInterviewstatus();

			String sctstatus = statusObj;

			String clinterstatus = interview.getClientinterview();
			String profilestaus = candiStatusOBJ.getClientStatus();

			// UserDTO user =
			// recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo());
			if(user!=null) {
			username = user.getUserName();
			}
			row = spreadsheet.createRow(i);

			cell = row.createCell(0);
			cell.setCellValue(pancard);

			cell = row.createCell(1);
			cell.setCellValue(firstname);

			cell = row.createCell(2);
			cell.setCellValue(number);

			cell = row.createCell(3);
			cell.setCellValue(emailid);

			cell = row.createCell(4);
			cell.setCellValue(dob1);

			cell = row.createCell(5);
			cell.setCellValue(basicqual);

			cell = row.createCell(6);
			cell.setCellValue(highestqual);

			cell = row.createCell(7);
			cell.setCellValue(skills);

			cell = row.createCell(8);
			cell.setCellValue(texp);

			cell = row.createCell(9);
			cell.setCellValue(relexp);

			cell = row.createCell(10);
			cell.setCellValue(designation);

			cell = row.createCell(11);
			cell.setCellValue(cctc);

			cell = row.createCell(12);
			cell.setCellValue(ectc);

			cell = row.createCell(13);
			cell.setCellValue(nperiod);

			cell = row.createCell(14);
			cell.setCellValue(wlocation);

			cell = row.createCell(15);
			cell.setCellValue(username);

			cell = row.createCell(16);
			cell.setCellValue(tpinterstatus);

			cell = row.createCell(17);
			cell.setCellValue(clinterstatus);

			cell = row.createCell(18);
			cell.setCellValue(sctstatus);

			cell = row.createCell(19);
			cell.setCellValue(profilestaus);

			i++;
		}
		FileOutputStream out = new FileOutputStream(new File("SourcedProfile.xlsx"));
		// workbook.write(out);
		workbook.write(response.getOutputStream());
		out.close();
		workbook.close();

	}

	@RequestMapping(value = { "/Multiplefiledownload" }, method = RequestMethod.GET)
	@ResponseBody
	public String Multiplefiledownload(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {

		String role = (String) req.getSession().getAttribute("role");

		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String jobcode = req.getParameter("jobcode");
		String attchmentType = "Jd_Doc";
		String attachmentName = recruitmentDAO.fileDownloadByType(jobid, attchmentType);

		if (attachmentName != null) {

			// String uploadsDir = "/uploads";
			// String workingDir = req.getServletContext().getRealPath(uploadsDir);
			String workingDir = env.getProperty("JDuploads");
			// String directorypath = workingDir + File.separator + uploadsDir;

			String directorypath1 = workingDir + File.separator + jobcode;

			File ff = new File(directorypath1 + File.separator + attachmentName);
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
				if (role.equalsIgnoreCase("BDM")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available in Directory');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				} else if (role.equalsIgnoreCase("RECRUITER")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available in Directory');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				} else if (role.equalsIgnoreCase("SCT")) {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available in Directory');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				}

				else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('No file available in Directory');");
					out.println("window.history.back();");
					out.println("</script>");
					out.close();
				}

			}

		} else {
			if (role.equalsIgnoreCase("BDM")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available in Directory');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();
			} else if (role.equalsIgnoreCase("RECRUITER")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available in Directory');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();
			} else if (role.equalsIgnoreCase("SCT")) {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available in Directory');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();
			}

			else {
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('No file available in Directory');");
				out.println("window.history.back();");
				out.println("</script>");
				out.close();
			}

		}
		return null;

	}

	@RequestMapping(value = { "/store_Feedback" }, method = RequestMethod.POST)
	@ResponseBody
	public String storeFeedBack(HttpServletRequest req) throws HandlingException, IOException {

		Integer loginEmpNo = (Integer) req.getSession().getAttribute("empNumber");

		String candidateid = req.getParameter("candidateidFBS");
		String canFeedBack = req.getParameter("candidateCommentS");
		Date dateofCall = new Date();
		java.sql.Date timeofcall = new java.sql.Date(dateofCall.getTime());
		CandidateFeedBack feedback = new CandidateFeedBack();
		CandidateInformation candidateinfo = new CandidateInformation();
		candidateinfo.setCnadidateid(Integer.parseInt(candidateid));
		feedback.setCandidate(candidateinfo);
		feedback.setComments(canFeedBack);
		feedback.setTakenby(loginEmpNo);
		feedback.setTimeofcall(timeofcall);
		String message = recruitmentDAO.saveCandidateFeedBack(feedback);

		return message;
	}

	@RequestMapping(value = { "/view_Feedback" }, method = RequestMethod.GET)
	@ResponseBody
	public List<CandidateFeedBackDTO> viewFeedBack(HttpServletRequest req) throws HandlingException, IOException {
		
		List<CandidateFeedBackDTO> canFbList = new ArrayList<>();

		String candidateid = req.getParameter("candidateidFBV");
		List<CandidateFeedBack> fbList = recruitmentDAO.getFeedBackByCandidateid(Integer.parseInt(candidateid));
		String role = (String) req.getSession().getAttribute("role");
		for (CandidateFeedBack candidateFeedBack : fbList) {
			UserDTO userObj = recruitmentDAO.getUserNameByEmpNo(candidateFeedBack.getTakenby(),role);
			CandidateFeedBackDTO fbObj = new CandidateFeedBackDTO();
			fbObj.setCallerDate(candidateFeedBack.getTimeofcall().toString());
			fbObj.setComments(candidateFeedBack.getComments());
			fbObj.setCallername(userObj.getUserName());
			canFbList.add(fbObj);

		}
		return canFbList;

	}

	/**
	 * To check candidate email id already exists or not in database
	 * 
	 * @param email
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = "/checkEmailExists", method = RequestMethod.GET)
	@ResponseBody
	public String candidateEmail(HttpServletRequest req) throws HandlingException {
		String email = req.getParameter("email");
		String jobDescId = req.getParameter("jobDescId");
		Integer candidateOBJ = recruitmentDAO.candidateEmailExistOrNot(email, jobDescId);
		String message = null;
		if (candidateOBJ == null) {
			message = "NotExist";
		} else {
			message = "Exist";
		}
		return message;

	}

	/**
	 * To check candidate Phone already exists or not in database
	 * 
	 * @param email
	 * @return
	 * @throws HandlingException
	 */
	@RequestMapping(value = "/checkContactExists", method = RequestMethod.GET)
	@ResponseBody
	public String candidatePhone(HttpServletRequest req) throws HandlingException {
		String number = req.getParameter("number");
		String jobDescId = req.getParameter("jobDescId");

		Integer candidateOBJ = recruitmentDAO.candidateContactExistOrNot(number, jobDescId);
		String message = null;
		if (candidateOBJ == null) {
			message = "NotExist";
		} else {
			message = "Exist";

		}
		return message;

	}

	/**
	 * TeamLead Graphs.
	 * 
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String tlGraphs(HttpServletRequest req, Model model) throws HandlingException {

		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");

		List<JobAllocationDTO> tljdlist = recruitmentDAO.getAllJobDesc(loginEmpNumber);
		List<TL_Dashboard_DTO> tldblist = new ArrayList<TL_Dashboard_DTO>();
		List<UserDTO> tlreclist = null;
		tlreclist = recruitmentDAO.getUsersByEmpNo(loginEmpNumber, role);

		for (UserDTO userDTO : tlreclist) {
			TL_Dashboard_DTO tldbdto = new TL_Dashboard_DTO();
			int totaljdcount = recruitmentDAO.getTotalJDCountByEmpId(userDTO.getEmp_number());
			int scttotalselectedcount = recruitmentDAO.getSCTTotalSubmittedCount(userDTO.getEmp_number());
			int rectotalsubmittedcount = recruitmentDAO.getTotalRecSubmittedCount(userDTO.getEmp_number());

			tldbdto.setRectotalsubmittedcount(rectotalsubmittedcount);
			tldbdto.setScttotalselectedcount(scttotalselectedcount);
			tldbdto.setTotaljdcount(totaljdcount);
			tldbdto.setRecname(userDTO.getUserName());
			tldblist.add(tldbdto);
		}
		model.addAttribute("tlDblist", tldblist);
		model.addAttribute("tlJdlist", tljdlist);
		model.addAttribute("tlReclist", tlreclist);
		return "TL_Dashboard";

	}
	// Rasheeda integaration resume database and mass email ids

	/**
	 * Mass Email IDs.
	 * 
	 * @throws HandlingException
	 */
	@RequestMapping(value = { "/massemailids" }, method = RequestMethod.GET)
	public String RCmassmailing() throws HandlingException {

		return "ViewMassMailEmailIds";

	}

	@RequestMapping(value = { "/massmailingBySearch" }, method = RequestMethod.GET)
	public String viewmassmailing(HttpServletRequest req) throws HandlingException {

		HttpSession session = req.getSession(true);

		String skills = req.getParameter("primaryskills");
		//List<ResumeDTO> eList =recruitmentDAO.getEmailIdsListBySkills(skills);
		List<CandidateInformation> eList = new ArrayList<CandidateInformation>();

		String[] skillArr = skills.split(",");
		for (String newSkill : skillArr) {
			List<String> emailList = recruitmentDAO.getEmailIdsBySkills(newSkill);

			Iterator it = emailList.iterator();
			while (it.hasNext()) {
				Object[] obj = (Object[]) it.next();
				CandidateInformation cinfo = new CandidateInformation();

				cinfo.setEmailID((String) obj[0]);
				cinfo.setContact_number((String) obj[1]);
				cinfo.setPrimaryskill((String) obj[2]);
				eList.add(cinfo);

			}

		}

		session.setAttribute("eList", eList);
		session.setAttribute("skills", skills);

		return "ViewMassMailEmailIds";

	}

	// Download emailids by searched
	@RequestMapping(value = { "/downloadmassids" }, method = RequestMethod.GET)
	public String crmallopportunityreport(HttpServletRequest req, HttpServletResponse response)
			throws IOException, HandlingException {
		String skills = req.getParameter("skills");

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=" + skills + "Emailids.xlsx");
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("" + skills + "Emailids");
		XSSFRow row = spreadsheet.createRow(0);
		XSSFCell cell;

		cell = row.createCell(0);
		cell.setCellValue("Candidate Email ID's");
		cell = row.createCell(1);
		cell.setCellValue("Mobile Numbers");
		cell = row.createCell(2);
		cell.setCellValue("Skills");

		String[] skillArr = skills.split(",");

		for (String newSkill : skillArr) {
			List<String> emailList = recruitmentDAO.getEmailIdsBySkills(newSkill);
			Iterator it = emailList.iterator();

			int i = 1;
			while (it.hasNext()) {
				Object[] obj = (Object[]) it.next();

				row = spreadsheet.createRow(i);

				cell = row.createCell(0);
				cell.setCellValue((String) obj[0]);
				cell = row.createCell(1);
				cell.setCellValue((String) obj[1]);
				cell = row.createCell(2);
				cell.setCellValue((String) obj[2]);
				i++;
			}

		}
		FileOutputStream out = new FileOutputStream(new File("" + skills + "Emailids.xlsx"));

		workbook.write(response.getOutputStream());
		out.close();
		workbook.close();
		return null;

	}

	// Resume Database
	@RequestMapping(value = { "/resumedatabase" }, method = RequestMethod.GET)
	public String viewResumeDatabase() throws HandlingException {

		return "ViewResumeDatabase";
	}

	// Resume Database search by skill
	@RequestMapping(value = { "/resumedatabaseBySearch" }, method = RequestMethod.GET)
	public String viewResumeDatabasebySearch(HttpServletRequest req, Model model) throws HandlingException {
		String skills = req.getParameter("primaryskills");
		List<ResumeDTO> resumeList = new ArrayList<ResumeDTO>();
		List<ResumeDTO> profilelist = recruitmentDAO.getResumeBySkills(skills);
		for (ResumeDTO resumeDTO : profilelist) {
			UserDTO udto = recruitmentDAO.getUserNameByEmpNo(resumeDTO.getRecempno(),"RECRUITER");
			if(udto!=null) {
			resumeDTO.setUserDto(udto);
			resumeList.add(resumeDTO);
			}
		}
		model.addAttribute("resumeList", resumeList);
		return "ViewResumeDatabase";

	}

	@RequestMapping({ "/errorLog" })
	public String errorLog(@RequestParam("errmsg") String errMsg, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException {

		try {

			response.setHeader("Content-Disposition", "attachment; filename=\"" + errMsg + "\"");
			OutputStream out = response.getOutputStream();
			response.setContentType(errMsg);
			FileCopyUtils.copy(errMsg.getBytes(), out);

			out.flush();
			out.close();
		} catch (IOException e) {
			logger.error("Exception raised due to:" + e);
		}
		return null;
	}

	@RequestMapping({ "/candidateInteSchedule" })
	public String candidateInterviewSchedule(HttpServletRequest req, Model model)
			throws HandlingException, ParseException {
		String username = (String) req.getSession().getAttribute("username");
		String role = (String) req.getSession().getAttribute("role");
		Integer empNo = (Integer) req.getSession().getAttribute("empNumber");
		if (username != null) {
			Integer candidateid = Integer.parseInt(req.getParameter("sicandidateid"));
			Integer jobDescId = null;
			String jobId = req.getParameter("siJobId");
			String candidateName = req.getParameter("siCName");
			String jobCode = req.getParameter("sijobCode");
			String lead = req.getParameter("silead");
			String company = req.getParameter("sicomapny");

			String bdname = null;
			String clientname = null;
			if (!jobId.equals("")) {
				jobDescId = Integer.parseInt(jobId);
			}
			Integer leadEmp = null;

			if (!lead.isEmpty()) {
				leadEmp = Integer.parseInt(lead);
			}
			UserDTO tlObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");

			List<String> ccList = new ArrayList<>();
			String ccMail = "requirements@tekskills.in";
			ccList.add(ccMail);
			String tlname = null;
			String tlEmail = null;
			if (tlObj != null) {
				tlname = tlObj.getUserName();
				tlEmail = tlObj.getEmail();

			}
			String interviewstatus = req.getParameter("interviewstatus");
			String interviewDate = req.getParameter("interviewdate");
			String interviewmode = req.getParameter("interviewmode");
			String interviewtime = req.getParameter("interview_time");
			String typeOfInterview = req.getParameter("interviewType");

			SimpleDateFormat sdfTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String interviewDate1 = null;
			if ((!interviewDate.equals("")) && (!interviewtime.equals(""))) {
				interviewDate1 = interviewDate + " " + interviewtime;
			}

			InterviewDetails interviewObj = null;

			Date interviewdate = null;
			try {

				if ((!interviewDate1.isEmpty())) {
					interviewdate = sdfTime.parse(interviewDate1);
				}
				Jobdescription jobdesc = new Jobdescription();
				jobdesc.setJobdescid(jobDescId);
				interviewObj = recruitmentDAO.getintervieDetailsByCandidateid(candidateid, jobDescId);
				if (interviewObj != null)
					if (typeOfInterview.equalsIgnoreCase("Client")) {
						interviewObj.setCliIntDate(interviewdate);
						interviewObj.setClIntMode(interviewmode);
						interviewObj.setClientinterview(interviewstatus);
						interviewObj.setInterviewType(typeOfInterview);
						recruitmentDAO.updateInterviewDetails(interviewObj);
					} else if (typeOfInterview.equalsIgnoreCase("Internal")) {
						interviewObj.setModeofinterview(interviewmode);
						interviewObj.setInterviewdate(interviewdate);
						interviewObj.setInterviewstatus(interviewstatus);
						interviewObj.setInterviewType(typeOfInterview);
						recruitmentDAO.updateInterviewDetails(interviewObj);
					}
				UserDTO fromObj = recruitmentDAO.getUserNameByEmpNo(empNo,role);
				String recmail = null;
				if (fromObj != null) {
					recmail = fromObj.getEmail();
				}

				Integer createdBy = recruitmentDAO.getCreatedByJobId(jobDescId);

				UserDTO cretedByobj = recruitmentDAO.getUserNameByEmpNo(createdBy,"BDM");
				if (cretedByobj != null) {
					String createdbyEmail = cretedByobj.getEmail();
					ccList.add(createdbyEmail);
				}
				String subject = jobCode;

				try {
					newEmail.sendMailInterviewSchedule(recmail, tlEmail, subject, null, tlname, ccList, role, jobCode,
							candidateName, interviewdate.toString(), interviewtime, interviewmode, typeOfInterview,
							company);

				} catch (Exception ex) {
					logger.error("Exception due to:", ex);

					String content = ex.toString();
					StringWriter errors = new StringWriter();
					ex.printStackTrace(new PrintWriter(errors));
					throw new HandlingException("Exception due to", errors.toString(), content);
				}
			}

			catch (Exception e) {
				logger.error("Exception raised due to:" + e);
			}
			if (role.equals("RECRUITER")) {
				return "redirect:/displaySourcedProfiles?jobId=" + jobId + "";
			} else {

				return "redirect:/view_Profiles_JD?jobId=" + jobId + "";
			}

		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	// Notice Period
	@RequestMapping(value = { "/addNoticePeriod" }, method = RequestMethod.GET)
	public String addNoticePeriod(HttpServletRequest req, Model model) throws HandlingException {

		List<CompanyNoticePeriod> ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
		model.addAttribute("ntcprdlist", ntcprdlist);
		return "AddNoticePeriod";
	}
	// Add Notice Period Companies

	@RequestMapping(value = { "/addCompNoticePeriod" }, method = RequestMethod.POST)
	public void addComNoticePeriod(HttpServletRequest req, Model model, HttpServletResponse res)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");
		PrintWriter out = res.getWriter();
		String companyName = req.getParameter("company_name");
		String companypanid = req.getParameter("companypanid");
		int noticeperiod = Integer.parseInt(req.getParameter("noticeperiod"));
		List<CompanyNoticePeriod> ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
		model.addAttribute("ntcprdlist", ntcprdlist);

		CompanyNoticePeriod noticeObj = new CompanyNoticePeriod();
		noticeObj.setCompanypanid(companypanid);
		noticeObj.setCompanyname(companyName);
		noticeObj.setNoticeperiod(noticeperiod);
		Integer addcomp = recruitmentDAO.addNoticePeriodComp(noticeObj);

		if (addcomp != null) {

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Company and Notice Period details added succesfully');");
			out.println("window.location.href='addNoticePeriod'");
			out.println("</script>");

			out.close();
		}
	}

	// Check Company Pan Id Exit or not
	@RequestMapping(value = "/checkCompanyPAN", method = RequestMethod.GET)
	@ResponseBody
	public String checkCompanyPAN(HttpServletRequest req) throws HandlingException {
		String companypanid = req.getParameter("companypanid");
		CompanyNoticePeriod companObj = recruitmentDAO.companyPANExistOrNot(companypanid);
		String message = null;
		if (companObj == null) {
			message = "NotExist";
		} else {
			message = "Exist";
		}
		return message;
	}

	// update Notice period Details
	@RequestMapping(value = { "/updateNoticePeriod" }, method = RequestMethod.POST)
	public void updateComNoticePeriod(HttpServletRequest req, Model model, HttpServletResponse res)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");

		String companyName = req.getParameter("company_name");
		String companypanid = req.getParameter("companypanid");
		int noticeperiod = Integer.parseInt(req.getParameter("noticeperiod"));
		int compid = Integer.parseInt(req.getParameter("compid"));

		String updatecompObj = recruitmentDAO.updateNoticePeriodComp(companyName, companypanid, noticeperiod, compid);
		if (updatecompObj != null) {
			PrintWriter out = res.getWriter();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Details Updated Succesfully');");
			out.println("window.location.href='addNoticePeriod'");
			out.println("</script>");
			out.close();
		}
		List<CompanyNoticePeriod> ntcprdlist = recruitmentDAO.getnoticePeriodCompnyList();
		model.addAttribute("ntcprdlist", ntcprdlist);

	}

	// View Profiles SCT Status
	@RequestMapping(value = { "/profilessctdates" }, method = RequestMethod.GET)
	public String profilessctdates(HttpServletRequest req, Model model, HttpServletResponse res)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {

			try {

				String fromdate = req.getParameter("fromdate");
				String todate = req.getParameter("todate");

				List<ViewUserProfilesSCTStatusDTO> viewcandidateinformationlist = recruitmentDAO
						.getSctReportByDates(fromdate, todate);
				model.addAttribute("fromdate", fromdate);
				model.addAttribute("todate", todate);
				model.addAttribute("viewcandidateinfolist", viewcandidateinformationlist);
				return "ViewProfilesSCTStatus";

			} catch (Exception e) {
			}
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
		}
		return "redirect:/loginpage";

	}

	@RequestMapping(value = { "/view_profilesSCTstatus" }, method = RequestMethod.GET)
	public String view_profilesSCTstatus(HttpServletRequest req, Model model, HttpServletResponse res)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");

		try {

			if (username != null) {
				List<ViewUserProfilesSCTStatusDTO> viewcandidateinformationlist = recruitmentDAO.SCTReportByTillDate();

				model.addAttribute("viewcandidateinfolist", viewcandidateinformationlist);
				return "ViewProfilesSCTStatus";
			} else {

				model.addAttribute("sessionmsg", "Session Expired");
				return "redirect:/loginpage";
			}

		} catch (Exception e) {
		}
		return null;

	}

	/**
	 * BD upload Mail proof file to SCT .
	 * 
	 * @param model
	 * @param req
	 * @throws HandlingException
	 * @throws IOException
	 */
	@RequestMapping(value = { "/bduploadMailProof" }, method = RequestMethod.POST)
	public String bduploadMailProof(Model model, HttpServletRequest req, HttpServletResponse response,
			@RequestParam("file") CommonsMultipartFile file) throws HandlingException, IOException {
		// String role = (String) req.getSession().getAttribute("role");
		Integer jobid = Integer.parseInt(req.getParameter("jobdesid"));
		Jobdescription filename = recruitmentDAO.mailproofDownloadByID(jobid);

		// String uploadsDir = "/BDMailProof";
		// String workingDir = req.getServletContext().getRealPath(uploadsDir);
		String workingDir = env.getProperty("BDMailProof");

		if (file != null) {
			String directorypath = workingDir + File.separator + file.getOriginalFilename();
			filename.setAttachmentname(file.getOriginalFilename());
			if (file != null) {
				try {
					if (!new File(workingDir).exists()) {
						new File(workingDir).mkdir();
					}
					File dest = new File(directorypath);
					if (dest.exists() != true) {
						file.transferTo(dest);
					} else {

					}
					recruitmentDAO.bdmailproofUpload(filename);

				} catch (Exception e) {
					logger.error(" exception raised with reason:", e);
				}
			}

			return "redirect:/displayRequirements";

		} else {
			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('File already uploaded');");
			out.println("window.location.href='view_Jobdescription'");
			out.println("</script>");
			out.close();
			return null;
		}
	}

	@RequestMapping(value = { "/sctDownloadmailProof" }, method = RequestMethod.GET)
	@ResponseBody
	public String sctDownloadmailProof(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String attachmentName = recruitmentDAO.mailProofDownload(jobid);
		if (role.equalsIgnoreCase("SCT")) {
			if (attachmentName != null) {

				// String uploadsDir = "/BDMailProof";
				// String workingDir = "C:\\Rec-portal\\BDMailProof";
				// String workingDir = req.getServletContext().getRealPath(uploadsDir);
				String workingDir = env.getProperty("BDMailProof");
				String directorypath = workingDir + File.separator + attachmentName;
				File ff = new File(directorypath);
				if (ff.exists() == true) {
					FileInputStream fis = new FileInputStream(ff);
					byte[] inputBytes = new byte[(int) ff.length()];
					fis.read(inputBytes);
					response.setContentType("application/vnd.ms-excel");
					response.setHeader("Content-Disposition", "attachment; filename=\"" + attachmentName);
					OutputStream os = response.getOutputStream(); // file output stream
					os.write(inputBytes);
					os.close();
					fis.close();
				} else {
					PrintWriter out = response.getWriter();
					out.println("<script type=\"text/javascript\">");
					out.println("alert('File Not Available Directory');");
					out.println("window.location.href='view_Jobdescription'");
					out.println("</script>");
					out.close();
				}

			} else {
				PrintWriter out = response.getWriter();

				out.println("<script type=\"text/javascript\">");
				out.println("alert('File Not Available');");
				out.println("window.location.href='view_Jobdescription'");
				out.println("</script>");
				out.close();
			}
		}
		return null;

	}

	@RequestMapping(value = { "/getMailProofFileName" }, method = RequestMethod.POST)
	@ResponseBody
	public String getMailProofFileName(HttpServletRequest req, Model model) throws HandlingException, IOException {
		// String role = (String) req.getSession().getAttribute("role");
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		String username = (String) req.getSession().getAttribute("username");
		String filename = recruitmentDAO.getMailFileNameByJobId(jobid);
		if (username != null) {
			return filename;
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/addSCTComments" }, method = RequestMethod.POST)
	public String addSCTComments(Model model, HttpServletRequest req) throws HandlingException, IOException {
		// String role = (String) req.getSession().getAttribute("role");
		String username = (String) req.getSession().getAttribute("username");
		Integer candidateid = Integer.parseInt(req.getParameter("candiid"));
		String jobid = req.getParameter("jid");
		String commentsct = req.getParameter("commentsct");
		String bdname = req.getParameter("sct_bdname");
		String recname = req.getParameter("recname");
		String clientname = req.getParameter("sct_clname");
		String jobCode = null;
		if (username != null) {

			try {
				Integer jobId = null;

				if (jobid != null) {
					jobId = Integer.parseInt(jobid);
					jobCode = recruitmentDAO.getJobCodeById(jobId);
				}
				Tbl_RecPortal_SCTComments comentStatus = new Tbl_RecPortal_SCTComments();

				CandidateInformation canObj = new CandidateInformation();
				Jobdescription jobdesidObj = new Jobdescription();
				canObj.setCnadidateid(candidateid);
				jobdesidObj.setJobdescid(jobId);
				Date ndate = new Date();
				comentStatus.setCanid(canObj);
				comentStatus.setJobid(jobdesidObj);
				comentStatus.setComment_sct(commentsct);
				comentStatus.setSubmitdate(ndate.toString());

				recruitmentDAO.addSCTComments(comentStatus);

			} catch (Exception ex) {
				logger.error("Exception due to:", ex);
			}
			return "redirect:/view_Profiles_JD?jobId=" + jobid + "";
		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}

	}

	@RequestMapping(value = { "/viewSCT_Comments" }, method = RequestMethod.POST)
	@ResponseBody
	public String viewSCT_Comments(HttpServletRequest req, Model model) throws HandlingException, IOException {
		// String role = (String) req.getSession().getAttribute("role");
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));
		Integer candidateid = Integer.parseInt(req.getParameter("candidateid"));
		String username = (String) req.getSession().getAttribute("username");

		String coment = null;
		if (username != null) {
			List<Tbl_RecPortal_SCTComments> getsctcmntObj = recruitmentDAO.getSCTComments(candidateid, jobid);
			if (getsctcmntObj.size() != 0) {

				for (Tbl_RecPortal_SCTComments scmt : getsctcmntObj) {
					if (scmt != null) {
						coment = scmt.getComment_sct() + "-----<<< Previous Comment >>>-----" + scmt.getSubmitdate()
								+ "" + coment;
					}
				}
			}
			return coment;

		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/sendMailToCandidate" }, method = RequestMethod.POST)
	@ResponseBody
	public String sendMailToCandidate(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {
		String role = (String) req.getSession().getAttribute("role");
		String username = (String) req.getSession().getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		Integer candidateid = Integer.parseInt(req.getParameter("canid"));
		Integer jobid = Integer.parseInt(req.getParameter("jobid"));

		if (username != null) {
			try {
				CandidateInformation canObj = recruitmentDAO.getCandidateInfoByCandidateID(candidateid);
				if (canObj != null) {
					UserDTO userObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
					if(userObj!=null) {
					String fromMail = userObj.getEmail();
					String toAddress = canObj.getEmailID();
					String subject = "Confirmation Mail - Tekskills !!";
					String mailBody = "<html>Greetings from Tekskills..!!!<br/><br/>As discussed, Please go through company profile and confirm the below details.<br/><br/><u><span style='background-color: #FFFF00'>Required Details:</span></u><br/><br/>Total Experience:"
							+ canObj.getTotal_experience() + "<br/><br/>Relevant Experience :" + canObj.getRelevantExp()
							+ "<br/><br/>Current CTC:" + canObj.getCurrentCTC() + "<br/><br/>Expected CTC (in INR):"
							+ canObj.getExpectedCTC() + "<br/><br/>Official Notice Period as per offer letter:"
							+ canObj.getNoticeperiod() + "<br/><br/>Minimum time required to join:"
							+ canObj.getMin_timereq_join() + "<br/><br/>Current Location:" + canObj.getWorkLocation()
							+ "<br/><br/>Native Location :" + canObj.getCan_native_loc()
							+ "<br/><br/>Currently working as Perm or C2H?: " + canObj.getCur_cmpny_name()
							+ " <br/><br/>Willing to be on payrolls of Tekskills (www.tekskills.in) ?:"
							+ canObj.getIs_tek_payroll()
							+ "<br/><br/><span style='background-color: #FFFF00'>Having all documents regarding previous organization(Offer Letter, Pay slips, Bank statements, Relieving letter):</span>"
							+ canObj.getCmpny_docs() + "<br/><br/>Reason for job change:" + canObj.getJob_change()
							+ "<br/><br/>Skype ID:" + canObj.getSkypeid() + "<br/><br/>Salary A/C:"
							+ canObj.getBank_name() + "<br/><br/>Any offers in hand?(Y/N):" + canObj.getOffer_inhand()
							+ "<br/><br/>Are you able to take the F2F interview( Yes/No):" + canObj.getF2f_intervew()
							+ "<br/><br/><span style='background-color: #FFFF00'><u>Company Profile (Tekskills):</u></span><br/><br/><p>Tekskills is a leading IT company which offers cost effective and quality software solutions and consultancy services. Our service portfolio includes on site project management, IT Infra services, onsite consultancy, Off-shore IT & ITES services, product and application development. Tekskills is an ISO: 9001 certified company and CMM Level 3 certified company.</p><p>Tekskills headquarters in New Jersey along with the state of the art off-shore development center in Hyderabad, India. Having around 400+ consultants across US working with our premier partners like EMC2 Data domain and Cisco globally, our clientele includes some of the fortune 500 companies like Pfizer, Citi, JP Morgan Chase and AT&T, etc. </p><p>Please visit http://www.tekskillsinc.com/ / http://www.tekskills.in/ to understand us better.</p></html>";
					String toName = canObj.getFirst_name();

					candidateMail.sendMail(fromMail, toAddress, subject, mailBody, null, toName, null, role);
				}

				}
			} catch (Exception ex) {
				logger.error("Exception due to:", ex);
			}

		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
		return null;
	}

	/*
	 * public static String html2text(String html) { return
	 * Jsoup.parse(html).text(); }
	 */
	// sct profile status Export to Excel
	@RequestMapping(value = { "/sctview_ExporttoExcel" }, method = RequestMethod.GET)
	public void sctview_ExporttoExcel(HttpServletResponse response, HttpServletRequest req)
			throws HandlingException, IOException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String role = (String) req.getSession().getAttribute("role");
		String username = (String) req.getSession().getAttribute("username");

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=ViewSCTProfileStatus.xlsx");
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet spreadsheet = workbook.createSheet("ViewSCTProfileStatus");
		XSSFRow row = spreadsheet.createRow(0);
		XSSFCell cell;
		cell = row.createCell(0);
		cell.setCellValue("Client Name");
		cell = row.createCell(1);
		cell.setCellValue("BD Name");
		cell = row.createCell(2);
		cell.setCellValue("Job Description");
		cell = row.createCell(3);
		cell.setCellValue("Canidate Name");
		cell = row.createCell(4);
		cell.setCellValue("Contact Number");
		cell = row.createCell(5);
		cell.setCellValue("SCT Status");
		cell = row.createCell(6);
		cell.setCellValue("SCT Comments");
		cell = row.createCell(7);
		cell.setCellValue("BD Comments");
		cell = row.createCell(8);
		cell.setCellValue("TL Comments");
		cell = row.createCell(9);
		cell.setCellValue("Recruiter Comments");
		cell = row.createCell(10);
		cell.setCellValue("Recruiter Name");
		cell = row.createCell(11);
		cell.setCellValue("TL Name");
		cell = row.createCell(12);
		cell.setCellValue("Email ID");
		cell = row.createCell(13);
		cell.setCellValue("Skills");
		cell = row.createCell(14);
		cell.setCellValue("Mode Of Interview");
		cell = row.createCell(15);
		cell.setCellValue("Interview Date");
		cell = row.createCell(16);
		cell.setCellValue("Skype ID");

		int i = 1;

		if (username != null) {
			List<ViewUserProfilesSCTStatusDTO> viewcandidateinfolist = new ArrayList<ViewUserProfilesSCTStatusDTO>();
			List<CandidateInfoDTO> candidateList = null;
			List<JobAllocationDTO> loginjdlist = recruitmentDAO.getAllJobDescByTLSelected(loginEmpNumber, role);
			for (JobAllocationDTO jobdescription : loginjdlist) {

				candidateList = recruitmentDAO.getCandidateListByTLSelected(role, loginEmpNumber,
						jobdescription.getJdID(), "External");
				if (candidateList.size() != 0) {
					for (CandidateInfoDTO candidateInfoDTO : candidateList) {
						if (candidateInfoDTO != null) {
							InterviewDetails interviewObj = recruitmentDAO.getintervieDetailsByCandidateid(
									candidateInfoDTO.getCandidateId(), jobdescription.getJdID());

							CandidateInformation caninfo = recruitmentDAO
									.getCandidateInfoByCandidateID(candidateInfoDTO.getCandidateId());
							String candidatename = caninfo.getFirst_name() + " " + caninfo.getLast_name();
							CandidateStatus candiStatusOBJ = recruitmentDAO.getStatusByCandidateID(
									candidateInfoDTO.getCandidateId(), jobdescription.getJdID());
							if (candiStatusOBJ != null) {
								ViewUserProfilesSCTStatusDTO viewcandidateinfo = new ViewUserProfilesSCTStatusDTO();
								UserDTO userbd = recruitmentDAO.getUserNameByEmpNo(jobdescription.getCreatedby(),"BDM");

								row = spreadsheet.createRow(i);
								cell = row.createCell(0);
								cell.setCellValue(jobdescription.getCmpny_name());
								cell = row.createCell(1);
								if(userbd!=null) {
								cell.setCellValue(userbd.getUserName());
								}
								cell = row.createCell(2);
								cell.setCellValue(jobdescription.getJobDescription());
								cell = row.createCell(3);
								cell.setCellValue(candidatename);

								if (caninfo.getAltcnt_number().isEmpty()) {
									cell = row.createCell(4);
									cell.setCellValue(caninfo.getContact_number());
								} else {
									cell = row.createCell(4);
									cell.setCellValue(caninfo.getContact_number() + "/" + caninfo.getAltcnt_number());
								}

								cell = row.createCell(5);
								cell.setCellValue(candiStatusOBJ.getSctStatus());
								cell = row.createCell(6);
								cell.setCellValue(candiStatusOBJ.getSctComment());
								cell = row.createCell(7);
								cell.setCellValue(candiStatusOBJ.getBdmComment());
								cell = row.createCell(8);
								cell.setCellValue(candiStatusOBJ.getTlComment());
								cell = row.createCell(9);
								cell.setCellValue(candiStatusOBJ.getRecComment());
								UserDTO user = recruitmentDAO.getUserNameByEmpNo(candidateInfoDTO.getRecEmpNo(),"RECRUITER");
								cell = row.createCell(10);
								if(user!=null) {
								cell.setCellValue(user.getUserName());
								}
								UserDTO tlname = recruitmentDAO.getUserNameByEmpNo(candiStatusOBJ.getTlEmpNo(),"TEAMLEAD");
								cell = row.createCell(11);
								if(tlname!=null) {
								cell.setCellValue(tlname.getUserName());
								}
								cell = row.createCell(12);
								cell.setCellValue(caninfo.getEmailID());

								cell = row.createCell(13);
								cell.setCellValue(caninfo.getPrimaryskill());

								cell = row.createCell(14);
								cell.setCellValue(interviewObj.getModeofinterview());

								cell = row.createCell(15);
								cell.setCellValue(interviewObj.getInterviewdate());

								cell = row.createCell(16);
								cell.setCellValue(caninfo.getSkypeid());

								i++;
							}

						}
					}

				} else {

					UserDTO userbd = recruitmentDAO.getUserNameByEmpNo(jobdescription.getCreatedby(),"BDM");
					row = spreadsheet.createRow(i);
					cell = row.createCell(0);
					cell.setCellValue(jobdescription.getCmpny_name());
					cell = row.createCell(1);
					if(userbd!=null) {
					cell.setCellValue(userbd.getUserName());
					}
					cell = row.createCell(2);
					cell.setCellValue(jobdescription.getJobDescription());
					i++;

				}

				// i++;
			}

			FileOutputStream out = new FileOutputStream(new File("ViewSCTProfileStatus.xlsx"));
			// workbook.write(out);
			workbook.write(response.getOutputStream());
			out.close();
			workbook.close();
		}

	}

	@RequestMapping(value = { "/all_tlreport" }, method = RequestMethod.GET)
	public String all_tlreport(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			List<CompanyDescription> clients = recruitmentDAO.getAllClients();
			model.addAttribute("clients", clients);

			return "AllTLReports";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/view_jdbyclid" }, method = RequestMethod.GET)
	@ResponseBody
	public List<Jobdescription> view_jdbyclid(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {

		Integer compid = Integer.parseInt(req.getParameter("compid"));
		List<Jobdescription> jdList1 = new ArrayList<>();
		List<Jobdescription> jdList = recruitmentDAO.getJobCodeByCompId(compid);
		HashMap<String, Integer> jdMap = new HashMap<String, Integer>();
		List<HashMap<String, Integer>> mapList = new ArrayList<>();
		Iterator it = jdList.iterator();
		while (it.hasNext()) {
			Jobdescription jd = new Jobdescription();

			Object[] obj = (Object[]) it.next();
			String jobcode = (String) obj[0];
			int jobid = (int) obj[1];
			jdMap.put(jobcode, jobid);
			jd.setJobCode(jobcode);
			jd.setJobdescid(jobid);

			jdList1.add(jd);
		}
		return jdList1;
	}

	@RequestMapping(value = { "/Tl_Dashboard_For_Recruiter" }, method = RequestMethod.GET)
	public String countForTl(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, Exception {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			List<TLDAshboardCountDTO> tlList = new ArrayList<>();
			List<CompanyDescription> clients = recruitmentDAO.getAllClients();
			String jobid = req.getParameter("jobid");
			String clname = req.getParameter("clientname");
			String fdate = req.getParameter("fromDate");
			String tdate = req.getParameter("endDate");
			Date fd = null;
			Date td = null;
			String todate = null;
			String fromdate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (fdate != null) {
				fd = sdf.parse(fdate);
			}
			if (tdate != null) {
				td = sdf.parse(tdate);
			}
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			if (fd != null) {
				fromdate = formatter.format(fd);
			}
			if (td != null) {
				todate = formatter.format(td);
			}

			logger.info("fromdate***" + fromdate + "todate**" + todate);

			Integer _jobdescid = null;
			if (jobid != null) {
				_jobdescid = Integer.parseInt(jobid);
			}
			Integer cid = 0;
			if (clname != null) {
				cid = Integer.parseInt(clname);
			}
			List<Integer> jaList = recruitmentDAO.getAssignedTlByJobid(_jobdescid, fromdate, todate);
			for (Integer _tl : jaList) {
				TLDAshboardCountDTO tlDto = new TLDAshboardCountDTO();
				UserDTO tlObj = recruitmentDAO.getUserNameByEmpNo(_tl,"TEAMLEAD");
				Integer recCount = recruitmentDAO.getRecCountByTL(_tl, _jobdescid, fromdate, todate);
				Integer recSubCount = recruitmentDAO.getRecSubCount1(_jobdescid, _tl, fromdate, todate);
				Integer sctClearedCount = recruitmentDAO.getSctClearedCount1(_jobdescid, _tl, fromdate, todate);
				Integer tlClearesdCount = recruitmentDAO.getTlClearedCount(_jobdescid, _tl, fromdate, todate);
				Integer clientClearedCount = recruitmentDAO.getclientClearedCount(_jobdescid, _tl, fromdate, todate);
if(tlObj!=null) {
				tlDto.setTlname(tlObj.getUserName());
}
				tlDto.setRecruitercount(recCount);
				tlDto.setRecruiterSubmiitedCount(recSubCount);
				tlDto.setSctclearedCount(sctClearedCount);
				tlDto.setTlclearedCount(tlClearesdCount);
				tlDto.setClientclearedCount(clientClearedCount);

				tlList.add(tlDto);

			}
			Jobdescription jobdec = recruitmentDAO.getjobDescriptionByJobID(_jobdescid);
			String description = jobdec.getJobCode();
			String comname = recruitmentDAO.getCompanyNameByjobId(cid);

			model.addAttribute("clients", clients);
			model.addAttribute("tlList", tlList);
			model.addAttribute("jobdec", description);
			model.addAttribute("comname", comname);
			return "AllTLReports";

		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	// Integrated by lavanya

	@RequestMapping(value = { "/getRecSubmissionByjob" }, method = RequestMethod.POST)
	@ResponseBody
	public List<RecruiterPerformanceDTO> getRecSubmissionByjob(Model model, HttpServletRequest req)
			throws HandlingException {
		String recempno = req.getParameter("recempno");
		String recname = req.getParameter("recname");
		String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("enddate");
		String tlname = req.getParameter("tlname");
		String tlemp = req.getParameter("tlemp");
		logger.info("getRecSubmissionByjob" + recempno + " " + recname + " " + fromdate + " " + todate + " "
				+ tlname + " " + tlemp);
		Integer rEmpno = null;
		List<RecruiterPerformanceDTO> recruiterPerformanceDTOList = new ArrayList<>();
		if (!recempno.isEmpty()) {
			rEmpno = Integer.parseInt(recempno);
		}
		Integer tEmpno = null;
		if (!tlemp.isEmpty()) {
			tEmpno = Integer.parseInt(tlemp);
		}
		List<Integer> jdList = recruitmentDAO.getjobDescriptionByRecruiter(rEmpno, tEmpno, fromdate, todate);
		logger.info(jdList.size() + "jdList");
		for (Integer jobids : jdList) {

			if (jobids != null) {
				RecruiterPerformanceDTO recDto = new RecruiterPerformanceDTO();
				Jobdescription jcObj = recruitmentDAO.getjobDescriptionByJobID(jobids);
				String jobcode = jcObj.getJobCode();
				String compnyname = jcObj.getCompany().getCmpny_name();
				Integer recSubCount = recruitmentDAO.getRecSubCount(rEmpno, tEmpno, fromdate, todate, jobids);
				Integer sctClearedCount = recruitmentDAO.getSctClearedCount(rEmpno, tEmpno, fromdate, todate, jobids);
				Integer clientstatus = recruitmentDAO.getClientstatus(rEmpno, tEmpno, fromdate, todate, jobids);
				recDto.setRecsub(recSubCount);
				recDto.setCompanyname(compnyname);
				recDto.setSctCleared(sctClearedCount);
				recDto.setClientCleared(clientstatus);
				recDto.setJobcode(jobcode);
				recDto.setTlName(tlname);
				recDto.setRecName(recname);
				recruiterPerformanceDTOList.add(recDto);

			}
		}
		return recruiterPerformanceDTOList;

	}

	@RequestMapping(value = { "ALLTL_report" }, method = RequestMethod.GET)
	public String ALLTL_report(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		return "TLReports";

	}

	@RequestMapping(value = { "ALLTL_reportbydate" }, method = RequestMethod.GET)
	public String countForTlDashBoard(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String username = (String) req.getSession().getAttribute("username");
		String role = (String) req.getSession().getAttribute("role");
		String fdate = req.getParameter("fromDate");
		String tdate = req.getParameter("endDate");
		Date fd = null;
		Date td = null;
		String todate = null;
		String fromdate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (fdate != null) {
			fd = sdf.parse(fdate);
		}
		if (tdate != null) {
			td = sdf.parse(tdate);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if (fd != null) {
			fromdate = formatter.format(fd);
		}
		if (td != null) {
			todate = formatter.format(td);
		}
		if (username != null) {
			if (role.equalsIgnoreCase("TEAMLEAD")) {
				List<TLDAshboardCountDTO> tlList = new ArrayList<>();
				// List<JobAllocationDTO> jaList=recruitmentDAO.getAllJobDesc(loginEmpNumber);
				UserDTO tlname = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
				List<Integer> rList = recruitmentDAO.getAssignedRecByTl(loginEmpNumber, fromdate, todate);
				for (Integer rec : rList) {

					TLDAshboardCountDTO tlDto = new TLDAshboardCountDTO();
					UserDTO recObj = recruitmentDAO.getUserNameByEmpNo(rec,"RECRUITER");
					if(recObj!=null) {
					int recempno = recObj.getEmp_number();
					Integer recSubCount = recruitmentDAO.getRecSubCount(recempno, loginEmpNumber, fromdate, todate,
							null);
					Integer sctClearedCount = recruitmentDAO.getSctClearedCount(recempno, loginEmpNumber, fromdate,
							todate, null);
					Integer clientstatus = recruitmentDAO.getClientstatus(recempno, loginEmpNumber, fromdate, todate,
							null);

					tlDto.setRecname(recObj.getUserName());
					
					tlDto.setRecruiterSubmiitedCount(recSubCount);
					tlDto.setSctclearedCount(sctClearedCount);
					tlDto.setTlname(tlname.getUserName());
					
					tlDto.setClientstatus(clientstatus);
					tlDto.setRecEmpno(recempno);
					tlDto.setTlemp(loginEmpNumber);

					tlList.add(tlDto);
				}
				}
				model.addAttribute("tlList", tlList);
				model.addAttribute("fromdate", fromdate);
				model.addAttribute("todate", todate);
				model.addAttribute("loginEmpNumber", loginEmpNumber);
				// model.addAttribute("recempno", recempno);

			} else {

				List<TLDAshboardCountDTO> tlList = new ArrayList<>();
				List<Integer> jaList = recruitmentDAO.getAssignedTlByJobid();

				logger.info("TL List" + jaList.size());
				for (Integer _tl : jaList) {

					UserDTO tlObj = recruitmentDAO.getUserNameByEmpNo(_tl,"TEAMLEAD");
					List<Integer> rList = recruitmentDAO.getAssignedRecByTl(_tl, fromdate, todate);
					for (Integer recempno : rList) {
						TLDAshboardCountDTO tlDto = new TLDAshboardCountDTO();
						UserDTO recObj = recruitmentDAO.getUserNameByEmpNo(recempno,"RECRUITER");

						Integer recSubCount = recruitmentDAO.getRecSubCount(recempno, _tl, fromdate, todate, null);
						Integer sctClearedCount = recruitmentDAO.getSctClearedCount(recempno, _tl, fromdate, todate,
								null);
						Integer clientstatus = recruitmentDAO.getClientstatus(recempno, _tl, fromdate, todate, null);

						tlDto.setRecname(recObj.getUserName());
						tlDto.setRecruiterSubmiitedCount(recSubCount);
						tlDto.setSctclearedCount(sctClearedCount);
						if(tlObj!=null) {
						tlDto.setTlname(tlObj.getUserName());
						}
						tlDto.setClientstatus(clientstatus);
						tlDto.setRecEmpno(recempno);
						tlDto.setTlemp(_tl);
						tlList.add(tlDto);
					}
				}
				model.addAttribute("tlList", tlList);
				model.addAttribute("fromdate", fromdate);
				model.addAttribute("todate", todate);
				model.addAttribute("loginEmpNumber", loginEmpNumber);
			}
			return "TLReports";

		} else {

			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/SctReportsCount" }, method = RequestMethod.GET)
	public String all_sctreport(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");
		List<RecruitmentportalLogin> bdList = null;
		bdList = recruitmentDAO.getBdNames();
		if (username != null) {

			model.addAttribute("bdList", bdList);
			return "SctReportsCount";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/closedRequirements" }, method = RequestMethod.GET)
	public String closedRequirements(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			return "closedRequirements";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/SctReportByBdName" }, method = RequestMethod.GET)
	public String SctReportByBdName(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		String username = (String) req.getSession().getAttribute("username");
		HttpSession session = req.getSession(true);
		List<RecruitmentportalLogin> bdList = null;
		bdList = recruitmentDAO.getBdNames();

		List<TLDAshboardCountDTO> sctrepList = new ArrayList<TLDAshboardCountDTO>();

		if (username != null) {
			String bdEmpNo = req.getParameter("bdempno");
			Integer bdNumber = null;

			String jdcategory = req.getParameter("jdcategory");

			String fdate = req.getParameter("fromDate");
			String tdate = req.getParameter("endDate");

			if (!bdEmpNo.isEmpty()) {
				bdNumber = Integer.parseInt(bdEmpNo);
			}
			Date fd = null;
			Date td = null;
			String todate = null;
			String fromdate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (fdate != null) {
				fd = sdf.parse(fdate);
			}
			if (tdate != null) {
				td = sdf.parse(tdate);
			}
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			if (fd != null) {
				fromdate = formatter.format(fd);
			}
			if (td != null) {
				todate = formatter.format(td);
			}

			List<SctReportDto> jobList = null;
			if (bdEmpNo.isEmpty() && jdcategory.isEmpty()) {

				jobList = recruitmentDAO.getJobIdByAllJdCategory(fromdate, todate);
			} else if (!bdEmpNo.isEmpty() && jdcategory.isEmpty()) {
				jobList = recruitmentDAO.getJobIdByBdmAllJdCategory(bdNumber, fromdate, todate);
			} else if (bdEmpNo.isEmpty() && !jdcategory.isEmpty()) {
				jobList = recruitmentDAO.getJobIdByJdCategoryAllBdm(fromdate, todate, jdcategory);
			} else {
				jobList = recruitmentDAO.getJobIdByJdCategory(bdNumber, jdcategory, fromdate, todate);
			}
			Map<String, Integer> bdMap = recruitmentDAO.getCcategoryCountByDates(fromdate, todate);
			Map<String, Integer> bdMapFte = recruitmentDAO.getFTEcategoryCountByDates(fromdate, todate);


			// String tlname=null;
			TLDAshboardCountDTO tlDto = null;

			for (SctReportDto jd : jobList) {

				tlDto = new TLDAshboardCountDTO();
				String bdnmae = null;
				Integer tlSubCount = recruitmentDAO.getTlSubCount(jd.getJobdescid(), jd.getTlEmpNo(), fromdate, todate);
				Integer sctClearedCount = recruitmentDAO.getSctClearedCountByTlsub(jd.getJobdescid(), jd.getTlEmpNo(),
						fromdate, todate);

				if (jd.getBdname() == null) {
					bdnmae = "Internal BD";
				}
				bdnmae = jd.getBdname();
				tlDto.setBdname(bdnmae);
				tlDto.setCatname(jd.getJdCategory());
				tlDto.setSctclearedCount(sctClearedCount);
				tlDto.setTlclearedCount(tlSubCount);
				tlDto.setTlname(jd.getTlname());
				tlDto.setJobcode(jd.getJobcode());
				tlDto.setClientname(jd.getCompany());
				sctrepList.add(tlDto);
			}

			model.addAttribute("bdList", bdList);
			model.addAttribute("fdate", fdate);
			model.addAttribute("tdate", tdate);
			model.addAttribute("sctrepList",sctrepList);
			model.addAttribute("bdMap", bdMap);
			model.addAttribute("bdMapFte", bdMapFte);

			session.setAttribute("sctrepList", sctrepList);

			return "SctReportsCount";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}

	@RequestMapping(value = { "/seacrhclosedRequirements" }, method = RequestMethod.GET)
	public String SearchClosedRequirements(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		String username = (String) req.getSession().getAttribute("username");
		String role = (String) req.getSession().getAttribute("role");
		try {
			if (username != null) {

				String fdate = req.getParameter("fromDate");
				String tdate = req.getParameter("endDate");

				String designation = (String) req.getSession().getAttribute("role");

				List<DisplayRequirementsDTO> jobList = recruitmentDAO.getAllClosedJobDescriptionByDate(loginEmpNumber,
						fdate, tdate);
				List<CompanyDescription> clientList = recruitmentDAO.getAllClients();
				Integer departmentId = (Integer) req.getSession().getAttribute("department");
				List<RecruitmentportalLogin> managerList = recruitmentDAO.getManagers();
				model.addAttribute("managerList", managerList);

				model.addAttribute("clientList", clientList);
				model.addAttribute("departmentId", departmentId);
				model.addAttribute("jobList", jobList);
				return "closedRequirements";
			}
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		} catch (Exception ex) {
			logger.error("Exception due to:", ex);

			String content = ex.toString();
			StringWriter errors = new StringWriter();
			ex.printStackTrace(new PrintWriter(errors));
			throw new HandlingException("Exception due to", errors.toString(), content);
		}
	}

	@RequestMapping(value = { "/ExportSctReportsCount" }, method = RequestMethod.GET)
	public void ExportSctReportsCount(HttpServletRequest req, HttpServletResponse response)
			throws IOException, HandlingException {
		int ttl_sub = 0;
		int ttl_cleared = 0;
		List<TLDAshboardCountDTO> sctrepList = (List<TLDAshboardCountDTO>) req.getSession().getAttribute("sctrepList");
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=SctReportsCount.xlsx");
		Workbook workbook = new SXSSFWorkbook();

		SXSSFSheet spreadsheet = null;
		spreadsheet = (SXSSFSheet) workbook.createSheet("SctReportsCount");

		SXSSFRow row = spreadsheet.createRow(0);
		Cell cell;
		cell = row.createCell(0);
		cell.setCellValue("BD Name");
		cell = row.createCell(1);
		cell.setCellValue("Delivery lead");
		cell = row.createCell(2);
		cell.setCellValue("Category Name");
		cell = row.createCell(3);
		cell.setCellValue("Profiles submitted Count");
		cell = row.createCell(4);
		cell.setCellValue("Client Name");
		cell = row.createCell(5);
		cell.setCellValue("Job Id");
		/*
		 * cell=row.createCell(6); cell.setCellValue("SAT Submitted Date");
		 */
		cell = row.createCell(6);
		cell.setCellValue("SAT Cleared Count");

		int i = 1;
		for (TLDAshboardCountDTO tldAshboardCountDTO : sctrepList) {

			ttl_sub = ttl_sub + tldAshboardCountDTO.getTlclearedCount();
			ttl_cleared = ttl_cleared + tldAshboardCountDTO.getSctclearedCount();

			row = spreadsheet.createRow(i);

			cell = row.createCell(0);
			cell.setCellValue(tldAshboardCountDTO.getBdname());
			cell = row.createCell(1);
			cell.setCellValue(tldAshboardCountDTO.getTlname());
			cell = row.createCell(2);
			cell.setCellValue(tldAshboardCountDTO.getCatname());
			cell = row.createCell(3);
			cell.setCellValue(tldAshboardCountDTO.getTlclearedCount());
			cell = row.createCell(4);
			cell.setCellValue(tldAshboardCountDTO.getClientname());
			cell = row.createCell(5);
			cell.setCellValue(tldAshboardCountDTO.getJobcode());
			/*
			 * cell=row.createCell(6);
			 * cell.setCellValue(tldAshboardCountDTO.getSctsubdate());
			 */
			cell = row.createCell(6);
			cell.setCellValue(tldAshboardCountDTO.getSctclearedCount());

			i++;
		}
		SXSSFRow trow = spreadsheet.createRow(i++);
		cell = trow.createCell(0);
		cell.setCellValue("Total");
		cell = trow.createCell(3);
		cell.setCellValue(ttl_sub);
		cell = trow.createCell(6);
		cell.setCellValue(ttl_cleared);

		FileOutputStream out = new FileOutputStream(new File("SctReportsCount.xlsx"));
		// workbook.write(out);
		workbook.write(response.getOutputStream());
		out.close();
		logger.info("SctReportsCount.xlsx written successfully");
	}

	@RequestMapping(value = "/checkResumeName", method = RequestMethod.GET)
	@ResponseBody
	public String checkResumeName(HttpServletRequest req) throws HandlingException {
		String FileName = req.getParameter("FileName");
		String fileNameObj = recruitmentDAO.checkResumeExistorNot(FileName);
		return fileNameObj;
	}

	@RequestMapping(value = { "/bdmRequirements" }, method = RequestMethod.GET)
	public String bdmRequirements(Model model, HttpServletRequest req) throws HandlingException {
		String username = (String) req.getSession().getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");
		List<CompanyDescription> clients;
		List<RecruitmentportalLogin> bdList;
		if (username != null) {

			clients = recruitmentDAO.getAllClients();
			bdList = recruitmentDAO.getBdNames();
			List<ViewUserProfilesSCTStatusDTO> viewcandidateinformationlist = recruitmentDAO
					.getBdReportByLoginBd(loginEmpNumber);

			model.addAttribute("clients", clients);
			model.addAttribute("bdList", bdList);
			model.addAttribute("viewcandidateinformationlist", viewcandidateinformationlist);
			return "BDMReports";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	@RequestMapping(value = { "/bdreportbyclient" }, method = RequestMethod.GET)
	public String bdmRequirementsBySearch(HttpServletRequest req, Model model, HttpServletResponse res)
			throws HandlingException, IOException {
		String username = (String) req.getSession().getAttribute("username");

		List<CompanyDescription> clients;
		List<RecruitmentportalLogin> bdList;
		if (username != null) {
			try {
				String client = req.getParameter("clientname");
				String bdm = req.getParameter("bdname");
				String fromdate = req.getParameter("fromdate");
				String todate = req.getParameter("todate");

				clients = recruitmentDAO.getAllClients();
				bdList = recruitmentDAO.getBdNames();

				List<ViewUserProfilesSCTStatusDTO> viewcandidateinformationlist = recruitmentDAO
						.getBdReportByClientAndBD(client, bdm, fromdate, todate);

				model.addAttribute("clients", clients);
				model.addAttribute("bdList", bdList);
				model.addAttribute("viewcandidateinformationlist", viewcandidateinformationlist);
			} catch (Exception e) {
				logger.info("Technical in bd report--" + e.toString());

			}
			return "BDMReports";
		}

		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	/* Suryprabha */
	@RequestMapping(value = { "/update_BdmReportStatus" }, method = RequestMethod.POST)
	public String update_BdmReportStatus(HttpServletRequest req, Model model) throws HandlingException, ParseException {
		String role = (String) req.getSession().getAttribute("role");
		String username = (String) req.getSession().getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		if (username != null) {
			// UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber);
			String candidateid1 = req.getParameter("bdu_candidateid");
			String jobid = req.getParameter("jobid");
			String empLead = req.getParameter("empLead");
			String sourcedBy = req.getParameter("sourcedBy");

			Integer candidateid = null;
			if (candidateid1 != null) {
				candidateid = Integer.parseInt(candidateid1);
			}
			Integer jobId = null;
			if (jobid != null) {
				jobId = Integer.parseInt(jobid);
			}

			Integer leadEmp = null;
			Integer sourcedByEmp = null;

			if (sourcedBy != null) {
				sourcedByEmp = Integer.parseInt(sourcedBy);
			}
			if (empLead != null) {
				leadEmp = Integer.parseInt(empLead);
			}

			String candidateName = req.getParameter("candidateName");
			String comment = req.getParameter("comment");
			String status = req.getParameter("bdResltStatus");
			String jobCode = recruitmentDAO.getJobCodeById(jobId);

			String ccMail = "requirements@tekskills.in";
			Date recSubmitDate = new Date();
			CandidateStatus candidateStatus = recruitmentDAO.getCandidateStatusTableByCandidateId(candidateid, jobId);
			if (candidateStatus != null) {
				candidateStatus.setBdmStatus(status);
				candidateStatus.setBdmComment(comment);
				candidateStatus.setBdmSubmitDate(recSubmitDate);
				candidateStatus.setBdmEmpNo(loginEmpNumber);

				recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);

				List<String> ccList = new ArrayList<>();
				ccList.add(ccMail);

				String recruitername = null;

				String bdmail = recruitmentDAO.getBdEmailByBdName(username);
				String recmail = recruitmentDAO.getusermailbyempno(sourcedByEmp);
				String leadEmail = recruitmentDAO.getusermailbyempno(leadEmp);
				if (status.equalsIgnoreCase("Selected")) {
					ccList.add(bdmail);
					ccList.add(recmail);

				} else {
				}

				if (status.equalsIgnoreCase("To Client")) {
					JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobId);
					if (jobstatus.getJdStatus() != null && jobstatus.getJdStatus().equalsIgnoreCase("Idle")) {
						jobstatus.setJdStatus("Working");
						recruitmentDAO.updateJobStatusByJobId(jobstatus);
					}
				} else {

				}

				if (leadEmail != null) {

					String subject = jobCode;
					String name = "Team";
					String message = "";

					try {
						newEmail.sendMailRectoTL(bdmail, leadEmail, subject, message, null, name, empLead, ccList, role,
								candidateName, jobCode, recruitername, status, null, null);

					} catch (Exception e) {
						logger.error("Exception raised due to:" + e);
					}
				}
			}
			return "redirect:/bdmRequirements";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	@RequestMapping(value = { "/update_BdmClientReportStatus" }, method = RequestMethod.POST)
	public String update_BdmClientReportStatus(HttpServletRequest req, Model model)
			throws HandlingException, ParseException {
		String role = (String) req.getSession().getAttribute("role");
		String username = (String) req.getSession().getAttribute("username");
		Integer loginEmpNumber = (Integer) req.getSession().getAttribute("empNumber");

		if (username != null) {
			UserDTO fromUserObj = recruitmentDAO.getUserNameByEmpNo(loginEmpNumber,role);
			String candidateid1 = req.getParameter("candidateid");
			String jobid = req.getParameter("jobid");
			String empLead = req.getParameter("empLead");
			String sourcedBy = req.getParameter("sourcedBy");
			String bdStatus = req.getParameter("bdStatus");

			Integer candidateid = null;
			if (candidateid1 != "") {
				candidateid = Integer.parseInt(candidateid1);
			}
			Integer jobId = null;
			if (jobid != "") {
				jobId = Integer.parseInt(jobid);
			}
			Integer leadEmp = null;
			Integer sourcedByEmp = null;
			if (sourcedBy != null) {
				sourcedByEmp = Integer.parseInt(sourcedBy);
			}
			if (empLead != null) {
				leadEmp = Integer.parseInt(empLead);
			}

			String clicomment = req.getParameter("clientcoment");
			String candidateName = req.getParameter("candidateName");
			// String reject_reason = req.getParameter("reject_reason");
			String choosereject_reason = req.getParameter("choosereject_reason");

			String jobCode = recruitmentDAO.getJobCodeById(jobId);
			String clistatus = req.getParameter("cliStatus");
			String obDate = req.getParameter("onBoardDate");

			String ccMail = "requirements@tekskills.in";
			Date recSubmitDate = new Date();
			CandidateStatus candidateStatus = recruitmentDAO.getCandidateStatusTableByCandidateId(candidateid, jobId);
			List<String> ccList = new ArrayList<>();
			ccList.add(ccMail);

			UserDTO sourcedbyObj = recruitmentDAO.getUserNameByEmpNo(sourcedByEmp,"RECRUITER");
			String recruitername = null;
			if (sourcedbyObj != null) {
				recruitername = sourcedbyObj.getUserName();
				String recEmail = sourcedbyObj.getEmail();
				ccList.add(recEmail);
			}
			String bdName = req.getParameter("bdName");
			String bduName = recruitmentDAO.getUserNameByBdName(bdName);
			String bdmdetails = recruitmentDAO.getBdEmailByBdName(bduName);
			ccList.add(bdmdetails);

			JobStatus jobstatus = recruitmentDAO.getJobStatusTableByJobId(jobId);
			if (jobstatus.getJdStatus() != null && jobstatus.getJdStatus().equalsIgnoreCase("Idle")) {
				jobstatus.setJdStatus("Working");
				recruitmentDAO.updateJobStatusByJobId(jobstatus);
			}

			Date onBoardDate = null;
			if (!obDate.isEmpty()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				onBoardDate = sdf.parse(obDate);
				candidateStatus.setRejectReason("");
			} else {
			}

			candidateStatus.setBdmSubmitDate(recSubmitDate);
			candidateStatus.setBdmEmpNo(loginEmpNumber);
			candidateStatus.setClientStatus(clistatus);
			if (clicomment != "") {
				candidateStatus.setClientComment(clicomment);
			}
			candidateStatus.setOnBoardDate(onBoardDate);
			if (choosereject_reason != "") {
				candidateStatus.setRejectReason(choosereject_reason);
			} else {

			}

			recruitmentDAO.saveCandidateStutusByCandidateID(candidateStatus);
			UserDTO leadObj = recruitmentDAO.getUserNameByEmpNo(leadEmp,"TEAMLEAD");
			if (leadObj != null) {
				String leadEmail = leadObj.getEmail();
				String leadName = leadObj.getUserName();
				String subject = jobCode;
				String name = "Team";
				String message = "";
if(fromUserObj!=null) {
				try {
					newEmail.sendMailRectoTL(fromUserObj.getEmail(), leadEmail, subject, message, null, name, leadName,
							ccList, role, candidateName, jobCode, recruitername, bdStatus, null, clistatus);

				} catch (Exception e) {
					logger.error("Exception raised due to:" + e);
				}
			}
			}
			return "redirect:/bdmRequirements";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	@RequestMapping(value = { "/CcategoryReport" }, method = RequestMethod.GET)
	public String CcategoryReport(Model model, HttpServletRequest req) throws HandlingException {
		String username = (String) req.getSession().getAttribute("username");
		if (username != null) {
			return "CcategoryReport";
		}
		model.addAttribute("sessionmsg", "Session Expired");
		return "redirect:/loginpage";
	}

	@RequestMapping(value = { "cCategoryReportBySearch" }, method = RequestMethod.GET)
	public String cCategoryReportByDate(Model model, HttpServletRequest req, HttpServletResponse response)
			throws HandlingException, IOException, ParseException {
		String username = (String) req.getSession().getAttribute("username");
		String fdate = req.getParameter("fromDate");
		String tdate = req.getParameter("endDate");
		Date fd = null;
		Date td = null;
		String todate = null;
		String fromdate = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (fdate != null) {
			fd = sdf.parse(fdate);
		}
		if (tdate != null) {
			td = sdf.parse(tdate);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		if (fd != null) {
			fromdate = formatter.format(fd);
		}
		if (td != null) {
			todate = formatter.format(td);
		}
		logger.info("fromdate****" + fromdate + "todate****" + todate);
		if (username != null) {
			List<CCategoryReportDTO> cCatList = recruitmentDAO.cCategoryReportByDate(fromdate, todate);
			model.addAttribute("cCatList", cCatList);
			model.addAttribute("fromdate", fromdate);
			model.addAttribute("todate", todate);
			return "CcategoryReport";
		} else {
			model.addAttribute("sessionmsg", "Session Expired");
			return "redirect:/loginpage";
		}
	}
}
