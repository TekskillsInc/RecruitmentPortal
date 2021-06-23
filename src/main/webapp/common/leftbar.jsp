  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
a.tempcolor{
background-color:black;
}
</style>

<body class='contrast-orange'>

 <% String role = (String) session.getAttribute("role"); 
 Integer empNumber = (Integer) session.getAttribute("empNumber");
 %>
    <div id='wrapper' >
        <div id='main-nav-bg' style="background-color:#222d32"></div>
        <c:choose>
            <c:when test="${role == 'Admin'}">
                <nav id='main-nav'>
                <div class='navigation'>
                   
                    <ul class='nav nav-stacked'>
                        <li class='active'><a href='Employee' class="tempcolor" > <i
                                class='icon-dashboard'></i> <span>Home</span>
                        </a></li>

                       

                  <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">EMPLOYEES</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a href='Employee'> <i
                                        class='icon-caret-right'></i> <span>Add EMPLOYEE</span>
                                </a></li>
                                <li class=''><a href='viewEmployee'>
                                        <i class='icon-caret-right'></i> <span>View EMPLOYEE</span>
                                </a></li>
                            </ul></li>
                         
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="" href="show_reportSelection_Page"><i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Reports</span></a>
                         </li>
                       
                        
                            </ul>
                     
                </div>
                </nav>
            </c:when>
               <c:when test="${role == 'BDM'}">
                <nav id='main-nav'>
                <div class='navigation'>
               
                    <ul class='nav nav-stacked'>
                        <li class=''><a href='displayRequirements' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Home</span>
                        </a></li>

                        <li class='treeview'>
                        <a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" id="client_bdm" data-toggle='dropdown' href="#"><i
                                class='icon-building'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Clients</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a href='addClients'> <i
                                        class='icon-caret-right'></i> <span>Add Clients</span>
                                </a></li>
                                <li class=''><a href='viewClients'>
                                        <i class='icon-caret-right'></i> <span>View Clients</span>
                                </a></li>
                            </ul>
                            </li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a href='displayJobDescPage'>
                                        <i class='icon-caret-right'></i> <span>Add Requirements</span>
                                </a></li>
                                <li class=''><a href='displayRequirements'> <i
                                        class='icon-caret-right'></i> <span>View Requirements</span>
                                </a></li>
                            </ul></li>
                            
                            <li class=''><a href='view_profilesSCTstatus' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">View SCT Status</span>
                        </a></li>
                     
                     <li class=''><a href='all_tlreport' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">ALL TL Report</span>
                        </a></li>
                        <li class=''><a href='ALLTL_report' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Recruiter Performance Reports</span>
                        </a></li>
                         <li class=''><a href='closedRequirements' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Closed Requirements </span>
                        </a></li>
                        
                        <li class=''><a href='bdmRequirements' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">BDM Reports </span>
                        </a></li>
                    </ul>
                </div>
                </nav>
            </c:when>
  <c:when test="${role == 'SCT'}">
                <nav id='main-nav'>
                <div class='navigation'>
                 
                    <ul class='nav nav-stacked'>
                        <li class=''><a href='view_Jobdescription' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Home</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                             <ul class='dropdown-menu'>
                                <li class=''><a href='view_Jobdescription'> <i
                                        class='icon-caret-right'></i> <span>View Requirements</span>
                                </a></li>
                            </ul></li>
                            
                              <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Notice Period Companies</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                             <ul class='dropdown-menu'>
                                <li class=''><a href='addNoticePeriod'> <i
                                        class='icon-caret-right'></i> <span>Add Company</span>
                                </a></li>
                            
                            </ul></li>
                            <li class=''><a href='view_profilesSCTstatus' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">View SCT Status</span>
                        </a></li>
                       
                            <li class=''><a href='SctReportsCount' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">SAT Reports </span>
                        </a></li>
                    </ul>
                </div>
                </nav>
            </c:when>
            <c:when test="${role == 'DELIVERYTEAM'}">
                <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked'>
                        <li class=''><a href='view_Jobdescription' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Home</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                             <ul class='dropdown-menu'>
                                <li class=''><a href='view_Jobdescription'> <i
                                        class='icon-caret-right'></i> <span>View Requirements</span>
                                </a></li>
                            </ul></li>
                    </ul>
                </div>
                </nav>
            </c:when>

            <c:when test="${role == 'TEAMLEAD'}">
                <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked'>
                       
                        <li class=''><a href='home' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Dashboard</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse" data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a href='view_Jobdescription'> <i
                                        class='icon-caret-right'></i> <span>View Requirements</span>
                                </a></li>

                            </ul></li>
                            <li class=''><a href='view_profilesSCTstatus' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">View SCT Status</span>
                        </a></li>
                         <li class=''><a href='all_tlreport' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">ALL TL Report</span>
                        </a></li>
                        <li class=''><a href='ALLTL_report' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Recruiter Performance Reports</span>
                        </a></li>
                         <li class=''><a href='candidatelist' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Client Selected Candidates</span>
                        </a></li>  
                        <li class=''><a href='resumedatabase' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Resume Database</span>
                        </a></li>
                        <li class=''><a href='CcategoryReport' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">C Category Report</span>
                        </a></li>
                        
                        <%
							if (empNumber == 200698 || empNumber == 201434) {
						%>
						<li class=''><a href='alltlslist' style="background-color:currentColor;" > <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">All TL Requirements</span>
                        </a></li>
						<%
							}
						%>
                      
                    </ul>
                </div>
                </nav>
                
            </c:when>


            <c:when test="${role == 'RECRUITER'}">
                <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked' style="display:block;">
                        <li class=''><a href='view_Jobdescription' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Home</span>
                        </a></li>
                        <li class=''><a class="dropdown-collapse" style="background-color:currentColor;" data-toggle='dropdown' href=""><i
                                class='icon-edit'style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a  href='view_Jobdescription'>
                                        <i class='icon-caret-right'></i> <span >View
                                            Requirements</span>
                                </a></li>

                            </ul></li>
                         <li class=''><a href='Recruiter_Daily_submissions' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Recruiter Daily submissions</span>
                        </a></li>
                            
                       
                        <li class=''><a href='massemailids' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">EmailIDs By Skills</span>
                        </a></li>
                        <li class=''><a href='resumedatabase' style="background-color:currentColor;"> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Resume Database</span>
                        </a></li>
                        <li class=''><a href='view_profilesSCTstatus' style="background-color:currentColor;"> <i
                                class='icon-group' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">View SCT Status</span>
                        </a></li>
                      <li class=''><a href='candidatelist' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Candidate List for Negotiation</span>
                        </a></li> 
                        
                    </ul>
                </div>
                </nav>
            </c:when>
            
                <c:when test="${role == 'HRMANAGER'}">
            <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked' style="display:block;">
                        <li class=''><a href='candidatelist' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Pre-Onboarding </span>
                        </a></li>
                       
                       
                    </ul>
              </div>
                </nav>
            </c:when> 
                  <c:when test="${role=='NEGOTIATOR'}">
            <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked' style="display:block;">
                        <li class=''><a href='candidatelist' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;"> Negotiation</span>
                        </a></li>
                       
                       
                    </ul>
              </div>
                </nav>
            </c:when>
                  <c:when test="${role == 'HRUSER'}">
            <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked' style="display:block;">
                        <li class=''><a href='candidatelist' style="background-color:currentColor;"> <i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Doc Verification</span>
                        </a></li>
                       
                       
                    </ul>
              </div>
                </nav>
            </c:when>

            <c:when test="${role == 'TECHNICAL PANEL'}">
                <nav id='main-nav'>
                <div class='navigation'>
                    
                    <ul class='nav nav-stacked'>
                        <li class='active'><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" href='jd_techPanel'> <i
                                class='icon-dashboard'></i> <span>Home</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="dropdown-collapse"  data-toggle='dropdown' href="#"><i
                                class='icon-edit'></i> <span>Requirements</span> <i
                                class='icon-angle-down angle-down'></i> </a>

                            <ul class='dropdown-menu'>
                                <li class=''><a href='jd_techPanel'> <i
                                        class='icon-caret-right'></i> <span>View Requirements</span>
                                </a></li>
                            </ul></li>
							
                       
                    </ul>
                </div>
                </nav>
            </c:when>
            <c:when test="${desgname == 'SystemAdmin'}">
                <nav id='main-nav'>
                <div class='navigation'>
               
                    <ul class='nav nav-stacked'>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" href='admin'> <i
                                class='icon-dashboard' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;" >Home</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" href='reportsoverview'> <i class=" icon-edit" style="color:white;" ></i>
                         <span style="color:white;text-shadow:0px 0px 0px #ececec;">Reports overview</span>
                        </a></li>
                        <li class=''><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" class="" href="show_reportSelection_Page"><i
                                class='icon-edit' style="color:white;"></i> <span style="color:white;text-shadow:0px 0px 0px #ececec;">Reports</span></a></li>

                    </ul>
                </div>
                </nav>
            </c:when>
            <c:otherwise>
                <nav id='main-nav'>
                <div class='navigation'>
                  
                    <ul class='nav nav-stacked'>
                        <li class='active'><a style="background-color:currentColor;text-shadow:0px 0px 0px #ececec;" 
                        href='home'> <i
                                class='icon-dashboard'></i> <span>Home</span>
                        </a></li>

                    </ul>
                </div>
                </nav>
            </c:otherwise>
        </c:choose>
    </div>

</body>

</html>