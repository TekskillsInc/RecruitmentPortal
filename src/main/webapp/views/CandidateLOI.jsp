
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
																	<td>
																	<%-- <a href='#modal-candidateDetails'
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
																,'${candidateInfo.resn_reloc}')"> </a>--%><font
																			color=blue>${candidateInfo.first_name} ${candidateInfo.last_name}</font></td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Contact
																		No</th>

																	<td><font color=blue> ${candidateInfo.contact_number}</font></td>
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
					<div class='row-fluid' style="margin-top: -65px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Employment Details</Strong>
										

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
																	style='text-align: center; color: #191970; vertical-align: middle;'>Reason
																	for change</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Comments</th>
															</tr>

														</thead>
														<tbody>
 
															<tr><%-- ${candidateInfo.prev_org}/ --%>
																<td>${candidateInfo.current_org}</td>
																<td>${candidateInfo.doj_cur_org}</td>
																<td>${candidateInfo.currentCTC}</td>
																 <td>${candidateInfo.currentCTC}</td> 
																<td>${candidateInfo.resn_reloc}</td>
																<td></td>
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
			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -10px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Education
										Details
									</Strong>
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
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Comments</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Course</th>
																<td>${candidateInfo.highest_qualification}</td>
																<td>${candidateInfo.basic_qualification}</td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
															<tr>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Year
																	of Pass out</th>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
																<td></td>

															</tr>
															<tr>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Percentage</th>
																<td>${candidateInfo.post_Graduation}</td>
																<td>${candidateInfo.graduation}</td>
																<td></td>
																<td>${candidateInfo.ssc}</td>
																<td></td>
															</tr>
															<tr>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Added By Negotiation Team </th>
																
																<td>${candEducainfo.post_graduation}</td>
																<td>${candEducainfo.graduation}</td>
																<td>${candEducainfo.intermediate}</td>
																<td>${candEducainfo.ssc}</td>
																<td>${candEducainfo.comments}</td>
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
															<c:choose>
															<c:when test="${canStatus.hr_loi_status=='Released'}">
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		onclick="releaseloi('${candidateInfo.candidateid}','${candidateInfo.contact_number}','${bdname}','${recname}','${clientname}','${jobid}')"
																		href='#modal-example4'><strong>View LOI</strong> </a>
															</c:when>
															<c:otherwise>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																		onclick="releaseloi('${candidateInfo.candidateid}','${candidateInfo.contact_number}','${bdname}','${recname}','${clientname}','${jobid}')"
																		href='#modal-example4'><strong>Release
																			LOI</strong> </a>
															</c:otherwise>
															</c:choose>
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
		</div>
		
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: -10px;">
					<div class='span12 box'>
						<div class='box-header orange-background'
							style="line-height: 5px;">
							<div class="title-head">
								<Strong style="color: #000080; padding-left: 42%;">Personal Details									
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
																<tr>
																	<th
																		style='text-align: middle; color: #191970; vertical-align: middle;'>Spouse</th>

																	<td>${candidateInfo.spouse_wrk}</td>
																</tr>
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
								<Strong style="color: #000080; padding-left: 42%;">Offered Details</Strong>
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
												style="height: 155px;overflow:hidden;">

												<table class='data-table table table-bordered table-striped'
													data-pagination-records='10' data-pagination-bottom='true'
													data-sorting='false' style='margin-top: -60;'>
													<thead>
														<tr>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>Offered CTC
																PM</th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>Offered CTC
																PA</th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>
																Offered Designation</th>
															<th
																style='text-align: center; color: #191970; vertical-align: middle;'>
																DOJ</th>		
														</tr>
													</thead>
													<tbody>
														<tr>
															<td style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.nego_rate_pm}</td>
															<td style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.nego_rate_pa}</td>
															<td style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.offeredDesignation}</td>
															<td	style='text-align: center; color: #191970; vertical-align: middle;'>${candiaddtnlinfo.dojDate}</td>	
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
	<div class='row-fluid' id='content-wrapper'>
		<div class='span12'>
			<div class='row-fluid' style="margin-top: -56px;">
				<div class='span12 box'>
					<div class='box-header orange-background' style="line-height: 5px;">
						<div class='title-head'>
							<Strong style="color: #000080;padding-left:35%;">Comments</Strong>
						</div>
					</div>
				</div>
			</div>
			<div class='container-fluid'>
				<div class='row-fluid'>
					<div class='span12'>
						<div class='row-fluid' style="margin-bottom: 10px;">
							<div class='span12 box'>
								<div class="span6">
								<!-- <form id="ajaxForm" action="negotiationComments" enctype='multipart/form-data'> -->
								<form action="negotiationComments" enctype='multipart/form-data'
									method="POST">
									<input type="hidden" id="canid" name="canid"
										value="${candidateInfo.candidateid}" /> <input type="hidden"
										id="jobid_ras" name="jobid" value="${jobid}" /> <input
										type="hidden" id="recname" name="recname" value="${recname}" />
									<input type="hidden" id="bdname" name="bdname"
										value="${bdname}" /> <input type="hidden" id="clientname"
										name="clientname" value="${clientname}" />

									<center>
										<div class='form-group'>
											<textarea name="negcomment" id="negcomment" rows="10"
												style="width: 480px; overflow-y: auto;"
												placeholder="Enter Your Notes..." class="form-control"
												autocomplete="off" required></textarea>
											<br> &nbsp;&nbsp;&nbsp;&nbsp;
											
											<input type="submit" class="btn btn-success btn-xs"
												value="Save Comment" style="background: #0b3c7c">
											<input type="button" style="background: #0b3c7c" class="btn btn-success btn-xs" onclick="goBack()" value="Back">
										</div>
									</center>
								</form>
								</div>
								<div class="span6">

								<div class='box-content box-no-padding'>
									<div class='responsive-table'>
										<div class='scrollable-area'
											style="height: 190px; overflow-y: scroll;">
											<table class='data-table table table-bordered table-striped'
												data-pagination-records='10' data-pagination-bottom='true'
												data-sorting='false'
												style='margin-bottom: 0PX; margin-width: 10px; width: 100%; table-layout: fixed;'>

												<thead>
													<tr>

														<th
															style='text-align: center; color: #191970; vertical-align: middle;'>Comments</th>
														
														<th
															style='text-align: center; color: #191970; vertical-align: left;'>Comment
															Date</th>
													</tr>

												</thead>
												<tbody>
													<c:forEach var="viewcom" items="${viewcomObj}">
														<tr>
															<td style="text-align: start;"><p
																	style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: scroll;">${viewcom.comments}</p></td>
															
															<td>${viewcom.updateDate}</td>

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

 	<div class='modal hide fade' id='modal-example4' tabindex='-1'
		style="height:50%!important;width:35%!important;">
		<div class='modal-header' style="max-width: 980px;">
			<button class='close' data-dismiss='modal' id="closemodel"
				type='button'>&times;</button>
			<h3>
				<i class="icon-user "></i>LOI
			</h3>
		</div>
		<div class='modal-body'>
			<div class='row'>
				<div class='col-sm-12'>
					<div class='box'>
						<div class='box-padding'>
							<form class="form-horizontal" style="margin-bottom: 0;"
							 method="post" action="docuploadloi"	enctype="multipart/form-data">
						<input type="hidden" id="candid1" name="candidateid"	value="${candidateInfo.candidateid}">
						 <input type="hidden"	name="bdname" value="${bdname}">
						  <input type="hidden"	name="recname" value="${recname}">
						   <input type="hidden" name="jobid" value="${jobid}">
						    <input type="hidden" name="clientname" value="${clientname}">
						    <input type="hidden" name="candidatename" value="${candidateInfo.first_name}">
								<c:choose>
								  <c:when test="${role=='HRMANAGER'}">
								  <div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>LOI :</label>
									<div class='controls'>
										<input type="file" id="loifile" name="loifile"	 size="50" accept=".pdf" onchange="CheckfileLoi(this)"
											style="text-align: center;" required/>
											<br>
										<c:if test="${canStatus.hr_loi_status=='Released'}">
										<u><b><a href='preObtFiledownload?candidateid=${candidateInfo.candidateid}&&filename=${canStatus.hr_loi_filename}&&fileType=LOI'><font style="color:red;">${canStatus.hr_loi_filename}</font></a></b></u>
										</c:if>	
										
									</div>
								</div>
								
								<div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>Comments : </label>
									<div class='controls'>
										<textarea id="textArea" rows="5" cols="40"
											class="form-control" placeholder="Comments" name="loiComments" 
											required>${canStatus.hr_loi_comment}</textarea>
									</div>
								</div>

								<center>
									<div class="form-group" id=submit >
										<input type="submit" id="submitloi"
											class="btn btn-success btn-xs" style="background: #0b3c7c"
											value="Submit">
									</div>
								</center>
								  </c:when>
								   <c:when test="${role=='NEGOTIATOR'}">
								   <div class='control-group'>
								  <center><c:if test="${canStatus.hr_loi_status=='Released'}">
										<u><b><a href='preObtFiledownload?candidateid=${candidateInfo.candidateid}&&filename=${canStatus.hr_loi_filename}&&fileType=LOI'><font style="color:red;">${canStatus.hr_loi_filename}</font></a></b></u>
									</c:if></center>
									</div>	
								   </c:when>
								  </c:choose>
							</form>
						</div>
					</div>
				</div>
			</div>
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
	$('#interviewtable1').DataTable();
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
					alert("this file is already attached to "+response);
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
					alert("this file is already attached to "+response)
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
					alert("this file is already attached to "+response)
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
						alert("this file is already attached to "+response)
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


</script>
</body>
</html>