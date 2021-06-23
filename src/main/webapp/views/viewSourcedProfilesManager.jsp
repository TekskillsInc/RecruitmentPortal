	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.9.2/full/ckeditor.js"></script>
<link href="resources/assets/stylesheets/jquery.timepicker.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"	media="all" rel="stylesheet" type="text/css" />
</head>
<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	font-weight: bold;
	border-radius: 50%;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}
.pagination

 

a


:hover


:not

 

(
.active

 

)
{
background-color


:

 

cyan


;
}
</style>

<section id='content'>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'
			style="margin-top: -100px;">
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

						<div class='box-header orange-background'
							style="line-height: 20px;">

							<div class='title' style="line: width:50px;">

								<Strong style="color: #000080; font-size: 25px;">View
									Source Profile</Strong>
							</div>



						</div>
	

						<div class='box-content box-no-padding'>
						<br>
						<b>
					
								<center>
									Client :<font color="red"> &nbsp${client}&nbsp&nbsp</font> &&
									&nbsp&nbsp JobCode:&nbsp <font color="red">${jobCode} </font>
								</center>
							</b>
							</br>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<div class="pagination">
										<input type="hidden" id="jobId" value="${jobId}">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10' data-pagination-bottom='true'
											style='margin-bottom: 0;' id="sampletable">
											<thead>
												<tr>
													<th style='text-align: center; vertical-align: middle;color:#000080;'>Rec Sub Date</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BDM
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Number/
														Alt Number</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Candidate
														Details</th>
													<c:choose>
														<c:when test="${role=='TEAMLEAD'}">
															<th
																style='text-align: center; vertical-align: middle; color: #000080;'>Edit
																Candidate</th>
														</c:when>
													</c:choose>

													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Recruiter
														Name</th>
													<c:choose>
														<c:when test="${role=='TEAMLEAD'}">
															<th style='text-align: center; vertical-align: middle;color:#000080;'>Schedule interview
													        </th>
														</c:when>
													</c:choose>	
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>%</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Resume
														Download</th>
													<!-- <th style='text-align: center; vertical-align: middle;color:#000080;'>OtherDocuments Download</th> -->
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>TP
														Interview Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Interview Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Result
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Profile
														Status @ Client</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Status</th>
														<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BD
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Comments</th>
														
														
													<c:if test="${role=='SCT'}">
														<th
															style='text-align: center; vertical-align: middle; color: #000080;'>SCT
															Comments</th>
														<th
															style='text-align: center; vertical-align: middle; color: #000080;'>BDM
															Status</th>
													</c:if>
															
													<c:if test="${role=='TEAMLEAD'}">
														<th style='text-align: center; vertical-align: middle; color: #000080;'>
														TL Rejected Comments</th>
													</c:if> 
													
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Upload
														Documents</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="candidate" items="${candidateinfolist}">
													<tr>
													<td>${candidate.candidateStatusObj.recSubmitDate}</td>
														<td>
															<div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-status'
																	onclick="doActionstatus('${candidate.candidateInfo.candidateid}','${candidate.candidateInfo.first_name}','${jobId}')">
																	${candidate.candidateInfo.first_name}
																	${candidate.candidateInfo.middle_name}
																	${candidate.candidateInfo.last_name} </a>
															</div>
														</td>
														<td>${bdName}</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-candidateFeedBack'
															onclick="candidatefeedback_View('${candidate.candidateInfo.candidateid}','${candidate.candidateInfo.contact_number}','${candidate.candidateInfo.first_name}')">${candidate.candidateInfo.contact_number}</a></td>
														<td><div class='text-right'>
																<a href='#modal-candidateDetails' class='btn btn-default btn-xs' data-toggle='modal'
																	onclick="candidateDetails('${candidate.candidateInfo.candidateid}','${candidate.candidateInfo.basic_qualification}','${candidate.candidateInfo.highest_qualification}'
							,'${candidate.candidateInfo.total_experience}','${candidate.candidateInfo.primaryskill}',
							'${candidate.candidateInfo.dob}','${candidate.candidateInfo.first_name}','${candidate.candidateInfo.relevantExp}',
							'${candidate.candidateInfo.candDesignation}','${candidate.candidateInfo.currentCTC}','${candidate.candidateInfo.expectedCTC}',
							'${candidate.candidateInfo.noticeperiod}','${candidate.candidateInfo.workLocation}','${candidate.candidateInfo.current_org}',
							'${candidate.candidateInfo.pancard}','${candidate.candidateInfo.emailID}','${candidate.candidateInfo.noticeprd_negotiable}'
							,'${candidate.candidateInfo.desc_np_negotion}','${candidate.candidateInfo.f2f_intervew}'
							,'${candidate.candidateInfo.doj_cur_org}','${candidate.candidateInfo.prev_relivd_date}','${candidate.candidateInfo.prev_start_date}'
							,'${candidate.candidateInfo.can_native_loc}','${candidate.candidateInfo.is_tek_payroll}','${candidate.candidateInfo.is_working}',
							'${candidate.candidateInfo.cur_cmpny_name}'	,'${candidate.candidateInfo.duration}','${candidate.candidateInfo.prev_org}',
							'${candidate.candidateInfo.bank_stmt}','${candidate.candidateInfo.bank_name}','${candidate.candidateInfo.bank_loc}',
							'${candidate.candidateInfo.cmpny_docs}'	,'${candidate.candidateInfo.job_change}','${candidate.candidateInfo.intrw_pipeline}',
							'${candidate.candidateInfo.int_pipeline_com}','${candidate.candidateInfo.offer_inhand}','${candidate.candidateInfo.family_bckgrund}',
							'${candidate.candidateInfo.spouse_wrk}','${candidate.candidateInfo.kids_info}','${candidate.candidateInfo.resn_reloc}'
							,'${candidate.candidateInfo.skypeid}','${candidate.candidateInfo.min_timereq_join}','${candidate.candidateInfo.can_native_loc}',
							'${candidate.candidateInfo.contact_number}','${candidate.candidateInfo.secskill}','${candidate.candidateInfo.rep_mgr_name}'
							,'${candidate.candidateInfo.mgr_official_emailid}','${candidate.candidateInfo.intrstlevlworkLoc}','${candidate.candidateInfo.comskillsRatig}'
							,'${candidate.candidateInfo.professional_Refrnces}','${candidate.candidateInfo.idProofDetails}')"
																	> <i
																	class='icon-user' style="color: Orange;"></i>
																</a>
															</div></td>



														<c:choose>
															<c:when test="${role=='TEAMLEAD'}">
																<td>
																	<div class='text-right'>
																		<a class='btn btn-default btn-xs' data-toggle='modal'
																			onclick="editProfile('${candidate.candidateInfo.candidateid}','${jobId}','${jobCode}')"
																			href='#modal-EditProfiles'> <i class='icon-edit'
																			style='color: green'></i>
																		</a>
																	</div>
																</td>
															</c:when>
														</c:choose>

														<td>${candidate.userName}</td>
														<c:choose>
															<c:when test="${role=='TEAMLEAD'}">
														<td><div class='text-right'>
															<a class='btn btn-default btn-xs' data-toggle='modal'
																onclick="scheduleInterview('${candidate.candidateInfo.candidateid}',
																'${jobId}','${jobCode}','${candidate.candidateInfo.first_name}',
																'${candidate.empl_lead}','${candidate.sourcedBy}','${client}',
																'${candidate.clientAvaiableFromTime}','${candidate.clientAvaiableToTime}')"
																href='#modal-SchInterview'>  <i class='icon-calendar' style="color:blue;" ></i>
															</a>
														</div></td>
														</c:when>
														</c:choose>

														<td>
															<div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-percentages'
																	onclick="doActionCad('${candidate.candidateInfo.candidateid}')">
																	<i class='icon-info' style='color: blue'></i>
																</a>
															</div>

														</td>
														<td><c:choose>
																<c:when
																	test="${candidate.candidateInfo.file_upload_name == ''}">
																	<div class='text-center'
																		style="background-color: grey; color: white;">
																		<strong></strong>
																	</div>
																</c:when>
																<c:otherwise>
																	<a
																		href="${pageContext.request.contextPath}/download/${candidate.candidateInfo.candidateid}.html"><i
																		class="icon-file"></i></a>
																</c:otherwise>
															</c:choose></td>

														

														<c:choose>

															<c:when
																test='${empty candidate.interevieDetails.interviewstatus}'>
																<td style="color: Black;"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.interevieDetails.interviewstatus=="Scheduled"}'>
																<td style="color: green;"><b>${candidate.interevieDetails.interviewstatus}</b></td>
															</c:when>

															<c:otherwise>
																<td style="color: red;"><b>${candidate.interevieDetails.interviewstatus}</b></td>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when
																test='${empty candidate.interevieDetails.clientinterview}'>
																<td style="color: Black;"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.interevieDetails.clientinterview=="Scheduled"}'>
																<td style="color: green;"><b>${candidate.interevieDetails.clientinterview}</b></td>
															</c:when>
															<c:otherwise>
																<td style="color: red;"><b>${candidate.interevieDetails.clientinterview}</b></td>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when test='${empty candidate.candidateStatus.status}'>
																<td style="color: Black;" id="tlresStats${candidate.candidateInfo.candidateid}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatus.status=="Selected"}'>
																<td style="color: green;" id="tlresStats${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatus.status}</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatus.status!="Selected"}'>
																<td style="color: red;" id="tlresStats${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatus.status}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>




														<c:choose>
															<c:when
																test='${empty candidate.candidateStatusObj.clientStatus}'>
																<td style="color: Black;"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.clientStatus=="Selected"}'>
																<td style="color: green;"><b>${candidate.candidateStatusObj.clientStatus}</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.clientStatus!="Selected"}'>
																<td style="color: red;"><b>${candidate.candidateStatusObj.clientStatus}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise> 
														</c:choose>

														<c:choose>
															<c:when
																test='${empty candidate.candidateStatusObj.sctStatus}'>
																<td style="color: Black;" id="tl_sctprevent"><b>N/A</b></td>
															</c:when>
													<c:when
																test='${candidate.candidateStatusObj.sctStatus=="Selected"}'>
																<td style="color: green;"><b><a
																data-toggle='modal' href="#viewsctcomntid"
																 onclick="sctViewComment(${candidate.candidateInfo.candidateid})" 
																 style="color: red;">${candidate.candidateStatusObj.sctStatus}</a></b></td>
															</c:when>
												<c:when
																test='${candidate.candidateStatusObj.sctStatus!="Selected"}'>
																<td style="color: red;"><b><a
																data-toggle='modal' href="#viewsctcomntid"
																 onclick="sctViewComment(${candidate.candidateInfo.candidateid})" 
																 style="color: red;">${candidate.candidateStatusObj.sctStatus}</a></b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>
														
														<c:choose>
															<c:when	test='${empty candidate.candidateStatusObj.bdmStatus}'>
																<td style="color: black;"><b>N/A</b></td>
																</c:when>
															<c:otherwise>
																<td style="color: darkgreen;"><b>${candidate.candidateStatusObj.bdmStatus}</b></td>
														</c:otherwise>
														</c:choose>
														
														
														<c:choose>
															<c:when test='${role=="SCT"}'>
																<td><select class="selectBox"
																	id="tlStatus${candidate.candidateInfo.candidateid}"
																	onchange="tlstatusfun(${candidate.candidateInfo.candidateid})"
																	required>
																		<option value="">-- Select Status --</option>
																		<option value="Selected">SCT Select </option>
																		<option value="BD Select">BD Select</option>
																		<option value="Director select">Director select</option>
																		<option value="VP select">VP select</option>
																		<option value="Asst VP select">Asst VP select</option>
																		<option value="Screen pending">Screen pending</option>
																		<option value="SCT Screen Hold">SCT Screen Hold</option>
																		<option value="SCT screen reject">SCT screen reject</option>
																		<option value="SCT soft skills reject">SCT soft skills reject</option>
																		<option value="Technical review reject">Technical review reject</option>

																</select></td>

															</c:when>
															<c:when test='${role=="TEAMLEAD"}'>
																<td><select class="selectBox"
																	id="tlStatus${candidate.candidateInfo.candidateid}"
																	onchange="tlstatusfun(${candidate.candidateInfo.candidateid})"
																	required>
																		<option value="">-- Select Status --</option>
																		<option value="Selected">Selected</option>
																		<option value="TL reject">TL reject</option>
																		<option value="On Hold">On Hold</option>
																		<%--  <option value="${candidate.candidateStatus.status}" selected>${candidate.candidateStatus.status}</option>  --%>
																</select></td>
															</c:when>
															<c:when test='${role=="MANAGER"}'>
																<td><select class="selectBox"
																	id="tlStatus${candidate.candidateInfo.candidateid}"
																	onchange="tlstatusfun(${candidate.candidateInfo.candidateid})"
																	required>
																		<option value="">-- Select Status --</option>
																		<option value="Selected">

</option>
																		<option value="Rejected">Rejected</option>
																		<option value="On Hold">On Hold</option>

																</select></td>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose>

														<td id="comments${candidate.candidateInfo.candidateid}">
															<div
																id='chooseReason${candidate.candidateInfo.candidateid}'
																style="display: none">
																<select class='input-large'  onchange="tlrejectreason(${candidate.candidateInfo.candidateid})"
																	id="rejReason${candidate.candidateInfo.candidateid}"
																	name='comment' data-toggle='modal'>
																	<option value='Technical Fitment'>Technical Fitment</option>
																	<option value='Culture_Fitment'>Culture Fitment</option>
																	<option value='Duplicated'>Duplicated(Already submitted by other vendor)</option>
																	<option value='Experience_Constraint'>Experience Constraint</option>
																	<option value='SalaryRateConstraint'>Salary/Rate Constraint</option>
																	<option value='CommSkills'>Comm Skills</option>
																	<option value='LocationConstraint'>Location Constraint</option>
																	<option value='NotforContract'>Not for Contract</option>
																	<option value='OtherComments'>Other Comments</option>
																</select>
															</div>
															<div id="txtArea${candidate.candidateInfo.candidateid}">
																<textarea
																	id="reason${candidate.candidateInfo.candidateid}"
																	name='comment' data-rule-required='true' rows='1'
																	cols='20' maxlength='1500' required></textarea>
															</div>


														</td>
														<c:if test="${role=='TEAMLEAD'}">
														<td>
														<div>
														<textarea id="tlrejcomment${candidate.candidateInfo.candidateid}"
																name='tlrejcomment' data-rule-required='true' rows='1'
																cols='20' maxlength='1500'  disabled>${candidate.candidateStatusObj.tlrejectedcomments}
														</textarea>
														</div>
														</td>
														</c:if>

														<c:if test="${role=='SCT'}">
															<td>
																<div
																	id="hidecoment${candidate.candidateInfo.candidateid}">
																	<a
																	onclick="clickComment(${candidate.candidateInfo.candidateid})"
																		data-toggle='modal' href="#modal-upload">Comments</a>
																</div>
															</td>
															<td><c:choose>
																	<c:when
																		test="${candidate.candidateStatusObj.bdmStatus=='To Client-SCT Pending'}">
																		<span style="color: blue;">${candidate.bdmStatus}</span>
																	</c:when>
																	<c:otherwise>
						
																	</c:otherwise>
																</c:choose></td>
														</c:if>


														<td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="uploadFile('${candidate.candidateInfo.candidateid}','${jobId}','${candidate.candidateInfo.contact_number}','${bdName}','${recusername}','${jobCode}','${client}')"
															href='#modal-example3'><strong>Upload
																	Document </strong> </a>
														<td><c:choose>

																<c:when
																	test="${candidate.candidateStatusObj.bdmStatus=='To Client'}">
																	<div class='text-center'>
																		<button type='button'
																			class='btn btn-default btn-small' disabled>SUBMIT</button>
																								</div>
																</c:when>
																
																<c:when
																	test="${candidate.candidateStatusObj.bdmStatus=='To Client-SCT Pending'}">
																<c:choose>	
																	<c:when
																	 test="${role=='SCT'}">
																	<div class='text-center'>
																		
																			<button class='btn btn-default btn-small'
																			id="ststusUpdate${candidate.candidateInfo.candidateid}"
																			onclick="saveTLStatus('${candidate.candidateInfo.candidateid}',
																			'${candidate.candidateInfo.first_name}','${jobId}','${candidate.empl_lead}','${candidate.sourcedBy}','${bdName}')"
																			>SUBMIT</button>
																			</div>
																			</c:when>
																			<c:otherwise>
																			<div class='text-center'>
																		
																			<button class='btn btn-default btn-small' disabled>SUBMIT</button>
																			</div>
																			
																			
																																						
																			</c:otherwise>
																		</c:choose>
										
																	
																</c:when>
																
																
																

																<c:otherwise>
																
																	<div class='text-center'>
																		
																		<button class='btn btn-default btn-small'
																			id="ststusUpdate${candidate.candidateInfo.candidateid}"
																			onclick="saveTLStatus('${candidate.candidateInfo.candidateid}','${candidate.candidateInfo.first_name}','${jobId}','${candidate.empl_lead}','${candidate.sourcedBy}','${bdName}')"
																			disabled>SUBMIT</button>
																	</div>
																</c:otherwise>
															</c:choose></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>


									<div class='modal hide fade' id='modal-example3' tabindex='-1'>
										<div class='modal-header' style="max-width: 980px;">
											<button class='close' data-dismiss='modal' id="closemodel"
												type='button'>&times;</button>
											<h3>
												<i class="icon-user "></i>Upload Documents
											</h3>
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<%-- <c:choose><c:when test="${role=='TEAMLEAD'}"> --%>
															<form class="form-horizontal" style="margin-bottom: 0;"
																id="myforms" method="post" action="uploadFiles"
																enctype="multipart/form-data">

																<input type="hidden" id="candids" name="candid">
																<input type="hidden" id="bdname_ds" name="bdname"
																	value="${bdName}"> <input type="hidden"
																	id="recname_ds" name="recname" value="${recusername}">
																<input type="hidden" id="clientname_ds"
																	name="clientname" value="${clientName}"> <input
																	type="hidden" id="jobid_ds" name="jobid"
																	value="${jobId}"> <input type="hidden"
																	id="upjobcode" name="jobcode" value="${jobCode}">
																<input type="hidden" id="upcmpny" name="cmpny"
																	value="${client}">

																<center>
																	<div class="form-group">
																		<label><strong><b>Add New Docs</b>
																				&nbsp&nbsp&nbsp
																				<button class="btn btn-success" type="button"
																					onclick="adddocuments();">+</button></strong></label>

																		<div id="adddocuments"></div>
																	</div>
																</center>
																<center>
																	<div class="form-group" id="submitid"
																		style="display: none;">
																		<input type="submit" id="docssubmit"
																			class="btn btn-success btn-xs"
																			style="background: #0b3c7c" value="Submit">
																	</div>
																</center>


																<br> <br>
																<div class='box-content box-no-padding'>
																	<div class='responsive-table'>
																		<div class='scrollable-area'
																			style="height: 175px; overflow-y: scroll;">
																			<table
																				class='data-table table table-bordered table-striped'
																				data-pagination-records='10'
																				data-pagination-top-bottom='true'
																				style='margin-bottom: 0;' id="sampletable3">

																				<tr>
																					<th>File Type</th>
																					<th>File Name</th>


																				</tr>

																				<tbody id="fileAttachments">

																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class='modal hide fade' id='modal-SchInterview'
										tabindex='-1'>
										  <div class='modal-header' style="border-bottom: transparent;"> 
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<!-- <h3 id="candidateName"></h3> -->
										 </div> 
										<b><legend>Schedule Interview</legend></b>
										<div class='modal-body'>
										<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<form class="form-horizontal" style="margin-bottom: 0;"
																id="schIntform" method="post" action="candidateInteSchedule"
																>
																<div class='step-content'>
																	<div class='row'>
																	
																	<input type="hidden" name="siJobId" id="siJobId" />
																			<input type="hidden" name="sicandidateid"
																				id="sicandidateid" />
																					<input type="hidden" name="silead"
																				id="silead" />
																					<input type="hidden" name="sisourced"
																				id="sisourced" />
																				<input type="hidden" name="sicomapny"
																				id="sicomapny" />
																			<div class='control-group'>
																				<label>Job Code</label>
																				<div>
																					<input class='span12' id='sijobcode' name='sijobCode'
																						type='text' readonly>
																					<p class='help-block'></p>
																				</div>
																				
																			</div>
																			<div class='control-group'>
																				<label>Candidate name</label>
																				<div>
																					<input class='span12' id='siCName' name='siCName'
																						type='text' readonly>
																					<p class='help-block'></p>
																				</div>
																				
																			</div>
																	<div class='control-group'>
																	<label for='interview'> Interview Type</label>
																	<div>
																		<select data-rule-required='true' class='span12'
																			id='interviewType' name='interviewType' required>
																			<option value="">Select</option>
																			<option value="Client">Client</option>
																			<option value="Internal">Internal</option>

																		</select>
																	</div>
																</div>
																<div class='control-group'>
																	<label for='interview'>Mode of Interview </label>
																	<div>
																		<select data-rule-required='true' class='span12'
																			id='interviewmode' name='interviewmode' required>
																			<option value="">Select</option>
																			<option value="Telephonic">Telephonic</option>
																			<option value="Skype">Skype</option>
																			<option value="F2F">F2F</option>
																			<option value="NA">NA</option>
																		</select>
																	</div>
																</div>
																
																<div class='control-group'>
																	<label>ClientAvailability Time From</label>
																		<div>
																		<div>
																				<input  name='clifromtime' id='clifromtime' style="color:red"
																					 placeholder='Select Time' 
																					type='text' readonly>
																			</div>
																		</div>
																		<div class='controls'>
																			<input class='form-control' data-rule-minlength='2'
																				data-rule-required='true' id='sdpicker'
																				name='sdpicker' type='hidden'>
																		</div>
																</div>

																	<div class='control-group'>
																	<label>ClientAvailability Time To</label>
																		<div>
																		<div>
																			<input  name='clitotime' id='clitotime'
																					 placeholder='Select Time'  style="color:red"
																					type='text' readonly>
																			</div>
																		</div>
																		<div class='controls'>
																			<input class='form-control' data-rule-minlength='2'
																				data-rule-required='true' id='sdpicker'
																				name='sdpicker' type='hidden'>
																		</div>
																</div>
																
																	<div class='control-group'>
																	<label for='interviewdate'>Interview Date </label>
																	<div>
																		<div id="datetimepicker1" class="input-append">
																			<input class='span12' data-rule-required='false'
																				data-format='yyyy-MM-dd ' id='interviewdate'
																				name='interviewdate' placeholder='Select Date'
																				type='text' required> <span class='add-on'> <i
																				data-date-icon='icon-calendar'
																				></i>
																			</span>
																		</div>
																	</div>
																</div>
																<div class='control-group'>
																	<label  >Interview Time</label>
																		<div>
																		<div>
																				<input  name='interview_time' id='interview_time'
																					 placeholder='Select Time' data-format="HH:mm:ss"
																					type='text' required>
																			</div>
																		</div>
																		<div class='controls'>
																			<input class='form-control' data-rule-minlength='2'
																				data-rule-required='true' id='sdpicker'
																				name='sdpicker' type='hidden'>
																		</div>
																</div>
																
																<div class='control-group'>
																	<label for='interview'> Interview Status<span style="color: red">(*)</span></label>
																	<div>
																		<select data-rule-required='true' class='span12'
																			id='interviewstatus' name='interviewstatus' required>
																			<option value="">Select</option>
																			<option value="Scheduled">Scheduled</option>
																			<option value="Pending">Pending</option>
																		</select>
																	</div>
																</div>	
																<input class="btn btn-primary" type="button" id="interviewSubmit"
																		value="Schedule Interview" onclick="submitInterview()">
															        <button type="button" class="btn btn-danger" id="btnclose" data-dismiss="modal">Close</button>
																</div>
																</div>
															</form>
															</div>
															</div>
															</div>
															</div>
														</div>
														</div>
	
									<div class='modal hide fade' id='modal-EditProfiles'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>
												<i class="icon-user "></i> Edit Profile
											</h3>
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<form class="form-horizontal" style="margin-bottom: 0;"
																id="myform" method="post" action="updateCandidateInfo"
																enctype="multipart/form-data">
																<input type="hidden" name="sourcedBy"
																	value="${candSourceby}">
																<div class='step-content'>
																	<div class='row'>
																		<div class='span12'>
																			<input type="hidden" name="jobDescId" id="jobDescId" />
																			<input type="hidden" name="candidateid"
																				id="candidateid" />
																			<div class='control-group'>
																				<label>Job ID</label>
																				<div>
																					<input class='span12' id='jobcode1' name='jobCode'
																						type='text' readonly>
																					<p class='help-block'></p>
																				</div>
																			</div>

																			<c:choose>
																				<c:when test="${departmentId == 5}">

																					<div class='control-group'>
																						<label>EAC Number</label>
																						<div>
																							<input class='span12'
																								pattern="[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}"
																								data-rule-required='true' id='panID'
																								class="form-control" data-rule-minlength='2'
																								data-rule-maxlength='20' name='panID'
																								type='text' placeholder="EAC Number" required>
																							<p class='help-block'></p>
																						</div>
																					</div>
																					<div class='control-group'>
																						<label for='h1bstart'>H1B Start Date </label>
																						<div class="col-md-4">
																							<div id="h1bstartDP" class="input-append">
																								<input class='span12' data-rule-required='true'
																									id='h1bstart' name='h1bstart'
																									placeholder='Select H1B Start Date (YYYY/MM/DD)'
																									type='text'> <span class='add-on'>
																									<i data-date-icon='icon-calendar'></i>
																								</span>
																							</div>
																						</div>
																					</div>
																					<div class='control-group'>
																						<label for='h1bend'>H1B End Date</label>
																						<div>
																							<div id="h1bendDP" class="input-append">
																								<input class='span12' data-rule-required='true'
																									id='h1bend' name='h1bend'
																									placeholder='Select H1B End Date (YYYY/MM/DD)'
																									type='text'> <span class='add-on'>
																									<i data-date-icon='icon-calendar'></i>
																								</span>
																							</div>
																						</div>
																					</div>
																				</c:when>

																				<c:otherwise>


																					<div class='control-group'>
																						<label for='panID'>PAN Number</label>
																						<div>
																							<input class='span12'
																								pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}"
																								data-rule-required='true' id='panID'
																								class="form-control" minlength='10'
																								maxlength='10' name='panID' type='text'
																								placeholder="PAN Number" onchange="checkPan()">
																							<span id="panshow" style="color: red;"></span>
																							<p class='help-block'></p>
																						</div>
																					</div>
																				</c:otherwise>
																			</c:choose>
																			<div class='control-group'>
																				<label for='txtFirstName'>First Name <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																						id='txtFirstName' data-rule-maxlength='25'
																						name='txtFirstName' type='text'
																						placeholder="First name....Only Characters"
																						data-rule-required='true' required>
																					<p class='help-block'></p>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label>Middle Name </label>
																				<div>
																					<input class='span12'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																						data-rule-required='false'
																						data-rule-maxlength='20' id='txtMiddleName'
																						name='txtMiddleName' type='text'
																						placeholder="Middle name">
																					<p class='help-block'></p>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label>Last Name <span style="color: red">(*)</span></label>
																				<div>
																					<input class='span12'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																						data-rule-maxlength='20' data-rule-required='true'
																						id='txtLastName' name='txtLastName' type='text'
																						placeholder="Last name...Only Characters" required>
																					<p class='help-block'></p>
																				</div>
																			</div>

																			<div class='control-group'>
																				<label for='email'>Email ID <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-email='true'
																						data-rule-required='true' type='email' id='email'
																						name='email'
																						pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
																						placeholder="Email ID" onchange="checkEmail()"
																						required> <span id="emailshow"
																						style="color: green;"></span>
																						<span id="showgreen" style="color: red;"></span>
																					<p class='help-block'></p>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='Number'>Contact Number <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' minlength='10' maxlength='13'
																						id='phnNumber' name='phnNumber' pattern='\d*'
																						type='text' placeholder="Contact Number"
																						data-rule-required='true'
																						onchange="checkContact()" required>
																						 <span id="phoneshow" style="color: green;"></span>
																						 <span id="phoneshowgreen" style="color: red;"></span>
																					<p class='help-block'></p>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='altNumber'>Alt Contact Number</label>
																				<div>
																					<input class='span12' data-rule-minlength='10'
																						data-rule-maxlength='13' pattern='\d*'
																						data-rule-required='false' min="0" id='altNumber'
																						name='altNumber' type='text'
																						placeholder='Alt Contact Number'>
																				</div>
																			</div>
																			<div class='form-group'>
																				<label for='skype'>Skype Id</label>
																				<div>
																					<input class='span12' data-rule-required='false'
																						id='skypeid' name='skypeid' type='text'
																						placeholder='Skype Id'>
																				</div>
																			</div>
																			<div class='form-group'>
																				<label for='skype'>Candidate Native Location</label>
																				<div>
																					<input class='span12' data-rule-required='false'
																						id='txtNlocation' name='txtNlocation' type='text'
																						placeholder='Naitve Location'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$">
																				</div>
																			</div>

																			<div class='control-group'>
																				<label for='date'>Date of Birth (MM-DD-YYYY)
																					<span style="color: red">(*)</span>
																				</label>
																				<div>
																					<div id="datetimepicker2" class="input-append">
																						<input class='span12' data-rule-required='true'
																							id='dob' name='dob'
																							placeholder=' Date of Birth(YYYY/MM/DD)'
																							type='text' required> <span
																							class='add-on'> <i
																							data-date-icon='icon-calendar'></i>
																						</span>
																					</div>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='basic_qualification'>Basic
																					Qualification <span style="color: red">(*)</span>
																				</label>
																				<div>
																					<select name="basic_qual" data-rule-required='true'
																						id="basic_qual" class='span12' required>
																						<option></option>
																						<option value="Not Pursuing"
																							label="Not Pursuing Graduation">Not
																							Pursuing Graduation</option>
																						<option value="B.A" label="B.A">B.A</option>
																						<option value="B.Arch" label="B.Arch">B.Arch</option>
																						<option value="BCA" label="BCA">BCA</option>
																						<option value="B.B.A" label="B.B.A">B.B.A</option>
																						<option value="B.Com" label="B.Com">B.Com</option>
																						<option value="B.Ed" label="B.Ed">B.Ed</option>
																						<option value="BDS" label="BDS">BDS</option>
																						<option value="BHM" label="BHM">BHM</option>
																						<option value="B.Pharma" label="B.Pharma">B.Pharma</option>
																						<option value="B.Sc" label="B.Sc">B.Sc</option>
																						<option value="B.Tech/B.E." label="B.Tech/B.E.">B.Tech/B.E.</option>
																						<option value="LLB" label="LLB">LLB</option>
																						<option value="MBBS" label="MBBS">MBBS</option>
																						<option value="Diploma" label="Diploma">Diploma</option>
																						<option value="BVSC" label="BVSC">BVSC</option>
																						<option value="Other" label="Other">Other</option>
																					</select>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='high_qualification'>High
																					Qualification</label>
																				<div>
																					<select name="highest_qual"
																						data-rule-required='false' id="highest_qual"
																						class='span12'>
																						<option></option>
																						<option value="Not Pursuing"
																							label="Not Pursuing Graduation">Not
																							Pursuing Graduation</option>
																						<option value="M.A" label="M.A">M.A</option>
																						<option value="M.Arch" label="M.Arch">M.Arch</option>
																						<option value="B.Tech/B.E." label="B.Tech/B.E.">B.Tech/B.E</option>
																						<option value="MCA" label="MCA">MCA</option>
																						<option value="M.B.A" label="M.B.A">M.B.A</option>
																						<option value="M.Com" label="M.Com">M.Com</option>
																						<option value="M.Ed" label="M.Ed">M.Ed</option>
																						<option value="MDS" label="MDS">MDS</option>
																						<option value="MHM" label="MHM">MHM</option>
																						<option value="M.Pharma" label="M.Pharma">M.Pharma</option>
																						<option value="M.Sc" label="M.Sc">M.Sc</option>
																						<option value="M.tech/M.E" label="M.Tech/M.E.">M.Tech/M.E.</option>
																						<option value="LLB" label="LLB">LLB</option>
																						<option value="MBBS" label="MBBS">MBBS</option>
																						<option value="other" label="Other">Other</option>
																					</select>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='ssc'>SSC %</label>
																				<div>
																					<input class='span12' data-rule-required='true'
																						min="1" max="99" id='sscPerc' name='sscPerc'
																						data-rule-maxlength='4' type='number'
																						placeholder="SSC">
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='validate_12'>12<sup>th</sup> %

																				</label>
																				<div>
																					<input class='span12' data-rule-required='true'
																						min="1" max="99" id='plus2Perc' name='plus2Perc'
																						data-rule-maxlength='4' type='number'
																						placeholder="12th %">
																				</div>
																			</div>

																		</div>
																	</div>

																	<div class='row'>
																		<div class='span12'>

																			<div class='control-group'>
																				<label for='validate_graduation'>Graduation
																					%</label>
																				<div>
																					<input class='span12' data-rule-required='true'
																						min="1" max="99" id='ugPerc' name='ugPerc'
																						type='number' placeholder="Graduation">
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='validate_postGraduation'>Post
																					Graduation % </label>
																				<div>
																					<input class='span12' data-rule-required='false'
																						min="1" max="99" id='pgPerc' name='pgPerc'
																						type='number' placeholder="Post Graduation">
																				</div>
																			</div>
																			<div class='control-group'>
																				<label>Primary Skill <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-maxlength='20'
																						data-rule-required='true' id='priSkill'
																						name='priSkill' type='text'
																						placeholder="Primary Skill" required>

																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='skill_SID'>Secondary Skill <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-maxlength='20'
																						data-rule-required='true' id='secSkill'
																						name='secSkill' type='text'
																						placeholder="Secondary Skill" required>

																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='validate_desg'>Candidate
																					Designation <span style="color: red">(*)</span>
																				</label>
																				<div>
																					<input class='span12' data-rule-maxlength='20'
																						data-rule-required='true' id='candidatedesg'
																						name='candidatedesg' type='text'
																						placeholder="Candidate Designation" required>
																					<!-- pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" -->

																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='noticePeriod'>Notice Period <span
																					style="color: red">(*)</span></label> <a
																					href='#modal-editCompDetails' data-toggle='modal'
																					style="float: inherit; color: blue;"> Check
																					Company Notice Period </a>
																				<div>
																					<select name="noticePeriod"
																						data-rule-required='true' id="noticePeriod"
																						class='span12' required>
																						<option value="">Select</option>
																						<option value="Immediate">Immediate</option>
																						<option value="7 Days">7 Days</option>
																						<option value="15 Days">15 Days</option>
																						<option value="30 Days">30 Days</option>
																						<option value="45 Days">45 Days</option>
																						<option value="60 Days">60 Days</option>
																						<option value="90 Days">90 Days</option>
																					</select>
																				</div>
																			</div>
																			<div class='form-group'>
																				<label for='location'>Minimum Time Required
																					To Join <span style="color: red">(*)</span>
																				</label>
																				<div>
																					<input class='span12' id='min_timereq_join'
																						name='min_timereq_join'
																						pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																						type='text' placeholder="Time Required to Join"
																						required>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='experience'>Total Experience <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-minlength='1'
																						data-rule-maxlength='4' data-rule-required='true'
																						min="1" max="99" id='totalExp' name='totalExp'
																						pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																						type='text' placeholder="Total Experience"
																						required>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='revalent'>Relevant Experience <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-minlength='1'
																						data-rule-maxlength='4' data-rule-required='true'
																						min="1" max="99" id='revalentExp'
																						name='revalentExp' type='text'
																						pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																						placeholder="Revalent Experience" required>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='location'>Work Location <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																						data-rule-required='true' data-rule-maxlength='20'
																						id='location' name='location' type='text'
																						placeholder="work location" required>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label for='comp'>Current Organization <span
																					style="color: red">(*)</span></label>
																				<div>
																					<input class='span12' data-rule-required='true'
																						data-rule-maxlength='25' id='currentOrg'
																						name='currentOrg' type='text'
																						pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																						placeholder="Current Organization" required>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='curctc'>Current CTC <span
																			style="color: red">(*)</span></label>
																		<div>
																			<input class='span12' data-rule-required='true'
																				min="1" max="9999999" id='currentctc'
																				pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																				data-rule-maxlength='10' name='currentctc'
																				type='text' placeholder="Current CTC" required>
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='expctc'>Expected CTC <span
																			style="color: red">(*)</span></label>
																		<div>
																			<input class='span12' data-rule-required='true'
																				min="1" max="9999999" id='expectedctc'
																				pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																				name='expectedctc' data-rule-maxlength='10'
																				type='text' placeholder="Expected CTC" required>
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='date'>Date of Joining <span
																			style="color: red">(*)</span>
																		</label>
																		<div>
																			<div id="datetimepicker3" class="input-append">
																				<input class='span12' id='doj' name='doj'
																					placeholder='Select Date of Joining (YYYY/MM/DD)'
																					type='text' required> <span class='add-on'>
																					<i data-date-icon='icon-calendar'></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='txtRMgrname'>Reporting Manager
																			name<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<input class='span12'
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				id='txtRMgrname' data-rule-maxlength='25'
																				name='txtRMgrname' type='text'
																				placeholder="Reporting Manager name"
																				data-rule-required='true' required>
																			<p class='help-block'></p>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='offemail'>Official Email ID<span
																			style="color: red">(*)</span>
																		</label>
																		<div>
																			<input class='span12' data-rule-email='true'
																				data-rule-required='true' type='email' id='offemail'
																				name='offemail'
																				pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$"
																				placeholder="Official Email ID" required> <span
																				id="emailshow" style="color: red;"></span>
																			<p class='help-block'></p>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='npn'>Notice Period Negotiable?<span
																			style="color: red">(*)</span></label><span style="color: red"></span>
																		<div>
																			<select data-rule-required='true' class='span12'
																				id='npn' name='npn' onchange="NPNegotiable()"
																				required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>
																	<div id="npn_r" style="display: none">
																		<label for="bname">Reason<span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="npn_reason" type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Reason" name="npn_reason">
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='work'>Interested to work on
																			payroll of Tekskills in the client place<span
																			style="color: red">(*)</span>
																		</label>
																		<div>
																			<select data-rule-required='true' class='span12'
																				id='work_on_tek_payroll' name='work_on_tek_payroll'
																				required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>


																	<div class='control-group'>
																		<label for='curr_work'>Current Working as
																			permanent / contract Employee<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select data-rule-required='true' class='span12'
																				onchange="checkperm()" id='curr_work_isPerm'
																				name='curr_work_isPerm' required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>
																	<!-- onclick = "ShowHideDiv()" -->

																	<div id="iscontract" style="display: none">
																		<label for="Cname">Payroll Company Name <span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="curcompname" type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Company Name" name="curcompname"
																				required>
																		</div>
																		<label for="Duration">Duration(in Year &
																			Months)<span style="color: red">(*)</span>
																		</label>
																		<div class="control-group">
																			<input class='span12' id="duration" type="text"
																				placeholder="Duration" name="duration"> <span
																				style="color: red">Enter the Year and Months
																				i.e 1 year and 2 months</span>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='prvious_comp_name'>Previous
																			organization/client name<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select data-rule-required='true' class='span12'
																				id='prvcname' onchange="checkPvsCmpny()"
																				name='prvcname' required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>


																	<div id="pvscmpny" style="display: none">
																		<div class='control-group'>
																			<label for='date'>Start Date <span
																				style="color: red">(*)</span></label>
																			<div id="datetimepicker4" class="input-append">
																				<input class='span12' id='std' name='std'
																					placeholder='Select Start Date (YYYY/MM/DD)'
																					type='text'> <span class='add-on'> <i
																					data-date-icon='icon-calendar'></i>
																				</span>
																			</div>
																		</div>

																		<div class='control-group'>
																			<label for='date'>Relieved Date <span
																				style="color: red">(*)</span></label>
																			<div id="datetimepicker5" class="input-append">
																				<input class='span12' id='Rld' name='Rld'
																					placeholder='Select Relived Date (YYYY/MM/DD)'
																					type='text'> <span class='add-on'> <i
																					data-date-icon='icon-calendar'></i>
																				</span>
																			</div>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='Bank_statements'>Latest 6 Months
																			Bank statements<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select data-rule-required='true' class='span12'
																				id='ltbnkstmt' name='ltbnkstmt'
																				onchange="checkLatestBankStmt()" required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>

																	<div id="depdltbnkstmt" style="display: none">
																		<label for="bname">Name of Bank<span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="bankname" type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Bank Name" name="bankname">
																		</div>
																		<label for="bLocation">Location<span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="bLocation" type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Location" name="bLocation">
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='expctc'>Having all companies
																			documents (offer and relieving letters)<span
																			style="color: red">(*)</span>
																		</label>
																		<div>
																			<select class='span12' id='hav_all_doc'
																				name='hav_all_doc' required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='reason_for_reloc'>Reason for
																			relocation<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<input class='span12'
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				data-rule-maxlength='25' id='reason_reloc'
																				name='reason_reloc' type='text'
																				placeholder="Reason for relocation" required>
																		</div>
																	</div>


																	<div class='control-group'>
																		<label for='reason_job_change'>Reason for job
																			change<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<input class='span12'
																				pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																				data-rule-maxlength='25' id='reason_job_change'
																				name='reason_job_change' type='text'
																				placeholder="Reason for job change" required>
																		</div>
																	</div>



																	<div class='control-group'>
																		<label for='any_inerview'>Any interviews are
																			in pipeline<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select class='span12' id='any_intervw'
																				name='any_intervw' onchange="interPipe()" required>
																				<option value=" ">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>


																	<div id="anyInterviewpipeline" style="display: none">
																		<label for="cname">Interview With Company <span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="com_name" type="text"
																				pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																				placeholder="company Name"
																				placeholder="company Name" name="com_name">
																		</div>
																	</div>


																	<div class='control-group'>
																		<label for='any_offer'>Had any offer in hand<span
																			style="color: red">(*)</span></label>
																		<div>
																			<select class='span12' id='any_offer'
																				name='any_offer' required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='f2fwe'>Available for F2F in Week
																			days?<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select class='span12' id='f2f_WE' name='f2f_WE'
																				required>
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>

																	<div class='control-group'>
																		<label for='family_background'>Family
																			background<span style="color: red">(*)</span>
																		</label>
																		<div>
																			<select class='span12' id="fmbcground"
																				onchange="checkfmgroungd()" name="fmbcground"
																				required>
																				<option value="">Select</option>
																				<option value="YES">Married</option>
																				<option value="NO">Single</option>
																			</select>
																		</div>
																	</div>

																	<div id="spwork" style="display: none">
																		<label for="spwork">Spouse does Job<span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<select class='span12' id="is_spouse_work"
																				name="is_spouse_work">
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																		<label for="kids">Have Kids<span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<select class='span12' id="is_hav_kids"
																				name="is_hav_kids">
																				<option value="">Select</option>
																				<option value="YES">YES</option>
																				<option value="NO">NO</option>
																			</select>
																		</div>
																	</div>
																	<div>
																		<label for="bname">ID proof details <span
																			style="color: red">(*)</span></label>
																		<div class="control-group">
																			<input class='span12' id="idProofDetails" type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="ID proof" name="idProofDetails"
																				required>
																		</div>
																	</div>

																	<div>
																		<label for="bname">Interest level in Work
																			Location<span style="color: red">(*)</span>
																		</label>
																		<div class="control-group">
																			<input class='span12' id="intrstlevlworkLoc"
																				type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Interest level in Work Location"
																				name="intrstlevlworkLoc" required>
																		</div>
																	</div>

																	<div>
																		<label for="bname">Communication skills rating
																			(from 1 to 10) <span style="color: red">(*)</span>
																		</label>
																		<div class="control-group">
																			<input class='span12' id="comskillsRatig"
																				type="number" min="1" max="10"
																				placeholder="Communication skills"
																				name="comskillsRatig" required>
																		</div>
																	</div>

																	<div>
																		<label for="bname">Professional references (If
																			Any)<span style="color: red"></span>
																		</label>
																		<div class="control-group">
																			<input class='span12' id="professional_Refrnces"
																				type="text"
																				pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																				placeholder="Professional references"
																				name="professional_Refrnces">
																		</div>
																	</div>
																	<div class='control-group'>
																		<label for='file'>Resume Upload<span
																			style="color: red">(*)</span></label>
																		<div>
																			<input name="file" data-rule-required='false'
																				id='file' type="file" onchange="ValidateSize(this)" />
																			<span id='filename1'></span>
																			<span id='fileexistid' style="color:red"></span>
																		</div>
																	</div>

																	<input class="btn btn-success btn-xs"
																		style="background: #0b3c7c" type="submit" id="candidateupdate"
																		value="Update Candidate">
																</div>
															</form>
														</div>


													</div>
												</div>
											</div>
										</div>
									</div>

									<div class='modal hide fade' id='modal-upload' tabindex='-1'
										style="top: 0%; width: 700px; margin-left: -300px;">
										<div class="ckeditor">
											<div class='modal-header'>
												<center>
													<button class='close' data-dismiss='modal' type='button' id="CKcomment">&times;</button>
													<h3>Comments</h3>
												</center>
											</div>
											<div class='modal-body'>
												<form class='form form-horizontal validate-form'
													style='margin-bottom: 0;' action="addSCTComments"
													method="post" onsubmit="return checkForm(this);" >

													<div class='span12'>
														<div class='control-group'>
															<input type="hidden" id="candiid" name="candiid">
															<input type="hidden" id="jid" name="jid" value="${jobId}">
															<textarea id="commentsct" name='commentsct'
																data-rule-required='true' rows='1' class="ckeditor"
																class="form-control" required></textarea>
															<center>
																<input type="submit"
																	style="background-color: #0b3c7c; color: white;"
																	value="Add Comments" name="myButton" id="myButton"   />
															</center>
														</div>
													</div>
												</form>
												<center>
													<h3>View Comments</h3>
												</center>
												<br>
												<div style="margin-top: -30px;">
													<textarea id="scmnt" name='scmnt' data-rule-required='true'
														rows='1' class="ckeditor" class="form-control"></textarea>
												</div>
											</div>

										</div>

									</div>
										
									
									
									
									
										<div class='modal hide fade' id='viewsctcomntid' tabindex='-1'
										style="top: 0%; width: 700px; margin-left: -300px;">
										<div class="ckeditor">
											<div class='modal-header'>
												<center>
													<button class='close' data-dismiss='modal' type='button'>&times;</button>
													<h3>SCT Comments</h3>
												</center>
											</div>
											<div class='modal-body'>
					
												<div style="margin-top: -30px;">
													<textarea id="leadsctcomnts" name='leadsctcomnts' data-rule-required='true'
														rows='1' class="ckeditor" class="form-control"></textarea>
												</div>
											</div>

										</div>

									</div>
									
									<div class='modal hide fade' id='modal-ckeck' role='dialog'
										tabindex='-1' onclick='window.location.reload()'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'
												id='interv' onclick='window.location.reload()'>&times;</button>
											<h3>History of Status</h3>
										</div>
										<h3 id='select_status'></h3>

									</div>

									<div class='modal hide fade' id='modal-ckeck' tabindex='-1'
										onclick='window.location.reload()'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'
												id='interv' onclick='window.location.reload()'>&times;</button>
											<h3>History of Status</h3>
										</div>
										<h3 id='select_status'></h3>

									</div>

									<div class='modal hide fade' id='modal-status' role='dialog'
										tabindex='-1' style="top: 25%; width: 1300px; left: 23%;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 id="interviewhistory"></h3>

										</div>
										<div class='modal-body'>
											<table class='table table-bordered table-striped'
												style='margin-bottom: 0;border-left:1px solid #dddddd'>
												<thead>
													<tr>


														<th style='text-align: center; vertical-align: middle;'>Client
															Round status</th>
														<th style='text-align: center; vertical-align: middle;'>BDM
															Round status</th>
														<th style='text-align: center; vertical-align: middle;'>SCT
															Status</th>
														<th style='text-align: center; vertical-align: middle;'>Team
															Lead<sup></sup> Round status
														</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><h5 id="Clientstatus"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
														<td><h5 id="BDMstatus"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
														<td><h5 id="sctstatus"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
														<td><h5 id="Teamleadstatus"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
													</tr>
												</tbody>
											</table>
											<table class='table table-bordered table-striped'
												style='margin-bottom: 0;border-left:1px solid #dddddd;'>
												<thead>
													<tr>
														<th style='text-align: center; vertical-align: middle;'>Client
															Comments</th>
														<th style='text-align: center; vertical-align: middle;'>BDM
															Comments</th>
														<th style='text-align: center; vertical-align: middle;'>SCT
															Comments</th>
														<th style='text-align: center; vertical-align: middle;'>Team
															Lead Comments</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td style="width: 200px;"><h5 id="client_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: auto; overflow-x: auto;"></h5></td>
														<td style="width: 200px;"><h5 id="bdm_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: auto; overflow-x: auto;"></h5></td>
														<td style="width: 200px;"><h5 id="sct_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: auto; overflow-x: auto;"></h5></td>
														<td style="width: 200px;"><p
																style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: auto; overflow-x: auto;"
																id="tl_cmnt"></p></td>


													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class='modal hide fade' id='modal-candidateFeedBack'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Candidate Feedback</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id="canFeedback">
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="" method="post"  onsubmit="return checkForm(this);">

												<input type="hidden" name="candidateidFB" id="candidateidFB">


												<div class='row'>
													<div class='span12'>
														<div class='box-content box-no-padding'>
															<div class='responsive-table'>
																<div class='scrollable-area'>
																	<br> <br>
																	<div class='control-group'>
																		<div class='controls'>
																			<b><span id='candidateidNameFB'
																				style="color: red;"></span> <span id='mobileno'
																				style="color: red;"></span></b>
																		</div>
																	</div>
																	<div class='control-group'>
																		<label class='control-label'>Discussion </label>
																		<div class='controls'>
																			<textarea data-rule-minlength='2'
																				data-rule-required='false' id='candidateComment'
																				name='candidateComment' placeholder='' required></textarea>

																		</div>
																	</div>
																	<div class='form-actions' style='margin-bottom: 0'>
																		<input type="button" value="Save" name="myButton" id="myButton"  
																			onclick="saveFeedBack()"  />
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>

												<br>
												<div class='row'>
													<div class='span12'>

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
																				<th style='text-align: center;'>Caller Name</th>
																				<th style='text-align: center;'>Called Date</th>
																				<th style='text-align: center;'>Candidate
																					FeedBack</th>

																			</tr>
																		</thead>
																		<tbody id="candidatefeedback1">
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

									<div class='modal hide fade' id='modal-percentages'
										tabindex='-1'>
										<div class='modal-header' style="border-bottom:transparent!important">
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 id="candidateName"></h3>
										</div>
										<div class='modal-body'>
											<table class='table table-bordered table-striped' style='margin-bottom: 0;border-left:1px solid #dddddd'>
												<thead>
													<tr>
														<th style='text-align: center; vertical-align: middle;'>10<sup>th</sup>
															%
														</th>
														<th style='text-align: center; vertical-align: middle;'>12<sup>th</sup>
															%
														</th>
														<th style='text-align: center; vertical-align: middle;'>Graduation
															%</th>
														<th style='text-align: center; vertical-align: middle;'>Post
															Graduation %</th>
													</tr>
												</thead>
												<tbody>
													<tr>

														<td id="ssc"></td>
														<td id="plus12"></td>
														<td id="graduation"></td>
														<td id="pg"></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class='modal hide fade' id='modal-candidateDetails'
										style="width: 850px; margin-left: -430px; top: 2%;"
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 style="color: red">
												<center>Candidate Details</center>
											</h3>
										</div>
										<div class='modal-body'
											style="font-family: calibri; font-size: 28px; line-height: 33px;">


											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'
															style="font-family: initial; font-size: 18px;">

															<table>
																<tr>
																	<td style="color: purple">Candidate Name (With
																		surname) (As per Pan Card)</td>
																	<td id='cName'></td>
																</tr>

																<tr>
																	<td style="color: purple">Primary & <font
																		color=red>secondary contact number ( mandatory)</font></td>
																	<td id='ccontact_number'></td>
																</tr>
																<tr>
																	<td style="color: purple">E-mail address</td>
																	<td id='cEMail'></td>
																</tr>

																<tr>
																	<td style="color: purple">Total Exp (YY/MM)</td>

																	<td id='cTEXP'></td>
																</tr>
																<tr>
																	<td style="color: purple">Relevant Exp</td>
																	<td id='cRExp'></td>
																</tr>

																<tr>
																	<td style="color: purple">Primary skills (mention
																		skills)</td>

																	<td id='cPSkill'></td>
																</tr>

																<tr>
																	<td style="color: purple">Secondary skills
																		(mention skills)</td>
																	<td id='csecskill'></td>

																</tr>
																<tr>
																	<td style="color: purple">Communication skills
																		rating (1-10)</td>

																	<td id='ccomskillsRatig'></td>
																</tr>

																<tr>
																	<td style="color: purple"><font color=red>Education,
																			Location of College/University where <br> he/she
																			has studied
																	</font></td>
																	<td id='cbasicQual'></td>
																</tr>
																<tr>
																	<td style="color: purple">Master's In</td>

																	<td id='cHQual'></td>
																</tr>
																<tr>
																	<td style="color: purple">Current CTC (LPA) (Fixed
																		and Variable)</td>

																	<td id='cCurCtC'></td>

																</tr>
																<tr>
																	<td style="color: purple">Expected CTC</td>

																	<td id='cExpCtC'></td>
																</tr>

																<tr>
																	<td style="color: purple">Notice period as per the
																		company norms</td>

																	<td id='cNPeriod'></td>
																</tr>

																<tr>
																	<td style="color: purple">If notice period
																		negotiable? How?</td>

																	<td id='cnp_negotiable'></td>
																</tr>
																<tr>
																	<td style="color: purple"><font color=red>Interested
																			to work with Tekskills and in the client place (Y/N).
																			<br> We should promote us as an IT company
																	</font></td>

																	<td id='is_tek_payroll'></td>
																</tr>

																<tr>
																	<td style="color: purple">Current
																		organization/client name with DOJ (MM/YY)</td>

																	<td id='cCurOrg'></td>
																	<!-- <td id='prev_org'></td> -->
																</tr>
																<tr>
																	<td style="color: purple">Working as perm /
																		contract employee?? If contract, <br>payroll
																		company name and duration (YY/MM).
																	</td>
																	<td id='currwork_isPerm'></td>
																</tr>
																<tr>
																	<td style="color: purple">Current Company (Role /
																		Designation)</td>
																	<td id='cDesignation'></td>
																</tr>

																<tr>
																	<td style="color: purple">Latest 6 Months Bank
																		statements (Y/N)<br> (Name of the bank and
																		location)
																	</td>
																	<td id='bank_stmt'>
																</tr>

																<tr>
																	<td style="color: purple">Name of Bank</td>

																	<td id='bank_name'></td>
																</tr>
																<tr>
																	<td style="color: purple">Bank Location</td>

																	<td id='bank_loc'></td>
																</tr>

																<tr>
																	<td style="color: purple">Official email id &
																		Reporting Manager name. (If Any)</td>
																	<td id='crep_mgr_name'></td>
																</tr>
																<tr>
																	<td style="color: purple">Candidate current work
																		location</td>
																	<td id='cWLoc'></td>
																</tr>
																<tr>
																	<td style="color: purple">Interest level in Work
																		Location</td>

																	<td id='cintrstlevlworkLoc'></td>
																</tr>

																<tr>
																	<td style="color: purple">Reason for relocation</td>

																	<td id='resn_reloc'></td>
																</tr>

																<tr>
																	<td style="color: purple">Family background (About
																		spouse work (Y/N) location and <br>kids
																		information).<br> <font color=red> Some
																			information about parents will also help</font>
																	</td>

																	<td id='family_bckgrund'></td>
																</tr>

																<tr>
																	<td style="color: purple">Spouse does job</td>

																	<td id='spouse_wrk'></td>
																</tr>
																<tr>
																	<td style="color: purple">Have Kids</td>

																	<td id='kids_info'></td>
																</tr>


																<tr>
																	<td style="color: purple">Candidate base (Native
																		place) location <font color=red>City/District/Town</font>
																	</td>

																	<td id='cnativeloc'></td>
																</tr>
																<tr>
																	<td style="color: purple">Reason for job
																		change(Valid reason)</td>
																	<td id='job_change'></td>
																</tr>

																<tr>
																	<td style="color: purple">Previous
																		organization/client name (start & relieved date)</td>

																	<td id='prev_org'></td>
																</tr>
																<tr>
																	<td style="color: purple">Having all companies
																		documents <br>(offer and relieving letters)
																	</td>

																	<td id='cmpny_docs'></td>
																</tr>
																<tr>
																	<td style="color: purple">Available for F2F
																		interview in weekdays (Y/N)</td>

																	<td id='f2f_intrv'></td>
																</tr>

																<tr>
																	<td style="color: purple">Any interviews are in
																		pipeline? <font color=red>If yes, need to probe
																			more and <br> get the status of the same
																	</font>
																	</td>
																	<td id=any_intervw1></td>
																</tr>

																<tr>
																	<td style="color: purple">Had any offer in hand?
																		If yes, need justification to looking for <br>
																		other opportunity.
																	</td>

																	<td id='offer_inhand'></td>
																</tr>
																<tr>
																	<td style="color: purple">ID proof details.</td>
																	<td id='cidProofDetails'></td>
																</tr>
																<tr>
																	<td style="color: purple">Last 3 organization
																		duration and CTC details</td>
																	<td id='durationid'></td>
																</tr>
																<tr>
																	<td style="color: purple">Professional references
																		(If Any)</td>
																	<td id='cprofessional_Refrnces'></td>
																</tr>

															</table>


														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class='modal hide fade' id='modal-editCompDetails'
										style="top: 25%;" tabindex='-1'>
										<div class='modal-header'>
											<!-- <button class='close' data-dismiss='modal'
												type='button'>&times;</button> -->
											<button class='close' type='button' onclick="hideDiv()">&times;</button>
											<!-- <h3 id="candidateName"></h3> -->
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<div class='box-content box-no-padding'>
																<div class='responsive-table'>
																	<div class='scrollable-area'>
																		<div class="pagination" style='font-size: 20px;'>
																			<table
																				class='data-table table table-bordered table-striped'
																				data-pagination-records='10'
																				data-pagination-top-bottom='true'
																				style='margin-bottom: 0; font-size: 20px;'
																				id="sampletable1">
																				<thead>
																					<tr>
																						<th style='text-align: center; color: #000080;'>Company
																							PAN ID</th>
																						<th style='text-align: center; color: #000080;'>Company
																							Name</th>
																						<th style='text-align: center; color: #000080;'>Notice
																							Period</th>
																					</tr>
																				</thead>
																				<tbody>
																					<c:forEach var="noticeperiod" items="${ntcprdlist}">
																						<tr>
																							<td>${noticeperiod.companypanid}</td>
																							<td>${noticeperiod.companyname}</td>
																							<td>${noticeperiod.noticeperiod}-Days</td>

																						</tr>
																					</c:forEach>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
						<br>
						<center>
							<button class="btn btn-success btn-xs"
								style="background: #0b3c7c" onclick="goBack()">Cancel</button>
						</center>
						<br>
						<center>
							<a href="exportSourcedData?jobId=${jobId}"
								class="btn btn-success btn-xs" style="background: #0b3c7c">Export
								to Excel</a>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script type="text/javascript">$('#sampletable1').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
	<script
	src="resources/assets/javascripts/jquery.timepicker.js"
	type="text/javascript"></script>
	<script
	src="resources/assets/javascripts/jquery.timepicker.min.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script
	src="resources/assets/javascripts/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js"
	type="text/javascript"></script>

<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js" type="text/javascript"></script>


<script src="resources/ckeditor/adapters/jquery.js"></script>
<script src="resources/ckeditor/ckeditor.js"></script>

<script>



</script>
<script type="text/javascript">
                                    function doActionCad(candidateid){
                                        $.ajax({
                                              type: "get",
                                              url: "getCandidatePercentage?candidateid="+candidateid,
                                              cache: false,
                                              async: false,               
                                              success: function(response){
                                           	   $('#candidateName').text("% History of "+response.candidateName);
                                                  if(response.ssc==null){
                                                  	 $('#ssc').text("N/A"); 
                                                  	 }
                                                  else{
                                                  $('#ssc').text(response.ssc);
                                                  }
                                                  if(response.interperc==null){
                                                      $('#plus12').text("N/A"); 
                                                      }
                                                  else{$('#plus12').text(response.interperc);}
                                                  if(response.graduation==null){
                                                      $('#graduation').text("N/A"); 
                                                      }
                                                  else{$('#graduation').text(response.graduation);}
                                                  if(response.pg==null){
                                                  	$('#pg').text('N/A');
                                                  }else
                                                      { 
                                                      $('#pg').text(response.pg);
                                                      }
                                                   
                                              },
                                              error: function(){  
                                                                      
                                                  
                                              }
                                              
                                          });
                                    }
                                    </script>



<script type="text/javascript">
                                    function doActionstatus(candidateid,name,jdid){
                                   	 $.ajax({
                                            type: "get",
                                            url: "getCandidateStatusByCandidateID?candidateid="+candidateid+"&jobId="+jdid,
                                            cache: false,
                                            async: false,               
                                            success: function(response){
                                            
                                            	 
                                                 $('#interviewhistory').text("Status of "+name);
                                                 $('#Clientstatus').text(response.clientStatus);
                                                 $('#Teamleadstatus').text(response.tlStatus);
                                                 $('#BDMstatus').text(response.bdmStatus);

                                                 if(response.tlrejectedcomments==""){
                                                	 $('#tl_cmnt').text(response.tlComment);
                                                     }
                                                 else{
                                                	 $('#tl_cmnt').text(response.tlrejectedcomments);
                                                     }
                                                 
                                                 // $('#tl_cmnt').text(response.tlComment);
                                                 $('#bdm_cmnt').text(response.bdmComment);
                                                 $('#client_cmnt').text(response.clientComment); 
                                                 $('#sctstatus').text(response.sctStatus);
                                              	 $('#sct_cmnt').text(response.sctComment); 
                                        
                                            },
                                            error: function(){  
                                                                    
                                            }
                                            
                                        });
                                        
                                           
                                    }
                                    </script>

<script>

function  tlstatusfun(candidateid) {
	
var TlStatus=$("#tlStatus"+candidateid).val();
if(TlStatus==""){
 alert("Plase select status ");
 $("#tlStatus"+candidateid).attr("required", "true");
 $("#ststusUpdate"+candidateid).attr("disabled", true);
}
else{
 $("#ststusUpdate"+candidateid).attr("disabled", false);
}
$("#comments").empty();
  		if((TlStatus=='SCT screen reject')||(TlStatus=='SCT soft skills reject')||(TlStatus=='TL reject')||(TlStatus=='Technical review reject')||(TlStatus=='Rejected')){
  			 $('#chooseReason'+candidateid).show();
  			 $('#txtArea'+candidateid).hide();
  		}
  	 else{
  		 $('#chooseReason'+candidateid).hide();
  		 $('#txtArea'+candidateid).show();
  		 
  			
  	 } 
  		
};
  </script>


<script>

function tlrejectreason(id){
	var tlStatus = $("#tlStatus"+id).val();
	var rejcoment = $("#rejReason"+id).val();
	if(rejcoment=='OtherComments'){
		$('#tlrejcomment'+id).removeAttr("disabled");
		$('#tlrejcomment'+id).val('');
	}  
	 else{
		 $('#tlrejcomment'+id).attr("disabled",true);
		 } 
}

</script>
<script type="text/javascript">
                                    function saveTLStatus(candidateid,name,jobID,empLead,sourcedBy,bdName){
                                    	//alert(bdName);
                                        var status = $("#tlStatus"+candidateid).val();
                                        var tlresStats = $("#tlresStats"+candidateid).text();
                                        var tlrejcomment = $("#tlrejcomment"+candidateid).val();
                                        var tl_sctprevent = $("#tl_sctprevent"+candidateid).text();
                                        if((tl_sctprevent!="")&&(tlresStats!="N/A" ||tlresStats!="")){
                                       	 alert("Sct already updated This profile,U can't modify");
                                           }
                                        else if((tl_sctprevent=="N/A" || tl_sctprevent=="") &&(tlresStats!="N/A" ||tlresStats!="")){
                                        	if(status=="" && (tlresStats=="N/A"||tlresStats=="")){
                                           	 alert("Plase select status");
                                               }
                                           else if((status==tlresStats) && status!="" && (tlresStats!="N/A"||tlresStats!="")){
                                           	alert("You already submitted result status as "+tlresStats);
                                               }
                                          
                                           else if((status=='TL reject')||(status=='SCT screen reject')||(status=='SCT soft skills reject')||(status==' Technical review reject'))
                                               {
                                          	 var comment = $("#rejReason"+candidateid).val();
                                          	 if(comment==''){
                                  				alert("Please select Reject Reason");
                                  			}
                                          	 else if(comment=='OtherComments' && tlrejcomment==""){
                                           		alert("Please enter TL rejected comments");
                                        		document.getElementById("tlrejcomment"+candidateid).required = true;
                                        	} 
                                      			else{
                                  				$.ajax({
                                                      type: "post",
                                                      url: "saveCandidateStatusByCandidateID?tlrejcomment="+tlrejcomment+"&candidateid="+candidateid+"&comment="+comment+"&status="+status+"&jobid="+jobID+"&candidateName="+name+"&empLead="+empLead+"&sourcedBy="+sourcedBy+"&bdName="+bdName,
                                                      cache: false,
                                                      async: false,               
                                                      success: function(response){
                                                          $("selected_status${candidate.candidateInfo.candidateid}").val(response);
                                                           alert("Candidate name : " + name + "\n\n Current Round Status : " + response);
                                                           window.location.reload();
                                                      },
                                                      error: function(){  
                                                      }
                                                  });
                                  			}
                                           }
                                          
                                           else{
                                          	 var comment = $("#reason"+candidateid).val();
                                           $.ajax({
                                                  type: "post",
                                                  url: "saveCandidateStatusByCandidateID?candidateid="+candidateid+"&comment="+comment+"&status="+status+"&jobid="+jobID+"&candidateName="+name+"&empLead="+empLead+"&sourcedBy="+sourcedBy+"&bdName="+bdName,
                                                  cache: false,
                                                  async: false,               
                                                  success: function(response){
                                                      $("selected_status${candidate.candidateInfo.candidateid}").val(response);
                                                       alert("Candidate name : " + name + "\n\n Current Round Status : " + response);
                                                      window.location.reload();
                                                  },
                                                  error: function(){  
                                                  }
                                                  
                                              });
                                           }  
                                             
                                              } 
                                        else{
                                       if(status=="" && (tlresStats=="N/A"||tlresStats=="")){
                                        	 alert("Plase select status");
                                            }
                                        else if((status==tlresStats) && status!="" && (tlresStats!="N/A"||tlresStats!="")){
                                        	alert("You already submitted result status as "+tlresStats);
                                            }
                                       
                                        else if((status=='TL reject')||(status=='SCT screen reject')||(status=='SCT soft skills reject')||(status==' Technical review reject'))
                                            {
                                       	 var comment = $("#rejReason"+candidateid).val();
                                       	 if(comment==''){
                               				alert("Please select Reject Reason");
                               			}
                                       	 else if(comment=='OtherComments' && tlrejcomment==""){
                                        		alert("Please enter TL rejected comments");
                                     		document.getElementById("tlrejcomment"+candidateid).required = true;
                                     	} 
                                   			else{
                               				$.ajax({
                                                   type: "post",
                                                   url: "saveCandidateStatusByCandidateID?tlrejcomment="+tlrejcomment+"&candidateid="+candidateid+"&comment="+comment+"&status="+status+"&jobid="+jobID+"&candidateName="+name+"&empLead="+empLead+"&sourcedBy="+sourcedBy+"&bdName="+bdName,
                                                   cache: false,
                                                   async: false,               
                                                   success: function(response){
                                                       $("selected_status${candidate.candidateInfo.candidateid}").val(response);
                                                        alert("Candidate name : " + name + "\n\n Current Round Status : " + response);
                                                        window.location.reload();
                                                   },
                                                   error: function(){  
                                                       //('Error while request..');
                                                   }
                                               });
                               			}
                                        }
                                       
                                        else{
                                       	 var comment = $("#reason"+candidateid).val();
                                        $.ajax({
                                               type: "post",
                                               url: "saveCandidateStatusByCandidateID?candidateid="+candidateid+"&comment="+comment+"&status="+status+"&jobid="+jobID+"&candidateName="+name+"&empLead="+empLead+"&sourcedBy="+sourcedBy+"&bdName="+bdName,
                                               cache: false,
                                               async: false,               
                                               success: function(response){
                                                   $("selected_status${candidate.candidateInfo.candidateid}").val(response);
                                                    alert("Candidate name : " + name + "\n\n Current Round Status : " + response);
                                                   window.location.reload();
                                               },
                                               error: function(){  
                                               }
                                               
                                           });
                                        }  
                                           }
                                    }
                                    </script>
<script type="text/javascript">
function goBack(){
    
    window.close();
}

 </script>
<script type="text/javascript">
function candidatefeedback_View(candidateid,phnno,candidatename){
	
	$('#candidateidNameFB').text(candidatename);
	$('#candidateidFB').val(candidateid);
    $('#mobileno').text(phnno);
$.ajax({
    	type: "get",
        url: "view_Feedback?candidateidFBV="+candidateid,
        cache: false,
        async: false,               
        success: function(response){
        	$('#candidatefeedback1').empty();
        	
        	for(var i=0;i<response.length;i++){
        		var tr="<tr><td>"+response[i].callername +"</td>"
	+"<td>"+response[i].callerDate+"</td>"
	+"<td>"+response[i].comments+"</td></tr>";

    	$('#candidatefeedback1').append(tr);
            }
        },
        error: function(){  
        }
    });
}
</script>
<script type="text/javascript">
function saveFeedBack(){
    var candidateidFBS=$('#candidateidFB').val();
    var candidateCommentS=$('#candidateComment').val();
    if(candidateCommentS==""){
    	  alert("Please enter feedback");
    	  }else{
	$.ajax({
    	type: "POST",
        url: "store_Feedback?candidateidFBS="+candidateidFBS+"&candidateCommentS="+candidateCommentS,
        cache: false,
        async: false,               
        success: function(response){
        	 window.location.reload();
            
        },
        error: function(){  
        }
        
        });
    	  }
    }
</script>
<script>
 function candidateDetails(candidateid,basic_qualification,highest_qualification,
		total_experience,primaryskill,dob,first_name,relevantExp,candDesignsation,
		currentCTC,expectedCTC,noticeperiod,workLocation,curOrg,pan,mail,np_negotiable,
		desc_np_negotion,f2f_intrv,doj_cur_org,prev_relivd_date,prev_start_date,
		can_native_loc,is_tek_payroll,is_working,cur_cmpny_name,duration,prev_org,bank_stmt,
		bank_name,bank_loc,cmpny_docs,job_change,intrw_pipeline,int_pipeline_com,offer_inhand,family_bckgrund,
		spouse_wrk,kids_info,resn_reloc,skypeid,min_timereq_join,can_native_loc,contact_number,secskill,rep_mgr_name,
		mgrofficialId,intrstlevlworkLoc,comskillsRatig,professional_Refrnces,idProofDetails)
{
  $('#cName').text(first_name);
  $('#cbasicQual').text(basic_qualification);
  $('#cHQual').text(highest_qualification);
  $('#cTEXP').text(total_experience);
  $('#cPSkill').text(primaryskill);
  $('#cDOB').text(dob);
  $('#cRExp').text(relevantExp);
  $('#cDesignation').text(candDesignsation);
  $('#cCurCtC').text(currentCTC);
  $('#cExpCtC').text(expectedCTC);
  $('#cNPeriod').text(noticeperiod);
  $('#cWLoc').text(workLocation);
  $('#cCurOrg').text(curOrg+"/"+doj_cur_org);
  $('#cPAN').text(pan);
  $('#cEMail').text(mail);
  $('#cnp_negotiable').text(np_negotiable);
  $('#desc_np_negotion').text(desc_np_negotion);
  $('#any_intervw1').text(intrw_pipeline);
  $('#int_pipeline_com').text(int_pipeline_com);
  $('#f2f_intrv').text(f2f_intrv);
  $('#doj_cur_org').text(doj_cur_org);
  $('#prev_relivd_date').text(prev_relivd_date);
  $('#prev_start_date').text(prev_start_date);
  $('#can_native_loc').text(can_native_loc);
  $('#is_tek_payroll').text(is_tek_payroll);
  $('#currwork_isPerm').text(is_working);
  $('#cur_cmpny_name').text(cur_cmpny_name);
  $('#durationid').text(duration);

  if(prev_org=='NO'){
	  $('#prev_org').text(prev_org);
	  }
  else{
	  $('#prev_org').text(prev_org+"/"+prev_start_date+"&&"+prev_relivd_date);
	  }
  
  $('#bank_stmt').text(bank_stmt);
  $('#bank_name').text(bank_name);
  $('#bank_loc').text(bank_loc);
  $('#cmpny_docs').text(cmpny_docs);
  $('#job_change').text(job_change);
  $('#offer_inhand').text(offer_inhand);
  if(family_bckgrund=='YES'){
	  family_bckgrund='Married';
	  }
  else{
	  family_bckgrund='UnMarried';
	  }
  $('#family_bckgrund').text(family_bckgrund);
  $('#spouse_wrk').text(spouse_wrk);
  $('#kids_info').text(kids_info);
  $('#resn_reloc').text(resn_reloc);
  $('#cskypeid').text(skypeid);

  $('#cnativeloc').text(can_native_loc);
  $('#minreqjoin').text(min_timereq_join);
  $('#ccontact_number').text(contact_number);
  $('#csecskill').text(secskill);
  $('#crep_mgr_name').text(mgrofficialId+"/"+rep_mgr_name);
  $('#cidProofDetails').text(idProofDetails);
  $('#cprofessional_Refrnces').text(professional_Refrnces);
  $('#ccomskillsRatig').text(comskillsRatig);
  $('#cintrstlevlworkLoc').text(intrstlevlworkLoc);
 }
 
 </script>

<script>
function hideDiv(){
	$('#modal-editCompDetails').hide();
} </script>
<script>
$('#closemodel').click(function(){
	window.location.reload();
});
</script>

<script type="text/javascript">
function clickComment(id)
{
	 var jobid= $('#jobId').val();
 $("#modal-upload").show();
 $('#candiid').val(id);
 
$.ajax({
	type: "POST",
    url: "viewSCT_Comments?jobid="+jobid+"&candidateid="+id,
    cache: false,
    async: false,               
    success: function(response){
    	CKEDITOR.instances.scmnt.setData(response);
    	
    },
    error: function(){  

    }
    
    });
 
 
}

</script>

<script type="text/javascript">
                             function editProfile(candidateid,jobid,jobcode){  
                               
                                $.ajax({
                                	type: "POST",
                                       url: "getCandidateInfoByCandidateId?candidateid="+candidateid+"&jobid="+jobid,
                                       cache: false,
                                       async: false,    
                                       success: function(response){
                                       	
                                   	 $('#jobDescId').val(jobid);
                                        $('#jobcode1').val(jobcode);
                                        $('#candidateid').val(candidateid);
                                            $('#panID').val(response.candidateInfo.pancard);
                                            $('#txtFirstName').val(response.candidateInfo.first_name);
                                            $('#txtMiddleName').val(response.candidateInfo.middle_name);
                                            $('#txtLastName').val(response.candidateInfo.last_name);
                                            $('#h1bstart').val(response.candidateInfo.hbstart_date);
                                            $('#h1bend').val(response.candidateInfo.hbend_date);
                                            $('#phnNumber').val(response.candidateInfo.contact_number);
                                            $('#altNumber').val(response.candidateInfo.altcnt_number);
                                            $('#email').val(response.candidateInfo.emailID);
                                            $('#dob').val(response.candidateInfo.dob);
                                            $('#basic_qual').val(response.candidateInfo.basic_qualification);
                                            $('#highest_qual').val(response.candidateInfo.highest_qualification);
                                            $('#priSkill').val(response.candidateInfo.primaryskill);
                                            $('#secSkill').val(response.candidateInfo.secskill);
                                            $('#totalExp').val(response.candidateInfo.total_experience);
                                            $('#revalentExp').val(response.candidateInfo.relevantExp);
                                            $('#candidatedesg').val(response.candidateInfo.candDesignation);
                                            $('#currentctc').val(response.candidateInfo.currentCTC);
                                            $('#expectedctc').val(response.candidateInfo.expectedCTC);
                                            $('#noticePeriod').val(response.candidateInfo.noticeperiod);
                                            $('#currentOrg').val(response.candidateInfo.current_org);
                                            $('#sscPerc').val(response.candidateInfo.ssc);
                                            $('#plus2Perc').val(response.candidateInfo.bieplus12);
                                            $('#ugPerc').val(response.candidateInfo.graduation);
                                            $('#pgPerc').val(response.candidateInfo.post_Graduation);
                                            $('#location').val(response.candidateInfo.workLocation);
                                            $('#min_timereq_join').val(response.candidateInfo.min_timereq_join);
                                            $('#skypeid').val(response.candidateInfo.skypeid);
                                            $('#txtNlocation').val(response.candidateInfo.can_native_loc);
                                           $('#npn').val(response.candidateInfo.noticeprd_negotiable);
                                           $('#intrstlevlworkLoc').val(response.candidateInfo.intrstlevlworkLoc);
                                           $('#comskillsRatig').val(response.candidateInfo.comskillsRatig);
                                           $('#professional_Refrnces').val(response.candidateInfo.professional_Refrnces);
                                           $('#idProofDetails').val(response.candidateInfo.idProofDetails);
                                       	 if(response.candidateInfo.noticeprd_negotiable=='YES'){
                                       		 $('#npn_reason').val(response.candidateInfo.desc_np_negotion);
                                       		 document.getElementById("com_name").required = true;
                                             	  $('#npn_r').show(); 
                                          	  }else{
                                          		document.getElementById("com_name").required = false;
                                          		 $('#npn_r').hide();
                                          	  }
                                       	
                                      	  $('#any_intervw').val(response.candidateInfo.intrw_pipeline);
                                      	 //$('#any_intervw').text(response.candidateInfo.intrw_pipeline);
                                      	
                                      	 if(response.candidateInfo.intrw_pipeline=='YES'){
                                      		 $('#com_name').val(response.candidateInfo.int_pipeline_com);//interview company
                                      		document.getElementById("com_name").required = true;
                                      		 $('#anyInterviewpipeline').show();
                                      	  }else{
                                      		 $('#anyInterviewpipeline').hide();
                                      		document.getElementById("com_name").required = false;
                                      	  }
                                      	  $('#doj').val(response.candidateInfo.doj_cur_org);
                                      	  $('#txtRMgrname').val(response.candidateInfo.rep_mgr_name);
                                         $('#offemail').val(response.candidateInfo.mgr_official_emailid);
                                      	  $('#can_native_loc1').val(response.candidateInfo.can_native_loc);
                                      	  $('#work_on_tek_payroll').val(response.candidateInfo.is_tek_payroll);
                                      	 $('#curr_work_isPerm').val(response.candidateInfo.is_working);
                                      	 if(response.candidateInfo.is_working=='YES'){
                                      		 $('#curcompname').val(response.candidateInfo.cur_cmpny_name);
                                         	  $('#duration').val(response.candidateInfo.duration);
                                         	document.getElementById("curcompname").required = true;
                                         	document.getElementById("duration").required = true;
                                         	 $('#iscontract').show(); 
                                      	  }else{
                                      		 $('#iscontract').hide(); 
                                      		document.getElementById("curcompname").required = false;
                                      		document.getElementById("duration").required = false;
                                      	  }
                                      	  $('#prvcname').val(response.candidateInfo.prev_org);
                                      	 if(response.candidateInfo.prev_org=='YES'){
                                      		  $('#Rld').val(response.candidateInfo.prev_relivd_date);
                                         	  $('#std').val(response.candidateInfo.prev_start_date);
                                         	document.getElementById("Rld").required = true;
                                         	document.getElementById("std").required = true;
                                   		 $('#pvscmpny').show();  
                                      	  }else{
                                      		 $('#pvscmpny').hide();
                                      		document.getElementById("Rld").required = false;
                                      		document.getElementById("std").required = false;
                                      	  }
                                      	  $('#ltbnkstmt').val(response.candidateInfo.bank_stmt);
                                      	 if(response.candidateInfo.bank_stmt=='YES'){
                                      		 $('#bankname').val(response.candidateInfo.bank_name);
                                         	  $('#bLocation').val(response.candidateInfo.bank_loc);
                                         	document.getElementById("bankname").required = true;
                                         	document.getElementById("bLocation").required = true;
                                         	$('#depdltbnkstmt').show(); 
                                      	  }else{
                                      		$('#depdltbnkstmt').hide();
                                      		document.getElementById("bankname").required = false;
                                      		document.getElementById("bLocation").required = false;
                                      	  }
                                      	  $('#hav_all_doc').val(response.candidateInfo.cmpny_docs);
                                      	  $('#reason_job_change').val(response.candidateInfo.job_change);
                                      	  $('#any_offer').val(response.candidateInfo.offer_inhand);
                                      	  $('#fmbcground').val(response.candidateInfo.family_bckgrund);
                                      	  if(response.candidateInfo.family_bckgrund=='YES'){
                                      		 $('#spwork').show(); 
                                      		  $('#is_spouse_work').val(response.candidateInfo.spouse_wrk);
                                         	  $('#is_hav_kids').val(response.candidateInfo.kids_info);
                                         	  document.getElementById("is_spouse_work").required = true;
                                         	  document.getElementById("is_hav_kids").required = true;
                                      	  }else{
                                      		$('#spwork').hide();
                                      		document.getElementById("is_spouse_work").required = false;
                                      		document.getElementById("is_hav_kids").required = false;
                                      	  }
                                      	  $('#reason_reloc').val(response.candidateInfo.resn_reloc);
                                      	 $('#f2f_WE').val(response.candidateInfo.f2f_intervew);
                                         $('#filename1').text(response.candidateInfo.file_upload_name);
                                         $('#filename2').text(response.candidateAttachements.attachmentname);
                                                
                               },

                      error: function(){         

                                      alert('Error while request..');

                      }
                               });
                             }
                             
                             
                   function scheduleInterview(candidateid,jobid,jobcode,canName,lead,sourced,company,clfromtime,cltotime){ 
                   	 $('#siJobId').val(jobid);
                   	 $('#siCName').val(canName);
                        $('#sijobcode').val(jobcode);
                        $('#sicandidateid').val(candidateid);
                        $('#silead').val(lead);
                        $('#sicomapny').val(company);
                        $('#sisourced').val(sourced);
                        $('#clifromtime').val(clfromtime);
                        $('#clitotime').val(cltotime);
                       
                        if(clfromtime=='' && cltotime==''){
                            alert("Clinet timings are not available you can't schedule interview..please update client availability");
                        	$('#interviewSubmit').attr("disabled", "disabled");
                              }
                   }
</script>

<script>
$( function() {
   $( "#h1bstartDP,#h1bendDP" ).datepicker({
   	 dateFormat: 'yy-mm-dd'   
       
   });
   $("#datetimepicker4").datetimepicker({
	pickTime : false,
 dateFormat: 'yy-mm-dd' 

});
$("#datetimepicker5").datetimepicker({
	pickTime : false,
	 dateFormat: 'yy-mm-dd' 

});
 } ); 

function getInterviewDate(date){
 var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();
  
    day = day < 10 ? "0" + day : day; 
    month = month < 10 ? "0" + month : month; 
    var formattedDate = year+ "-" +month+ "-" +day;   
    return formattedDate;
 }
function getInterviewTime(date){

    var hours=date.getHours();
    var min=date.getMinutes();
    var sec=date.getSeconds();
    var ms=date.getMilliseconds();
    var formattedTime = hours+":"+min+":0"; 
    return formattedTime;
 }

 </script>
<script type="text/javascript">
$(function() {
  $('#datetimepicker3').datetimepicker({
  	pickTime: false,
  	 dateFormat: 'yy-mm-dd' 
  });
});
</script>
<script>

$(function() {
    $('#datetimepicker1').datetimepicker({
      pickTime:false,
      dateFormat: 'yy-mm-dd' 
    });
  });
</script>
<script type="text/javascript">
function checkEmail(){
    var Email=$('#email').val();
    var jobDescId = $('#jobDescId').val();
    $.ajax({
    	type : "GET",
        asyn : false,
        url  : "checkEmailExists?jobDescId="+jobDescId+"&email="+Email,
        success  : function(response){
           // $('#emailshow').text(response);
        	if(response=="NotExist"){
				$('#emailshow').text('Email ID not exists..Continue');
				$('#showgreen').text('');
				$('#candidateupdate').attr("disabled",false);
				}
			else{
				$('#showgreen').text('Email ID already exists.');
				$('#emailshow').text('');
				$('#candidateupdate').attr("disabled",true);
				}
	        
        }
	    
	    });
 
 }
</script>
<script type="text/javascript">
function checkContact(){
    var PhoneNumber=$('#phnNumber').val();
    var jobDescId = $('#jobDescId').val();
    
    $.ajax({
    	type : "GET",
        asyn : false,
        url  : "checkContactExists?jobDescId="+jobDescId+"&number="+PhoneNumber,
        success  : function(response){            
        	if(response=="NotExist"){
				$('#phoneshow').text('Phone number not exists..Continue');
				$('#candidateupdate').attr("disabled",false);
				$('#phoneshowgreen').text('');
				}
			else{
				$('#phoneshowgreen').text('Phone Number already exists..');
				$('#candidateupdate').attr("disabled",true);
				$('#phoneshow').text('');
				}
	        
        }
	    
	    });
 
 }
</script>
<script type="text/javascript">
function checkPan(){
    var panid=$('#panID').val();
    $.ajax({
    	type : "GET",
        asyn : false,
        url  : "checkPanExists?panId="+panid,
        success  : function(response){
            $('#panshow').text(response);
	        
        }
	    
	    });
 
 }
</script>
<script>
 function ValidateSize(file) {
	 
var maxFileSize = 20480000;
       var FileSize = file.files[0].size ;
       var FileType = file.files[0].type ;
       var FileName = file.files[0].name ;
     if(FileSize>maxFileSize) {
       	 alert('File size exceeds 20 MB');
            $(file).val('');
       }
       else {

    		$.ajax({
				type : "get",
				url : "checkResumeName?FileName=" + FileName,
				cache : false,
				async : false,
				success : function(response) {
					
					if(response!=""){
						$('#fileexistid').text('File name already exist')
						 $(file).val('');
						}
					else{
						$('#fileexistid').text('')
						}
				},
				error : function() {
					//alert("failure");
				}
			});

       }
   }
 
</script>
<script type="text/javascript">
function checkLatestBankStmt(){
	var sel=$('#ltbnkstmt').val();
	if(sel=='YES'){
	$('#depdltbnkstmt').show(); 
	document.getElementById("bankname").required = true;
	document.getElementById("bLocation").required = true;
	}
	else{
		document.getElementById("bankname").required = false;
		document.getElementById("bLocation").required = false;
		$('#depdltbnkstmt').hide(); 
	}
} 
</script>
<script type="text/javascript">
function checkPvsCmpny(){
	var sel=$('#prvcname').val();
	if(sel=='YES'){
	$('#pvscmpny').show(); 
	document.getElementById("std").required = true;
	document.getElementById("Rld").required = true;
	}
	else{
		document.getElementById("std").required = false;
		document.getElementById("Rld").required = false;
		$('#pvscmpny').hide(); 
	}
} 
</script>

<script type="text/javascript">
function checkperm(){
	var sel=$('#curr_work_isPerm').val();
	if(sel=='YES'){
	$('#iscontract').show(); 
	document.getElementById("curcompname").required = true;
	document.getElementById("duration").required = true;
	}
	else{
		document.getElementById("curcompname").required = false;
		document.getElementById("duration").required = false;
		$('#iscontract').hide(); 
	}
} 
</script>


<script type="text/javascript">
function interPipe(){
	var sel=$('#any_intervw').val();
	if(sel=='YES'){
	$('#anyInterviewpipeline').show();
	document.getElementById("com_name").required = true;
	}
	else{
		document.getElementById("com_name").required = false;
		$('#anyInterviewpipeline').hide(); 
	}
} 

function NPNegotiable(){
	var sel=$('#npn').val();
	if(sel=='YES'){
	$('#npn_r').show(); 
	 document.getElementById("npn_reason").required = true;
	}
	else{
		document.getElementById("npn_reason").required = false;
		$('#npn_r').hide(); 
	}
}

function checkfmgroungd(){
	var sel=$('#fmbcground').val();
	if(sel=='YES'){
	$('#spwork').show(); 
	 document.getElementById("is_spouse_work").required = true;
	 document.getElementById("is_hav_kids").required = true;
	}
	else{
		 document.getElementById("is_spouse_work").required = false;
		 document.getElementById("is_hav_kids").required = false;
		$('#spwork').hide(); 
	}
} 
</script>
<script type="text/javascript">
$(function() {
  $('#datetimepicker2').datetimepicker({
    pickTime: false,
    dateFormat: 'yy-mm-dd' 
  });
});
</script>


<script type="text/javascript">
  function uploadFile(candidateid,jobid,phnno,bdname,recnam,jobcode,client){
  	//alert("jobcode.."+jobcode);
  	var resumeType='Resume';
  	var resumedel='NA';
  	
  	$.ajax({
	type : "get",
	url : "viewAttachedDocs?candidateid="+candidateid+"&jobid="+jobid,
	cache : false,
	async : false,
	success : function(response) {
		
		
		var list1 = response.docList;
		var list2 = response.jobattachments;
		var canobj = response.canDocs;
		

		var encoded = encodeURIComponent(name);
		
		$('#fileAttachments').empty();
		
		var tr = '';
		
		
		 for (var i = 0; i < list1.length; i++) {
		 tr = tr+"<tr><td>" + list1[i].attachmentType + "</td>"
		        + "<td><a href='CandidateAttachmentFiledownload?candidateid="
				+ candidateid+"&&jobid="+jobid+"&&filename=" + encodeURIComponent(list1[i].attachmentname)
				+ "&&fileType=" + list1[i].attachmentType + "'>"
				+ list1[i].attachmentname + "</a></td></tr>";
		
	} 
		for (var i = 0; i < list2.length; i++) {
		 tr =tr+"<tr><td>" + list2[i].attachmentType + "</td>"
		            + "<td><a href='JobAttachmentFiledownload?jobcode="
					+ jobcode +"&&jobid="+jobid+"&&filename=" + list2[i].attachmentname
					+ "&&fileType=" + list2[i].attachmentType + "'>"
					+ list2[i].attachmentname + "</a></td></tr>";
			
		}
		 tr =tr+"<tr><td>" +  resumeType+ "</td>"
		 + "<td><a href='ResumeFiledownload?candidateid="
			+ candidateid + "&&jobid="+jobid+"&&filename=" + canobj
			+ "&&fileType=" + resumeType + "'>"
			+ canobj + "</a></td></tr>";
			
	
		
        $('#fileAttachments').append(tr);
		
		
		$('#candids').val(candidateid); 
		//$('#candmobno').val(phnno);
		$('#bdname_ds').val(bdname);
		$('#recname_ds').val(client);
		$('#clientname_ds').val(clnt_nam);
		$('#jobid_ds').val(jobid);
		$('#upjobcode').val(jobcode);
		$('#upcmpny').val(client); 
	},
	error : function() {
	}
});
  }
</script>
<script type="text/javascript">
	var value = 0;
	var max_limit = 20;
	function adddocuments() {
		value++;
		$('#btncount').val(value);
		$('#submitid').show();
		var objTo = document.getElementById('adddocuments');
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + value);
		var rdiv = 'removeclass' + value;
		divtest.innerHTML = '<div class="form-group"><div><input type="text" class="form-control" id="other_doc" name="other_doc[]" placeholder="Enter Document name" required><input type="file" class="form-control" id="othr_doc" name="othr_doc[]" onchange="checkDocFiles(this)" required><button class="btn btn-danger" type="button" onclick="remove_add_fieldsC('
				+ value
				+ ');">-</button></div></div><br><div class="clear"></div>';
		if (value <= max_limit) {
			objTo.appendChild(divtest);
		} else if (value > max_limit) {
			alert("Can't add more than 20 Docs!!");
		}
	}
	function remove_add_fieldsC(rid) {
		$('.removeclass' + rid).remove();
		value--;
		if (value == 0) {
			$('#submitid').hide();
		}
	}
</script>


<script>
function checkDocFiles(file){
       var candidateid=$('#candids').val();
	   var jobid=$('#jobid_ds').val();
       var filename = file.files[0].name;
      
       $.ajax({
              type : "get",
              url : "checkSelectedFiles?candidateid=" + candidateid + "&&filename="+encodeURIComponent(filename)+"&&jobid="+jobid ,
              cache : false,
              async : false,
              success : function(response) {
                    // alert(response);
                     
                     if(response!=''){
                           alert("this file is already attached to "+response)
                           $(file).val('');
                           $('#docssubmit').attr('disabled', true);
                     }else{
                    	 $('#docssubmit').attr('disabled', false);
                     }
              },
              error : function() {
              }
       });
       
}
</script>


<script type="text/javascript">
function sctViewComment(id)
{
	 var jobid= $('#jobId').val();
 
$.ajax({
	type: "POST",
    url: "viewSCT_Comments?jobid="+jobid+"&candidateid="+id,
    cache: false,
    async: false,               
    success: function(response){
    	CKEDITOR.instances.leadsctcomnts.setData(response);
    	$("#viewsctcomntid").show();
    },
    error: function(){  

    }
    
    });
 
 
}

</script>

<script>
    $('#interview_time').timepicker({
    	    'timeFormat': 'H:i:s',
    	   'step': 15 });
	$('#interview_time').on('changeTime', function() {
		$('#interviewSubmit').attr("disabled", "disabled");
		checkTime($(this).val());
	
});

  function checkTime(time){
                
                //var inttime=$('#interview_time').val();
                var interview_type=$('#interviewType').val();
                var interviewdate=$('#interviewdate').val();
               
                var candidateid= $('#sicandidateid').val();
                var jobid=$('#siJobId').val();
                $.ajax({
                    type: "get",
                    url: "checkIntervkiewTime?jobdescid="+jobid+"&inttime="+time+"&interview_type="+interview_type+"&interviewdate="+interviewdate+"&&candidateid="+candidateid,
                    cache: false,
                    async: false,               
                    success: function(response){
                        //alert(response);
                        if(response==true){
                        	alert("You can schedule interview at this time");
                        	$('#interviewSubmit').prop( "disabled", false );
                        }
                        else{
                        	alert("Already interview scheled interview at this time.. please set another time..");
                        	$('#interviewSubmit').attr("disabled", "disabled");
                        }
                    		$('#timespan').text(response); 
                    },
                    error: function(){  
                    	//alert("failure");
                    }            
            	});  
  }
   
  </script>



      <script type="text/javascript">
  function checkForm(form){
  var messageLength = CKEDITOR.instances['commentsct'].getData().replace(/<[^>]*>/gi, '').length;
  
  if( !messageLength ) {
      alert( 'Please enter comments' );
     // e.preventDefault();
      return false;
  }
  
  
    form.myButton.disabled = true;
    form.myButton.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.myButton.disabled = false;
    form.myButton.value = "Submit";
    form_being_submitted = false;
  }
  function submitInterview(){
	
	  $('#schIntform').submit();
     
	  }
</script>
</body>
</html>