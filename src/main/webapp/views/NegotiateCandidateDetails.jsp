
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
<head>
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/multi-select.css"
	rel="stylesheet" />
</head>
<section id='content'>

	<!-- <div class='container-fluid'> -->
	<div class="dataTables_wrapper" style="margin-bottom: 3em;">
		<div class='row-fluid' id='content-wrapper'
			style="margin-bottom: 50px">
			<div class='span12'>

				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box'>
						<div class='box-header orange-background'
							style="line-height: 5px;">

							<div class="title-head">
								<Strong style="color: #000080; padding-left: 42%;">Resource
									Record</Strong>

							</div>
						</div>
					</div>
				</div>

				<div class='row-fluid' id='content-wrapper'>

					<div class='span6'>
						<div class='container-fluid'>
							<div class='row-fluid' id='content-wrapper'>
								<div class='span12'>
									<div class='row-fluid' style="margin-top: 0px;">
										<div class='span12 box'>
											<div class='box-content box-no-padding'>
												<div class='responsive-table'>
													<div style="height: 94px;">

														<table
															class='data-table table table-bordered table-striped'
															data-pagination-records='10'
															data-pagination-bottom='true' data-sorting='false'
															style='margin-top: -60;'>

															<tbody>

																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Candidate
																		Name</th>
																	<td><a href='#modal-candidateDetails'
																		data-toggle='modal'
																		onclick="candidateDetails('${candidateInfo.candidateid}','${candidateInfo.basic_qualification}','${candidateInfo.highest_qualification}'
																,'${candidateInfo.total_experience}','${candidateInfo.primaryskill}',
																'${candidateInfo.dob}','${candidateInfo.first_name}','${candidateInfo.relevantExp}',
																'${candidateInfo.candDesignation}','${candidateInfo.currentCTC}','${candidateInfo.expectedCTC}',
																'${candidateInfo.noticeperiod}','${candidateInfo.workLocation}','${candidateInfo.current_org}',
																'${candidateInfo.pancard}','${candidateInfo.emailID}','${candidateInfo.noticeprd_negotiable}'
																,'${candidateInfo.desc_np_negotion}','${candidateInfo.int_pipeline_com}','${candidateInfo.f2f_intervew}'
																,'${candidateInfo.doj_cur_org}','${candidateInfo.prev_relivd_date}','${candidateInfo.prev_start_date}'
																,'${candidateInfo.can_native_loc}','${candidateInfo.is_tek_payroll}','${candidateInfo.cur_cmpny_name}'
																,'${candidateInfo.duration}','${candidateInfo.prev_org}','${candidateInfo.bank_stmt}'
																,'${candidateInfo.bank_name}','${candidateInfo.bank_loc}','${candidateInfo.cmpny_docs}'
																,'${candidateInfo.job_change}','${candidateInfo.intrw_pipeline}','${candidateInfo.offer_inhand}'
																,'${candidateInfo.family_bckgrund}','${candidateInfo.spouse_wrk}','${candidateInfo.kids_info}'
																,'${candidateInfo.resn_reloc}')"><font
																			color=blue>${candidateInfo.first_name} ${candidateInfo.last_name}</font></a></td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Contact
																		No</th>

																	<td><a data-toggle='modal'
																		href='#modal-candidateFeedBack'
																		onclick="candidatefeedback_View('${candidateInfo.candidateid}','${candidateInfo.contact_number}','${candidateInfo.first_name}','${candidateInfo.last_name}')"><font
																			color=blue> ${candidateInfo.contact_number}</font></a></td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Experience</th>
																	<td>${candidateInfo.total_experience}</td>
																</tr>

															</tbody>
														</table>
													</div>
												</div>


												
												<div class='modal hide fade' id='modal-candidateDetails' style="width:850px;margin-left:-430px;top:2%;" tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3 style="color:red">
												<center> Candidate Details</center>
											</h3>
										</div>
										<div class='modal-body'   style="font-family: calibri; font-size: 28px;line-height: 33px;">
    
   
											<div class='row'>
												<div class='col-sm-12'>
													<div class='box'>
														<div class='box-padding' style="font-family:initial;font-size:18px;">

													<table>
														<tr>
															<td style="color: purple">Candidate Name (With
																surname) (As per Pan Card)</td>
															<td id='cName'></td>
														</tr>

														<tr>
															<td style="color: purple">Primary & <font color=red>secondary
																contact number ( mandatory)</font></td>
															<td id='cName'></td>
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
															<td style="color: purple">Secondary skills (mention
																skills)</td>

														</tr>
														<tr>
															<td style="color: purple">Communication skills
																rating (1-10)</td>

															<!-- <td id='cPSkill'></td> -->
														</tr>

														<tr>
															<td style="color: purple">  <font color=red>Education, Location of College/University where <br>
															he/she has  studied
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
															<td style="color: purple"><font color=red>Interested to work with
																Tekskills and in the client place (Y/N). <br> We should
																promote us as an IT company</font></td>

															<td id='is_tek_payroll'></td>
														</tr>

														<tr>
															<td style="color: purple">Current
																organization/client name with DOJ (MM/YY)</td>

															<td id='cur_cmpny_name'></td>
															<!-- <td id='prev_org'></td> -->
														</tr>
														<tr>
															<td style="color: purple">Working as perm / contract
																employee?? If contract, <br>payroll company name and
																duration (YY/MM).</td>
															<td id='currwork_isPerm'></td>
														</tr>
														<tr>
															<td style="color: purple">Current Company (Role /
																Designation)</td>
															<td id='cDesignation'></td>
														</tr>

														<tr>
															<td style="color: purple">Latest 6 Months Bank
																statements (Y/N)<br> (Name of the bank and location)</td>
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
															<td>NA</td>
														</tr>
														<tr>
															<td style="color: purple">Candidate current work
																location</td>
															<td id='cWLoc'></td>
														</tr>
														<tr>
															<td style="color: purple">Interest level in Work
																Location</td>
																			<td>NA</td>
															<!-- <td id='job_change'></td> -->
														</tr>

														<tr>
															<td style="color: purple">Reason for relocation</td>

															<td id='resn_reloc'></td>
														</tr>

														<tr>
															<td style="color: purple">Family background (About
																spouse work (Y/N) location and kids information).<br><font color=red> Some
																information about parents will also help</font></td>

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
																place) location <font color=red>City/District/Town</font></td>

															<td id='cnativeloc'></td>
														</tr>
														<tr>
															<td style="color: purple">Reason for job change(Valid reason)</td>
															<td id='job_change'></td>
														</tr>

														<tr>
															<td style="color: purple">Previous organization/client name (start & relieved date)</td>

															<td id='prev_org'></td>
														</tr>
														<tr>
															<td style="color: purple">Having all companies
																documents <br>(offer and relieving letters)</td>

															<td id='cmpny_docs'></td>
														</tr>
														<tr>
															<td style="color: purple">Available for F2F
																interview in weekdays (Y/N)</td>

															<td id='f2f_intrv'></td>
														</tr>

														<tr>
															<td style="color: purple">Any interviews are in
																pipeline? <font color=red>If yes, need to probe more and <br> get the status
																of the same</font></td>
															<td id=any_intervw1></td>
														</tr>

														<tr>
															<td style="color: purple">Had any offer in hand? If
																yes, need justification to looking for <br> other
																opportunity.</td>

															<td id='offer_inhand'></td>
														</tr>
														<tr>
															<td style="color: purple">ID proof details.</td>
															<td>NA</td>
														</tr>
														<tr>
															<td style="color: purple">Last 3 organization
																duration and CTC details</td>
															<td id='durationid'></td>
														</tr>
														<tr>
															<td style="color: purple">Professional references
																(If Any)</td>
															<td>NA</td>
														</tr>
														<tr>
															<td style="color: purple">Professional references
																(If Any)</td>
															<td>NA</td>
														</tr>
													

													</table>

													
												</div>
													</div>
												</div>
											</div>
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

															<input type="hidden" name="candidateidFB"
																id="candidateidFB">


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
																					<input type="button" value="Save"
																						onclick="saveFeedBack()" class="btn btn-success btn-xs" style="background: #0b3c7c"/>
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

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='span6'>
						<div class='container-fluid'>
							<div class='row-fluid' id='content-wrapper'>
								<div class='span12'>
									<div class='row-fluid' style="margin-top: 0px;">
										<div class='span12 box'>
											<div class='box-content box-no-padding'>
												<div class='responsive-table'>
													<div style="height: 94px;">

														<table
															class='data-table table table-bordered table-striped'
															data-pagination-records='10'
															data-pagination-bottom='true' data-sorting='false'
															style='margin-top: -60;'>

															<tbody>

																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>BD
																	</th>
																	<td>${bdname}</td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Recruiter</th>

																	<td>${recname}</td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Client
																		& Work Location</th>
																	<td>${clientname}<font color=red> & </font>${worklocation}</td>
																</tr>

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

		<div class='row-fluid' id='content-wrapper'>

			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -150px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Employment Details</Strong>
									<a  data-toggle='modal' href='#modal-employmentdetails'> <i class="icon-plus"></i></a>	

								</div>

							</div>
						</div>
					</div>

					<div class='container-fluid'>
						<div class='row-fluid' id='content-wrapper'>
							<div class='span12'>
								<div class='row-fluid' style="margin-top: 0px;">
									<div class='span12 box'>
										<div class='box-content box-no-padding'>
											<div class='responsive-table'>
												<div class='scrollable-area'
													style="height: 200px; overflow-y: scroll;">
													<table
														class='data-table table table-bordered table-striped'
														data-pagination-records='10' data-pagination-bottom='true'
														data-sorting='false'
														style='margin-bottom: 0; margin-width: 10px; overflow-y: scroll;'>

														<thead>
															<tr>

																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Employer(starting
																	from Latest employment)</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Employment
																	Tenure as per Resume (Month & Year)</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>CTC
																	</th>
																 <th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Last
																	Drawn CTC</th> 
																<th
																	style='text-align: center; color: #191970; '>Reason
																	for change</th>
																<th
																	style='text-align: center; color: #191970; '>Comments</th>
																	<!-- <th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Action</th> -->
															</tr>

														</thead>
														<tbody>
													<c:forEach var="employer" items="${employerList}">
 
 
															<tr><%-- ${candidateInfo.prev_org}/ --%>
																<td>${employer.employername}</td>
																<td>${employer.tenureresume}</td>
																<td>${employer.ctc}</td>
																<td>${employer.ldctc}</td>
																 <td>${employer.reasonforchange}</td>
																 <td><p style="width: 400px; white-space: pre-wrap; word-wrap: break-word; height: 100px; overflow-y: scroll;">
																 ${employer.reccomments}</p></td> 
																<%-- <td><a class='btn btn-default btn-xs' data-toggle='modal'
																href='#modal-employmentdetails'
																onclick="editEmployement('${employer.employername}','${employer.id}')">
																<i class="icon-pencil"></i>
															</a></td> --%>
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
			
			<%-- <div class='modal hide fade' id='modal-employmentdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Employment Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="verifierEmployerDetails" method="post" class="form-horizontal">
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden" name="bdname" value="${bdname}">
						<input type="hidden" name="recname" value="${recname}"> 
						<input type="hidden" name="jobid" value="${jobid}">
						<input type="hidden" name="clientname" value="${clientname}">
						<input type="hidden" name="ver_employername" id="ver_employername">	
						<input type="hidden" name="ver_id" id="ver_id">						

										<center><div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Appointment Letters (Month & Year)	</label>
												<div class="col-lg-4">
													<input class="form-control" id='appointmentletter' autocomplete="off"
														name="appointmentletter" 
														
														type='text' required>
												</div>
											</div><br>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Relieving Letters (Month & Year)</label>
												<div class="col-lg-4">
													<input class="form-control" id='relievingletter' 
														name="relievingletter" 
														autocomplete="off"  
														 type='text' required>
													<!--  pattern="\d*"-->
												</div>
											</div><br>

											

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Latest 6 months Bank Statements (From Month & Year to Month& Year)</label>
												<div class="col-lg-4">
													<input class="form-control" id='bankstmt' name="bankstmt"
														autocomplete="off" title="Enter Only digits" type='text' 
														
														type='text' required>
												</div>
											</div><br>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Latest 6 months Pay slips(From Month & Year to Month& Year)	</label>
												<div class="col-lg-4">
													<input class="form-control" id='payslip' name='payslip' autocomplete="off"
														type='text' 
														>
												</div>
											</div><br>

										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Comments</label>
												<div class="col-lg-4">
													<input type="text" id="comments" name="comments"
														><br>
												</div>
											</div><br>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>
										</form>	
								    </fieldset>
								</div></div>
				
 --%>
 
 
 
 
 
 
 
 
				
				<%-- <input type ="button" value="Save" class="btn btn-success btn-xs" onclick="saveEmployerDetails('${candidateInfo.candidateid}')"> --%>
			<!-- </form> -->
		
			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -10px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Education
										Details
										<c:if test='${empty candEducainfo}'>
											<a data-toggle='modal' href='#modal-addeducationdetails'> <i
												class="icon-plus"></i></a>
										</c:if>	</Strong>

								</div>

							</div>
						</div>
					</div>

					<div class='container-fluid'>
						<div class='row-fluid' id='content-wrapper'>
							<div class='span12'>
								<div class='row-fluid' style="margin-top: 0px;">
									<div class='span12 box'>
										<div class='box-content box-no-padding'>
											<div class='responsive-table'>
												<div class='scrollable-area' style="height: 180px; overflow-y: scroll;"> 
													<table
														class='data-table table table-bordered table-striped'
														data-pagination-records='10' data-pagination-bottom='true'
														data-sorting='false'
														style='margin-bottom: 0; margin-width: 10px; overflow-y: scroll;'>

														<thead>
															<tr>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Education (starting from highest Qualification)</th>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Post-Graduation</th>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Graduation</th>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Intermediate</th>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Secondary Education</th>
																<!-- <th style='text-align: center; color: #191970; vertical-align: middle;'>Comments</th> -->
															</tr>
														</thead>
														<tbody>
															<tr>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Course</th>
																<td>${candEducainfo.pg}</td>
																<td>${candEducainfo.degree}</td>
																<td>${candEducainfo.inter}</td>
																<td>${candEducainfo.ssc}</td>
																<!-- <td></td> -->
															</tr>
															
															
															<tr>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Percentage </th>
																<c:choose>
																<c:when test="${candEducainfo.pgperc==0}">
																<td></td>
																
																</c:when>
																<c:otherwise><td>${candEducainfo.pgperc}</td></c:otherwise>
																
																</c:choose>
																
																<td>${candEducainfo.degree_perc}</td>
																<td>${candEducainfo.interperc}</td>
																<td>${candEducainfo.sscperc}</td>
																
															</tr>
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
			
			<div class='modal hide fade' id='modal-addeducationdetails' tabindex='-1' style="height: 90% !important;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Education Info</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name}</span>
			</p>
			<form class='form form-horizontal validate-form'
				style='margin-bottom: 0;' action="updateeducationdetails"
				method="GET"> <!-- addeducationdetails -->
				<input type="hidden" name="candidateid"
					value="${candidateInfo.candidateid}"> <input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">


				<div class="form-group">
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Secondary Education </label>
						<div class='controls'>
							<input type="text" 
							name="ssc" 	class="form-control" title="only numbers,characters, dot and %"
							 pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$" />
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>SSC Perc </label>
						<div class='controls'>
							<input type="number" 
							name="sscperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
					
					
					
					<!-- pattern="[0-9]+(\.[0-9]{0,2})?%?" -->
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Intermediate</label>
						<div class='controls'>
							<input type="text" id="intermediate" name="intermediate" 
							class="form-control" title="only numbers,characters, dot and %"
							title="only numbers,characters and dots" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Intermediate  % </label>
						<div class='controls'>
							<input type="number" 
							name="interperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
				<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Graduation </label>
						<div class='controls'>
							<input type="text" id="graduation"	name="graduation" 
							class="form-control" title="only numbers,characters, dot and - %" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Graduation  % </label>
						<div class='controls'>
							<input type="number" 
							name="gradperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
				<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Post-Graduation</label>
						<div class='controls'>
							<input type="text" id="post_graduation"	name="post_graduation" 
							class="form-control" title="only numbers,characters, dot and % -" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>PostGraduation  % </label>
						<div class='controls'>
							<input type="number" 
							name="pgperc" 	class="form-control" title="only numbers"
							/>
							
						</div>
					</div>
					 <input type="hidden"  	name="addcomments" 	class="form-control" />
				</div>
			
				<div class="form-group" id="btn-custm">
					<div class="col-lg-12">
						<center>
							<button type="submit" style="background: #0b3c7c" class="btn btn-success btn-xs">Submit</button>
							&nbsp&nbsp&nbsp&nbsp
						</center>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<center>
						<div class='container-fluid'>
							<div class='row-fluid' id='content-wrapper'>
								<div class='span12'>
									<div class='row-fluid' style="margin-top: 0px;">
										<div class='span12 box'>
											<div class='box-content box-no-padding'>
												<div class='box-content'>
													<div class='control-group'>
														<div class='controls'>
														<a data-toggle='modal' onclick="preupload('${candidateInfo.candidateid}','${candidateInfo.contact_number}','${bdname}','${recname}','${clientname}','${jobid}')"
										href='#modal-example3'><strong><i class="icon-upload btn btn-info btn-lg" >Upload</i></strong></a>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</center>
	

<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: -10px;">
					<div class='span12 box'>
						<div class='box-header orange-background'
							style="line-height: 5px;">
							<div class="title-head">
								<Strong style="color: #000080; padding-left: 42%;">Personal Details
								<%-- <c:choose>
									<c:when test="${canStatus.nego_status=='Negotiation Completed'}"></c:when>
									
									<c:otherwise >
									<a data-toggle='modal' href='#modal-addcanAdddetails'> <i
												class="icon-plus"></i></a>
										</c:otherwise>
									</c:choose> --%>
								
							<%-- 	<a data-toggle='modal' href='#modal-editpersonaldetails'> <i
												class="icon-pencil"
												onclick="editPersonal(${candidateInfo.candidateid})"
												></i></a> --%>
											
								</Strong>
							</div>
						</div>
					</div>
				</div>
				<div class='row-fluid' id='content-wrapper'>
					<div class='span6'>
						<div class='container-fluid'>
							<div class='row-fluid' id='content-wrapper'>
								<div class='span12'>
									<div class='row-fluid' style="margin-top: 0px;">
										<div class='span12 box'>
											<div class='box-content box-no-padding'>
												<div class='responsive-table'>
												<!-- 	<div style="height: 190px;"> -->
														<table
															class='table table-bordered table-striped'
															style='margin-top: -80;'>
															<tbody>
															

																<tr>
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Father
																	</th>
																	<td>${candiaddtnlinfo.fathername}</td>
																</tr>
																<tr>
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Mother</th>
																	<td>${candiaddtnlinfo.mothername}</td>
																</tr>

																<tr>
																
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Marital
																		Status</th>
																	<td>${candidateInfo.family_bckgrund}</td>
																</tr>
																
																<c:if test="${fn:containsIgnoreCase(candidateInfo.family_bckgrund, 'Yes') || fn:containsIgnoreCase(candidateInfo.family_bckgrund, 'married')}">
																<tr>
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Spouse Occupation</th>

																	<td>${candidateInfo.spouse_wrk}</td>
																</tr></c:if>
																
																<tr>
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Native</th>
																	<td>${candidateInfo.can_native_loc}</td>
																</tr>
																	<tr>
																	<th
																		style='text-align: center; color: #191970; vertical-align: middle;'>Current
																		location</th>
																	<td>${candidateInfo.workLocation}</td>
																</tr>
																
															</tbody>
														</table>
													<!-- </div> -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='span6'>
						<div class='container-fluid'>
							<div class='row-fluid' id='content-wrapper'>
								<div class='span12'>
									<div class='row-fluid' style="margin-top: 0px;">
										<div class='span12 box'>
											<div class='box-content box-no-padding'>
												<div class='responsive-table'>
													<div style="height: 160px;">

														<table
															class='data-table table table-bordered table-striped'
															data-pagination-records='10'
															data-pagination-bottom='true' data-sorting='false'
															style='margin-top: -60;'>

															<tbody>

																<tr>
																	<th
																		style='text-align: center; color: #191970; vertical-align: middle;'>Additional Family info</th>
																	<td><p
																			style="width: 300px; white-space: pre-wrap; word-wrap: break-word; height: 140px; overflow-y: scroll;">${candiaddtnlinfo.familyDetails}</p></td>
																</tr>

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
		
				
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box'>
						<div class='box-header orange-background'
							style="line-height: 5px;">

							<div class="title-head">
								<Strong style="color: #000080; padding-left: 42%;">Candidate
									Expectation</Strong>
								

							</div>

						</div>
					</div>
				</div>


				<div class='container-fluid'>
					<div class='row-fluid' id='content-wrapper'>
						<div class='span12'>
							<div class='row-fluid' style="margin-top: 0px;">
								<div class='span12 box'>
									<div class='box-content box-no-padding'>
										<div class='responsive-table'>
											<div class='scrollable-area'
												style="height: 175px; overflow-x: scroll;">

												<table class='data-table table table-bordered table-striped'
													data-pagination-records='10' data-pagination-bottom='true'
													data-sorting='false' style='margin-top: -60;'>
													<thead>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'></th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>CTC
																PA(From Recruiter)</th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>CTC
																PM(From Recruiter)</th>
															
															<c:choose><c:when test="${role=='NEGOTIATOR'}">
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>CTC
																PA(Negotiation Team)</th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>CTC
																PM(Negotiation Team)</th>
																</c:when></c:choose>
														</tr>

													</thead>
													<tbody>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>CCTC/LCTC</th>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candidateInfo.currentCTC}</td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.ctc_pm}</td>
																
														</tr>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>ECTC</th>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candidateInfo.expectedCTC}</td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.ectc_pm}</td>
																
														</tr>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>Negotiable
																Rate</th>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.negratePA}</td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.negratePM}</td>
																<c:choose><c:when test="${role=='NEGOTIATOR'}">
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.nego_rate_pa}</td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.nego_rate_pm}</td>
																</c:when></c:choose>
														</tr>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>NP</th>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'>${candidateInfo.noticeperiod}</td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'></td>
																<c:choose><c:when test="${role=='NEGOTIATOR'}">
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'></td>
															<td
																style='text-align: center; color: #191970; vertical-align: middle;'></td>
																</c:when></c:choose>
														</tr>
													</tbody>
												</table>
											</div>
											
										</div>
									</div>
								</div>
								<c:choose>
									<c:when test="${role=='RECRUITER' || role=='TEAMLEAD'}">
								<center><input type="button" style="background: #0b3c7c" class="btn btn-success btn-xs" onclick="goBack()" value="Back"> </center>
								</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			</div>
	
	<div class="container-fluid" id="divScroll">
		<div class="row-fluid">
			<div class="span12">
			<div class="status-clint" style="margin-top: -3%;padding-left: 17%;margin-bottom: 3%;">
			
			</div>	
			</div>
		</div>
	</div>
 		
		<div class='modal hide fade' id='modal-example3' tabindex='-1' style="height:90%!important;width:680px;">
		<div class='modal-header' style="max-width: 980px;">
			<button class='close' data-dismiss='modal' id="closemodel"
				type='button'>&times;</button>
			<h3>
				<i class="icon-user "></i> CANDIDATE CERTIFICATES
			</h3>
		</div>
		<div class='modal-body'>
			<div class='row'>
				<div class='col-sm-12'>
					<div class='box'>
						<div class='box-padding'>
							<form class="form-horizontal" style="margin-bottom: 0;"
								id="myform" method="post" action="docuploadpreonboard"
								enctype="multipart/form-data" onsubmit="return checkForm(this);">
								<input type="hidden" id="candid" name="candid"> 
								<input	type="hidden" id="candmobno" name="candmobno">
								 <input	type="hidden" id="bdname_d" name="bdname">
								  <input type="hidden" id="recname_d" name="recname">
								   <input type="hidden" id="clientname_d" name="clientname">
								    <input type="hidden" id="jobid_d" name="jobid">

								<div class='control-group' id="eduscationDiv">
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;">*</span>Education : </label>
									<div class='controls'>
									    <input type="hidden" id="EducationDoc" name="EducationDoc"  value="Education Documents" >
										<input type="file" id="EducationDocs" name="EducationDocs" class="form-control" onchange="checkDoc(this)" accept=".zip"/>
										<br><span style="color: red;">Accepts .zip files only and max file size 30MB</span>
									</div>
								</div>
								<div class='control-group' id="idProofDiv">
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;">*</span>ID Proofs : </label>
									<div class='controls'>
									    <input type="hidden" id="Idproof" name="Idproof"  value="Id Proofs" >
										<input type="file" id="IdProofDocs" name="IdProofDocs" class="form-control" onchange="checkIdDoc(this)" accept=".zip"/><br>
										<span style="color: red;">Accepts .zip files only and max file size 10MB</span>
									</div>
								</div>
								
								<div class='control-group' id="curOrgDiv">
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;">Current Organization Docs : </label>
									<div class='controls'>
										<input type="hidden" id="currOrgDoc" name="currOrgDoc"  value="Current Organization Docs" >
										<input type="file" id="currOrgDocs" name="currOrgDocs" class="form-control" onchange="checkDoc(this)" accept=".zip"/><br>
										<span style="color: red;">Accepts .zip files only and max file size 30MB</span>
									</div>
								</div>
									<div class='control-group' >
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;">Any Pending Documents? </label>
									<div class='controls'>
										<input type="checkbox" id="chkBox" name="chkBox" >
										
									</div>
								</div>
								<div class='control-group' id="pendingDocs">
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;">Pending Documents : </label>
									<div class='controls'>
										<input type="hidden" id="pendingDoc" name="pendingDoc"  value="Pending Docs" >
										<input type="file" id="pendingfiles" name="pendingDocs" class="form-control" onchange="checkDoc(this)" accept=".zip"/><br>
										<span style="color: red;">Accepts .zip files only and max file size 30MB</span>
									</div>
								</div>
								<div class='control-group' >
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;">Previous Organization</label>
									<div class='controls'>
									
									<input type="checkbox" id="chkBox1" name="chkBox1" >
										
									</div>
									<!-- <div id="addEmps"></div> -->
								</div>
								<div class='control-group' id="prevOrganizationDocs">
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;">Previous Organization Docs:</label>
									<div class='controls'>
										<strong><b></b> &nbsp&nbsp&nbsp<button class="btn btn-success" type="button" id="addEmpBtnId"
											onclick="addEmp();">+</button></strong>
									</div><br>
									<div id="addEmps"></div>
								</div>
								
								<center><div class="form-group" id="submitid">  
									<input type="submit" id="docsubmitId" name="myform" class="btn btn-success btn-xs" 
									style="background: #0b3c7c"	value="Submit">
								</div></center>
								
								
				<br><br>		
				  <div class='box-content box-no-padding'>
										<div class='responsive-table'>
											<div class='scrollable-area'
												style="height: 175px; overflow-y: scroll;">
				  <table class='data-table table table-bordered table-striped'
					data-pagination-records='10' data-pagination-top-bottom='true'
					style='margin-bottom: 0;' id="sampletable3">

					<tr>
						<th>File Type</th>
						<th>File Name</th>
						<th>Status</th>
					</tr>

					<tbody id="uploadedocs">

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
	
	
	<div class='modal hide fade' id='modal-viewDocs' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Verify Documents</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			<form class='form form-horizontal validate-form'
				style='margin-bottom: 0;'>

				<table class='data-table table table-bordered table-striped'
					data-pagination-records='10' data-pagination-top-bottom='true'
					style='margin-bottom: 0;' id="sampletable2">
					<tr>
					<c:choose><c:when test="${role=='HRUSER'}">
					    <th>File ID</th>
					    </c:when>
						</c:choose>
						<th>File Type</th>
						<th>File Name</th>
						<th>Status</th>
						<th>Comments</th>
						
						
						
					</tr>
								
				</table>
			</form>
		</div>

</div>

 <div class='modal hide fade' id='modal-employmentdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Employment Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="saveCandidateEmployers" method="post" class="form-horizontal" id="employerformid" >
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">					

										<center><div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Employer Name</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtemployer' autocomplete="off"
														name="employer" 
														
														type='text' required>
												</div>
											</div><br>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Tenure 
													<br><span style="color: red;">(Eg: January 2020-August 2020)</span></label>
												<div class="col-lg-4">
													<input class="form-control" id='txttenure' 
														name="tenure" 
														autocomplete="off"  
														 type='text' required  title="Eg: Month Year-Month Year"><br>
														 
													<!--  pattern="\d*"-->
												</div>
											</div>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>CTC/Annum</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtctc' name="ctc"
														autocomplete="off" title="Enter Only digits" type='text' 
														maxlength="9" pattern="\d*"
														type='text' >
												</div>
											</div><br>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Last drawn CTC/Annum</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtldctc' name='txtldctc' autocomplete="off"
														
														title="Enter Only digits" type='text' 
														maxlength="9" pattern="\d*">
												</div>
											</div><br>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Reason for change</label>
												<div class="col-lg-4">
													<input class="form-control" id='txtchangereason'
														autocomplete="off" name="changereason" type="text"
														 required>
													<!--  pattern="\d*"-->
												</div>
											</div><br>
											

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Comments</label>
												<div class="col-lg-4">
													<input type="text" id="comments" name="comments"
														><br>
												</div>
											</div><br>
											<div class="form-group row">
											<label for="inputPassword" class="col-lg-4 control-label">
											<b>Add Other Employer Details</b>
											</label>
											<div class="input-group-btn addButton">
												<button class="btn btn-success btn-sm" type="button"
													onclick="generateRows();">
													<span>+</span>
												</button>
											</div></div>
											
											<div id="apeendEmployersRows"></div>
													<br>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>
										</form>	
								    </fieldset>
								</div>
				

				
				<%-- <input type ="button" value="Save" class="btn btn-success btn-xs" onclick="saveEmployerDetails('${candidateInfo.candidateid}')"> --%>
			<!-- </form> -->
		</div>



	<div class='modal hide fade' id='modal-addcanAdddetails' tabindex='-1'
		style="height: 92% !important;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Candidate Additional(Personal&Expectations) Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name}</span>
			</p>
			<form class='form form-horizontal validate-form'
				style='margin-bottom: 0;' action="canAddtnlPersonalDetails"
				method="GET">
				<input type="hidden" name="candidateid"
					value="${candidateInfo.candidateid}"> <input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">


				<div class="form-group">

					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Father Name: </label>
						<div class='controls'>
							<input type="text" id="fathername" name="fathername"
							value="${candiaddtnlinfo.fathername}" class="form-control" title="only accepts characters" pattern="[a-zA-Z][a-zA-Z\s]*" />
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Mother Name: </label>
						<div class='controls'>
							 <input type="text" id="mothername" name="mothername"
							value="${candiaddtnlinfo.mothername}" class="form-control"
							title="only accepts characters" pattern="[a-zA-Z][a-zA-Z\s]*"/>
						</div>
					</div>
					
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Additional Family Info: </label>
						<div class='controls'>
							 <textarea  id="familyDetails" name="familyDetails"
							class="form-control" title="only accepts numbers and characters" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$">${candiaddtnlinfo.familyDetails}</textarea>
						</div>
					</div>
					
				
				</div>

				<div class="form-group" id="btn-custm">
					<div class="col-lg-12">
						<center>
							<button type="submit" style="background: #0b3c7c" class="btn btn-success btn-xs">Submit</button>
							&nbsp&nbsp&nbsp&nbsp
						</center>
					</div>
				</div>
				</center>
			</form>
		</div>
	</div>



	



</section>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$('#sampleTable').DataTable();
</script>
<script type="text/javascript">
	$('#sampletables').DataTable();
</script>
<script type="text/javascript">
	$('#sampletable2').DataTable();
</script>
<script type="text/javascript">
	$('#sampletable3').DataTable();
</script>
<script type="text/javascript">
	$('#employersampletable2').DataTable();
</script>
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
<script src="resources/assets/javascripts/multi-select.js"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>


<script type="text/javascript">
var i = 0;
var max_limit = 4;
function generateRows(){
	/* var number = $('#noofpreOrgs').val();
	if(number==0){alert("Number should not be 0");
	$('#apeendEmployersRows').empty();
	} */
	i++;
	$('#btncount').val(i);
	var objTo = document.getElementById('apeendEmployersRows');
	//for(var i=1;i<=number;i++){
		
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + i);
		var rdiv = 'removeclass' + i;
		divtest.innerHTML = '<br><div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</span>Employer Name</label><div class="col-lg-4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="form-control"  id="employer" autocomplete="off" name="employer'+i+'" placeholder="Enter employer name" type="text" required><button class="btn btn-danger btn-sm" type="button" onclick="remove_add_fieldsV('+i+ ');"><input type="hidden" value="'+i+'" name="btncount"> <span class="glyphicon glyphicon-minus" aria-hidden="true">-</span></button></div></div><br><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Tenure<br><span style="color: red;">(Eg: January 2020-August 2020)</span></label><div class="col-lg-4"><input class="form-control"  id="tenure" autocomplete="off" name="tenure'+ i+ '" placeholder="Tenure" title="Ex: Month Year-Month Year"  type="text" required></div></div><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>CTC/Annum</label><div class="col-lg-4"><input class="form-control"  id="CTC" autocomplete="off" name="ctc'+i+'" placeholder="CTC"   title="Enter Only digits" type="text"></div></div><br><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:black;"></Span>Last drawn CTC/Annum</label><div class="col-lg-4"><input class="form-control"  id="ldctc" autocomplete="off" name="ldctc'+i+'" placeholder="Last drawn CTC" title="Enter Only digits" type="text"></div></div><br><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;">*</Span>Reason For Change</label><div class="col-lg-4"><input class="form-control"  id="changereason" autocomplete="off" name="changereason'+i+'"   type="text" required></div></div><br><div class="form-group row"><label for="inputPassword" class="col-lg-4 control-label"><Span style="color:red;"></Span>Comments</label><div class="col-lg-4"><input type="text" id="comments" name="comments'+i+'" ></div></div></div><div class="clear"></div>';
		
		if (i <= max_limit) {
			objTo.appendChild(divtest);
		} else if (i > max_limit) {
			alert("Can't add more than  "+max_limit+"!!");
		}
		
		/* var tr = '<tr>'+
		"<td><input type='text' name='employer' id='employer"+i+"'></td>"+
			"<td><input type='text' name='tenure' id='tenure"+i+"'></td>"+
			"<td><input type='text' name='ctc' id='ctc"+i+"'></td>"+
			"<td><input type='text' name='ldctc' id='ldctc"+i+"'></td>"+
			"<td><input type='text' name='resonforchange' id='resonforchange"+i+"'></td>"+
			"<td><input type='text' name='comments' id='comments"+i+"'></td>"+
			"</tr>"; */
//$('#apeendEmployersRows').append(div);
	//}
}
function remove_add_fieldsV(rid) {
	$('.removeclass' + rid).remove();
	value--;
}

function saveEmployerDetails(){
	//employersampletable2
	
	
	var TableData = new Array();

    $('#employersampletable2 tr').each(function(row, tr){
    	$(this).closest('tr').find("input").each(function() {
            alert(this.value)
        });    
    }); 
    TableData.shift();
    
    TableData = $.toJSON(TableData);
	/* $('#employersampletable2 tr').each(function(row, tr){
		
		var employer=$(tr).find('td:eq(0)').val();
		var tenure=$(tr).find('td:eq(1)').val();
		var ctc=$(tr).find('td:eq(2)').val();
		var ldCtc=$(tr).find('td:eq(3)').val();
		var reasonforchange=$(tr).find('td:eq(4)').val();
		var comments=$(tr).find('td:eq(5)').val();
		
		alert(employer+"---"+tenure);
		alert(ctc+"---"+ldCtc);
		alert(reasonforchange+"---"+comments);
		
	    /* TableData = TableData 
	        + $(tr).find('td:eq(0)').val() + ' '  // Task No.
	        + $(tr).find('td:eq(1)').val() + ' '  // Date
	        + $(tr).find('td:eq(2)').val() + ' '  // Description
	        + $(tr).find('td:eq(3)').val() + ' ' 
	        + $(tr).find('td:eq(4)').val() + ' ' 
	        + $(tr).find('td:eq(5)').val() + ' ' 
	        + '\n'; 
	});
 */	 alert(TableData);
}
		
	function saveComment(canid, jobid, bdname, recname, clientname) {
		var form = $('#ajaxForm')[0];
		var data = new FormData(form);
		var formdata = new FormData(form);

		$.ajax({
			type : "POST",
			data : formdata,
			url : "negotiationComments",
			cache : false,
			async : false,
			processData : false,
			contentType : false,

			success : function(response) {
				if (response.message == "saved") {
					alert("Details added successfully!!");
					window.location = "negotiateCandidate";
				} else {
					alert("Details not added");
					window.location.reload();
					window.location = "negotiateCandidate";
				}

			},
			error : function() {

				alert('Error while request..');
			}

		});

	}
</script>
<script>
	function candidateDetails(candidateid, basic_qualification,
			highest_qualification, total_experience, primaryskill, dob,
			first_name, relevantExp, candDesignsation, currentCTC, expectedCTC,
			noticeperiod, workLocation, curOrg, pan, mail, np_negotiable,
			desc_np_negotion, int_pipeline_com, f2f_intrv, doj_cur_org,
			prev_relivd_date, prev_start_date, can_native_loc, is_tek_payroll,
			cur_cmpny_name, duration, prev_org, bank_stmt, bank_name, bank_loc,
			cmpny_docs, job_change, intrw_pipeline, offer_inhand,
			family_bckgrund, spouse_wrk, kids_info, resn_reloc) {

		$('#cName').text(first_name);
		$('#durationtd').text(duration);
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
		$('#cCurOrg').text(curOrg);
		$('#cPAN').text(pan);
		$('#cEMail').text(mail);
		$('#cnp_negotiable').text(np_negotiable);
		$('#desc_np_negotion').text(desc_np_negotion);
		$('#int_pipeline_com').text(int_pipeline_com);
		$('#f2f_intrv').text(f2f_intrv);
		$('#doj_cur_org').text(doj_cur_org);
		$('#prev_relivd_date').text(prev_relivd_date);
		$('#prev_start_date').text(prev_start_date);
		$('#can_native_loc').text(can_native_loc);
		$('#is_tek_payroll').text(is_tek_payroll);
		$('#cur_cmpny_name').text(cur_cmpny_name);
		$('#duration').text(duration);
		$('#prev_org').text(prev_org);
		$('#bank_stmt').text(bank_stmt);
		$('#bank_name').text(bank_name);
		$('#bank_loc').text(bank_loc);
		$('#cmpny_docs').text(cmpny_docs);
		$('#job_change').text(job_change);
		$('#offer_inhand').text(offer_inhand);
		$('#family_bckgrund').text(family_bckgrund);
		$('#spouse_wrk').text(spouse_wrk);
		$('#kids_info').text(kids_info);
		$('#resn_reloc').text(resn_reloc);

	}
</script>
<script type="text/javascript">
	function candidatefeedback_View(candidateid, phnno, candidatename,lname) {

		$('#candidateidNameFB').text(candidatename+" "+lname);
		$('#candidateidFB').val(candidateid);
		$('#mobileno').text(phnno);
		$.ajax({
			type : "get",
			url : "view_Feedback?candidateidFBV=" + candidateid,
			cache : false,
			async : false,
			success : function(response) {
				$('#candidatefeedback1').empty();

				for (var i = 0; i < response.length; i++) {
					var tr = "<tr><td>" + response[i].callername + "</td>"
							+ "<td>" + response[i].callerDate + "</td>"
							+ "<td>" + response[i].comments + "</td></tr>";

					$('#candidatefeedback1').append(tr);
				}
			},
			error : function() {
				//alert('Error while request..');
			}
		});
	}
</script>
<script>
	function getStatusId() {
		var statusid = document.getElementById('statusid').value;
	
		
		if (statusid == 'Approved By Management') {
		     $('#appid').show();
		     $('#mgmtfile').prop("required",true);
			// document.getElementById('file').required=true;
			
		} else {
			$('#appid').hide();
			document.getElementById('mgmtfile').removeAttribute('required');
		}
	}

	function getfileType(file) {
		var Filetype = file.files[0].type;
		var filename = file.files[0].name;
		if (filename.endsWith(".msg")) {

		} else {
			alert("accept .msg files only");
			$(file).val('');

		}
	}
</script>
<script type="text/javascript">
	$('#submitCandidate').attr("disabled", "disabled");
</script>
<script>
	$('input[type="file"]').change(function(e) {
		var fileName = e.target.files[0].name;
		$('#submitCandidate').removeAttr("disabled");
		$('#submit').show();
	});
</script>
<script type="text/javascript">
	var value = 0;
	var max_limit = 20;
	function adddocs() {
		value++;
		$('#btncount').val(value);

		$('#submitid').show();
		var objTo = document.getElementById('adddocs');
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + value);
		var rdiv = 'removeclass' + value;
		divtest.innerHTML = '<div class="form-group"><div><input type="text" class="form-control" id="other_doc" name="other_doc[]" placeholder="Enter Document name" required><input type="file" class="form-control" id="othr_doc" name="othr_doc[]" onchange="checkDoc(this)" required><button class="btn btn-danger" type="button" onclick="remove_add_fieldsC('
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
<script type="text/javascript">
	var emax_limit = 7;
	function addEmp() {

		var evalue=$("input[name='prevOrgDocs[]']").length
		evalue++;
		var objTo = document.getElementById('addEmps');
		var divtest = document.createElement("div");
		divtest.setAttribute("class", "form-group removeclass" + evalue);
		var rdiv = 'removeclass' + evalue;
		//divtest.innerHTML = '<div class="form-group"><div><label>Employer '+evalue+': <input type="file" class="form-control" id="emp_doc" name="emp_doc[]" onchange="checkCareerDoc(this)" required><button class="btn btn-danger" type="button" onclick="remove_empsC('+ evalue+ ');">-</button></label></div></div><br><div class="clear"></div>';
		divtest.innerHTML = '<div class="form-group"><div><input type="text" class="form-control" id="prevOrgName" name="prevOrgName[]" placeholder="Enter Name" required>&nbsp&nbsp&nbsp<input type="file"  id="prevOrgDocs" name="prevOrgDocs[]" class="form-control"  onchange="checkCareerDoc(this)" required accept=".zip"/><button class="btn btn-danger" type="button" onclick="remove_empsC('+ evalue+ ');">-</button></div><br><span style="color: red;">Accepts .zip files only and max file size 10MB</span></div><br><div class="clear"></div>';
		  if (evalue >= emax_limit) {
			      objTo.appendChild(divtest);
                   $('#addEmpBtnId').attr('disabled', 'disabled');
             }else{
            	 objTo.appendChild(divtest);
             }
	}
	function remove_empsC(reid) {
		$('.removeclass' + reid).remove();
		 if ($("input[name='emp_doc[]']").length <= emax_limit) {
             $('#addEmpBtnId').removeAttr('disabled');
         }
		
	}
</script>
<script type="text/javascript">
    function preupload(candidateid,phnno,bdname,recnam,clnt_nam,jobid){
    	$.ajax({
			type : "get",
			url : "viewUploadedDocs?candidateid=" + candidateid,
			cache : false,
			async : false,
			success : function(response) {
				
				var list1 = response.canDocs;
				$('#uploadedocs').empty();
				if(list1.length>0){
					 var eduArr=false;
					var idArr=false;
					var curArr=false; 
				for (var i = 0; i < list1.length; i++) {
					if(list1[i].fileType.includes("Education Documents") ){
				        eduArr= true;
				    }
					if(list1[i].fileType.includes("IdProof")){
				        idArr=true;
				    } 
					if(list1[i].fileType.includes("Current Organization Docs") ){
				        curArr=true;
				    } 
					if(eduArr==true){
						$('#eduscationDiv').hide();
						}else{
							  $('#eduscationDiv').show();
							}
					if(idArr==true){
						$('#idProofDiv').hide();
						}
					else{$('#idProofDiv').show();
						}
					if(curArr==true){
						$('#curOrgDiv').hide();
						}else{
							$('#curOrgDiv').show();
							}
					
					var tr = "<tr><td>" + list1[i].fileType + "</td>"
							+ "<td><a href='preObtFiledownload?candidateid="
							+ candidateid + "&&filename=" + list1[i].fileName
							+ "&&fileType=" + list1[i].fileType + "'>"
							+ list1[i].fileName + "</a></td>" + "<td>"
							+ list1[i].status + "</td></tr>";
					$('#uploadedocs').append(tr);
				    }
				}
				$('#candid').val(candidateid); 
				$('#candmobno').val(phnno);
				$('#bdname_d').val(bdname);
				$('#recname_d').val(recnam);
				$('#clientname_d').val(clnt_nam);
				$('#jobid_d').val(jobid);
				$('#prevOrganizationDocs').hide();
				$('#pendingDocs').hide();
				
			   },
			error : function() {
			}
		});
    }
    
    
	
    
</script>
<script>
function deleteFile(candidateid,tblpk){
	$.ajax({
		type : "get",
		url : "preObtFiledelete?candidateid=" + candidateid+"&tblpk="+tblpk,
		cache : false,
		async : false,
		success : function(response) {
			if(response=='success'){
				alert("File Deleted successfully");
				location.reload();
			}
		},
		error : function() {
		}
	});
}
</script>
<script>
function checkDoc(file){
	var candidateid=$('#candid').val();
	var filename = file.files[0].name;
	 var FileSize = ((file.files[0].size)/ 1024 )/ 1024; 
 	if (filename.endsWith(".zip") && FileSize < 30) {
		$.ajax({
			type : "get",
			url : "checkSelectedDoc?candidateid=" + candidateid + "&&filename=" + filename ,
			cache : false,
			async : false,
			success : function(response) {
				if(response!=''){
					alert("This file is already attached");
					$(file).val('');
				}else{
				}
			},
			error : function() {
			}
		});
	} else {
		alert("Accepts .zip files only and max file size 30 MB");
		$(file).val('');
	}
}
function checkCareerDoc(file){
	var candidateid=$('#candid').val();
	var filename = file.files[0].name;
	 var FileSize = file.files[0].size / 1024 / 1024; 
	if (filename.endsWith(".zip") && FileSize < 10) {
		$.ajax({
			type : "get",
			url : "checkSelectedDoc?candidateid=" + candidateid + "&&filename=" + filename ,
			cache : false,
			async : false,
			success : function(response) {
				//alert(response);
				if(response!=''){
					alert("This file is already attached")
					$(file).val('');
				}else{
					
				}
			},
			error : function() {
			}
		});
	} else {
		alert("Accepts .zip files only and max file size 10 MB");
		$(file).val('');
	}
}
function checkIdDoc(file){
	var candidateid=$('#candid').val();
	var filename = file.files[0].name;
	 var FileSize = ((file.files[0].size) / 1024) / 1024; 
	if (filename.endsWith(".zip") && FileSize < 10) {
		$.ajax({
			type : "get",
			url : "checkSelectedDoc?candidateid=" + candidateid + "&&filename=" + filename ,
			cache : false,
			async : false,
			success : function(response) {
				if(response!=''){
					alert("This file is already attached")
					$(file).val('');
				}else{
					
				}
			},
			error : function() {
			}
		});
	} else {
		alert("Accepts .zip files only and max file size 10 MB");
		$(file).val('');
	}
}
</script>

<script type="text/javascript">
	function viewDocuments(candidateid, bdname, recname, clientname, jobid,role) {
		$.ajax({
			type : "get",
			url : "viewCandidateDocs?candidateid=" + candidateid + "&&bdname="
					+ bdname + "&&recname=" + recname + "&&clientname="
					+ clientname + "&&jobid=" + jobid,
			cache : false,
			async : false,
			success : function(response) {
				var list1 = response.canDocs;
			if(role=='HRUSER'){
				 $('#candidatedocs').empty(); 
				for (var i = 0; i < list1.length; i++) {
				var comments=null;
					if(list1[i].comments==null){
						comments="";
					}else{
						comments=list1[i].comments;
					}
					var tr = "<tr><td>"+list1[i].tbl_pk+ "</td>"
					+"<td style='display:none;'><input type='hidden'  name='candidate_ver'   id='candidate_ver'  value="+candidateid+"></td>"
					 +"<td style='display:none;'><input type='hidden' name='bdname_ver'     id='bdname_ver'     value="+bdname+"></td>"
					 +"<td style='display:none;'><input type='hidden' name='recname_ver'    id='recname_ver'    value="+recname+"></td>"
					 +"<td style='display:none;'><input type='hidden' name='clientname_ver' id='clientname_ver' value="+clientname+"></td>"
					 +"<td style='display:none;'><input type='hidden' name='jobid_ver'      id='jobid_ver'      value="+jobid+"></td>" 
					 
					        +"<td>"+list1[i].fileType+"</td>"
							+ "<td><a href='preObtFiledownload?candidateid="
							+ candidateid + "&&filename=" + list1[i].fileName
							+ "&&fileType=" + list1[i].fileType + "'>"
							+ list1[i].fileName + "</a></td>" 

							/* <option value="+list1[i].status+">"+list1[i].status+"</option> */
							
							if(list1[i].status=='Approved'){
								tr=tr+"<td><select id='status_ver" + list1[i].tbl_pk + "' size='1' name='status_ver' onchange='changeStatus("+ list1[i].tbl_pk +")'><option value=''>Choose status</option><option value='Approved' selected>Approved</option><option value='Rejected'>Rejected</option><option value='onHold'>onHold</option></select></td>";

							}else if(list1[i].status=='Rejected'){
								tr=tr+"	<td><select id='status_ver" + list1[i].tbl_pk + "' size='1' name='status_ver' onchange='changeStatus("+ list1[i].tbl_pk +")'><option value=''>Choose status</option><option value='Approved'>Approved</option><option value='Rejected' selected>Rejected</option><option value='onHold'>onHold</option></select></td>";
								}
							else if(list1[i].status=='onHold'){
								tr=tr+"	<td><select id='status_ver" + list1[i].tbl_pk + "' size='1' name='status_ver' onchange='changeStatus("+ list1[i].tbl_pk +")'><option value=''>Choose status</option><option value='Approved'>Approved</option><option value='Rejected'>Rejected</option><option value='onHold' selected>onHold</option></select></td>";
							}else{
								tr=tr+"	<td><select id='status_ver" + list1[i].tbl_pk + "' size='1' name='status_ver' onchange='changeStatus("+ list1[i].tbl_pk +")'><option value=''>Choose status</option><option value='Approved'>Approved</option><option value='Rejected'>Rejected</option><option value='onHold'>onHold</option></select></td>";
								}
							
							tr=tr+	"<td><input type='textarea' rows='4' column='30' id='comments_ver" +  list1[i].tbl_pk + "' value='"+comments+"' name='comments' readonly></td>"+
				"<td><input type='button' name='submit' id='verify_submit"+ list1[i].tbl_pk +"' value='Submit' style='background: #0b3c7c' class='btn btn-success btn-xs' onclick='verifysubmit("+ list1[i].tbl_pk +")'></td></tr>";	

	$('#candidatedocs').append(tr);
		$("#verify_submit"+list1[i].tbl_pk).attr("disabled", true);
							
				}
			}else{
				
				$('#uploadedocs1').empty();
				for (var i = 0; i < list1.length; i++) {

					var comments=null;
					if(list1[i].comments==null){
						comments="";
					}else{
						comments=list1[i].comments;
					}
					var tr = "<tr><td>" + list1[i].fileType + "</td>"
							+ "<td><a href='preObtFiledownload?candidateid="
							+ candidateid + "&&filename=" + list1[i].fileName
							+ "&&fileType=" + list1[i].fileType + "'>"
							+ list1[i].fileName + "</a></td>" + "<td>"
							+ list1[i].status + "</td>"
							+"<td>"+comments+"</td></tr>";
					$('#uploadedocs1').append(tr);
				}				
			  }
			
			
			//changeStatus
			},
			error : function() {
			}
		});
	}
</script> 
<script>

	function checkFileType(file) {
		var Filetype = file.files[0].type;
		var filename = file.files[0].name;
		if (filename.endsWith(".msg")) {
		} else {
			alert("accept .msg files only");
			$(file).val('');

		}
	}
</script>
<script>

	function checkFileTypeDoc(file) {
		var Filetype = file.files[0].type;
		var filename = file.files[0].name;
		if (filename.endsWith(".msg")) {
			
		} else {
			alert("accept .msg files only");
			$(file).val('');
		}
	}
</script>
<script>

$('#prevOrganizationDocs').hide();
$('#pendingDocs').hide();
function verifysubmit(id){
	
	var status=$('#status_ver'+id).val();
	var candidateid_ver=$('#candidate_ver').val();
	var bdname_ver=$('#bdname_ver').val();
	var recname_ver=$('#recname_ver').val();
	var clientname_ver=$('#clientname_ver').val();
	var jobid_ver=$('#jobid_ver').val();
	var comments=$('#comments_ver'+id).val();
	if (comments=="") {
		$('#comments_ver'+id).attr("required", true);
		$('#comments_ver'+id).focus();
	}else{
		
	$.ajax({
		type : "get",
		url : "saveVerifyDocs?candidateid=" + candidateid_ver + "&&status="
				+ status + "&&comments=" + comments + "&&tbl_pk="+ id+"&&bdname="+ bdname_ver + "&&recname=" + recname_ver + "&&clientname="+ clientname_ver + "&&jobid=" + jobid_ver,
		cache : false,
		async : false,
		success : function(response) {
		//alert("^^^^^^^^^^^"+response)
			if(response!=null){
			// alert("Details Updated Sucessfully");
			 $('#comments_ver'+id).attr("readonly", true);
			 $("#verify_submit"+id).attr("disabled", true);
			
			}else{
				
				}
			// 
		    }
         })
	}
}
</script>
<script>
function statusByApproved(){
	var status=$('#status').val();
	if(status=="ApprovedByManagement"){
		 $('#details').show();
	       }
	else{
		$('#details').hide();
		document.getElementById('file').removeAttribute('required'); 
	}
}

$('#mgmtAppctcPA').on('change', function () {
	var pa=$('#mgmtAppctcPA').val();
	var pm=$('#mgmtAppctcPM').val();
	if(pa!=''){
		var ctcPa=parseInt(pa);
		var ctcPm=ctcPa/12;
		ctcPm=ctcPm.toFixed(2);
		$('#mgmtAppctcPM').val(ctcPm);
		}
}); 
$('#mgmtAppctcPM').on('change', function () {
	var pa=$('#mgmtAppctcPA').val();
	var pm=$('#mgmtAppctcPM').val();
	if(pm!=''){
		var ctcPm=parseInt(pm);
		var ctcPa=ctcPm*12;
		ctcPa=ctcPa.toFixed(2);
		$('#mgmtAppctcPA').val(ctcPa);
		}
	
}); 

$('#mgmtAppctcPA1').on('change', function () {
	var pa=$('#mgmtAppctcPA1').val();
	var pm=$('#mgmtAppctcPM1').val();
	if(pa!=''){
		var ctcPa=parseInt(pa);
		var ctcPm=ctcPa/12;
		ctcPm=ctcPm.toFixed(2);
		
	$('#mgmtAppctcPM1').val(ctcPm);
		}
}); 
$('#mgmtAppctcPM1').on('change', function () {
	var pa=$('#mgmtAppctcPA1').val();
	var pm=$('#mgmtAppctcPM1').val();
	if(pm!=''){
		var ctcPm=parseInt(pm);
	var ctcPa=ctcPm*12;
	ctcPa=ctcPa.toFixed(2);
		$('#mgmtAppctcPA1').val(ctcPa);
		}
	
}); 
$('#ctcType').on('change', function () {
	if($('#ctcType').val()!=''){
		if($('#ctcType').val()=='PA'){
			   $('#mgmtAppctcPA1').removeAttr("readOnly");
			   $('#mgmtAppctcPM1').attr("readOnly",true);
			   $('#mgmtAppctcPM1').val('');
			   $('#mgmtAppctcPA1').val('');
			}	
		else if($('#ctcType').val()=='PM'){
			   $('#mgmtAppctcPM1').removeAttr("readOnly");
			   $('#mgmtAppctcPA1').attr("readOnly",true);
			   $('#mgmtAppctcPM1').val('');
			   $('#mgmtAppctcPA1').val('');
			}
	}else{
		$('#mgmtAppctcPM1').attr("readOnly",true);
		$('#mgmtAppctcPA1').attr("readOnly",true);
		$('#mgmtAppctcPA1').val('');
		$('#mgmtAppctcPM1').val('');
		}
});

</script>

<script type="text/javascript">
	function saveFeedBack() {
		var candidateidFBS = $('#candidateidFB').val();
		var candidateCommentS = $('#candidateComment').val();
		if (candidateCommentS == "") {
			alert("Please enter feedback");
		} else {
			$.ajax({
				type : "POST",
				url : "store_Feedback?candidateidFBS=" + candidateidFBS
						+ "&candidateCommentS=" + candidateCommentS,
				cache : false,
				async : false,
				success : function(response) {
					window.location.reload();

				},
				error : function() {
					//alert('Error while request..');
				}

			});
		}
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
function releaseloi(candidateid,phnno,bdname,recnam,clnt_nam,jobid){
		
}
</script>
<script>
	function CheckfileLoi(file) {
		var candidateid=$('#candid1').val();
		var Filetype = file.files[0].type;
		var filename = file.files[0].name;
		if (Filetype=='application/pdf') {
			$.ajax({
				type : "get",
				url : "checkSelectedDoc?candidateid=" + candidateid + "&&filename=" + filename ,
				cache : false,
				async : false,
				success : function(response) {
					if(response!=''){
						alert("This file is already attached")
						$(file).val('');
					}else{
						
					}
				},
				error : function() {
				}
			});
		} else {
			alert("accept .pdf files only");
			$(file).val('');

		}
	}

	
function checkForm(form)
{
 	var edu = $('#EducationDocs').val(); 
     var id = $('#IdProofDocs').val(); 
     var cur = $('#currOrgDocs').val(); 
     var pd = $('#pendingfiles').val(); 
     
     var prv=$("input[name='prevOrgDocs[]']").length;
     if(edu!='' || id!='' || cur!='' || pd!='' || prv>0) 
     { 
   	    return true;
     }else{
    	  alert( 'Please select file' );
    	  return false;
      }
}
function saveStatus(role){
	
	if(role=='HRUSER'){

		//$("#submitid").attr("disabled",true);
		 var form = $('#userForm')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "docPageSubmit", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
		            if(response=='Success'){
	            	alert("Status updated Successfully");
	            	window.location.reload();
		            }
		            else if(response==null){
		            	alert("Status updated,mail issue.."+response);
		            }else{
		            	alert("Error while updating status .Please check..");
			            }
		            
	            	
	            }
	        });


	}
	 if(role=='NEGOTIATOR'){
		
		 var form = $('#negotiatorForm')[0];
	     var data = new FormData(form);
		$.ajax({
	            url: "negotiationTeamStatus", //this is the submit URL
	            type: "POST",
	            enctype: 'multipart/form-data',
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            success: function(response){
	            	if(response=='Success'){
		            	alert("Status upadated Successfully");
		            	window.location.reload();
	            	}
			            else{
			            	alert("Error while updating status .Please check..");
			            }
	            	
	            	
	            }
	        });
		
	}

}




</script>    
<script type="text/javascript">
function goBack(){
	window.location.href="candidatelist";
	//window.history.back();
}


$('#chkBox').change(function() {
    if($(this).is(':checked')){
    $('#pendingDocs').show();
    }else{
    	 $('#pendingDocs').hide();
        }
  });
$('#chkBox1').change(function() {
    if($(this).is(':checked')){
    $('#prevOrganizationDocs').show();
    }else{
    	 $('#prevOrganizationDocs').hide();
        }
  });

function changeStatus(id){
	var status=$("#status_ver"+id).val();
	
	if(status!=''){
	$("#verify_submit"+id).attr("disabled", false);
	$('#comments_ver'+id).attr("readonly", false);
	}
	else{
		$("#verify_submit"+id).attr("disabled", true);
		}
}
function editEmployement(employername,id){
	
	$('#ver_employername').val(employername);
	$('#ver_id').val(id);
	var tenuername_td=$('#tenuername_td'+id).html();
	var employername_td=$('#employername_td'+id).html();
	
	var appointmenttenure_td=$('#appointmenttenure_td'+id).html();
	var relievetenure_td=$('#relievetenure_td'+id).html();
	var bankstmtstenure_td=$('#bankstmtstenure_td'+id).html();
	var verifiercomments_td=$('#verifiercomments_td'+id).html();
	var payslipstenure_td=$('#payslipstenure_td'+id).html();
	
	$('#appointmentletter').val(appointmenttenure_td);$('#relievingletter').val(relievetenure_td);
	$('#bankstmt').val(bankstmtstenure_td);$('#comments').val(verifiercomments_td);$('#payslip').val(payslipstenure_td);
	
	$("#modal-employmentdetails").show();
	
}

</script>
</body>
</html>