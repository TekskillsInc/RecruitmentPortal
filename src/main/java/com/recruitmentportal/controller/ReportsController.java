
package com.recruitmentportal.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFRow;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recruitmentportal.DAO.ReportsDao;
import com.recruitmentportal.DTO.MainReport;
import com.recruitmentportal.DTO.MainReportDTO;

@Controller
public class ReportsController {

	
	@Autowired
	private ReportsDao report;
	
	
	//private static final Logger logger = Logger.getLogger(ReportsController.class);

		@RequestMapping(value = { "/getMainReport" }, method = RequestMethod.GET)
	public String getMasterReport() {

		return "mainReport";
	}
		
	@RequestMapping(value = { "/getMasterReport" }, method = RequestMethod.GET)
	public String getMainReport(Model model,HttpServletRequest req,
			@RequestParam(value = "fromDate", required = true) String fromDate,
			@RequestParam(value = "endDate", required = true) String endDate) throws ParseException,
	HandlingException {
		HttpSession session = req.getSession(true);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date fDate = null;
		Date tDate = null;
		String frmDate = null;
		String toDate = null;
		Date dateempty = null;
		List<MainReport> recruiterMainReportlist = new ArrayList<MainReport>();
		if (!fromDate.equals("") && fromDate != null) {
			fDate = sdf.parse(fromDate);
			frmDate=sdf1.format(fDate);
		}
		if (!endDate.equals("") && endDate != null) {
			tDate = sdf.parse(endDate);
			toDate=sdf1.format(tDate);
		}
		
		
		List results = report.getAllJobId(frmDate, toDate);
		Iterator itr = results.iterator();
		MainReportDTO mainDto=new MainReportDTO();
		
		while (itr.hasNext()) {
			int profileNo=0;
			Object[] obj = (Object[]) itr.next();

			String clientName = (String) obj[0];
			String type = (String) obj[1];
			String account = (String) obj[2];
			String bdm1 = (String) obj[3];
			String bdm = null;
			String sender = (String) obj[4];
			String jdCategory=(String) obj[5];
			String requirement = (String) obj[6];
			String technology = (String) obj[7];
			Integer positions = (Integer) obj[8];
			String locations = (String) obj[9];
			String req_lable = (String) obj[10];
			String recievedTime1 = (String) obj[11];
			Date recievedTime=null;
			if (recievedTime1 != null) {
				recievedTime = sdf2.parse(recievedTime1);
				
			}
			
	        String priority =(String) obj[12];
	        String req_status=(String) obj[33];
	        if(bdm1.isEmpty()) {
	        	bdm="internal Bd";
	        }
	        else {
	        	bdm=bdm1;
	        }
	        String Team_Lead_Name=(String) obj[13];
	        String bdAssDate1=(String) obj[14];
	        
	        Date bdAssDate=null;
			if (bdAssDate1 != null) {
				bdAssDate = sdf2.parse(bdAssDate1);
				
			}
			
			
			String assignedTo=(String) obj[15];
			String tlAssDate1=(String) obj[16];
			 Date tlAssDate=null;
				if ( tlAssDate1 != null) {
					tlAssDate = sdf2.parse(tlAssDate1);
					
				}
			
	        String rec=(String) obj[17];
	        String consultantName = (String) obj[18];
			String contactNo = (String) obj[19];
			
	        
			String recSubTime1= (String) obj[20];
			Date recSubTime=null;
			if (recSubTime1 != null) {
				recSubTime = sdf2.parse(recSubTime1);
				
			}
		
	        String toLead = (String) obj[21];
	        String p_status = (String) obj[22];
	        String sctTeam = (String) obj[23];
	        
	        String sctRecTime1 = (String) obj[24];
	        Date sctRecTime=null;
			if (sctRecTime1 != null) {
				sctRecTime = sdf2.parse(sctRecTime1);
				
			}
	        String sctReponseTime1 = (String) obj[25];
	        Date sctReponseTime=null;
			if (sctReponseTime1 != null) {
				sctReponseTime = sdf2.parse(sctReponseTime1);
				
			}
			
	        String profileSubTime1 = (String) obj[26];
			
	        Date profileSubTime=null;
			if (profileSubTime1 != null) {
				profileSubTime = sdf2.parse(profileSubTime1);
				
			}
			String submittedto=(String) obj[27];

			
			String cliStatus = (String) obj[28];
			String interviewDate1 = (String) obj[29];
			Date interviewDate=null;
			if (interviewDate1 != null) {
				interviewDate = sdf2.parse(interviewDate1);
				
			}
			String cliComment =(String) obj[31];
			String rejectReason = (String) obj[30];
			String onboardingDate1 = (String) obj[32];
			Date onboardingDate=null;
			if (onboardingDate1 != null) {
				onboardingDate = sdf1.parse(onboardingDate1);
				
			}
			String tlStatus=(String) obj[34];
			String sctStatus = (String) obj[35];
			
			
			//int prono=fnGetProNo(p_status,requirement);
		
									MainReport jobDescObj = new MainReport();
            						jobDescObj.setClient(clientName);
            						jobDescObj.setPriority(priority);
            						jobDescObj.setType(type);
            						jobDescObj.setAccount(account);
            						jobDescObj.setBdm(bdm);
            						jobDescObj.setSender(sender);
            						jobDescObj.setRequirement(requirement);
            						jobDescObj.setTechnology(technology);
            						jobDescObj.setPositions(positions);
            						jobDescObj.setLocations(locations);
            						jobDescObj.setReq_lable(req_lable);
            						jobDescObj.setRecievedTime(recievedTime);
            						jobDescObj.setRequirementStatus(req_status);
            						jobDescObj.setAssignedTo(assignedTo);
            						jobDescObj.setTlAssignedON(tlAssDate);
            						jobDescObj.setJdCategory(jdCategory);
            						jobDescObj.setTlName(Team_Lead_Name);
            						jobDescObj.setBdmAssignedON(bdAssDate);
            							
            							if (rec != null) {
            								jobDescObj.setRec(rec);
            							}
            							if (!toLead.isEmpty() ) {
            								jobDescObj.setToLeads(toLead);
            							}
            							else {
            								jobDescObj.setToLeads(Team_Lead_Name);
            							}
            							if (sctTeam != null) {
            								jobDescObj.setSctTeam(sctTeam);
            							}
            							jobDescObj.setSctStatus(sctStatus);
            							jobDescObj.setTime(recSubTime);
            							jobDescObj.setCandidateStatus(cliStatus);
            							jobDescObj.setComment(cliComment);
            							jobDescObj.setOnboardingDate(onboardingDate);
            							jobDescObj.setRejectReason(rejectReason);
            							jobDescObj.setConsultant(consultantName);
            							jobDescObj.setConsultantContNo(contactNo);
            							String profileStaus=fnGetPStatus(tlStatus,toLead,Team_Lead_Name,sctStatus,p_status,bdm);
            							if (interviewDate != null) {
            									jobDescObj.setInterviewDate(interviewDate);
            								}
            							if(tlStatus!=null) {
            								if(tlStatus.equalsIgnoreCase("TL reject")||tlStatus.equalsIgnoreCase("On Hold")) {
            									
            									//jobDescObj.setSctReceTime(dateempty);
            									jobDescObj.setSctReceTime(null);
            									
            							 }
            								else {
            									jobDescObj.setSctReceTime(sctRecTime);
            								}
            							}


            							if(sctStatus!=null) {
            								jobDescObj.setSctRespTime(sctReponseTime);
            								
            							}
        								if (p_status == null) {
        									jobDescObj.setSubmittedTo("");

        								} 
        								else if (p_status.isEmpty()) {
        									jobDescObj.setSubmittedTo("");
        									

        								} 
        								else if (p_status.equalsIgnoreCase("To Client")||p_status.equalsIgnoreCase("To Client-SCT Pending")) {
        									jobDescObj.setSubmittedTo(submittedto);
        									jobDescObj.setProfileNo(profileNo+1);
        									
        									jobDescObj.setProfileSubTime(profileSubTime);
        								}else {
        									
        								}
        								jobDescObj.setP_status(profileStaus);
        								
        							
            							recruiterMainReportlist.add(jobDescObj);
            							} 
		
                          		
            						
		mainDto.setMainRerportList(recruiterMainReportlist);
		session.setAttribute("recruiterMainReportlist", recruiterMainReportlist);
		model.addAttribute("fromDate", fromDate);
		model.addAttribute("toDate", endDate);
		model.addAttribute("mainDto", mainDto);
		return "mainReport";
	}
	
	
	
private String fnGetPStatus(String tlStatus, String toLead, String tlName,String sctStatus, String p_status, String bdm) {
	String proStatus="";
	
	if(p_status!=null) {
			 if((p_status.equalsIgnoreCase("To Client")||p_status.equalsIgnoreCase("To Client-SCT Pending"))) {
				 proStatus=p_status;
				 
				}
			 else if(!p_status.equalsIgnoreCase("To Client")||!p_status.equalsIgnoreCase("To Client-SCT Pending")) {
				 
				 proStatus="To "+bdm;
			 }
			 else if(p_status.equalsIgnoreCase("On Hold")) {
				 proStatus="To "+bdm;
				}
			 else {
				
				 proStatus=p_status;
				}
			
			 
	}
	else {
		if(sctStatus!=null) {
			proStatus="To "+bdm;
		}
		else {
		if(tlStatus!=null) {
			
			 if(tlStatus.equalsIgnoreCase("TL reject")) {
				 proStatus=tlStatus;
			}
			 else if(tlStatus.equalsIgnoreCase("On Hold")) {
				 
				 proStatus="Tl On Hold";
				}
			else {
				proStatus="SCT On Hold";
			}
		 }
		else {
			proStatus="Tl On Hold";
			
		}
		}
	}
	
	
	
		return proStatus;
	}

@RequestMapping(value = { "/ExportMasterReport" }, method = RequestMethod.GET)
    public void ExportMasterReport( HttpServletResponse response,HttpServletRequest req)throws HandlingException, IOException, ParseException {

	List<MainReport> recruiterMainReportlist = (List<MainReport>) req.getSession().getAttribute("recruiterMainReportlist");
		String fromDate = req.getParameter("fromDate");
		String endDate = req.getParameter("toDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date fDate = null;
		Date tDate = null;
		String frmDate = null;
		String toDate = null;
		//List<MainReport> recruiterMainReportlist = new ArrayList<MainReport>();
		if (!fromDate.equals("") && fromDate != null) {
			fDate = sdf.parse(fromDate);
			frmDate=sdf1.format(fDate);
		}
		if (!endDate.equals("") && endDate != null) {
			tDate = sdf.parse(endDate);
			toDate=sdf1.format(tDate);
		}

	   response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=ExcelmasterReport.xlsx");
        Workbook workbook = new SXSSFWorkbook();
         
        SXSSFSheet spreadsheet = null;
        spreadsheet = (SXSSFSheet)workbook.createSheet("ExcelmasterReport");
       
        SXSSFRow row=spreadsheet.createRow(0);
        Cell cell; 
        CellStyle cellStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        cellStyle.setDataFormat(
            createHelper.createDataFormat().getFormat("m/d/yy h:mm"));
        
        CellStyle my_style = workbook.createCellStyle();
        Font my_font=workbook.createFont();
         
        my_font.setBoldweight(Font.BOLDWEIGHT_BOLD);
        my_style.setFont(my_font);
        
        cell=row.createCell(0);
        cell.setCellValue("Client");
        cell.setCellStyle(my_style);
        cell=row.createCell(1);
        cell.setCellValue("Type");
        cell.setCellStyle(my_style);
        cell=row.createCell(2);
        cell.setCellValue("Account");
        cell.setCellStyle(my_style);
        cell=row.createCell(3);
        cell.setCellValue("BDM");
        cell.setCellStyle(my_style);
        cell=row.createCell(4);
        cell.setCellValue("Sender");
        cell.setCellStyle(my_style);
        cell=row.createCell(5);
        cell.setCellValue("Requirement");
        cell.setCellStyle(my_style);
        cell=row.createCell(6);
        cell.setCellValue("Technology");
        cell.setCellStyle(my_style);
        cell=row.createCell(7);
        cell.setCellValue("Positions");
        cell.setCellStyle(my_style);
        cell=row.createCell(8);
        cell.setCellValue("Location");
        cell.setCellStyle(my_style);
        cell=row.createCell(9);
        cell.setCellValue("Req Lable");
        cell.setCellStyle(my_style);
        cell=row.createCell(10);
        cell.setCellValue("Received Time");
        cell.setCellStyle(my_style);
      
        
        cell=row.createCell(11);
        cell.setCellValue("Team Lead Name");
        cell.setCellStyle(my_style);
        cell=row.createCell(12);
        cell.setCellValue("Assigned ON");
        cell.setCellStyle(my_style);
        cell=row.createCell(13);
        cell.setCellValue("Assigned To");
        cell.setCellStyle(my_style);
        cell=row.createCell(14);
        cell.setCellValue("Assigned ON");
        cell.setCellStyle(my_style);
        cell=row.createCell(15);
        cell.setCellValue("Rec");
        cell.setCellStyle(my_style);
        cell=row.createCell(16);
        cell.setCellValue("Consultant");
        cell.setCellStyle(my_style);
        cell=row.createCell(17);
        cell.setCellValue("Consultant Cont No");
        cell.setCellStyle(my_style);
        cell=row.createCell(18);
        cell.setCellValue("Time");
        cell.setCellStyle(my_style);
        cell=row.createCell(19);
        cell.setCellValue("To Leads");
        cell.setCellStyle(my_style);
        cell=row.createCell(20);
        cell.setCellValue("P-Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(21);
        cell.setCellValue("SCT Team");
        cell.setCellStyle(my_style);
        cell=row.createCell(22);
        cell.setCellValue("SCT Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(23);
        cell.setCellValue("SCT Rece Time");
        cell.setCellStyle(my_style);
        cell=row.createCell(24);
        cell.setCellValue("SCT Resp Time");
        cell.setCellStyle(my_style);
        cell=row.createCell(25);
        cell.setCellValue("ProfileSubmitTime");
        cell.setCellStyle(my_style);
       cell=row.createCell(26);
        cell.setCellValue("P-No");
        cell.setCellStyle(my_style);
        cell=row.createCell(27);
        cell.setCellValue("SubmittedTo");
        cell.setCellStyle(my_style);
        cell=row.createCell(28);
        cell.setCellValue("Interview Date");
        cell.setCellStyle(my_style);
        cell=row.createCell(29);
        cell.setCellValue("Candidate Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(30);
        cell.setCellValue("Reject Reason");
        cell.setCellStyle(my_style);
        cell=row.createCell(31);
        cell.setCellValue("Comment");
        cell.setCellStyle(my_style);
        cell=row.createCell(32);
        cell.setCellValue("Onboard Date");
        cell.setCellStyle(my_style);
        cell=row.createCell(33);
        cell.setCellValue("Requirement Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(34);
        cell.setCellValue("Requirement Priority");
        cell.setCellStyle(my_style);
        cell=row.createCell(35);
        cell.setCellValue("Job Category");
        cell.setCellStyle(my_style);
        
        
                
        
		 int i=1;

			for (MainReport masterReport : recruiterMainReportlist) {
			
			row=spreadsheet.createRow(i);
         
           cell=row.createCell(0);
           cell.setCellValue(masterReport.getClient());
           cell=row.createCell(1);                         
           cell.setCellValue(masterReport.getType());
           cell=row.createCell(2);                         
           cell.setCellValue(masterReport.getAccount());
           cell=row.createCell(3);
           cell.setCellValue(masterReport.getBdm());
           cell=row.createCell(4);
           cell.setCellValue(masterReport.getSender());
           cell=row.createCell(5);
           cell.setCellValue(masterReport.getRequirement());
           cell=row.createCell(6);
           cell.setCellValue(masterReport.getTechnology());
           if(masterReport.getPositions()!=null){
           cell=row.createCell(7);
           cell.setCellValue(masterReport.getPositions());
			}else{
				String positions="";
				 cell=row.createCell(7);
		            cell.setCellValue(positions);
			}
           cell=row.createCell(8);
           cell.setCellValue(masterReport.getLocations());
           cell=row.createCell(9);
           cell.setCellValue(masterReport.getReq_lable());
           cell=row.createCell(10);
           cell.setCellValue(masterReport.getRecievedTime());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(11);
           cell.setCellValue(masterReport.getTlName());
           cell=row.createCell(12);
           cell.setCellValue(masterReport.getBdmAssignedON());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(13);
           cell.setCellValue(masterReport.getAssignedTo());
           cell=row.createCell(14);
           cell.setCellValue(masterReport.getTlAssignedON());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(15);
           cell.setCellValue(masterReport.getRec());
           cell=row.createCell(16);
           cell.setCellValue(masterReport.getConsultant());
           cell=row.createCell(17);
           cell.setCellValue(masterReport.getConsultantContNo());
           cell=row.createCell(18);
           cell.setCellValue(masterReport.getTime());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(19);
           cell.setCellValue(masterReport.getToLeads());
           cell=row.createCell(20);
           cell.setCellValue(masterReport.getP_status());
           cell=row.createCell(21);
           cell.setCellValue(masterReport.getSctTeam());
           cell=row.createCell(22);
           cell.setCellValue(masterReport.getSctStatus());
           cell=row.createCell(23);
           cell.setCellValue(masterReport.getSctReceTime());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(24);
           cell.setCellValue(masterReport.getSctRespTime());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(25);
           cell.setCellValue(masterReport.getProfileSubTime());
           cell.setCellStyle(cellStyle);
           
            if((masterReport.getP_status()!=null) && (masterReport.getP_status().equalsIgnoreCase("To Client"))){
          cell=row.createCell(26);
          
           cell.setCellValue(masterReport.getProfileNo());
           }else{
           	String s="";
           	 cell=row.createCell(26);
                cell.setCellValue(s);
           }
           cell=row.createCell(27);
           cell.setCellValue(masterReport.getSubmittedTo());
           cell=row.createCell(28);
           cell.setCellValue(masterReport.getInterviewDate());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(29);
           cell.setCellValue(masterReport.getCandidateStatus());
           cell=row.createCell(30);
           cell.setCellValue(masterReport.getRejectReason());
           cell=row.createCell(31);
           cell.setCellValue(masterReport.getComment());
          
           cell=row.createCell(32);
           cell.setCellValue(masterReport.getOnboardingDate());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(33);
           
           cell.setCellValue(masterReport.getRequirementStatus());
           cell=row.createCell(34);
           
           cell.setCellValue(masterReport.getPriority());
           cell=row.createCell(35);
           cell.setCellValue(masterReport.getJdCategory());
           
           i++;
			}
		
       FileOutputStream out = new FileOutputStream(new File("ExcelmasterReport.xlsx"));
       //workbook.write(out);
       workbook.write(response.getOutputStream());
       out.close();
       workbook.close();

	           
   	 
    }
	
	@RequestMapping(value = { "/show_reportSelection_Page" }, method = RequestMethod.GET)
	public String viewReportSelectionpage(  ) {
		return "admin";
	}

	
	@RequestMapping(value = { "/BDMReport" }, method = RequestMethod.GET)
	public String viewBDMReport(  ) {
		return "BDMainReport";
	}

	
	@RequestMapping(value = { "/getBDMReport" }, method = RequestMethod.GET)
	public String getBDMReport(Model model,HttpServletRequest req,
			@RequestParam(value = "fromDate", required = true) String fromDate,
			@RequestParam(value = "endDate", required = true) String endDate)
			throws ParseException, HandlingException {
			HttpSession session = req.getSession(true);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date fDate = null;
			Date tDate = null;
			String frmDate = null;
			String toDate = null;
			Date dateempty = null;
			List<MainReport> BDMReportlist = new ArrayList<MainReport>();
			if (!fromDate.equals("") && fromDate != null) {
				fDate = sdf.parse(fromDate);
				frmDate=sdf1.format(fDate);
			}
			if (!endDate.equals("") && endDate != null) {
				tDate = sdf.parse(endDate);
				toDate=sdf1.format(tDate);
			}
			
			
			List bdmreport = report.getAllJobId(frmDate, toDate);
			Iterator itr = bdmreport.iterator();
			MainReportDTO mainDto=new MainReportDTO();
			
			while (itr.hasNext()) {
				
				Object[] obj = (Object[]) itr.next();

				String clientName = (String) obj[0];
				String bdm1 = (String) obj[3];
				String bdm = null;
				String requirement = (String) obj[6];
				String technology = (String) obj[7];
		        String priority =(String) obj[12];
		        String req_status=(String) obj[33];
		        if(bdm1.isEmpty()) {
		        	bdm="internal Bd";
		        }
		        else {
		        	bdm=bdm1;
		        }
		        String Team_Lead_Name=(String) obj[13];
		     
		        String rec=(String) obj[17];
		        String consultantName = (String) obj[18];
				String contactNo = (String) obj[19];
		
		        String toLead = (String) obj[21];
		        String p_status = (String) obj[22];
		        String sctTeam = (String) obj[23];
		        
		     
				

				String cliStatus = (String) obj[28];
				String interviewDate1 = (String) obj[29];
				Date interviewDate=null;
				if (interviewDate1 != null) {
					interviewDate = sdf2.parse(interviewDate1);
					
				}
				String cliComment =(String) obj[31];
				//Integer canID=;
				
				String rejectReason = (String) obj[30];
				String onboardingDate1 = (String) obj[32];
				Date onboardingDate=null;
				if (onboardingDate1 != null) {
					onboardingDate = sdf1.parse(onboardingDate1);
					
				}
				String tlStatus=(String) obj[34];
				String sctStatus = (String) obj[35];
				
		
				
				
			
										MainReport bdmObj = new MainReport();
										bdmObj.setClient(clientName);
										bdmObj.setPriority(priority);
									
										bdmObj.setBdm(bdm);
							
										bdmObj.setRequirement(requirement);
										bdmObj.setTechnology(technology);
										
										bdmObj.setRequirementStatus(req_status);
								
										bdmObj.setTlName(Team_Lead_Name);
									
	            							
	            							if (rec != null) {
	            								bdmObj.setRec(rec);
	            							}
	            							if (!toLead.isEmpty() ) {
	            								bdmObj.setToLeads(toLead);
	            							}
	            							else {
	            								bdmObj.setToLeads(Team_Lead_Name);
	            							}
	            							if (sctTeam != null) {
	            								bdmObj.setSctTeam(sctTeam);
	            							}
	            							bdmObj.setSctStatus(sctStatus);
	            							
	            							bdmObj.setCandidateStatus(cliStatus);
	            							bdmObj.setComment(cliComment);
	            							bdmObj.setOnboardingDate(onboardingDate);
	            							bdmObj.setRejectReason(rejectReason);
	            							bdmObj.setConsultant(consultantName);
	            							bdmObj.setConsultantContNo(contactNo);
	            							String profileStaus=fnGetPStatus_BD(tlStatus,toLead,Team_Lead_Name,sctStatus,p_status,bdm);
	            							if (interviewDate != null) {
	            								bdmObj.setInterviewDate(interviewDate);
	            								}
	            							
	        								bdmObj.setP_status(profileStaus);
	        								
	        								BDMReportlist.add(bdmObj);
	            							} 
	            						
			mainDto.setBDMReportList(BDMReportlist);
			session.setAttribute("BDMReportlist", BDMReportlist);
			model.addAttribute("fromDate", fromDate);
			model.addAttribute("toDate", endDate);
			model.addAttribute("mainDto", mainDto);
			
		
		
		return "BDMainReport";
	}
		
	
	private String fnGetPStatus_BD(String tlStatus, String toLead, String team_Lead_Name, String sctStatus,
			String p_status, String bdm) {
		String proStatus="";
		
		if(p_status!=null) {
				
					 proStatus=p_status;
					
				
				 
		}
		else {
			if(sctStatus!=null) {
				proStatus=sctStatus;
			}
			else {
			if(tlStatus!=null) {
				
				 if(tlStatus.equalsIgnoreCase("TL reject")) {
					 proStatus=tlStatus;
				}
				 else if(tlStatus.equalsIgnoreCase("On Hold")) {
					 
					 proStatus="Tl On Hold";
					}
				else {
					proStatus="SCT On Hold";
				}
			 }
			else {
				proStatus="Tl On Hold";
				
			}
			}
		}
		
		
		
			return proStatus;
	}

	@RequestMapping(value = { "/ExportBDMReport" }, method = RequestMethod.GET)
    public void ExportBDMReport( HttpServletResponse response,HttpServletRequest req)throws HandlingException, IOException, ParseException {

	List<MainReport> BDMReportlist = (List<MainReport>) req.getSession().getAttribute("BDMReportlist");
		String fromDate = req.getParameter("fromDate");
		String endDate = req.getParameter("toDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date fDate = null;
		Date tDate = null;
		String frmDate = null;
		String toDate = null;
		//List<MainReport> recruiterMainReportlist = new ArrayList<MainReport>();
		if (!fromDate.equals("") && fromDate != null) {
			fDate = sdf.parse(fromDate);
			frmDate=sdf1.format(fDate);
		}
		if (!endDate.equals("") && endDate != null) {
			tDate = sdf.parse(endDate);
			toDate=sdf1.format(tDate);
		}

	   response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=ExcelbdmReport.xlsx");
        Workbook workbook = new SXSSFWorkbook();
         
        SXSSFSheet spreadsheet = null;
        spreadsheet = (SXSSFSheet)workbook.createSheet("ExcelBDMReport");
       
        SXSSFRow row=spreadsheet.createRow(0);
        Cell cell; 
        CellStyle cellStyle = workbook.createCellStyle();
        CreationHelper createHelper = workbook.getCreationHelper();
        cellStyle.setDataFormat(
            createHelper.createDataFormat().getFormat("m/d/yy h:mm"));
        
        CellStyle my_style = workbook.createCellStyle();
        Font my_font=workbook.createFont();
         
        my_font.setBoldweight(Font.BOLDWEIGHT_BOLD);
        my_style.setFont(my_font);
        
        cell=row.createCell(0);
        cell.setCellValue("RequirementID");
        cell.setCellStyle(my_style);
        cell=row.createCell(1);
        cell.setCellValue("Client");
        cell.setCellStyle(my_style);
        cell=row.createCell(2);
        cell.setCellValue("Name of the Candidate");
        cell.setCellStyle(my_style);
        cell=row.createCell(3);
        cell.setCellValue("Contact Number");
        cell.setCellStyle(my_style);
        cell=row.createCell(4);
        cell.setCellValue("Skills");
        cell.setCellStyle(my_style);
        cell=row.createCell(5);
        cell.setCellValue("BD Name");
        cell.setCellStyle(my_style);
        cell=row.createCell(6);
        cell.setCellValue("Team Lead");
        cell.setCellStyle(my_style);
        cell=row.createCell(7);
        cell.setCellValue("Recruiter");
        cell.setCellStyle(my_style);
        cell=row.createCell(8);
        cell.setCellValue("Candidate Resume Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(9);
        cell.setCellValue("Candidate Interview Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(10);
        cell.setCellValue("SAT Member Name");
        cell.setCellStyle(my_style);
      
        cell=row.createCell(11);
        cell.setCellValue("SAT Status");
        cell.setCellStyle(my_style);
        cell=row.createCell(12);
        cell.setCellValue("Exemption Approved");
        cell.setCellStyle(my_style);
        cell=row.createCell(13);
        cell.setCellValue("Onboarding status & Date");
        cell.setCellStyle(my_style);
         
        
		 int i=1;

			for (MainReport bdmReport : BDMReportlist) {
			
			row=spreadsheet.createRow(i);
         
           cell=row.createCell(0);
           cell.setCellValue(bdmReport.getRequirement());
           cell=row.createCell(1);                         
           cell.setCellValue(bdmReport.getClient());
           cell=row.createCell(2);                         
           cell.setCellValue(bdmReport.getConsultant());
           cell=row.createCell(3);
           cell.setCellValue(bdmReport.getConsultantContNo());
           cell=row.createCell(4);
           cell.setCellValue(bdmReport.getTechnology());
           cell=row.createCell(5);
           cell.setCellValue(bdmReport.getBdm());
           cell=row.createCell(6);
           cell.setCellValue(bdmReport.getTlName());
  
           cell=row.createCell(7);
           cell.setCellValue(bdmReport.getRec());
           cell=row.createCell(8);
           cell.setCellValue(bdmReport.getP_status());
           cell=row.createCell(9);
           cell.setCellValue(bdmReport.getCandidateStatus());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(10);
           cell.setCellValue(bdmReport.getSctTeam());
           cell=row.createCell(11);
           cell.setCellValue(bdmReport.getSctStatus());
           cell=row.createCell(11);
           cell.setCellValue(bdmReport.getComment());
           cell.setCellStyle(cellStyle);
           cell=row.createCell(12);
           cell.setCellValue(bdmReport.getOnboardingDate());
           
           i++;
			}
		
       FileOutputStream out = new FileOutputStream(new File("ExcelbdmReport.xlsx"));
       //workbook.write(out);
       workbook.write(response.getOutputStream());
       out.close();
       workbook.close();

	           
   	 
    }
	
	
	

}