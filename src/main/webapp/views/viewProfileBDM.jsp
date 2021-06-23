<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="resources/assets/stylesheets/plugins/datatables/bootstrap-datatable.css"
	media="all" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"       href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
</head>

<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	 padding: 8px 16px; 
	/* padding: 1px 3px; */
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
<head>
</head>
<section id='content'>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'
			style="margin-top: -140px;">
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


										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10' data-pagination-bottom='true'
											style='margin-bottom: 0;' id="sampletable">
											<thead>
												<tr>
													<th style='text-align: center; vertical-align: middle;color:#000080;'>Rec Sub Date</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Submission Date</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BDM
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Rec
														Name</th>

													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Number
														/ Alt Number</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Candidate
														Details</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>%</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Resume
														Download</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>
														TP Interview Status</th>

													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Interview Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>
														Result Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>
														Profile Status @ Client</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BDM
														Status</th>
													<!-- <th
														style='text-align: center; vertical-align: middle; color: #000080;'>BDM
														Comments</th> -->
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Status</th>
													
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Documents
														Upload</th>
													
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
																	onclick="doActionstatus('${candidate.candidateInfo.candidateid}','${jobId}','${candidate.candidateInfo.first_name}')"
																	role='button'>
																	${candidate.candidateInfo.first_name}${candidate.candidateInfo.middle_name}
																	${candidate.candidateInfo.last_name} </a>
															</div>
														</td>

														<td>${candidate.sctSubmissionDate}</td>
														<td id="bdsName${candidate.candidateInfo.candidateid}">${bdName}</td>
														<td>${client}</td>
														<td>${candidate.userName}</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-candidateFeedBack'
															onclick="candidatefeedback_View('${candidate.candidateInfo.candidateid}','${candidate.candidateInfo.contact_number}','${candidate.candidateInfo.first_name}')">${candidate.candidateInfo.contact_number}</a></td>

														<td><div class='text-right'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
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
																	href='#modal-candidateDetails'> <i
																	class='icon-user' style="color: Orange;"></i>
																</a>
															</div></td>
														<td>
															<div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-percentages'
																	onclick="doActionCad('${candidate.candidateInfo.candidateid}')">
																	<i class='icon-info'></i>
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
																<td style="color: Black;" ><b>N/A</b></td>
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
																<td style="color: Black;" id="intvwstat${candidate.candidateInfo.candidateid}" ><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.interevieDetails.clientinterview=="Scheduled"}'>
																<td style="color: green;" id="intvwstat${candidate.candidateInfo.candidateid}"><b>${candidate.interevieDetails.clientinterview}</b></td>
															</c:when>
															<c:otherwise>
																<td style="color: red;" id="intvwstat${candidate.candidateInfo.candidateid}"><b>${candidate.interevieDetails.clientinterview}</b></td>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when test='${empty candidate.candidateStatus.status}'>
																<td style="color: Black;"
																	id="bdStatus${candidate.candidateInfo.candidateid}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatus.status eq "To Client"}'>
																<td style="color: green;"
																	id="bdStatus${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatus.status}</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatus.status ne "Selected"}'>
																<td style="color: red;"
																	id="bdStatus${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatus.status}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when
																test='${empty candidate.candidateStatusObj.clientStatus}'>
																<td style="color: Black;"
																	id="clintStatus${candidate.candidateInfo.candidateid}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.clientStatus=="Selected"}'>
																<td style="color: green;"
																	id="clintStatus${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatusObj.clientStatus}</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.clientStatus!="Selected"}'>
																<td style="color: orange;"
																	id="clintStatus${candidate.candidateInfo.candidateid}"><b>${candidate.candidateStatusObj.clientStatus}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when
																test='${empty candidate.candidateStatusObj.sctStatus}'>
																<td style="color: Black;"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.sctStatus=="Selected"}'>
																<td style="color: green;"><b>${candidate.candidateStatusObj.sctStatus}</b></td>
															</c:when>
															<c:when
																test='${candidate.candidateStatusObj.sctStatus!="Selected"}'>
																<td style="color: red;"><b>${candidate.candidateStatusObj.sctStatus}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>
															<c:choose>															
															<c:when test='${candidate.candidateStatus.status=="To Client" || candidate.candidateStatus.status=="To Client-SCT Pending"}'>
															<td><button class='btn btn-default btn-xs' style="background: #2c7a41;color:white;text-shadow:none!important;">${candidate.candidateStatus.status}</button></td>
															</c:when>															
															<c:otherwise>
															
															<td><a class='btn btn-default btn-xs' style="background: darkgoldenrod;color:white;text-shadow:none!important;margin-left: 35px;"
															data-toggle='modal'
															onclick="updateBdmStatus('${candidate.candidateInfo.candidateid}',
																	'${candidate.candidateInfo.first_name}','${jobId}',
																	'${candidate.interevieDetails.clientinterview}',
																	'${candidate.empl_lead}','${candidate.sourcedBy}',
																	'${candidate.candidateStatusObj.bdmComment}',
																	'${client}')"
															href='#modal-bdmStatus'>BDM Status </a></td>
															
															
															</c:otherwise>
														</c:choose>	

															<c:choose>															
															<c:when test='${candidate.candidateStatus.status=="To Client" || candidate.candidateStatus.status=="To Client-SCT Pending"}'>
															
															<td><a class='btn btn-default btn-xs' style="background: darkgoldenrod;color:white;text-shadow:none!important;"
															
															onclick="updateBdmClientStatus('${candidate.candidateInfo.candidateid}',
																	'${candidate.candidateInfo.first_name}','${jobId}',
																	'${candidate.interevieDetails.clientinterview}',
																	'${candidate.empl_lead}','${candidate.sourcedBy}',
																	'${candidate.candidateStatusObj.onBoardDate}',
																	'${candidate.candidateStatusObj.clientComment}',
																	'${candidate.candidateStatusObj.rejectReason}',
																	'${clientName}','${candidate.candidateStatusObj.clientStatus}')"
															href='#modal-bdmClientStatus' data-toggle='modal'>Client Status </a></td>																
															</c:when>															
															<c:otherwise>
															<td><button class='btn btn-default btn-xs'>Client Status</button></td>
															</c:otherwise>
														</c:choose>														
														<td>
															
															<a class='btn btn-default btn-xs' onclick="uploadFile('${candidate.candidateInfo.candidateid}','${jobId}',
															'${candidate.candidateInfo.contact_number}','${bdName}','${recusername}',
															'${clientName}','${jobCode}')" href='#modal-example3' data-toggle='modal'>
															<strong>Upload
																	Documents </strong> </a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<div class='modal hide fade' id='modal-status' role='dialog'
										tabindex='-1' style="top: 25%; width: 1000px; left: 38%;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 id="interviewhistory"></h3>

										</div>
										<div class='modal-body'>
											<table class='table table-bordered table-striped'
												style='margin-bottom: 0; border-left-width: 1px;'>
												<thead>
													<tr>
														<th style='text-align: center; vertical-align: middle;'>Client
															Round status</th>
														<th style='text-align: center; vertical-align: middle;'>BDM
															Round status</th>
														<th style='text-align: center; vertical-align: middle;'>SCT
															status</th>
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
																style="white-space: pre-wrap; word-wrap: break-word; height: 60px; overflow-y: auto; overflow-x: auto; width: 400px;"></h5></td>
														<td><h5 id="Teamleadstatus"
																style="white-space: pre-wrap; word-wrap: break-word; height: 90px; overflow-y: auto; overflow-x: auto; width: 280px;"></h5></td>
													</tr>
												</tbody>
											</table>
											<table class='table table-bordered table-striped'
												style='margin-bottom: 0; border-left-width: 1px;'>
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
														<td><h5 id="client_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
														<td><h5 id="bdm_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 30px; overflow-y: auto; overflow-x: auto; width: 200px;"></h5></td>
														<td><h5 id="sct_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 60px; overflow-y: auto; overflow-x: auto; width: 400px;"></h5></td>
														<td><h5 id="tl_cmnt"
																style="white-space: pre-wrap; word-wrap: break-word; height: 90px; overflow-y: auto; overflow-x: auto; width: 280px;"></h5></td>


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
												style='margin-bottom: 0;' action="" method="post">

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
																				name='candidateComment'
																				placeholder='Interviewer Name' required></textarea>

																		</div>
																	</div>
																	<div class='form-actions' style='margin-bottom: 0'>
																		<input type="button" value="Save"
																			onclick="saveFeedBack()" />
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

									<div class='modal hide fade' id='modal-viewDocs' tabindex='-1'
										style="width: 708px; height: 91% !important;">
										<div class='modal-header'
											style="max-width: 980px; overflow-y: auto;">
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Verify Documents</h3>
										</div>

										<div class='modal-body' id="jd_assignedto">
											<p>
											<center>
												<b>CandidateName:</b><span style="color: red" id="can_name"></span>
											</center>
											<%-- <c:forEach var="candidate" items="${candidateinfolist}">
				
			 </c:forEach> --%>
											</p>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;'>

												<table class='data-table table table-bordered table-striped'
													data-pagination-records='10'
													data-pagination-top-bottom='true' style='margin-bottom: 0;'
													id="sampletable2">



													<tr>
														<th>File ID</th>
														<th>File Type</th>
														<th>File Name</th>
														<th>Status</th>
														<th>Comments</th>
														<c:choose>
															<c:when test="${role=='HRUSER'}">
																<th>Action</th>
															</c:when>
														</c:choose>


													</tr>

													<tbody id="candidatedocs">

													</tbody>
												</table>
											</form>
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
																		information).<br>
																	<font color=red> Some information about parents
																			will also help</font>
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
																
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class='modal hide fade' id='modal-example3' tabindex='-1'
										style="height: 90% !important; width: 680px;">
										<div class='modal-header' style="max-width: 980px;">
											<button class='close' data-dismiss='modal' id="closemodel"
												type='button'>&times;</button>
											<h3>
												<i class="icon-user "></i> Documents Upload
											</h3>
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<form class="form-horizontal" style="margin-bottom: 0;"
																id="myforms" method="post" action="uploadFiles"
																enctype="multipart/form-data">

																<input type="hidden" id="candids" name="candid">
																<input type="hidden" id="candmobno" name="candmobno">
																<input type="hidden" id="bdname_ds" name="bdname">
																<input type="hidden" id="recname_ds" name="recname">
																<input type="hidden" id="clientname_ds"
																	name="clientname"> <input type="hidden"
																	id="jobid_ds" name="jobid" value="${jobId}"> <input
																	type="hidden" id="upjobcode" name="jobcode"
																	value="${jobCode}"> <input type="hidden"
																	id="upcmpny" name="cmpny" value="${comapany}">

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


																<br>
																<br>
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

																					<!-- <th>Delete</th> -->
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
									</table>
									<div class='modal hide fade' id='modal-bdmClientStatus'
										tabindex='-1' style="height: 50% !important;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' id="closemodel"
												type='button'>&times;</button>
											<h3>
												<i class="icon-user"></i> Update Client Status : <span id="showStatus" style="color:red"></span>
											</h3>
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															 <form class="form-horizontal" style="margin-bottom: 0;"
																method="post" action="bdmUpdate_ClientStatus"
																enctype="multipart/form-data" id="clntformid"> 

																<input type="hidden" id="cjobID" name="jobid">
																<input type="hidden" id="cempLead" name="cempLead"> 
																<input type="hidden" id="csourcedBy" name="sourcedBy">
																<input type="hidden"   id="cbcandiId" name="candidateid">
																<input type="hidden" id="canName1" name="candidateName">
																<input type="hidden" id="cbdmName" name="bdName">
																<input type="hidden" id="cinterviewStatus" name="cinterviewStatus">
																<input type="hidden" id="profileatclient" name="profileatclient">
																<input type="hidden" id="clbdStatus" name="bdStatus">
																<input type="hidden" id="cclientname" name="cclientname">
																
																																
																
																<div class='control-group'>
																
                                            <label class='control-label'>Update Status</label>
                                            <div class='controls'>
                                                <div>
                                                    <select class="selectBox"
																	id="clientStatus1" name="cliStatus"
																	onchange="changeReason()">
																	<option value="">Update Status</option>
																	<option value="No Show">No Show</option>
																	<option value="Scheduled">Scheduled</option>
																	<option value="Feedback Pending">Feedback Pending</option>
																	<option value="Selected">Selected</option>
																	<option value="Rejected">Rejected</option>
																	<option value="On Hold">On Hold</option>
																	<option value="Backfooted">Backfooted</option>
																	<option value="Interviewed">Interviewed</option>
																	<option value="To Be OnBoard">Yet To OnBoard</option>
																	<option value="Client Drop">Client Drop</option>
																	<option value="On Boarded">On Boarded </option>
																	<option value="Screen Rejected">Screen Rejected</option>
																	<%-- <option value="${candidate.candidateStatusObj.clientStatus}" selected>${candidate.candidateStatusObj.clientStatus}</option>  --%>
																</select>
                                                </div>
                                                
                                            </div>
                                        </div>
                                                                                                                   
                                        
                                        <div class='control-group' id='chooseReason'>                                        
                                            <label class='control-label'>Reject Reason <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='input-large'
																		id="reject_reason" name="choosereject_reason">
																		<option value=''>Select Reason</option>
																		<option value='Technical Fitment'>Technical Fitment</option>
																		<option value='Culture Fitment'>Culture Fitment</option>
																		<option value='Duplicated ( Already submitted by other vendor )'>Duplicated ( Already submitted by other vendor )</option>
																		<option value='Experience Constraint'>Experience Constraint</option>
																		<option value='Salary / Rate Constraint'>Salary / Rate Constraint</option>
																		<option value='Comm Skills'>Comm Skills</option>
																		<option value='Location Constraint'>Location Constraint</option>
																		<option value='Not for Contract'>Not for Contract</option>
																		<%-- <option value="${candidate.candidateStatusObj.rejectReason}" selected>${candidate.candidateStatusObj.rejectReason}</option> --%>
																	</select>
                                            </div>
                                        </div>
                                        		
											<div class='control-group' id="onbrdid">
                                            <label class='control-label' for='validation_date'>On-boarded Date</label>
                                            <div class='controls'>
                                                <div>
                                                    <div class='datetimepicker input-append'
																	id='datetimepicker1'>
																	<input class='span12' data-format='yyyy-MM-dd'
																		id='onBoardDate1' name='onBoardDate'
																		placeholder='Select Date'	type='text'>
																		<span class='add-on'> <i data-date-icon='icon-calendar' data-time-icon='icon-time'></i>
																	
																</span>
																</div>
                                                </div>
                                                
                                            </div>
                                        </div>
																
																
											<div class='control-group' id="txtArea">                                        
                                            <label class='control-label'>Client Comments</label>
                                            <div class='controls'>
                                                <textarea id="clientcomment" name="clientcoment"
																	pattern="[a-zA-Z][a-zA-Z0-9\s*]"
																	data-rule-required='true' rows="3" cols="20"
																	maxlength="75" required></textarea>
                                            </div>
                                        </div> 
																<center>
																	<button type="button" id="clsubid" onclick="ClientSubmit()" class="btn btn-success btn-xs"
																		style="background: #0b3c7c">SUBMIT</button>
																		
																		
																</center>
															 </form> 
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class='modal hide fade' id='modal-bdmStatus' tabindex='-1'
										style="height: 50% !important;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' id="closemodel"
												type='button'>&times;</button>
											<h3>											
												<i class="icon-user"></i> Update BDM Status
											</h3>
										</div>
										<div class='modal-body'>
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding'>
															<form class="form-horizontal" style="margin-bottom: 0;"
																method="post" action="update_BdmStatus"
																enctype="multipart/form-data">

																<input type="hidden" id="bjobID" name="jobid"> <input
																	type="hidden" id="empLead" name="empLead"> <input
																	type="hidden" id="sourcedBy" name="sourcedBy">
																<input type="hidden" id="bcandiId" name="candidateid">
																<input type="hidden" id="canName" name="candidateName">
																<input type="hidden" id="bdsName1" name="bdName">
																<input type="hidden" id="bdResltStatus" name="bdsStatus">
																<input type="hidden" id="bdclientname" name="bdclientname">
																
																
																<div class='control-group'>                                        
                                            <label class='control-label'>Update Status <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class="selectBox"
																	id="bdchoseStatus" name="bdResltStatus" onchange="chooseBDStatus()" required>
																	<option value="">Update Status</option>
																	<option value="To Client">To Client</option>
																	<option value="Rejected">Rejected</option>
																	<option value="Screen reject">Screen reject</option>
																	<option value="On Hold">On Hold</option>
																	<option value="To Client-SCT Pending">To Client-SCT Pending</option>
																	
																</select>
																
                                            </div>
                                        </div>
                                        	<div class='control-group'>                                        
                                            <label class='control-label'>BDM Comments</label>
                                            <div class='controls'>
                                                <textarea name="comment" id="bdcomentsid"
																	pattern="[a-zA-Z][a-zA-Z0-9\s*]"
																	data-rule-required='true' rows="5" cols="20"
																	maxlength="75" required></textarea>
                                            </div>
                                        </div>

																<center>
																	<button type="submit" id="bsubmit" class="btn btn-success btn-xs"
																		style="background: #0b3c7c">SUBMIT</button>
																</center><span id="bspan" style="color:red;"></span>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class='modal hide fade' id='modal-percentages'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 id="candidateName"></h3>
										</div>
										<div class='modal-body'>
											<table class='table table-bordered table-striped'
												style='margin-bottom: 0; border-left: 1px solid #dddddd !important;'>
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

								</div>
							</div>
						</div>
						<br>
						<!--  class="btn btn-default btn-xs" -->
						<center>
							<button class="btn btn-success btn-xs"
								style="background: #0b3c7c" onclick="goBack()">Cancel</button>
						</center>
						<br>
						<center>
							<a href="exportSourcedData?jobId=${jobId}&action=recruiter"
								class="btn btn-success btn-xs" style="background: #0b3c7c">Export
								to Excel</a>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>








<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript">
	
</script>
<script
	src="resources/assets/javascripts/plugins/datatables/dataTables.bootstrap.min.js"
	type="text/javascript">
	</script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
	
<script
	src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js"
	type="text/javascript"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>



<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>


<script type="text/javascript">
$('#sampletable').DataTable({
    dom: 'Bfrtip',
    buttons: [
        {
            extend: 'excelHtml5',
title: 'View Requirements,
exportOptions : {columns : ':visible'}
        },
    ]
});

			


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
                                             function doActionstatus(candidateid,jobid,name){
                                                 $.ajax({
                                                        type: "get",
                                                        url: "getCandidateStatusByCandidateID?candidateid="+candidateid+"&jobId="+jobid,
                                                        cache: false,
                                                        async: false,               
                                                        success: function(response){
                                                             
                                                        	 $('#interviewhistory').text("Status of "+name);
                                                             $('#Clientstatus').text(response.clientStatus);
                                                             $('#Teamleadstatus').text(response.tlStatus);
                                                             $('#BDMstatus').text(response.bdmStatus);
                                                             $('#tl_cmnt').text(response.tlComment);
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





<script type="text/javascript">
function goBack(){
    //window.history.back();
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
                //alert('Error while request..');
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
                //alert('Error while request..');
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


<script type="text/javascript">
	function viewDocuments(candidateid,candidatename, bdname, recname, clientname, jobid) {
		$('#can_name').text(candidatename);
		
		$.ajax({
			type : "get",
			url : "viewCandidateDocs?candidateid=" + candidateid + "&&bdname="
					+ bdname + "&&recname=" + recname + "&&clientname="
					+ clientname + "&&jobid=" + jobid,
			cache : false,
			async : false,
			success : function(response) {
				//alert(response);
				var list1 = response.canDocs;
				 $('#candidatedocs').empty(); 
				for (var i = 0; i < list1.length; i++) {
					var tr = "<tr><td>"+list1[i].tbl_pk+ "</td>"
					
					 +"<td style='display:none;'><input type='text' name='candidate_ver'  id='candidate_ver'  value="+candidateid+"></td>"
					 +"<td style='display:none;'><input type='text' name='bdname_ver'     id='bdname_ver'     value="+bdname+"></td>"
					 +"<td style='display:none;'><input type='text' name='recname_ver'    id='recname_ver'    value="+recname+"></td>"
					 +"<td style='display:none;'><input type='text' name='clientname_ver' id='clientname_ver' value="+clientname+"></td>"
					 +"<td style='display:none;'><input type='text' name='jobid_ver'      id='jobid_ver'      value="+jobid+"></td>" 
					 
					        +"<td>"+list1[i].fileType+"</td>"
							+ "<td><a href='preObtFiledownload?candidateid="
							+ candidateid + "&&filename=" + list1[i].fileName
							+ "&&fileType=" + list1[i].fileType + "'>"
							+ list1[i].fileName + "</a></td>"; 
							if(response.role=='BDM'){
								tr=tr+"<td><select id='status_ver" + list1[i].tbl_pk + "' size='1'><option value="+list1[i].status+">"+list1[i].status+"</option></select></td>"
							+"<td><input type='textarea' rows='4' column='30' id='comments_ver" +  list1[i].tbl_pk + "' value="+  list1[i].comments + " name='comments' readonly></td>"
							}
							else{
								tr=tr+"<td><select id='status_ver" + list1[i].tbl_pk + "' size='1'><option value="+list1[i].status+">"+list1[i].status+"</option><option value='Approved'>Approved</option><option value='Rejected'>Rejected</option><option value='onHold'>onHold</option></select></td>"
								+"<td><input type='textarea' rows='4' column='30' id='comments_ver" +  list1[i].tbl_pk + "' value="+  list1[i].comments + " name='comments'></td>";
							}
							/* +"<td><input type='button' name='submit' id='verify_submit' value='Submit' style='background: #0b3c7c' class='btn btn-success btn-xs' onclick='verifysubmit("+ list1[i].tbl_pk +")'></td></tr>"; */	
                          
							if(response.role=='HRUSER'){
							tr=tr+"<td><input type='button' name='submit' id='verify_submit' value='Submit' style='background: #0b3c7c' class='btn btn-success btn-xs' onclick='verifysubmit("+ list1[i].tbl_pk +")'></td></tr>";	
							}
							$('#candidatedocs').append(tr);
							
				}
				
			},
			error : function() {
			}
		});
	}
</script>



<script type="text/javascript">
    function uploadFile(candidateid,jobid,phnno,bdname,recnam,clnt_nam,jobcode){
    	
    	var resumeType='Resume';
    	var resumedel='NA';
    	$('#uploadedocs').empty();
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
						+ candidateid + "&&jobid="+jobid+"&&filename=" +encodeURIComponent(list1[i].attachmentname)
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
				$('#candmobno').val(phnno);
				$('#bdname_ds').val(bdname);
				$('#recname_ds').val(recnam);
				$('#clientname_d').val(clnt_nam);
				$('#jobid_ds').val(jobid);
				$('#upjobcode').val(jobcode);
				$('#upcmpny').val(cmpny); 
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
		//alert(cbval);
//		$('#submitCandidate').removeAttr("disabled");
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


<script  type="text/javascript">
function checkDocFiles(file){
	//alert("checking");
       var candidateid=$('#candids').val();
	   var jobid=$('#jobid_ds').val();
	 // alert("candidateid"+candidateid);
	 // alert("jobid"+jobid+"-----"+filename);
       var filename = file.files[0].name;
       
       $.ajax({
              type : "get",
              url : "checkSelectedFiles?candidateid=" + candidateid + "&&filename="+encodeURIComponent(filename)+"&&jobid="+jobid ,
              cache : false,
              async : false,
              success : function(response) {
              //    alert(response);
                  
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


<script  type="text/javascript">
	function updateBdmStatus(candidateid,name,jobID,interviewStatus,empLead,sourcedBy,bdcomentsid,clientname){
		 var bdStatus=$('#bdStatus'+candidateid).text();
		 var bdsName=$('#bdsName'+candidateid).text();
		 $('#bjobID').val(jobID);
		 $('#empLead').val(empLead);
		 $('#sourcedBy').val(sourcedBy);
		 $('#bdResltStatus').val(bdStatus);
		 $('#bcandiId').val(candidateid);
		 $('#canName').val(name);
		 $('#bdsName1').val(bdsName);
		 $('#bdcomentsid').val(bdcomentsid);
		 $('#bdclientname').val(clientname);
		 
		 
		$('#modal-bdmStatus').show();
		}
	</script> 
    
    <script  type="text/javascript">
$('#chooseReason').hide();

/* $('#txtArea').hide(); */
 function  changeReason() {
  var clientstatus=$("#clientStatus1").val();

  			if(clientstatus=='On Boarded'){
			  $('#onbrdid').show(); 
			  $('#chooseReason').hide();  
			}  
  		else if((clientstatus=='Rejected')||(clientstatus=='Screen Rejected')){
  		//else if(clientstatus=='Screen Rejected'){  				
    				 $('#chooseReason').show();  
    				 $('#onbrdid').hide();       			 
        		}
        	 else{        	        		 
        		 $('#chooseReason').hide();
        		 $('#reject_reason').val('');
        		 //$('#onbrdid').hide(); 
        	 }     		
  }
    </script>
    
<script  type="text/javascript">
$('#onbrdid').hide(); 
		function ClientSubmit(){
			var clistatus=$('#clientStatus1').val();
			var profileatclient=$('#profileatclient').val();
			
			var onBoardDate=$('#onBoardDate1').val();
			var interviewStatus=$('#cinterviewStatus').val();

			var reject_reason=$('#reject_reason').val();
					//alert(interviewStatus)	;
			if(clistatus==""){
				$("#clientStatus1").attr("required", true);
				alert("Please select update status");
				}
			else if((clistatus==profileatclient)){
				alert("You already updated status as "+clistatus+"");
				
				} 					
			else if((clistatus=='Scheduled')||(clistatus=='Backfooted')||(clistatus=='Interviewed')||(clistatus=='Selected')||(clistatus=='On Hold')||(clistatus=='No Show')||(clistatus=='Feedback Pending'))
				{
				if(interviewStatus==''){
					  alert("Please schedule interview before updating client status");
				  }
				else{
					//alert("Interview status is :"+interviewStatus);
					document.getElementById("clntformid").submit();
					}		
				}
			else if(clistatus=='On Boarded'){
				  var onBoardDate=$("#onBoardDate1").val();
				  
				 if(interviewStatus==''){
					  //alert("Please schedule interview");
					 alert("Interview not Scheduled , So you cant not proceed till interview scheduled..");
				  }
				  else if(onBoardDate==''){
					  $('#onbrdid').show(); 
					  alert("Please select On-Boarded date");
				  }
				  else{
					  document.getElementById("clntformid").submit();
					  //alert("Candidate already On-Boarded");
					  }
			}

			else if(clistatus=='Rejected'){ 
				var rj=$("#reject_reason").val();
				if(interviewStatus==''){
					alert("Interview not Scheduled , So you cant not proceed till interview scheduled..");
				  }
				//else{
					 
				else if(rj==""){
						 $("#reject_reason").attr("required", true);
						 alert("Please select reject reason");
						 }
					 else{
					 document.getElementById("clntformid").submit();
					 }
					//}	
			}
				
			else if(clistatus=='Screen Rejected'){  
				$('#chooseReason').show();  
				 $('#onbrdid').hide(); 
				 var rj=$("#reject_reason").val();
				 if(interviewStatus==''){
					 alert("Interview not Scheduled , So you cant not proceed till interview scheduled..");
				  }
				 if(rj==""){
					 $("#reject_reason").attr("required", true);
					 alert("Please select reject reason");
					 
					 }
				 else{
				 document.getElementById("clntformid").submit();
				 }
			}
			else{
				 $('#chooseReason').hide();
        		 $('#chooseReason').val('');
        		 $('#onbrdid').hide(); 
				document.getElementById("clntformid").submit();
				}
			}
		</script>

<script  type="text/javascript">
	function updateBdmClientStatus(candidateid,name,jobID,interviewStatus,empLead,sourcedBy,onbordDate,clintcomment,
			cli_rej_reason,clientname,clstatus){
		 var clintStatus=$('#clintStatus'+candidateid).text();
		 var bdStatus=$('#bdStatus'+candidateid).text();		 
		 var bdsName=$('#bdsName'+candidateid).text();
		
		 $('#cjobID').val(jobID);
		 $('#cempLead').val(empLead);
		 $('#csourcedBy').val(sourcedBy);
		 $('#cbcandiId').val(candidateid);
		 $('#canName1').val(name);
		 $('#cbdmName').val(bdsName);
		 $('#cclientname').val(clientname);
		 $('#cinterviewStatus').val(interviewStatus);
		 if(onbordDate!=""){
			 $('#onBoardDate1').val(onbordDate);
			 $('#onbrdid').show();
			 $('#clsubid').attr("disabled",true);
			 }
		 else{
			 $('#onbrdid').hide(); 
			 $('#clsubid').attr("disabled",false);
			 }
		
		$('#clientStatus1').val(clstatus);
		 //$('#profileatclient').val(clintStatus);
		 
		 $('#clbdStatus').val(bdStatus);
		 $('#clientcomment').val(clintcomment);
		 if((clintStatus=='Rejected')||(clintStatus=='Screen Rejected')){  				
			 $('#chooseReason').show(); $('#onbrdid').hide(); 
			 $('#reject_reason').val(cli_rej_reason); 
			 $('#clsubid').attr("disabled",false);  
			 $('#onBoardDate1').val('');    			 
			}
		else{        	        		 
			 $('#chooseReason').hide();
			 }     
		 $('#showStatus').text(clstatus)
		$('#modal-bdmClientStatus').show();
		}

	$(function() {
		  $('#datetimepicker1').datetimepicker({
		   pickTime:false
		  });
		});

 	</script>
		<script>
		function chooseBDStatus(){
			var bdchoseStatus=$('#bdchoseStatus').val();
			var bdResltStatus=$('#bdResltStatus').val();
			if(bdchoseStatus==bdResltStatus){
				$('#bspan').text('You already sumitted status as :'+bdResltStatus);
				$('#bsubmit').attr("disabled",true);	
				}
			else{
				$('#bspan').text('');
				$('#bsubmit').attr("disabled",false);
				}
			}
		
	
		</script>
</html>