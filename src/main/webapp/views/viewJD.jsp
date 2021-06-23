

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
     <link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css" media="all" rel="stylesheet" type="text/css" />

	<link href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/multi-select.css"
	rel="stylesheet" />
	 
</head>
<style>

.pagination {
    display: inline-block;a
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
   font-weight: bold;
    border-radius:50%;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: cyan;}
</style>
<!-- <style>
.ScrollStyle
{
    height: 1000px;
    overflow-y: scroll;
}
</style> -->
<section id='content'>
    <div class='container-fluid'>
    	<%-- <c:if test="${not empty msg}">
		    <div class="alert alert-${css} alert-dismissible" role="alert" id='success-alert'>
			<button type="button" class="close" data-dismiss="alert" 
                                aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>${msg}</strong>
		    </div>
		</c:if> --%>
    
    
    
    
    
    
			<div class='row-fluid' id='content-wrapper' style="margin-top:-140px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

						<div class='box-header orange-background'
							style="line-height: 20px;">
							<div class='title' style="line: width:50px;">
								<Strong style="color: #000080; font-size: 25px;">View
									Requirements</Strong>
							</div>
						</div>


						<div class='box-content box-no-padding'>
                            <div class='responsive-table'>
                                <div class='scrollable-area'>
                                  <div class="pagination">
                                    <table id="sampletable"
                                        class='data-table table table-bordered table-striped'
                                        data-pagination-records='10' data-pagination-top-bottom='true'
                                        style='margin-bottom: 0;'>
                                        <thead>
                                            <tr>
                                            <th style='text-align: center;color:#000080;'>Job Id</th>
                                                <th style='text-align: center;color:#000080;'>Job Created Date</th>
                                              <!--   <th style='text-align: center;color:#000080;'>JD ID</th> -->
                                                 <th style='text-align: center;color:#000080;'>Client Name</th>
                                                   <th style='text-align: center;color:#000080;'>Job Description</th>
                                                   <th style='text-align: center;color:#000080;'>JD Download</th>
                                                  	<th style='text-align: center;color:#000080;'>Edit</th>
                                                  	<th style='text-align: center; color: #000080;'>Edit
														Assign</th>
                                                
                                                 	<th style='text-align: center;color:#000080;'>View JD Profiles</th>
                        							                        
                                                   <th style='text-align: center; color: #000080;'>Job Priority</th>
                                                   <th style='text-align: center; color: #000080;'>Allocated Budget</th>
                                                    <th style='text-align: center;color:#000080;'>Status</th>
                                                    <th style='text-align: center; color:#000080;'>Job Category</th>
                                                     <th style='text-align: center;color:#000080;'>Job Label</th>
                                                     <th style='text-align: center;color:#000080;'>Job Code</th> 
                                               	 <th style='text-align: center;color:#000080;'>Job Mandatory Skills</th>
                                                     <th style='text-align: center;color:#000080;'>Assigned To</th>
                                                     <th style='text-align: center;color:#000080;'>No.of Positions</th>
                                               
                                                
                                                <th style='text-align: center;color:#000080;'>Internal/External</th>
                                             
                                                <th style='text-align: center;color:#000080;'>Account Name</th>
                                                <th style='text-align: center;color:#000080;'>Segment</th>
                                               
                                                 <th style='text-align: center;color:#000080;'>Client Availability</th>
                                                 <th style='text-align: center;color:#000080;'>profiles@Client Scheduled</th>
                                           
                                                <th style='text-align: center;color:#000080;'>Upload Mail Proof</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="job" items="${jobList}">
                                                <tr>
                                                <td>${job.jobDescId}</td>
                                                <td>${job.createddate}</td>
                                             
                                                <td>${job.client}</td>
                                            
                                                    <td><c:choose>
                                                            <c:when test="${fn:length(job.jobdescription) >= 20}">
                                                                <div class='text-center'>
                                                                
                                                                    <a 
                                                                        data-toggle='modal' href='#modal-statusJD'
                                                                         onclick="showJobDesc('${job.jobDescId}')">
                                                                        ${fn:substring(job.jobdescription, 0, 20)}.... </a>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise> ${job.jobdescription}</c:otherwise>
                                                    </c:choose></td>
                                                
                                                <td>
													<div class='text-center'>
															<a class='fa fa-download' data-toggle='modal'
																href=''
																onclick="doMultipleActionDownload('${job.jobDescId}','${job.jobCode}')"> <i
                                                                class='icon-download' title="Download this document" style='color:darkblue;'></i>
															</a>
														</div>
													</td>
													<td><div class='text-center'>
                                                    <a class='btn btn-default btn-xs' data-toggle='modal'
                                                                     href='#modal-editJD'   onclick="getData('${job.jobCode}','${job.jobDescId}')"  > 
                                                                       <i class='icon-edit' style='color:green'></i>
                                                                    </a>                
                                                    </div></td> 
                                                    
                                                    										<td>
															<div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	href='#modal-edit'
																	onclick="doActionEdit('${job.jobDescId}','${job.jobCode}','${job.client}')">
																	<i class='icon-edit' style='color: darkblue'></i>

																</a>
															</div>
														</td>
                                                    
													         <td><div class='text-center'>
                                                    <a class='btn btn-default btn-xs' data-toggle='modal'
                                                                        onclick="viewprofileBdm('${job.jobDescId}','${job.client}','${job.jobCode}')"  > 
                                                                       <i class='icon-group' style='color:orange;'></i>
                                                                    </a>                
                                                    </div>  </td>  
													<td>${job.priority}</td>
                                                        <td>${job.allocatedbudget}</td>
                                                         <td class="bg-warning text-dark">${job.jobstatus} </td> 
                                                         <td><strong><font color=blue>${job.jdCategory}</font></strong></td>
                                                         <td>${job.lable}</td>
                                                             <td><a class='btn btn-default btn-xs' data-toggle='modal' href='#modal-viewJdstatus' 
                                                onclick="viewJd('${job.jobDescId}')">
                                                ${fn:substring(job.jobCode, 0, 20)}..</a></td>
                                                        
                                                    <td><div class='text-center'><a class='btn btn-default btn-small'
                                                                        data-toggle='modal' href='#modal-JDMandatory'
                                                                         onclick="showJobMandatory('${job.jobDescId}')"><i class='icon-info' style='color:darkgreen;'></i></a></div></td>
                                                     
                                                      <td><c:choose>
                                                            <c:when test="${fn:length(job.tlName) >= 20}">
                                                                <div class='text-center'>
                                                                    <a  
                                                                        data-toggle='modal' href='#modal-TlName'
                                                                         onclick="showTL('${job.jobDescId}','${job.tlName}')">
                                                                        ${fn:substring(job.tlName, 0, 20)}.... </a>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise> ${job.tlName}</c:otherwise>
                                                    </c:choose></td>
                                                     
                                                      
                                                        <td>${job.positions}</td>
                                                    <td>${job.jobtype}</td>
                                                    <td>${job.account}</td>
                                                    <td>${job.segment}</td>
                                               
													<td><a class='btn btn-default btn-xs'  data-toggle='modal' href='#modal-ClientAvailability' onclick="client_availability('${job.jobDescId}')"><i class='icon-calendar' style='color:darkblue;'></i></a></td>
													
													<td><a class='btn btn-default btn-xs'
														data-toggle='modal' href='#modal-JDsprofiles' 
														onclick="viewprofileClientScheduled('${job.jobDescId}')">
															<i class='icon-time' style='color:darkred;'></i>
													</a></td>
                                                  
                                                 <%--    		<td>
													<div class='text-center'>
															<a class='btn btn-default btn-xs' data-toggle='modal'
																href=''
																onclick="doActionDownload('${job.jobDescId}')"> <i
                                                                class='icon-download' title="Download this document" style='color:darkblue;'></i>
															</a>
														</div>
													</td> --%>   
													
													 <c:if test="${role=='BDM'}">
															<td>
																<div class='text-center'>
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		href='#modal-upload'
																		onclick="mailProofUpload('${job.jobDescId}')">
																		<i class='icon-upload' style='color: darkgreen'></i>

																	</a>
																</div>
															</td>
														</c:if>   
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table></div>
                                    
                                  <div class='modal hide fade' id='modal-upload' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>File Upload</h3>
										</div> -

										<div class='modal-body' id=jd_edit_assigns>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="bduploadMailProof"
												enctype="multipart/form-data" method="post">
												<input type="hidden" name="jobdesid" id="jobdesid" />


												<div>
													<center><label for='file'>File Upload</label></center><center><input name="file" data-rule-required='false' id='file'
														onchange="fileupload(this)" type="file"
														accept=".msg" required /><br> File Name: <span id="mailprfid" style="color:red;"> </span> <br><br>
														<button
															class="btn btn-success btn-xs"
															style="background: #0b3c7c">Submit</button> 
															</center>
												</div>
												

											</form>
										</div>
									</div>
                                    
			<div class='modal hide fade' id='modal-viewJdstatus' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>View Jd Status</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_edit_assigns>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action=""
												method="post">
												
													
								<div class='row'>
                                <div class='span12'>     
                                         <div class='box-content box-no-padding'>   
                                        <div class='responsive-table'>
								        <div class='scrollable-area'>       
                                        <table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-top-bottom='true'
										style='margin-bottom: 0;' id="sampletable">
										<thead>
											<tr>
												<th style='text-align: center;'>Roles</th>
												<th style='text-align: center;'>Approved</th>
												<th style='text-align: center;'>Rejected</th>
											</tr>
										</thead>
										<tbody id="roleCount">
									
									</tbody>
										
										</table>
										</div>
										</div>
										</div>
										 </div>
                                         </div>
												
											</form>

									</div> 


								</div>
								<div class='modal hide fade' id='modal-edit' tabindex='-1' style="height:250px;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>EDIT Assign</h3>
										</div>
										<div class='modal-body' id="mbody_edit">
											<h4 id="jd_edit" style="color: red;"></h4>
										</div>
										<div class='modal-body' id=jd_edit_assigns>
											<!-- <form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="editAssignedJdToUser"
												id='editAssignedEmp' method="post"> -->
												<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="editAssignedJdToTL"
												id='editAssignedEmp' method="post">
												
												<input type="hidden" id="jobIdEdit" name="jobIdEdit">
												<input type="hidden" id="deptIdEdit" name="deptIdEdit">
												<input type="hidden" id="unAssignEmp" name="unAssignEmp">
												<input type="hidden" id="jobCodeEdit" name="jobCodeEdit">
												  <input type="hidden" id="cmpnynameEdit" name="cmpnynameEdit">
												<div class='row'>
													<div class='span12'>
														<div class='control-group'>
															<label style="color: red;">Choose to update</label> <Select
																class='form-control' data-rule-required='true'
																id='assignToedit' name='assignToedit' multiple>

															</Select>

														</div>
													</div>
												</div>
												<!-- <div> -->
													<div class='' style='margin-bottom: 0'>
														<input name="selectj_d" id="selectj_d" type="hidden" />
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c" id="EditAssaignee">
															Update</button>
													</div>
												<!-- </div> -->
											</form>
										</div>

									</div>
								
										<div class='modal hide fade' id='modal-JDsprofiles' style="width:700px;height:700px;"
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Scheduled Profiles</h3>
										</div>
										<!-- 	<div class="ScrollStyle"> -->
										<div class='modal-body'>
											<table id="interviewtable"
												class='data-table table table-bordered table-striped'
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom: 0;'>
												<thead>
													<tr>
														<th style='text-align: center;'>Candidate Name</th>
														<th style='text-align: center;'>Phone Number</th>
														<th style='text-align: center;'>Technology</th>
														<th style='text-align: center;'>Years Of experience</th>
														<th style='text-align: center;'>Mode of Interview</th>
														<th style='text-align: center;'>Interview Time</th>
													</tr>
												</thead>
												<tbody id="interviewrow">
												</tbody>
											</table>
										</div>

									</div>
								<div class='modal hide fade' id='modal-TPAvailability'
										tabindex='-1' style="height: 70%!important">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_client_Interview>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="TechPanelAvailability" method="post">

												<input type="hidden" name="jobsid" id="jobid_tp">


												<div class='row'>
													<div class='span12'>
														<div class='box-content box-no-padding'>
															<div class='responsive-table'>
																<div class='scrollable-area'>
																	<br> <br>
																	<div class='control-group'>
																		<label class='control-label' for='InterviewerName'>Interviewer
																			Name</label>
																		<div class='controls'>
																			<input pattern="[a-zA-Z][a-zA-Z\s]*"
																				data-rule-minlength='2' data-rule-maxlength='25'
																				data-rule-required='false' id='interviewname'
																				name='interviewname' placeholder='Interviewer Name'
																				type='text' title="only characters allowed" required>

																		</div>
																	</div>

 											<div class='control-group'>
                                            <label class='control-label' for='validation_date'>Available Date</label>
                                            <div class='controls'>
                                                <div>
                                                    <div class='datetimepicker input-append'
                                                        id='datetimepicker'>
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd' id='interview_date'
                                                            name='interview_date' placeholder='Select Date'
                                                            type='text' required> <span class='add-on'> 
                                                            </span> <i
                                                            data-date-icon='icon-calendar' data-time-icon='icon-time'></i>
                                                       
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>

																	<div class='control-group'>
																		<label class='control-label' for='validation_date'
																			style="color: #191970;">Schedule Time</label>
																		<div class='controls'>
																			<div>
																				<div class='datetimepicker input-append'
																					id='datetimepicker1'>
																					<input class='span12' name='availablity'
																						data-format="HH:mm:ss PP"
																						placeholder='Select Time' type='text' required>
																					<span class='add-on'> <i
																						data-time-icon="icon-time"
																						data-date-icon='icon-calendar'></i>
																					</span>
																				</div>
																			</div>
																			<div class='controls'>
																				<input class='form-control' data-rule-minlength='2'
																					data-rule-required='true' id='sdpicker'
																					name='sdpicker' type='hidden'>
																			</div>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label class='control-label'> Mode Of
																			Interview</label>
																		<div class='controls'>
																			<select class='form-control' id='interviewmode'
																				name='interviewmode' required>
																				<option value="">Select Interview Type</option>
																				<option value="Skype">Skype</option>
																				<option value="Telephonic">Telephonic</option>
																				<option value="F2F">F2F</option>
																			</select>
																		</div>
																	</div>


																	<div class='form-actions' style='margin-bottom: 0'>
																		<input type="submit" value="Save" />
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>

												<br>
												<div class='row'>
													<div class='span12'>

														<div class='modal-header'>
															<button class='close' data-dismiss='modal' type='button'>&times;</button>
															<h3>View Interview Details</h3>
														</div>

														<div class='box-content box-no-padding'>
															<div class='responsive-table'>
																<div class='scrollable-area'>
																	<table
																		class='data-table table table-bordered table-striped'
																		data-pagination-records='10'
																		data-pagination-top-bottom='true'
																		style='margin-bottom: 0;' id="sampletable">
																		<thead>
																			<tr>
																				<th style='text-align: center;'>Interviewer
																					Name</th>
																					<th style='text-align: center;'>Available
																					Date</th>
																					<th style='text-align: center;'>Available
																					Time</th>
																				<th style='text-align: center;'>Mode Of
																					Interview</th>
																			</tr>
																		</thead>
																		<tbody id="Tp_details">
																		</tbody>

																	</table>
																</div>
															</div>
														</div>

													</div>
												</div>
											</form>
										</div>
									</div>

								
								<div class='modal hide fade' id='modal-ClientAvailability' tabindex='-1'  >
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Client Availability</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_client_Interview>
										<form class='form form-horizontal validate-form' style='margin-bottom: 0;' action="SaveClientAvailabily" method="post">
										
											<input type="hidden" name="jobsid" id="jobid_cl">
											
										
								<div class='row'>
                                <div class='span12'>     
                                         <div class='box-content box-no-padding'>   
                                        <div class='responsive-table'>
								        <div class='scrollable-area'>  
								         <br>
								          <br>
                                        <div class='control-group'>
                                            <label class='control-label' >
                                             Mode Of Interview</label>
                                                
                                            <div class='controls'>
                                                <select class='form-control' 
                                                    id='interview_type' name='interview_type' required>
                                                    <option value="">Select Interview Type</option>
                                                    <option value="Skype">Skype</option>
                                                    <option value="Telephonic">Telephonic</option>
                                                    <option value="F2F">F2F</option>
                                                </select>
                                            </div>
                                            </div>
                                       <div class='control-group'>
                                            <label class='control-label' for='validation_date'>Available Date</label>
                                            <div class='controls'>
                                                <div>
                                                    <div class='datetimepicker input-append'
                                                        id='datetimepicker3'>
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd' id='interview_date'
                                                            name='interview_date' placeholder='Select Date'
                                                            type='text' required> <span class='add-on'> 
                                                            </span> <i
                                                            data-date-icon='icon-calendar' data-time-icon='icon-time'></i>
                                                       
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                	 <div class='control-group'>
								<label class='control-label' for='validation_date' style="color:#191970;">Available Time From</label>
								<div class='controls'>
									<div>										
										<div class='datetimepicker input-append' id='datetimepicker2'>
											<input class='span12'  name='interview_time' data-format="HH:mm:ss PP" placeholder='Select Time'	type='text' required>
											 <span class='add-on'>
											  <i data-time-icon="icon-time" data-date-icon='icon-calendar'></i>
											</span>
										</div>
									</div>
									<div class='controls'>
										<input class='form-control' data-rule-minlength='2' data-rule-required='true' id='sdpicker' name='sdpicker' type='hidden'>
									</div>
								</div>
							</div> 
							
							 <div class='control-group'>
								<label class='control-label' for='validation_date' style="color:#191970;">Available Time To</label>
								<div class='controls'>
									<div>										
										<div class='datetimepicker input-append' id='datetimepicker4'>
											<input class='span12'  name='interview_timeTo' data-format="HH:mm:ss PP" placeholder='Select Time'	type='text' required>
											 <span class='add-on'>
											  <i data-time-icon="icon-time" data-date-icon='icon-calendar'></i>
											</span>
										</div>
									</div>
									<div class='controls'>
										<input class='form-control' data-rule-minlength='2' data-rule-required='true' id='sdpicker' name='sdpicker' type='hidden'>
									</div>
								</div>
							</div> 
                                     <div class='form-actions' style='margin-bottom: 0'>
                                            <input type="submit" class="btn btn-success btn-xs" style="background:#0b3c7c" value="Save"/> </div>
                                        </div>
										</div>
										</div>
										</div>
										 </div>
										 </form>
                                         </div>
                                         
                                     <div class='row'>
                                     <div class='span12'>        
                                        
                                       <div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>View Interview Details</h3>
										</div> 
										 
                                        <div class='box-content box-no-padding'>   
                                        <div class='responsive-table'>
								        <div class='scrollable-area'>       
                                        <table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-top-bottom='true'
										style='margin-bottom: 0;' id="sampletable">
										<thead>
											<tr>
												<th style='text-align: center;'>Available Date</th>
												<th style='text-align: center;'>Available Time</th>
												<th style='text-align: center;'>Available Time To</th>
												<th style='text-align: center;'>Mode Of Interview</th>
												
											</tr>
										</thead>
										<tbody id="client_details">
									   </tbody>
										</table>
										</div>
										</div>
										</div> 
                  
										</div>
										</div>
									
										</div>
										 </div>
										 
										 
                                    <div class='modal hide fade' id='modal-statusJD' 
                                        tabindex='-1'>
                                        <div class='modal-header'>
                                            <button class='close' data-dismiss='modal' type='button'>&times;</button>
                                            <h3>Job Description</h3>
                                        </div>
                                        <div class='modal-body'>
                                            <p id="retrivejobDescription" style="text-align: justify;"></p>
                                        </div>

                                    </div>
                                      <div class='modal hide fade' id='modal-TlName' 
                                        tabindex='-1' style="height: 23%!important;width: 35%!important;top:22%!important">
                                        <div class='modal-header'>
                                            <button class='close' data-dismiss='modal' type='button'>&times;</button>
                                            <h3>Assigned TL's</h3>
                                        </div>
                                        <div class='modal-body'>
                                            <p id="retriveTL" style="text-align: justify;"></p>
                                        </div>

                                    </div>
                                     <div class='modal hide fade' id='modal-JDMandatory' 
                                        tabindex='-1'>
                                        <div class='modal-header'>
                                            <button class='close' data-dismiss='modal' type='button'>&times;</button>
                                            <h3>Job Mandatory Skills</h3>
                                        </div>
                                        <div class='modal-body'>
                                         <table id="skilltable"
                                        class='data-table table table-bordered table-striped'
                                        data-pagination-records='10' data-pagination-top-bottom='true'
                                        style='margin-bottom: 0;'>
                                        <thead>
                                            <tr>
                                                <th style='text-align: center;'>Skill</th>
                                               </tr>
                                        </thead>
                                        <tbody id="skillrow">
                                        </tbody>
                                        </table>
                                        </div>

                                    </div>
                                    <div class='modal hide fade' id='modal-JDprofiles' 
                                        tabindex='-1'>
                                        <div class='modal-header'>
                                            <button class='close' data-dismiss='modal' type='button'>&times;</button>
                                            <h3>Scheduled Profiles</h3>
                                        </div>
                                        <div class='modal-body'>
                                         <table id="interviewtable"
                                        class='data-table table table-bordered table-striped'
                                        data-pagination-records='10' data-pagination-top-bottom='true'
                                        style='margin-bottom: 0;border-left:1px solid #dddddd;'>
                                        <thead>
                                            <tr>
                                                <th style='text-align: center;'>Candidate Name</th>
                                                <th style='text-align: center;'>Phone Number</th>
                                                <th style='text-align: center;'>Technology</th>
                                                <th style='text-align: center;'>Years Of experience</th>
                                                <th style='text-align: center;'>Interview Time</th>
                                               </tr>
                                        </thead>
                                        <tbody id="interviewrow">
                                        </tbody>
                                        </table>
                                        </div>

                                    </div>

                                    <div class='modal hide fade' id='modal-editJD' 
                                        tabindex='-1' style="height: 100%!important;overflow-y:hidden!important;">
                                        <div class='modal-header'>
                                            <button class='close'  type='button' onclick="cloSeEditModal()">&times;</button>
                                            <h3>EDIT JD</h3>
                                        </div>
                                        
                                        <form class='form form-horizontal validate-form' id="updatejdesc"
                                        action="update_JobDesc" method="post" style='margin-bottom: 0;' enctype="multipart/form-data" onsubmit="return checkForm(this);">
                                        <div class='modal-body' >
                                            
                                        <input type=hidden name="jobid" id="jobid" >
                                        <input type=hidden name="unAssignEmp" id="unAssignEmp" >
                                        <input type=hidden name="reassign" id="reassign" >
                                        
                                        <div class='control-group'>
                                            <label class='control-label' >JobDescription ID <span style="color:red">*</span></label>
                                            <div class='controls'>
                                                <input data-rule-minlength='2' data-rule-required='true'
                                                    id='jobCode' data-rule-maxlength='25' name='jobCode' pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
                                                    placeholder='Job Description ID' type='text' required="required" onchange="chkJobCode()"><!-- onchange="chkJobCode()" -->
                                                    <span style="color:No specrial characters allowed other than space and _"></span>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label' >JobDescription <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <textarea rows="3" cols="100" data-rule-required='true' id='jobdescription'
                                                    name='jobdescription' required="required" placeholder='Minimum 30 characters'></textarea>
                                            </div>
                                        </div>
                                          <div class='control-group'>
                                            <label class='control-label' for='Technology'>
                                                Technology <span style="color: red">(*)</span></label>
																				
                                            <div class='controls'>
                                                <input  
                                                    id='Technology' name='Technology'
                                                    placeholder='Technology' type='text' required>
                                            </div>
                                            </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='JobGivenBy'>
                                                Given By <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='true'
                                                    id='jobGivenBy' name='jobGivenBy'
                                                    placeholder='Given By' type='text'>
                                            </div>
                                        </div>

                                        <div class='control-group'>
                                            <label class='control-label' for='LocationProject'>Location Of The Project <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                 
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='false'
                                                    id='locationProject' name='locationProject'
                                                    placeholder='Location Of The Project' type='text' required="required">
                                                 
                                            </div>
                                            </div> 
                                            <div class='control-group'>
                                            <label class='control-label' for='DurationProject'>Duration Of The Project</label>
                                            <div class='controls'>
                                                 
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='false'
                                                    id='durationProject' name='durationProject'
                                                    placeholder='Duration Of The Project' type='text'>
                                             
                                            </div>
                                            </div> 
                                        <div class='control-group'>
                                            <label class='control-label'>External / Internal <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true' id='intORext' name='intORext' required="required">
                                                    <option value="">Choose Job Type</option>
                                                    <option value="External">External</option>
                                                    <option value="Internal">Internal</option>
                                                    <option value="External Fulltime">External Fulltime</option>
                                                </select>
                                            </div>
                                        </div> 
                                        
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_date'>JobCloseDate</label>
                                            <div class='controls'>
                                                <div>
                                                    <div class='datetimepicker input-append'
                                                        id='jdclosedDate'>
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd' id='jobCloseDate'
                                                            name='jobCloseDate' placeholder='Select Date'
                                                            type='text'> <span class='add-on'> <i
                                                            data-date-icon='icon-calendar' data-time-icon='icon-time'></i>
                                                        </span>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>

                                        <div class='control-group'>
                                        
                                            <label class='control-label'>Select Company <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='company' name='company' required="required">
                                                    <option id="companySelected"></option>
                                                    <c:forEach var="company" items="${clientList}">
                                                    <option value="${company.cmpny_id}">${company.cmpny_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class='control-group'>
                                            <label class='control-label' >Enter Account</label>
                                            <div class='controls'>
                                                <input class='form-control' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" data-rule-minlength='2' data-rule-maxlength='25'
                                                      id='account' name='account' placeholder='Enter Account' type='text'>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label'>Enter Segment</label>
                                            <div class='controls'>
                                                <input class='form-control' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" id='segment' data-rule-minlength='2' data-rule-maxlength='10' name='segment' placeholder='Enter Segment' type='text'>
                                            </div>
                                        </div> 
                                        <div class='control-group'>
                                            <label class='control-label' >No.of
                                                Positions <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input class='form-control' data-rule-minlength='1' min='1' max='9999999'
                                                    data-rule-required='true' id='totalpositions'
                                                    name='totalpositions' placeholder='Positions'
                                                    type='number' required="required">
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_jd_label'>
                                                Requirement Label</label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='jd_label' name='jd_label' onchange="getLabel()">
                                                    <option value="">Select label</option>
                                                    <option value="New">New</option>
                                                    <option value="RECYCLE">RECYCLE</option>
                                                    <option value="EXCLUSIVE">EXCLUSIVE</option>
                                                    <option value="NON_EXCLUSIVE">NON-EXCLUSIVE</option>
                                                     <option value="TIME_BOND_EXCLUSIVE">TIME BOND EXCLUSIVE</option>
                                                    <option value="ON_GOING">ON_GOING </option>
                                                </select>
                                            </div>
                                        </div>
                                         <div class='control-group'>
                                            <label class='control-label' for='validation_jd_label'>
                                                Requirement Priority<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                               <select class='form-control' data-rule-required='true'
                                                    id='jd_priority' name='jd_priority' required>
                                                    <option value="">Choose Priority</option>
                                                    <option value="P1">P1</option>
                                                    <option value="P2">P2</option>
                                                    <option value="Requirements">Requirements</option>
                                                    <option value="Drive Requirements">Drive Requirements</option><!-- Non-Exclusive  Time bond Exclusive  -->
                                                </select>
                                            </div>
                                        </div>
                                          <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Allocated budget\CTC<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <input type ="text" name="allocated_budget" id="allocated_budget" pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$" required>
                                            </div>
                                        </div>
                                         <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Status</label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='jd_status' name='jd_status'>
                                                    <option value="">Choose Status</option>
                                                    <option value="Open">Req Open</option>
                                                    <option value="Req on Hold">Req on Hold</option>
                                                    <option value="Req Closed">Req Closed</option>
                                                    <option value="Req Fulfilled">Req Fulfilled</option>
                                                </select>
                                            </div>
                                        </div>
                                        <input type="hidden" id="categoryFromDb" >
                                         <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Category<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <select class="form-control" data-rule-required='true'
                                                    id='jdcategory' name='jdcategory' 
                                                     required="required">
                                                        <option value="">--Select Category--</option>
                                                         <option value="A">A</option>
                                                          <option value="B1">B1</option>
                                                          <option value="B2">B2</option>
                                                          <option value="C">C</option>
                                                   
                                                </select>
                                               
                                        </div>
                                        </div>
                                        <input type="hidden" id="jobreceivedTimeFrmDb">
                                                                 <div class='control-group'>
                                                                 
                                                  <div class='control-group'>
                                            <label class='control-label' for='validation_date'>Job Received Time <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                    <div id="jdRecTime" class="input-append">
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd hh:mm:ss' id='jobreceivedTime'
                                                            name='jobreceivedTime' placeholder='Select Time'
                                                            type='text' required> <span class='add-on'> 
                                                            <i data-date-icon='icon-calendar'></i>
														</span>
                                                    </div>
                                            </div>
                                        </div>     
                                                               
                                            <!--  <label class='control-label' for='validation_date'>Job Received Time<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                    <div id="jdRecTime" class="input-append">
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd hh:mm:ss' id='jobreceivedTime' 
                                                            name='jobreceivedTime' placeholder='Select Time'
                                                            type='text' required>  <span class='add-on'> 
                                                            <i data-date-icon='icon-calendar'></i>
														</span>&nbsp;&nbsp;&nbsp;&nbsp;
														
														
													
                                                    </div>
                                                   
                                            </div>  -->
                                            <label class='control-label' >Will create as new requirement</label>
                                                      <div class='controls'>
														<input type="checkbox" id="newCeationChkBox" name="newCeationChkBox" >           
                                                                 
                                                                </div> 
                                            
                                        </div>
                                        
                                        <div class='control-group' id="assigntlDiv">
                                            <label class='control-label' >AssignTo <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class="form-control" data-rule-required='true'
                                                    id='assignTo' name='assignTo'
                                                    multiple >
                                                    <c:forEach var="manager" items="${managerList}">
                                                        <option value="${manager.emp_number}">${manager.userName}</option>
                                                    </c:forEach>
                                                
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class='control-group'>
                                           <label for='file'> Upload JD Description Doc</label>
                                            <input type="hidden" id="JdDescription" name="JdDescription"  value="Jd_Doc" >
                                           
                                          <input name="uploadfile1" data-rule-required='false' id='uploadfile1' type="file" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" onchange="ValidateSize(this)" />
                                           <span id="filename1"></span>
                                           </div>
                                           <div class='control-group'>
                                           <label for='file'> Upload JD Received mail proof</label>
                                            <input type="hidden" id="Mailproof" name="Mailproof"  value="Mail" >
                                            <input name="uploadfile2" data-rule-required='false' id='uploadfile' type="file" accept="application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" onchange="ValidateSize(this)" />
                                       		<span id="filename"></span>
                                            
                                              </div>
                                                                                                            
                                        <div class='form-actions' style='margin-bottom: 0' id="updateDiv">
                                           <input type="submit" class="btn btn-success btn-xs" style="background:#0b3c7c" id="updateJd">
															
														
                                        </div>
                                         <div class='form-actions' style='margin-bottom: 0' id="reassignDiv">
                                           
											<input type="submit"  class="btn btn-success btn-xs" style="background:#0b3c7c" id="reassignJd">
															
														
														
                                        </div>
                                        </div>
                                        
                                        </form>
                                         
                                         </div>    
                                          </div>
                                          
                                      </div>
                                         </div>
                                        
                                       
                                        </div>
                                        
                                    </div>
                                </div>
			 <div id="myModal" class="modal"
				style="height: 80px; width: 400px; align-items: center; top:15%;left: 60%;">
				<div class="modal-content" id="popup-modal">
				
				<div>
				<p id="addsummaryfields" style="font-size:20px;color:blue;text-align: center;margin-top:10%" ></p>
				</div>
				</div>
			</div> 
                            </div>
                    
  
</section>
     <script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
     <script type="text/javascript">$('#sampletable').DataTable();</script> 
    <!--  <script src="resources/assets/javascripts/plugins/datatables/datatable_rec.js" type="text/javascript"></script> -->
     
     
     <script src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
    <script src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
	<script src="resources/assets/javascripts/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js" type="text/javascript"></script>
     
     <script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
     <script src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/multi-select.js"></script>
 

  <script>
  $('#myModal').hide();
  
    var text='${msg}';
  
    if(text!=''){
	$('#addsummaryfields').html(text);
	$('#myModal').show(); 
	setTimeout(function(){ $('#myModal').fadeOut() }, 2000);
	
    }
    
</script>  
 
<script type="text/javascript">
/* $("#success-alert").fadeTo(2000, 500).slideUp(500, function() {
    $("#success-alert").slideUp(500);
  }); */
 


$("#updateDiv").hide();
$("#reassignDiv").hide();
</script>
<script type="text/javascript">
 function getData(jobval,jobid){
    $.ajax({
        type: "GET",
        url: "getJobDescByJobID?jobcode="+jobval+"&jobId="+jobid,
        cache: false,
        async: false,               
        success: function(response){
           
                $('#jobid').val(response.jobdesc.jobdescid);
                $('#jobCode').val(response.jobdesc.jobCode);
                $('#jobdescription').val(response.jobdesc.jobDescription);
                $('#Technology').val(response.jobdesc.technology);
                $('#jobGivenBy').val(response.jobdesc.jobDescGiven);
                $('#durationProject').val(response.jobdesc.duration_project);
                $('#locationProject').val(response.jobdesc.location_project);
                $('#intORext').val(response.jobdesc.external_internal);
                $('#companySelected').text(response.jobdesc.company.cmpny_name);
                $('#companySelected').val(response.jobdesc.company.cmpny_id);
                var fileList=response.zipfile;
               
               if(fileList.length!=0){
            	   for(var i=0;i<fileList.length;i++){
                $('#filename1').text(fileList[0].attachmentname);
                $('#filename').text(fileList[1].attachmentname);
            	   }
               }
              
              // $('#jdcategory').val(response.jobdesc.jdCategory);
               
               
               var idTypeVal = $("select[name='jdcategory']");
   			
   			 idTypeVal.find('option[value="' + response.jobdesc.jdCategory + '"]').attr('selected', true);
               $('#categoryFromDb').val(response.jobdesc.jdCategory);
               
               
                $('#account').val(response.jobdesc.acc_name);
                $('#segment').val(response.jobdesc.segment);
                $('#totalpositions').val(response.jobdesc.no_of_positions);
                $('#jobCloseDate').val(response.jobdesc.posEndDate);
                $('#jd_label').val(response.jobdesc.joblabel);
               
                $('#jd_status').val(response.jobdesc.jobstatus);
                $('#jd_priority').val(response.jobdesc.jdPriority);
                $('#allocated_budget').val(response.jobdesc.allocatedBudget);
                
              
                var date = new Date(parseInt(response.jobdesc.jobrecieved_time));
             	
                var daterecieved=formatRecieved(date);
                $('#jobreceivedTime').val(daterecieved);
                $('#jdRecTime').datetimepicker({
                    defaultDate:daterecieved
            });
                $('#jobreceivedTimeFrmDb').val(response.jobdesc.jobrecieved_time);
                

        
                
                },
        error: function(){  
        }
        
    });

    }                                           
           function viewprofileBdm(jobdescid,clientName,jobcode)
           {
        		window.open("view_Profiles_JD?jobId="+jobdescid+"");
              
               }
             
           function showJobDesc(jobid){
               
               
          	$.ajax({
                   type: "get",
                   url: "displayJobDescByJobid?jobid="+jobid,
                   cache: false,
                   async: false,               
                   success: function(response){
                      $("#retrivejobDescription").text(response);
                   },
                   error: function(){                                                                                  
                   }                                                       
               });    
               
              }
           function showTL(jobid,tl){
        	   $("#retriveTL").text(tl);
               
          
               
              }

           function showJobMandatory(jobid){
             	$.ajax({
                     type: "get",
                     url: "displayMandatorySkillsByJobid?jobdescid="+jobid,
                     cache: false,
                     async: false,               
                     success: function(response){
                    	
                   	  $("#skillrow").empty();
                   	  if(response.length==0){
                       	  alert("No mandatory Skills Available");
                       	  
                       	  }
                   	  else{
                         for(var i=0;i<response.length;i++){
                            var tr="<tr><td>"+response[i].reqskill+"</td></tr>";
                        $("#skillrow").append(tr);
                         }
                   	  }
                     },
                     error: function(){                                                                                  
                     }                                                       
                 });     
                 
                }
                    
                        
                                                
     </script>   
     
    
    <script type="text/javascript">

function viewJd(jobdescid){
	$.ajax({
        type: "get",
        url: "view_JdStatus?jobdescid="+jobdescid,
        cache: false,
        async: false,               
        success: function(response){
        	$('#roleCount').empty();
        	for(var i=1;i<=response.length;i++){
        		var tr="<tr><td>"+response[i].role+"</td>"
        		+"<td>"+response[i].selectedCount+"</td>"
        		+"<td>"+response[i].rejectedCount+"</td></tr>";
        		$('#roleCount').append(tr);
        		
        	}
        },
        error: function(){  
        	alert("failure");
        }                                                       
    });     
	
}

</script>     


    
         
 <script type="text/javascript">
  $(function() {
    $('#datetimepicker1').datetimepicker({
    	pickDate: false
    });
  });
</script> 
<script>
$(function() {
  $('#jdclosedDate').datetimepicker({
   pickTime:false
  });
});
$(function() {
	  $('#datetimepicker').datetimepicker({
	   pickTime:false
	  });
	});
$(function() {
	  $('#datetimepicker3').datetimepicker({
	   pickTime:false
	  });
	});
</script>   
<script>
$(function() {
  $('#datetimepicker2').datetimepicker({
	  pickDate: false
  });
  $('#datetimepicker4').datetimepicker({
	  pickDate: false
  });
  
});
</script>  
<!-- <script type="text/javascript">
$(function() {
	
  $('#jdRecTime').datetimepicker({
         
  });
});
</script> -->
   
     <script type="text/javascript">
    function client_availability(jobdescid){
       $("#jobid_cl").val(jobdescid);
      

        $.ajax({
              
            type: "get",
            url: "panel_availability_view?jobdescid="+jobdescid,
            cache: false,
            async: false,               
            success: function(response){
             
              $('#client_details').empty();
              if(response.length!=0){
                 for(var i=0;i<response.length;i++){
                	 
                	 var tr="<tr><td>"+response[i].clinterviewdate+"</td>"
                     +"<td>"+response[i].clavalabletime+"</td>"
                     +"<td>"+response[i].clavailabletimeto+"</td>"
                         +"<td>"+response[i].clIntMode+"</td></tr>";
                        
                            
                             /*  +"<td><button id='delete' class='btn btn-default btn-xs'>Delete</button></td> */
                              $('#client_details').append(tr);
                         
                 }
              }
              else{
              
              }
              
            },
            error: function(){   
             
            }                                                       
        });   
        
       }
    </script>
    <script>
function doActionDownload(jobid)
{                                                					
window.location.href="filedownload?jobid="+jobid;				             				  
                
 }  
</script> 
<script type="text/javascript">
    function TP_Availability(jobdescid){
    	$("#jobid_tp").val(jobdescid);
    	//alert(jobdescid);
       
     	 $.ajax({
     		
            type: "get",
            url: "panel_availability_view?jobdescid="+jobdescid,
            cache: false,
            async: false,               
            success: function(response){
            //alert(response.length);
            
              $('#Tp_details').empty();
              for(var i=0;i<response.length;i++){
            	
              var tr="<tr><td>"+response[i].tpname+"</td>"
      		+"<td>"+response[i].tpavailabledate+"</td>"
      		+"<td>"+response[i].tpavalabletime+"</td>"
      		+"<td>"+response[i].interview_type+"</td></tr>";
      		 $('#Tp_details').append(tr);
            
              }
            },
            error: function(){   
            	//alert("failure");
            }                                                       
        });   
        
       }

 </script>
               <script>
               function doMultipleActionDownload(jobid,jobcode)
               {                                                					
               	window.location.href="Multiplefiledownload?jobid="+jobid+"&jobcode="+jobcode;	
                }  
    </script>  
    <script>
    function viewprofileClientScheduled(jobid){
    	var type="client";
    	$.ajax({
            type: "get",
            url: "view_scheduledCandidates?jobdescid="+jobid+"&inttype="+type,
            cache: false,
            async: false,               
            success: function(response){
            	
            	 $('#interviewrow').empty();
            	for(var i=0;i<response.length;i++){
            	
            		var tr="<tr><td>"+response[i].candidate.first_name+"</td>"
            		+"<td>"+response[i].candidate.contact_number+"</td>"
            		+"<td>"+response[i].candidate.primaryskill+"</td>"
            		+"<td>"+response[i].candidate.relevantExp+"</td>"
            		+"<td>"+response[i].clinterviewMode+"</td>"
            		+"<td>"+response[i].clinterviewDate+"</td></tr>";
            		$('#interviewrow').append(tr); 
            		
            	}
            },
            error: function(){  
            	//alert("failure");
            }            
    	});
    }
    function viewprofileTPScheduled(jobid){
    	var type="TP";
    	$.ajax({
            type: "get",
            url: "view_scheduledCandidates?jobdescid="+jobid+"&inttype="+type,
            cache: false,
            async: false,               
            success: function(response){
            	
            	 $('#interviewrow').empty();
            	for(var i=0;i<response.length;i++){
            		
            		var tr="<tr><td>"+response[i].candidate.first_name+"</td>"
            		+"<td>"+response[i].candidate.contact_number+"</td>"
            		+"<td>"+response[i].candidate.primaryskill+"</td>"
            		+"<td>"+response[i].candidate.relevantExp+"</td>"
            		+"<td>"+response[i].tpinterviewMode+"</td>"
            		+"<td>"+response[i].tpinterviewDate+"</td></tr>";
            		$('#interviewrow').append(tr); 
            		
            	}
            },
            error: function(){  
            	//alert("failure");
            }            
    	});
    }
    </script>  

   <script>
   $("#assigntlDiv").hide();
    $("#updateDiv").show();
    function getLabel(){
    	var label=$("#jd_label").val();
    	var filename1=$("#filename1").text();
    	var filename=$("#filename").text();
    	
   
    	if(label=="RECYCLE"){
         
    		$("#updateDiv").hide();
        	$("#reassignDiv").show();
        	$("#reassign").val("reassign");
        	$("#assigntlDiv").show();  
        	$("#assignTo").attr("required",true);
        	$("#uploadfile1").attr("required",true);
        	$("#uploadfile").attr("required",true);
        	
    	}
    	else{
    		
    		 $("#updateDiv").show();
    		 $("#assigntlDiv").hide();
        	$("#reassignDiv").hide();
       
        	
        	$("#assignTo").attr("required",false);
        	$("#uploadfile1").attr("required",false);
        	$("#uploadfile").attr("required",false);
        	
    	}
    }
    
   

    
    function cloSeEditModal(){
    	
    	$('#newCeationChkBox').prop('checked', false);
    	
    	var dateNow = new Date();
        $('#jdRecTime').datetimepicker({
            defaultDate:dateNow
        });
    	 $("#assigntlDiv").hide();  
    	  
    	 window.location.reload();
    }
    

 
    
    $('#newCeationChkBox').change(function() {
    	
    	
    	var categoryFrmDb=$('#categoryFromDb').val();
    	var category=$('#jdcategory').val();
    	
    	var chkBox=$('#newCeationChkBox').is(":checked");
    	
    	
    	
    	var receivedTimeFrmDb=$('#jobreceivedTimeFrmDb').val();
     	var date = new Date(parseInt(receivedTimeFrmDb));
     	
        var daterecieved=formatRecieved(date);
     	
    	var receivedTime=$('#jobreceivedTime').val();
    	
    	
    	   if((chkBox==true) ) {
    		   if((daterecieved!=receivedTime)||(categoryFrmDb!=category)){
    			   $("#updateDiv").hide();
    	        	$("#reassignDiv").show();
    	        	$("#reassign").val("reassign");
    	        	$("#assigntlDiv").show();  
    	        	$("#assignTo").attr("required",true);
    	        	$("#uploadfile1").attr("required",true);
    	        	$("#uploadfile").attr("required",true); 
    		   }
    	 
    		   else if((daterecieved==receivedTime)||(categoryFrmDb==category)){
           		   alert("No Requirement Category or Job Time received changed. Are you trying to create new requirement?");
           		$('#newCeationChkBox').prop('checked', false); 
           		  $('#jobreceivedTime').val(daterecieved);
           		$('#receivedTimeChkBox').prop('checked', false);
           		var idTypeVal2 = $("select[name='jdcategory']");
     			 idTypeVal2.find('option[value="' + categoryFrmDb + '"]').prop('selected', 'selected');
           		   $("#updateDiv").show();
             		 $("#assigntlDiv").hide();
                 	$("#reassignDiv").hide();
                 	$("#assignTo").attr("required",false);
                 	$("#uploadfile1").attr("required",false);
                 	$("#uploadfile").attr("required",false);
           	   }
    	   }
         else if(chkBox==false ){
    		         		//   alert("chkBox---false");
       		  $('#jobreceivedTime').val(daterecieved);
       		var idTypeVal2 = $("select[name='jdcategory']");
 			 idTypeVal2.find('option[value="' + categoryFrmDb + '"]').prop('selected', 'selected');
       		   $("#updateDiv").show();
         		 $("#assigntlDiv").hide();
             	$("#reassignDiv").hide();
             	$("#assignTo").attr("required",false);
             	$("#uploadfile1").attr("required",false);
             	$("#uploadfile").attr("required",false);
       	   }
    	   
 	   else{
				var idTypeVal2 = $("select[name='jdcategory']");
 			 idTypeVal2.find('option[value="' + categoryFrmDb + '"]').prop('selected', 'selected');
 		   	$("#updateDiv").show();
   			 $("#assigntlDiv").hide();
       		$("#reassignDiv").hide();
       	/* $("#assigntlDiv").show();  */
       	
       	$("#assignTo").attr("required",false);
       	$("#uploadfile1").attr("required",false);
       	$("#uploadfile").attr("required",false);
 	   }
 	});
    
    
    
    </script> 
   
<script>
function formatRecieved(reciveddate){
	 var day = reciveddate.getDate();
	    var month = reciveddate.getMonth() + 1;
	    var year = reciveddate.getFullYear();
	   var hours=reciveddate.getHours();
	    var min=reciveddate.getMinutes();
	    var sec=reciveddate.getSeconds();
	    var ms=reciveddate.getMilliseconds(); 
	    day = day < 10 ? "0" + day : day; 
	    month = month < 10 ? "0" + month : month; 
	    var formattedDate = year+ "-" +month+ "-" +day+" "+hours+":"+min+":"+sec;  
	    //var formattedDate = year+ "-" +month+ "-" +day;   
	    return formattedDate;
}
</script>
<script>
function ValidateSize(file) {
	
	var maxFileSize = 20480000; // 1MB -> 1000 * 1024
    var FileSize = file.files[0].size ;
    if (FileSize > maxFileSize) {
        alert('File not accept more than 20 MB');
        $(file).val('');
      
    }else {}
    

}
 function chkJobCode(){
	var jc=$('#jobCode').val();//\w
	
	if(/^[0-9a-zA-Z ]+$/.test(jc) == false) {
	    alert('Job code not allow special characters characters.');
	    
	}else if((jQuery.trim( jc )).length==0){
		alert('Job code  not accpets only spaces.');
		$('#jobCode').val("");
	}
} 
</script> 
<script>
		function mailProofUpload(jobId){
		$('#jobdesid').val(jobId);
		 }                  
		 </script>
		 <script>

function fileupload(file) {
	
	var maxFileSize = 10240000;
        var FileSize = file.files[0].size ;
        var FileType = file.files[0].type ;
    
        if (FileType=="") {
           
        }else{
        	alert('Only mail formats are accepted(.msg)..');
            $(file).val('');
        	
        } 
        if(FileSize>maxFileSize) {
        	 alert('File size exceeds 10 MB');
             $(file).val('');
        }
        else {

        }
    }
</script>


<script>
		function mailProofUpload(jobId){
		$('#jobdesid').val(jobId);
		
		$.ajax({
	    	type: "POST",
	        url: "getMailProofFileName?jobid="+jobId,
	        cache: false,
	        async: false,               
	        success: function(response){
	        	//alert(response)
	        	 $('#mailprfid').text(response);
	        	
	        },
	        error: function(){  

	        }
	        
	        });
		
		 }                  
		 </script>
		 <script>
function fileupload(sender) 
{
    var fext = new Array(".xlsx", ".xls");
    var fname = sender.value;
    fname = fname.substring(fname.lastIndexOf('.'));
    
    if (fext.indexOf(fname)<0) 
     {
    document.getElementById('message').innerHTML = "please choose file types are .xls & .xlsx";  
 
    return true;
     }
    else return true;
}
</script>
<script type="text/javascript">
	function doActionEdit(jobid, jobCode,cmpnyname) {
		$.ajax({
			type : "get",
			url : "editUserListByJobID?jobid=" + jobid + "&jobCode=" + jobCode,
			cache : false,
			async : false,
			success : function(response) {
				if (response.length != 0) {
					$('#assignToedit').empty();
					$("#jobIdEdit").val(jobid);
					$("#jobCodeEdit").val(jobCode);
					 $("#cmpnynameEdit").val(cmpnyname);
					for (var i = 0, len = response.length; i < len; i = i + 1) {
						$('#assignToedit').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
						$('#deptIdEdit').val(response[i].deptId);
						$("#mbody_edit").hide();
						$('#jd_edit_assigns').show();
					}
				} else {
					$("#jd_edit").text("PLEASE ASSIGN JD BEFORE EDITTING");
					$('#jd_edit_assigns').hide();
					$("#mbody_edit").show();
				}
				var userName = "";

				$.ajax({
					type : "get",
					url : "getAssignedUserByJobID?jobid=" + jobid,
					cache : false,
					async : false,
					success : function(response) {
						for (var i = 0, len = response.length; i < len; i = i + 1) {

							var name = response[i].user.userName;
							$("option").filter(function() {
								return $(this).text() == name;
							}).prop('selected', 'selected');
						}
						$('#assignToedit').multipleSelect();


					},
					error : function() {}
				});

			},

			error : function() {}
		});

	}
    $('#EditAssaignee').click(function(){
    	
    	var selected = [];
    	var noselected = [];
    	    $.each($('#assignToedit option'), function (key, value) {

    	        if (!$(this).prop('selected')) {
    	            noselected[key] = $(this).val();
    	         
    	           
    	        } else {
    	            selected[key] = $(this).val();
    	          
    	        }
    	    });
    	    $('#unAssignEmp').val(noselected);
    	    $('#EditAssaignee').attr('disabled',true);
    		$('#editAssignedEmp').submit();
    	
    });
</script>

<script type="text/javascript">
  function checkForm(form)
  {
    form.updateJd.disabled = true;
    form.updateJd.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.updateJd.disabled = false;
    form.updateJd.value = "Submit";
    form_being_submitted = false;
  }
</script>

</body>
</html>