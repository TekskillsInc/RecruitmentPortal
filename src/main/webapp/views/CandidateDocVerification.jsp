
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
																	<td><font color=blue>${candidateInfo.first_name} ${candidateInfo.last_name}</font></td>
																</tr>
																<tr>
																	<th
																		style='text-align: left; color: #191970; vertical-align: middle;'>Contact
																		No</th>

																	<td><font color=blue>${candidateInfo.contact_number}</font></td>
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
									<a data-toggle='modal' href='#modal-addemploymentdetails'> <i class="icon-plus"></i></a>
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
																	style='text-align: center; color: #191970; vertical-align: middle;'>Appointment Letters (Month & Year)
																	</th>
																 <th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Relieving Letters (Month & Year)
																	</th> 
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Latest 6 months Bank Statements (From Month & Year to Month& Year)</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Latest 6 months Payslips (From Month & Year to Month& Year)</th>
<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Comments</th>

																<th>Action</th>
															</tr>

														</thead>
														<tbody>
 
															<c:forEach var="employer" items="${employerList}">
															<tr><%-- ${candidateInfo.prev_org}/ --%>
																<td id="employername_td${employer.id}">${employer.employername}</td>
																<td id="tenuername_td${employer.id}">${employer.tenureresume}</td>
																<td id="appointmenttenure_td${employer.id}">${employer.appointmenttenure}</td>
																<td id="relievetenure_td${employer.id}">${employer.relievetenure}</td>
																<td id="bankstmtstenure_td${employer.id}">${employer.bankstmtstenure}</td> 
																<td id="payslipstenure_td${employer.id}">${employer.payslipstenure}</td> 
																<td id="verifiercommentsemp_td${employer.id}">${employer.verifiercomments}</td>
																<td><a class='btn btn-default btn-xs' data-toggle='modal'
																href='#modal-employmentdetails'
																onclick="editEmployement('${employer.employername}','${employer.id}')">
																<i class="icon-pencil"></i>
															</a></td>
																
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
			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -10px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Education Details
										</Strong>
										<a data-toggle='modal' href='#modal-editeducationdetails'> <i
												class="icon-pencil"
												onclick="editEducation(${candEducainfo.id})"
												></i></a>
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
																 <!-- <th style='text-align: center; color: #191970; vertical-align: middle;'>Edit</th> -->  
															</tr>
														</thead>
														<tbody>
															<tr>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Course</th>
																<td id="pgtd${candEducainfo.id}">${candEducainfo.pg}</td>
																<td id="detd${candEducainfo.id}">${candEducainfo.degree}</td>
																<td id="intd${candEducainfo.id}">${candEducainfo.inter}</td>
																<td id="ssctd${candEducainfo.id}">${candEducainfo.ssc}</td>
															</tr>
															<tr>
																<th style='text-align: center; color: #191970; vertical-align: middle;'>Percentage </th>
																<c:choose>
																<c:when test="${candEducainfo.pgperc==0}">
																<td></td>
																
																</c:when>
																<c:otherwise><td id="pgperctd${candEducainfo.id}">${candEducainfo.pgperc}</td></c:otherwise>
																
																</c:choose>
																<%-- <td>${candEducainfo.pg_perc}</td> --%>
																
																<td id="dgperctd${candEducainfo.id}">${candEducainfo.degree_perc}</td>
																<td id="inperctd${candEducainfo.id}">${candEducainfo.interperc}</td>
																<td id="sscperctd${candEducainfo.id}">${candEducainfo.sscperc}</td>
																
																
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
			<div class='modal hide fade' id='modal-editeducationdetails' tabindex='-1' style="height: 90% !important;">
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
							style="color: #191970;"><span style="color: red;"></span>Secondary Education </label>
						<div class='controls'>
							<input type="text" id="ssctds"
							name="ssc" 	class="form-control" title="only numbers,characters, dot and %"
							 pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$" />
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>SSC Perc </label>
						<div class='controls'>
							<input type="number" id="sscperctds"
							name="sscperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
					
			 
					
					<!-- pattern="[0-9]+(\.[0-9]{0,2})?%?" -->
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Intermediate</label>
						<div class='controls'>
							<input type="text" id="intds" name="intermediate" 
							class="form-control" title="only numbers,characters, dot and %"
							title="only numbers,characters and dots" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Intermediate  % </label>
						<div class='controls'>
							<input type="number" id="inperctds"
							name="interperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
			 
				<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Graduation </label>
						<div class='controls'>
							<input type="text" id="detds"	name="graduation" 
							class="form-control" title="only numbers,characters, dot and - %" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Graduation  % </label>
						<div class='controls'>
							<input type="number" id="dgperctds"
							name="gradperc" 	class="form-control" title="only numbers"
							/>
						</div>
					</div>
				<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>Post-Graduation</label>
						<div class='controls'>
							<input type="text" id="pgtds"	name="post_graduation" 
							class="form-control" title="only numbers,characters, dot and % -" pattern="^([A-Za-z0-9%.,-]+ )+[A-Za-z0-9%.-,]+$|^[A-Za-z0-9%.-,]+$"/>
						</div>
					</div>
					<div class='control-group'>
						<label class='control-label' for='validation_jd_status'
							style="color: #191970;"><span style="color: red;"></span>PostGraduation  % </label>
						<div class='controls'>
							<input type="number"  id="pgperctds"
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
			<div class='modal hide fade' id='modal-addemploymentdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
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
													style="color: red;">*</Span>Tenure<br><span style="color: red;">(Eg: January 2020-August 2020)</span></label>
												<div class="col-lg-4">
													<input class="form-control" id='txttenure' 
														name="tenure" 
														autocomplete="off"  
														 type='text' required  title="Ex: Month Year-Month Year"><br>
														 
														 
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
			
			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -10px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Personal Details- ID & Address proofs</Strong>
									
									<a data-toggle='modal' href='#modal-proofdetails'> <i
												class="icon-pencil"
												onclick="editPersonal()"
												></i></a>
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
																	style='text-align: center; color: #191970; vertical-align: middle;'>ID Proof document (Name)</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Received /Not received</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Address proof document (Name)</th>
																 <th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Received /Not received</th>
																	<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Photo (Received /Not received)</th>
																	
															</tr>

														</thead>
														<tbody>
 
															<c:forEach var="personal" items="${personadetillsList}">
															<tr>
															<input type="hidden" name="personalid" id="personalid" value="${personal.id}">
																<td id="idprooftd${personal.id}">${personal.idproof}</td>
																<td id="idPRtd${personal.id}">${personal.isreceived}</td>
																<td id="addprooftd${personal.id}">${personal.addressproof}</td>
																<td id="addPRtd${personal.id}">${personal.isadproffreceived}</td>
																<td id="phototd${personal.id}">${personal.photo}</td>
																
																
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
			
			<div class='row-fluid' id='content-wrapper'>
				<div class='span12'>
					<div class='row-fluid' style="margin-top: -10px;">
						<div class='span12 box'>
							<div class='box-header orange-background'
								style="line-height: 5px;">
								<div class="title-head">
									<Strong style="color: #000080; padding-left: 42%;">Payslip Details</Strong>
									<a  data-toggle='modal' href='#modal-payslipdetails'> <i class="icon-plus"></i></a>	
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
																	style='text-align: center; color: #191970; vertical-align: middle;'>Months</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Payslip</th>
																<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Bank statement
																	</th>
																 <th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Comments
																	</th> 
																	<th
																	style='text-align: center; color: #191970; vertical-align: middle;'>Action
																	</th> 
															</tr>

														</thead>
														<tbody>
 
															<c:forEach var="payslip" items="${payslipList}">
															<tr>
															
																<td id="month_td${payslip.id}">${payslip.month}</td>
																<td id="payslip_td${payslip.id}">${payslip.payslip}</td>
																<td id="bank_td${payslip.id}">${payslip.bank_stmt}</td> 
																<td id="comm_td${payslip.id}">${payslip.comments}</td>
																<td><a class='btn btn-default btn-xs' data-toggle='modal'
																href='#modal-updatepayslip'
																onclick="editPayslip('${payslip.id}')">
																<i class="icon-pencil"></i>
															</a></td> 
																
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
			
			
			<div class='modal hide fade' id='modal-proofdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Personal Details - ID Proofs</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="saveCandidateProofs" method="post" class="form-horizontal" >
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">
				<input type="hidden" id="pers_id" name="pers_id">	
					
					
					<fieldset>		
							            <center> 
							            
							            
							            <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>ID Proof document (Name)</label>
												<div class="col-lg-4">
													<input class="form-control" id="idproof" autocomplete="off" name="idproof" type='text' placeholder="Id Proof Name" required>
													<input class="form-control" id='idproofRN' name="idproofRN" autocomplete="off" type='text' min-length="1" max-length="1"  placeholder="Received /Not received" required>
													<br>
												</div>
											</div><br> 
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Address proof document (Name)</label>
												<div class="col-lg-4">
													 <input class="form-control" id="addressproof" autocomplete="off" name="addressproof" type='text' placeholder="Address Proof Name" required>
													 <input class="form-control" id='addressproofRN' name="addressproofRN" autocomplete="off" type='text' min-length="1" max-length="1" placeholder="Received /Not received" required>
												</div>
											</div><br>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Photo</label>
												<div class="col-lg-4">
												<input class="form-control" id="photoRN" autocomplete="off" name="photoRN" type='text' placeholder="Photo Received /Not received" required>
												<input class="form-control"  autocomplete="off" readonly type='text' style='border:0;'>
												</div>
											</div><br>
											
												
												
												<!-- <div class='col-lg-4' >
		                                     ID Proof document (Name)<input class="form-control" id="idproof" autocomplete="off" name="idproof" type='text' placeholder="Id Proof Name" required>
											  <input class="form-control" id='idproofRN' name="idproofRN" autocomplete="off" type='text' min-length="1" max-length="1"  placeholder="Received /Not received" required>
											 <br>
											  
											  Address proof document (Name)<input class="form-control" id="addressproof" autocomplete="off" name="addressproof" type='text' placeholder="Address Proof Name" required>
											  <input class="form-control" id='addressproofRN' name="addressproofRN" autocomplete="off" type='text' min-length="1" max-length="1" placeholder="Received /Not received" required>
											  <br>Photo     <input class="form-control" id="photoRN" autocomplete="off" name="photo" type='text' placeholder="Photo Received /Not received" required>
												</div> -->
												
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>
                                             	</center>
												</fieldset>				

										</form>	
								   
								</div>
				
		</div>
			
			<div class='modal hide fade' id='modal-payslipdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Payslip Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="saveCandidatePayslip" method="post" class="form-horizontal" >
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">	
					
					
					<fieldset>		
							            <center> 
							            
							            <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months1" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip1" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt1" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments1">
													
												</div>	<br>
												 <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months2" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip2" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt2" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments2">
													
												</div>	<br>
												 <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months3" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip3" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt3" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments3">
													
												</div>	<br>
												 <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months4" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip4" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt4" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments4">
													
												</div>	<br>
												 <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months5" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip5" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt5" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments5">
													
												</div>	<br>
												 <div class='col-lg-4' >
		                                      <input class="form-control" id='months' autocomplete="off" name="months6" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='payslip' name="payslip6" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='bankstmt' name="bankstmt6" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="comments" placeholder="Comments" name="comments6">
													
												</div>	<br>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>
                                             	</center>
												</fieldset>				

										<!-- <div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Months</label>
												<div class="col-lg-4">
													<input class="form-control" id='months' autocomplete="off"
														name="months" type='text' required>
												</div>
											</div><br>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span>Payslip</label>
												<div class="col-lg-4">
													<input class="form-control" id='payslip' 
														name="payslip" 
														autocomplete="off"  
														 type='text' required>
													 pattern="\d*"
												</div>
											</div><br>

											

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Bank Statements</label>
												<div class="col-lg-4">
													<input class="form-control" id='bankstmt' name="bankstmt"
														autocomplete="off" title="Enter Only digits" type='text' 
														maxlength="9" pattern="\d*"
														type='text' required>
												</div>
											</div><br>

										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Comments</label>
												<div class="col-lg-4">
													<input type="text" id="comments" name="comments"
														><br>
												</div>
											</div> 
											
													<br>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>-->
										</form>	
								   
								</div>
				

				
				<%-- <input type ="button" value="Save" class="btn btn-success btn-xs" onclick="saveEmployerDetails('${candidateInfo.candidateid}')"> --%>
			<!-- </form> -->
		</div>
		<div class='modal hide fade' id='modal-updatepayslip' tabindex='-1' style="width:60%!important;height:40%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Update Payslip Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="updateCandidatePayslips" method="post" class="form-horizontal" >
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden"
					name="bdname" value="${bdname}"> <input type="hidden"
					name="recname" value="${recname}"> <input type="hidden"
					name="jobid" value="${jobid}"> <input type="hidden"
					name="clientname" value="${clientname}">
					<input type="hidden"
					id="pay_id" name="pay_id">	
					
					
					<fieldset>		
							            <center> 
							            
							             <div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>Month : </label>
									<div class='controls'>
										<input class="form-control" id='ud_months' autocomplete="off" name="months" type='text' placeholder="Month&Year" required>
									</div>
								</div>
								
								<div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>Payslip : </label>
									<div class='controls'>
										 <input class="form-control" id='ud_payslip' name="payslip" autocomplete="off" type='text' placeholder="Payslip" required>
									</div>
								</div>
								
								<div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>Bank Statements : </label>
									<div class='controls'>
										 <input class="form-control" id='ud_bankstmt' name="bankstmt" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
									</div>
								</div>
								<div class='control-group'>
									<label class='control-label' for='validation_jd_status'
										style="color: #191970;"><span style="color: red;"></span>Comments : </label>
									<div class='controls'>
										<input type="text" id="ud_comments" placeholder="Comments" name="comments">
									</div>
								</div>
							            <!-- <div class='col-lg-4' >
		                                      <input class="form-control" id='ud_months' autocomplete="off" name="months" type='text' placeholder="Month&Year" required>
											  <input class="form-control" id='ud_payslip' name="payslip" autocomplete="off" type='text' placeholder="Payslip" required>
											 <input class="form-control" id='ud_bankstmt' name="bankstmt" autocomplete="off"  type='text'	placeholder="Bank Statement" type='text' required>
											 <input type="text" id="ud_comments" placeholder="Comments" name="comments">
													
												</div>	 -->
												
												
												
												<br>
												<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span></label>
												<div class="col-lg-4">
													<input type="submit" class="btn btn-default btn-sm" value="Submit"	style="padding: 7px; background-color: green; color: white; text-transform: INITIAL; line-height: 0.728571;" > 
														<input type="Reset"	class="btn btn-danger btn-sm"	style="padding: 7px; background-color: red; color: white; text-transform: INITIAL; line-height: 0.728571;"value="Reset">
												</div> 
											</div>
                                             	</center>
												</fieldset>	
												
										</form>	
								   
								</div>

		</div>
			<div class='modal hide fade' id='modal-employmentdetails' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Update Employment Details</h3>
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
													<input class="form-control" id='verif_bankstmt' name="bankstmt"
														autocomplete="off" title="Enter Only digits" type='text' 
														
														type='text' >
												</div>
											</div><br>

										<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Latest 6 months Payslips(From Month & Year to Month& Year)	</label>
												<div class="col-lg-4">
													<input class="form-control" id='verif_payslip' name='payslip' autocomplete="off"
														type='text' 
														>
												</div>
											</div><br>

										
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;"></Span>Comments</label>
												<div class="col-lg-4">
													<input type="text" id="verifiercommentsemps_tds" name="comments"
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
								</div>
				

				
				<%-- <input type ="button" value="Save" class="btn btn-success btn-xs" onclick="saveEmployerDetails('${candidateInfo.candidateid}')"> --%>
			<!-- </form> -->
		</div>
		
		<div class='modal hide fade' id='modal-editCourse' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Course Documents</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="editCourse" method="post" class="form-horizontal">
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden" name="bdname" value="${bdname}">
						<input type="hidden" name="recname" value="${recname}"> 
						<input type="hidden" name="jobid" value="${jobid}">
						<input type="hidden" name="clientname" value="${clientname}">
						<input type="hidden" name="course_id" id="course_id">						

										<center><div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Post Graduation </label>
												<div class="col-lg-4">
													<input class="form-control" id='postgraduate' autocomplete="off"
														name="postgraduate"  type='text' required>
												</div>
											</div><br>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Graduation </label>
												<div class="col-lg-4">
													<input class="form-control" id='graduate' autocomplete="off"
														name="graduate"  type='text' required>
												</div>
											</div><br>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Intermediate </label>
												<div class="col-lg-4">
													<input class="form-control" id='intermediate' autocomplete="off"
														name="intermediate"  type='text' required>
												</div>
											</div><br>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> SSC </label>
												<div class="col-lg-4">
													<input class="form-control" id='ssc' autocomplete="off"
														name="ssc"  type='text' required>
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
								</div>
		</div>
		
		<div class='modal hide fade' id='modal-editPerncentage' tabindex='-1' style="width:70%!important;height:91%!important;left:40%;">
		<div class='modal-header' style="max-width: 980px; overflow-y: auto;">
			 <a href="negotiateCandidate?canid=${candidateInfo.candidateid}&bdname=${bdname}&recname=${recname}
			&jobid=${jobid}&clientname=${clientname}" class='close'><font color=blue>&times;</font></a> 
			
		<h3>Percentage Details</h3>
		</div>

		<div class='modal-body' id="jd_assignedto">
			<p>
				<b>CandidateName:</b><span style="color: red">${candidateInfo.first_name} ${candidateInfo.last_name}</span>
			</p>
			
				<form action="editPercentage" method="post" class="form-horizontal">
				<input type="hidden" id="candidateid" name="candidateid" value="${canid}">
						<input type="hidden" name="bdname" value="${bdname}">
						<input type="hidden" name="recname" value="${recname}"> 
						<input type="hidden" name="jobid" value="${jobid}">
						<input type="hidden" name="clientname" value="${clientname}">
						<input type="hidden" name="perc_id" id="perc_id">						

										<center><div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Post Graduation %</label>
												<div class="col-lg-4">
													<input class="form-control" id='postgraduateperc' autocomplete="off"
														name="postgraduateperc"  type='text' required>
												</div>
											</div><br>

											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Graduation %</label>
												<div class="col-lg-4">
													<input class="form-control" id='graduateperc' autocomplete="off"
														name="graduateperc"  type='text' required>
												</div>
											</div><br>
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> Intermediate %</label>
												<div class="col-lg-4">
													<input class="form-control" id='intermediateperc' autocomplete="off"
														name="intermediateperc"  type='text' required>
												</div>
											</div><br>
											
											<div class="form-group row">
												<label for="inputPassword" class="col-lg-4 control-label"><Span
													style="color: red;">*</Span> SSC %</label>
												<div class="col-lg-4">
													<input class="form-control" id='sscperc' autocomplete="off"
														name="sscperc"  type='text' required>
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
								<c:when test="${documentCountbycandidateid gt 0 }">
								<a class='btn btn-default btn-xs' data-toggle='modal'
																href='#modal-viewDocs'
																onclick="viewDocuments('${candidateInfo.candidateid}','${bdname}','${recname}','${clientname}','${jobid}','${role}')">
																<i class="icon-view"><strong>View Documents</strong></i>
															</a>
								</c:when>
								<c:otherwise>
								 <span data-toggle="tooltip" title="No documents to view">
								<button class='btn btn-default btn-xs' disabled>
									<i class="icon-view"><strong>View Documents</strong></i></button>
									</span>								
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
	</div>

	<div class='row-fluid' id='content-wrapper'>
		<div class='span12'>
			<div class='row-fluid' style="margin-top: -56px;">
				<div class='span12 box'>
					<div class='box-header orange-background' style="line-height: 5px;">
						<div class='title-head'>
							    <Strong style="color: #000080;padding-left:35%;">Doc Verification Comments</Strong>
						</div>
					</div>
				</div>
			</div>
			<div class='container-fluid'>
				<div class='row-fluid'>
				<div class='span12'>
						
								<div class='row-fluid' style="margin-bottom: 10px;">
							<div class='span12 box'>
				<c:choose>
												<c:when test="${canStatus.doc_verify_status=='Approved' ||canStatus.doc_verify_status=='ApprovedByManagement'}"></c:when>
												<c:otherwise>
					<div class="span6">
					
								<!-- <form id="ajaxForm" action="negotiationComments" enctype='multipart/form-data'> -->
								<form action="DocVerifierComments" enctype='multipart/form-data' method="POST">
								
									
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
											
											
											
											
											<!-- <input type="submit" class="btn btn-success btn-xs"
												value="Save Comment" style="background: #0b3c7c"> -->
										</div>
									</center>

								</form>
								</div>
								</c:otherwise>
											</c:choose>
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
															
															<td style="text-align: start;"><p
																	style="white-space: pre-wrap; word-wrap: break-word; height: 80px; overflow-y: scroll;">${viewcom.updateDate}</p></td>

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
	<div class="container-fluid" id="divScroll">
		<div class="row-fluid">
			<div class="span12">
			<div class="status-clint" style="margin-top: -3%;padding-left: 17%;margin-bottom: 3%;">
			<span style="color:white;"><c:out value="${role}">${role}</c:out> </span>
			<form class='form form-horizontal validate-form' style='margin-bottom: 0;' action="/"  id="userForm">
	      
	               <input type="hidden" name="candidate_id" id="candidate_id" value="${candidateInfo.candidateid}" >
				   <input type="hidden" name="bdname" id="bdname"  value="${bdname}"> 
				   <input type="hidden" name="recname" id="recname"  value="${recname}"> 
				   <input type="hidden" name="clientname" id="clientname" value="${clientname}" >
				   <input type="hidden" name="jobid" id="jobid" value="${jobid}">
				   <input type="hidden" name="candidatename" value="${candidateInfo.first_name}">
	      							 <center> 
	      							 <c:if test="${not empty canStatus.doc_verify_status}">
	      							 <div class='form-group'><b>Documents Status:</b> <span style="color:red;"> 
	      							 ${canStatus.doc_verify_status} </span><br>
	      							    <c:if test="${not empty canStatus.doc_verify_mgmt_filename}">
										<b>File 1:</b>
										<u><b><a href='preObtFiledownload?candidateid=${candidateInfo.candidateid}&&filename=${canStatus.doc_verify_mgmt_filename}&&fileType=docmail'>
										<font style="color:blue;">${canStatus.doc_verify_mgmt_filename}</font></a></b></u>
										<br>
										</c:if>
										<c:if test="${not empty canStatus.doc_verify_mgmt_filename2}">
										<b>File 2:</b>
										<u><b><a href='preObtFiledownload?candidateid=${candidateInfo.candidateid}&&filename=${canStatus.doc_verify_mgmt_filename2}&&fileType=docmail'>
										<font style="color:blue;">${canStatus.doc_verify_mgmt_filename2}</font></a></b></u>
										</c:if>
										
										</div>
									</c:if>
									 <br>
	 							  <div class='form-group'>											
											<b>Choose Status</b>&nbsp;&nbsp;
											<select id="status"
												name='status' onchange="statusByApproved()"
												style="width: 200px; height: 35px;"
												class="form-control text-center" required>
												<option value="">-- Select Status --</option>
												<c:forEach var="status" items="${statusenumList}">
											             <option value="${status}" ${status == canStatus.doc_verify_status ? 'selected="selected"' : ''}>${status.getName()}</option>
												</c:forEach>
											</select>
											</div>
											
											<div class='form-group' id='details' style="display:none;">											
											<input type="file" id="file" name="prefile" accept=".msg"
												onchange="checkFileType(this)" size="50" required
													style="text-align: center;" accept=".msg"/>
											</div>
											<div class='form-group' id='details2' style="display:none;">											
											<input type="file" id="file2" name="prefile2" accept=".msg"
												onchange="checkFileType(this)" size="50"
													style="text-align: center;" accept=".msg"/>
											</div>
											</center>
				
				<br>
				
				<div class="form-group" id="btn-custm">
					<div class="col-lg-2">
						<center>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
							<c:choose>
												<c:when test="${canStatus.doc_verify_status=='Approved' ||canStatus.doc_verify_status=='ApprovedByManagement'}"></c:when>
												<c:otherwise>
											<c:choose>
								<c:when test="${documentCountbycandidateid gt 0 }">
								<input type="button" class="btn btn-success btn-xs" onclick="saveStatus('${role}')"
									value="Save Status" style="background: #0b3c7c" >
								</c:when>
								<c:otherwise>
								 <span data-toggle="tooltip" title="You can't update it because no documents uploaded">
								<input type="button" class="btn btn-success btn-xs" disabled 
									value="Save Status" style="background: #0b3c7c" ></span>
								</c:otherwise>
								</c:choose>
											</c:otherwise>
											</c:choose>
								
							   <input type="button" style="background: #0b3c7c" class="btn btn-success btn-xs" onclick="goBack()" value="Back"> 
						</center>
					</div>
				</div>
			</form>
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
					    <th>File ID</th>
						<th>File Type</th>
						<th>File Name</th>
						<th>Status</th>
						<th>Comments</th>
						<th>Action</th>
					</tr>
					<tbody id="candidatedocs">
                  
					</tbody>
				</table>
			</form>
		</div>
  </div>
</section>
<script	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$('#sampleTable').DataTable();
</script>
<script type="text/javascript">
	$('#sampletable2').DataTable();
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
		/* 	if(role=='HRUSER'){ */
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
							
							tr=tr+	"<td><input type='textarea' rows='4' column='30' id='comments_ver" +  list1[i].tbl_pk + "' value='"+comments+"' name='comments' readonly><span style='color:red'>*</span></td>"+
				"<td><input type='button' name='submit' id='verify_submit"+ list1[i].tbl_pk +"' value='Submit' style='background: #0b3c7c' class='btn btn-success btn-xs' onclick='verifysubmit("+ list1[i].tbl_pk +")'></td></tr>";	

	$('#candidatedocs').append(tr);
		$("#verify_submit"+list1[i].tbl_pk).attr("disabled", true);
							
				}
		/* 	}else{
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
			  } */
			
			
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
		//var length = file.files.length;
		if (filename.endsWith(".msg")) {
			/* if(length>2){
				alert("You can max select only 2 files");
				$(file).val('');
			}else{
				
			} */
		} else {
			alert("accept .msg files only");
			$(file).val('');

		}
	}
</script>
<script>
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
		 $('#details,#details2').show();
	       }
	else{
		$('#details,#details2').hide();
		document.getElementById('file').removeAttribute('required'); 
	}
}

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

function saveStatus(role){
	if(role=='HRUSER'){
		var statusid=$('#status').val();
		var file=$('#file').val();
		if(statusid!=""){
			if(statusid=="ApprovedByManagement"){
				 if(file!=""){
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
				 }else{
					 $('#file').focus();
				 }
			}else{
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
		//$("#submitid").attr("disabled",true);
		}else{
			 //alert("Please select status");
			 $('#status').focus();
		 }
	}
}

function goBack(){
	window.location.href="candidatelist";
}
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
	var verifiercommentsemp_td=$('#verifiercommentsemp_td'+id).html();
	var payslipstenure_td=$('#payslipstenure_td'+id).html();
	
	$('#appointmentletter').val(appointmenttenure_td);$('#relievingletter').val(relievetenure_td);
	$('#verif_bankstmt').val(bankstmtstenure_td);
	$('#verifiercommentsemps_tds').val(verifiercommentsemp_td);
	$('#verif_payslip').val(payslipstenure_td);
	
	$("#modal-employmentdetails").show();
	
}

function editCourse(pg,degree,inter,ssc,id){
	$('#course_id').val(id);
	$('#postgraduate').val(pg);
	$('#graduate').val(degree);
	$('#intermediate').val(inter);
	$('#ssc').val(ssc);
	$("#modal-editCourse").show();
	
}
function editPercentage(pg,degree,inter,ssc,id){
	$('#perc_id').val(id);
	$('#postgraduateperc').val(pg);
	$('#graduateperc').val(degree);
	$('#intermediateperc').val(inter);
	$('#sscperc').val(ssc);
	$("#modal-editPerncentage").show();
	
}

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
function editEducation(id){
	var pgtd= $("#pgtd"+id).html();		
	var detd= $("#detd"+id).html();
	var intd= $("#intd"+id).html();	    
	var ssctd= $("#ssctd"+id).html();
	var pgperctd= $("#pgperctd"+id).html();	
	var dgperctd= $("#dgperctd"+id).html();
	var inperctd= $("#inperctd"+id).html();	
	var sscperctd= $("#sscperctd"+id).html();
	
	 $("#pgtds").val(pgtd);		
	 $("#detds").val(detd);
	 $("#intds").val(intd);	   
	 $("#ssctds").val(ssctd);
	 $("#pgperctds").val(pgperctd);	
	 $("#dgperctds").val(dgperctd);
	 $("#inperctds").val(inperctd);	
	 $("#sscperctds").val(sscperctd);
	
	$("#modal-editeducationdetails").show();
}

function editPersonal(){
	var id= $("#personalid").val();
	var idprooftd= $("#idprooftd"+id).html();
	var idPRtd= $("#idPRtd"+id).html();
	var addprooftd= $("#addprooftd"+id).html();
	var addPRtd= $("#addPRtd"+id).html();
	var phototd= $("#phototd"+id).html();
	 $("#idproof").val(idprooftd); 
	 $("#idproofRN").val(idPRtd);
	 $("#addressproof").val(addprooftd); 
	 $("#addressproofRN").val(addPRtd); 
	 $("#photoRN").val(phototd);
	 $("#pers_id").val(id);
	
}
function editPayslip(id){
	    
	var month_td= $("#month_td"+id).html();
	var payslip_td= $("#payslip_td"+id).html();
	var bank_td= $("#bank_td"+id).html();
	var comm_td= $("#comm_td"+id).html();
	//ud_months ud_payslip ud_bankstmt  ud_comments
	 $("#ud_months").val(month_td); 
	 $("#ud_payslip").val(payslip_td);
	 $("#ud_bankstmt").val(bank_td); 
	 $("#ud_comments").val(comm_td); 
	 $("#pay_id").val(id);
	 
	
}



</script>
</body>
</html>