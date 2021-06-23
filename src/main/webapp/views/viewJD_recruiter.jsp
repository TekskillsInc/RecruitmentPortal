
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{
	color: red;
}

.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}
</style>

<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css"
	href="resources/assets/stylesheets/formValidation.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/stylesheets/formValidation.min.css">
	


	
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

.pagination a:hover:not (.active ) {
	background-color: cyan;
}
</style>
<!-- <style>
.ScrollStyle
{
    height: 1000px;
    overflow-y: scroll;
}
</style>  -->
<section id='content'>
<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'
			style="margin-top: -250px;">
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">
	                    <div class='box-header orange-background'
							style="line-height: 20px;">
							

							<div class='title' style="line: width:50px;">

								<center><Strong style="color: #000080; font-size: 25px;">View Requirements</Strong></center>
							</div>

						</div>
						
					
				<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
											
					<form action="getSearchView" method="GET">
						<fieldset>		
						<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>		
							           
							             <div class='col-lg-4' >
		                                      <select id="dynamic_select" name='clientname' style="width:200px;height:35px;" class="form-control text-center"> 
													<option value="">-- Select Client --</option>
													<c:forEach var="cname" items="${clients}"> 
														<option value="${cname.cmpny_id}">${cname.cmpny_name}</option>
														 </c:forEach> 
													 	    	
														</select>
													
												
														 <select id="dynamic_select" name='bdname' style="width:200px;height:35px;margin-left:60px;"> 
													<option value="">-- Select BDM --</option>
													
													<c:forEach var="bd" items="${bdList}"> 
														<option value="${bd.emp_number}">${bd.userName}</option>
														 </c:forEach> 
														</select>
													<button class="btn btn-primary icon-btn custom-resp-btn" type="submit" id="mysubmit" value="search" style="background:#0b3c7c;width:200px;height:34px;margin-left:60px;position: relative;    bottom: 3px;"> <strong><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong></button>
											 <!-- <input type="submit" value="search"  style="background:#0b3c7c;width:200px;height:30px;" > -->
												</div>
                                             	
												</fieldset>
                                             </form>
                                             
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<div class="pagination" >
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
						<tr>
						<th style='text-align: center; color: #000080;'>Job Id</th>
						<th style='text-align: center; color: #000080;'>Created	Date</th>
						<th style='text-align: center; color: #000080;'>Client	Name</th>
						<th style='text-align: center; color: #000080;'>BDM	Name</th>
						<th style='text-align: center; color: #000080;'>Job	Description</th>
						<th style='text-align: center; color:#000080;'>Job Category</th>
						<th style='text-align: center; color: #000080;'>JD	Download</th>
						<th style='text-align: center; color: #000080;'>Assigned TL</th>
						<th style='text-align: center; color: #000080;'>Source Profile</th>	
						<th style='text-align: center; color: #000080;'>View Profiles</th>
						<th style='text-align: center; color: #000080;'>Job	Priority</th>
						<th style='text-align: center; color: #000080;'>Allocated Budget</th>
						<th style='text-align: center; color: #000080;'>Status</th>
						
						<th style='text-align: center; color: #000080;'>Job	label</th>
						<th style='text-align: center; color: #000080;'>Job	Code</th>
						<th style='text-align: center; color: #000080;'>TechPanel	Availability</th>
						<th style='text-align: center; color: #000080;'>profiles@TP	Scheduled</th>
						<th style='text-align: center; color: #000080;'>Client	Availability</th>
						<th style='text-align: center; color: #000080;'>profiles@Client	Scheduled</th>
							

						</tr>
											</thead>
											<tbody>
												<c:forEach var="jdlist" items="${jobdescList}">
													<tr>
													<td>${jdlist.jobDescId}</td>
													<td>${jdlist.createddate}</td>
													<td>${jdlist.client}</td>
													<td>${jdlist.bdName}</td>
													<td><c:choose>
																
																	<c:when test="${fn:length(jdlist.jobdescription) >= 20}">
																	<div class='text-center'>
																		<a class='btn btn-default btn-small'
																			data-toggle='modal' href='#modal-JD'
																			onclick="showJobDesc( '${jdlist.jobDescId}')">
																			${fn:substring(jdlist.jobdescription, 0, 20)}... </a>
																	</div>
																</c:when>
																<c:otherwise>
                                                                         ${jdlist.jobdescription}
                                                                    </c:otherwise>
															</c:choose></td>
															<td><strong><font color=blue>${jdlist.jdCategory}</font></strong></td>
															
														<td>
															<div class='text-center'>
																<a class='fa fa-download' data-toggle='modal' href=''
																	onclick="doMultipleActionDownload('${jdlist.jobDescId}','${jdlist.jobCode}')">
																	<i class='icon-download' title="Download this document"
																	style="color: darkblue;"></i>
																</a>
															</div>
														</td>
														<td>${jdlist.assignedTL}</td>
															<td><c:choose>
																<c:when test="${jdlist.empStatus == 'InActive'}">

																	<div class='text-center'>
																		<a class='btn btn-default btn-xs' data-toggle='modal'
																			
																			href='#modal-example3'> <i class='icon-info'
																			style="color: red"></i>
																		</a>
																	</div>
																</c:when>

																<c:otherwise>
																	<div class='text-center'>
																		<a class='btn btn-default btn-xs' data-toggle='modal'
																			onclick="saveCandidate('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}')"
																			href='#modal-example2'> <i class='icon-user'
																			style="color: green"></i>
																		</a>
																	</div>
																</c:otherwise>
															</c:choose></td>
														<td><div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	onclick="viewprofileBdm('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}','${jdlist.bdName}')">
																	<i class='icon-group' style="color: orange;"></i>
																</a>
															</div></td>
															<td>${jdlist.priority}</td>
														 <td>${jdlist.allocatedbudget}</td>
														<td class="bg-warning text-dark">${jdlist.jobstatus}
														</td><td>${jdlist.lable}</td>
															<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-viewJdstatus'
															onclick="viewJd('${jdlist.jobDescId}')">
															${fn:substring(jdlist.jobCode, 0, 20)}..
															</a></td>
													


														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-TPAvailability'
															onclick="TP_Availability('${jdlist.jobDescId}')">
																<i class="icon-calendar" style="color: darkgreen;"></i>
														</a></td>

														<td><a class='btn btn-default btn-xs'
															href='#modal-JDsprofiles' data-toggle='modal'
															onclick="viewprofileTPScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: purple;"></i>
														</a></td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-ClientAvailability'
															onclick="client_availability('${jdlist.jobDescId}')"><i
																class='icon-calendar' style="color: violet;"></i></a></td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-JDsprofiles'
															onclick="viewprofileClientScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: darkblue;"></i>
														</a></td>
														
														
													
														
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>


								<div class='modal hide fade' id='modal-JD'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>JOB DESCRIPTION</h3>
									</div>
									<div class='modal-body' style="text-align: justify;">
										<p id="retrivejobDescription"></p>
									</div>
								</div>
								<div class='modal hide fade' id='modal-viewJdstatus'
									tabindex='-1'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>View Jd Status</h3>
									</div>
									<span id="sample"></span>
									<div class='modal-body' id=jd_edit_assigns>
										<form class='form form-horizontal validate-form'
											style='margin-bottom: 0;' action="" method="post">


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
								

								<div class='modal hide fade' id='modal-TPAvailability'
									tabindex='-1'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>View Technical Panel Availability</h3>
									</div>

									<div class='modal-body' id=jd_client_Interview>
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
																		<th style='text-align: center;'>Interviewer Name</th>
																		<th style='text-align: center;'>Available Time</th>
																		<th style='text-align: center;'>Mode Of Interview</th>
																	</tr>
																</thead>
																<tbody id="interview_details">
																</tbody>

															</table>
														</div>
													</div>
												</div>

											</div>
										</div>

									</div>
								</div>

								<div class='modal hide fade' id='modal-ClientAvailability'
									tabindex='-1'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>Client Availability</h3>
									</div>
									<span id="sample"></span>
									<div class='modal-body' id=jd_client_Interview>
										<form class='form form-horizontal validate-form'
											style='margin-bottom: 0;' action="#" method="post">


											<div class='row'>
												<div class='span12'>

													<div class='modal-header'></div>

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
																			<th style='text-align: center; color: #000080;'>Available
																				Date</th>
																			<th style='text-align: center; color: #000080;'>Available
																				Time</th>
																				<th style='text-align: center; color: #000080;'>Available
																				Time To</th>
																			<th style='text-align: center; color: #000080;'>Mode
																				Of Interview</th>
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
										</form>
									</div>
								</div>
								<div class='modal hide fade' id='modal-JDsprofiles' style="width:780px;height:500px;overflow-y:scroll"
										tabindex='-1'>
										
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>Scheduled Profiles</h3>
									</div>
									<!-- <div class="ScrollStyle"> -->
									<div class='modal-body'>
								
										<table id="interviewtable"
											class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;border-left:1px solid #dddddd;'>
											<thead>
												<tr>
													<th style='text-align: center; color: #000080;'>Candidate
														Name</th>
													<th style='text-align: center; color: #000080;'>Phone
														Number</th>
													<th style='text-align: center; color: #000080;'>Technology</th>
													<th style='text-align: center; color: #000080;'>Years
														Of experience</th>
													<th style='text-align: center; color: #000080;'>Mode
														of Interview</th>
													<th style='text-align: center; color: #000080;'>Interview
														Time</th>
												</tr>
											</thead>
											<tbody id="interviewrow">
											</tbody>
										</table>
									</div>

								</div>
								<div class='modal hide fade' id='modal-example3'
									tabindex='-1'>
										<div class='modal-header' style="border-bottom: transparent;">
										<button class='close' data-dismiss='modal' id="closemodel"
											type='button'>&times;</button>
											<h3>
											 Source Profile
										</h3>
										
									</div>
									<div class='modal-body'>
									<h3>
											 <span Style="color:red">You don't have access to source profile as you are un-assigned to this Requirement</span>
										</h3>
									</div>

								</div>

						

								<div class='modal hide fade' id='modal-example2' tabindex='-1'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' id="closemodel"
											type='button'>&times;</button>
										<h3>
											<i class="icon-user "></i> CANDIDATES INFORMATION
										</h3>
									</div>
									<div class='modal-body'>
										<div class='row'>
											<div class='col-sm-12'>
												<div class='box'>
													<div class='box-padding'>
														<form class="form-horizontal" style="margin-bottom: 0;"
															id="myform" method="post" action="storeCandidateInfo" onsubmit="return checkForm1(this);"
															enctype="multipart/form-data">
															<div class='step-content'>

																<div class='row'>
																	<div class='span12'>

																		<input type="hidden" name="jobDescId" id="jobDescId" />
																		<div class='control-group'>
																			<label>Job ID</label>
																			<div>
																				
																				<input class='span12' id='clientName_Req' name='clientName_Req'
																					type='text' readonly>
																				<input class='span12' id='jobCode' name='jobCode'
																					type='text' readonly>
																				<p class='help-block'></p>
																			</div>
																		</div>
																		<div class='form-group'
																			style="white-space: normal;padding-bottom:5px">
																			<label>Job Mandatory
																				Skills </label>
																			
																		<div>	
																		<textarea id="skillrow" class='span12'  rows="5" cols="50" style="padding-bottom:5px"></textarea>
																		</div>
																			
																				
																			
																		</div>
																		<c:choose>
																			<c:when test="${departmentId == 5}">

																				<div class="form-group">
																					<label for='panval'>EAC Number</label>
																					<div>
																						<input class='span12'
																							pattern="[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}"
																							data-rule-required='true' id='panID'
																							class="form-control" data-rule-minlength='2'
																							data-rule-maxlength='20' name='panID' type='text'
																							placeholder="EAC Number" onchange="checkPanExists()">
																						<p class='help-block'></p>
																					</div>
																				</div>
																				<div class="form-group">
																					<label for='h1bstart'>H1B Start Date </label>
																					<div>
																						<div id="datetimepicker2" class="input-append">
																							<input class='span12' data-rule-required='true'
																								data-format='yyyy-MM-dd' id='h1bstart'
																								name='h1bstart'
																								placeholder='Select H1B Start Date (YYYY-MM-DD)'
																								type='text'> <span class='add-on'>
																								<i data-date-icon='icon-calendar'></i>
																							</span>
																						</div>
																					</div>
																				</div>
																				<div class="form-group">
																					<label for='h1bend'>H1B End Date</label>
																					<div>
																						<div id="datetimepicker2" class="input-append">
																							<input class='span12' data-rule-required='true'
																								data-format='yyyy-MM-dd' id='h1bend'
																								name='h1bend'
																								placeholder='Select H1B End Date (YYYY-MM-DD)'
																								type='text'> <span class='add-on'>
																								<i data-date-icon='icon-calendar'></i>
																							</span>
																						</div>
																					</div>
																				</div>
																			</c:when>

																			<c:otherwise>

																				<div class='form-group'>
																					<label for='panID'>PAN Number</label>
																					<div>
																						<input class='span12'
																							pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}"
																							data-rule-required='true' id='panID' onchange="checkPanExists()"
																							class="form-control" maxlength='10' name='panID'
																							type='text' placeholder="PAN Number" >
																							 <span id="panshow"
																							style="color: red;"></span>
																						<p class='help-block'></p>
																					</div>
																				</div>


																			</c:otherwise>
																		</c:choose>
																		<div class='form-group'>
																			<label for='txtFirstName'>First Name <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' id='txtFirstName'
																					name='txtFirstName' type='text' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					placeholder="First name" data-rule-required='true'
																					required>
																				<p class='help-block'></p>
																			</div>
																		</div>
																		
																	 	<div class='form-group'>
																			<label for='Middle-name'>Middle Name </label>
																			<div>
																				<input class='span12'
																					pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					data-rule-required='false' data-rule-maxlength='20'
																					id='txtMiddleName' name='txtMiddleName' type='text'
																					placeholder="Middle name">
																				<p class='help-block'></p>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='Last-name'>Last Name <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' id='txtLastName'
																					name='txtLastName' type='text' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					placeholder="Last name" required>
																				<p class='help-block'></p>
																			</div>
																		</div>


																		<div class='form-group'>
																			<label for='email'>Email ID <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' data-rule-email='true'
																					data-rule-required='true' type='email' id='email'
																					name='email' placeholder="Email ID"  pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" 
																					onchange="checkEmail()" required>
																					 <span id="emailshow" style="color: green;"></span>
																					  <span id="showgreen" style="color: red;"></span>
																					 
																				<p class='help-block'></p>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='Number'>Contact Number <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' minlength='10' maxlength='13' id='phnNumber'
																					name='phnNumber' pattern='\d*' type='text'
																					placeholder="Contact Number"
																					data-rule-required='true' onchange="checkContact()"
																					required> 
																					<span id="phoneshow" style="color: green;"></span>
																					<span id="phoneshowgreen" style="color: red;"></span>
																				<p class='help-block'></p>
																			</div>
																			
																		</div>
																		<div class='form-group'>
																			<label for='altNumber'>Alt Contact Number</label>
																			<div>
																				<input class='span12' minlength='10' maxlength='13'
																					data-rule-required='false' pattern='\d*'
																					id='altNumber' name='altNumber' type='text'
																					placeholder='Alt Contact Number'>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='skype'>Skype Id</label>
																			<div>
																				<input class='span12' 
																					data-rule-required='false' 
																					id='skypeid' name='skypeid' type='text'
																					placeholder='Skype Id'>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='skype'>Candidate Native Location</label>
																			<div>
																				<input class='span12' 
																					data-rule-required='false'  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					id='txtNlocation' name='txtNlocation' type='text'
																					placeholder='Naitve Location'>
																			</div>
																		</div>

																		<div class='form-group'>
																			<label for='date'>Date of Birth (MM-DD-YYY)<span style="color:red">(*)</span>
																			</label>
																			<div>
																				<div id="datetimepicker2" class="input-append">
																					<input class='span12' id='dob' name='dob'
																						placeholder='Select Date of Birth (MM-DD-YYYY)'
																						type='text' required> <span class='add-on'>
																						<i data-date-icon='icon-calendar'></i>
																					</span>
																				</div>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='basic_qualification'>Basic
																				Qualification <span style="color:red">(*)</span></label>
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
																		<div class='form-group'>
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
																					<option value="B.Tech/B.E." label="B.Tech/B.E.">B.Tech/B.E.</option>
																					<option value="M.A" label="M.A">M.A</option>
																					<option value="M.Arch" label="M.Arch">M.Arch</option>
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
																		<div class='form-group'>
																			<label for='ssc'>SSC %</label>
																			<div>
																				<input class='span12' data-rule-required='true'
																					min="1" max="99" id='sscPerc' name='sscPerc'
																					data-rule-maxlength='4' type='number'
																					placeholder="SSC">
																			</div>
																		</div>
																		<div class='form-group'>
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

																		<div class='form-group'>
																			<label for='validate_graduation'>Graduation %
																			</label>
																			<div>
																				<input class='span12' data-rule-required='true'
																					min="1" max="99" id='ugPerc' name='ugPerc'
																					type='number' placeholder="Graduation">
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='validate_postGraduation'>Post
																				Graduation % </label>
																			<div>
																				<input class='span12' data-rule-required='false'
																					min="1" max="99" id='pgPerc' name='pgPerc'
																					type='number' placeholder="Post Graduation">
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='skill_ID'>Primary Skill <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12'
																					data-rule-maxlength='20' data-rule-required='true'
																					id='priSkill' name='priSkill' type='text'
																					placeholder="Primary Skill" required>

																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='skill_SID'>Secondary Skill <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' id='secSkill' name='secSkill'
																					type='text' placeholder="Secondary Skill" required>

																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='validate_desg'>Candidate
																				Designation <span style="color:red">(*)</span></label>
																			<div>
																				<input class='span12' id='candidatedesg'
																					name='candidatedesg' type='text'  
																					placeholder="Candidate Designation" required>
																					<!--  pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"-->
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='noticePeriod'>Notice Period <span style="color: red">(*)</span></label>
																				 <a	href='#modal-editCompDetails' data-toggle='modal'
																				style="float: inherit; color: blue;"> Check
																				Company Notice Period </a>
																			<div>
																				<select name="noticePeriod"
																					data-rule-required='true' id="noticePeriod"
																					class='span12' required>
																					<option value="">Select Notice Period</option>
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
																			<label for='location'>Minimum Time Required To Join <span style="color: red">(*)</span></label>
																			<div>
																				<input class='span12' id='min_timereq_join' name='min_timereq_join'  pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																					type='text' placeholder="Time Required to Join" required>
																			</div>
																		</div>
																		
																		<div class='form-group'>
																			<label for='experience'>Total Experience <span style="color: red">(*)</span></label>
																			<div>
																				<input class='span12' id='totalExp' name='totalExp' pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																					type='text' placeholder="Total Experience" required>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='revalent'>Relevant Experience <span style="color: red">(*)</span></label>
																			<div>
																				<input class='span12' id='revalentExp'
																					name='revalentExp' type='text' pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$"
																					placeholder="Relevant Experience" required>
																				<span style="color: red">Relevant Experience
																					should less than total Experience</span>
																			</div>
																		</div>
																		<div class='form-group'>
																			<label for='location'>Work Location <span style="color: red">(*)</span></label>
																			<div>
																				<input class='span12' id='location' name='location'  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					type='text' placeholder="work location" required>
																			</div>
																		</div>
																																				
																		<div class='form-group'>
																			<label for='comp'>Current Organization <span style="color: red">(*)</span></label>
																			<div>
																				<input class='span12' id='currentOrg' 
																					name='currentOrg' type='text'  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																					placeholder="Current Organization" required>
																			</div>
																		</div>
																		<div class='control-group'>
																			<label for='date'>Date of Joining<span style="color: red">(*)</span>
																				</label>
																			<div>
																				<div id="datetimepicker3" class="input-append">
																					<input class='span12' data-rule-required='true'
																						 id='doj' name='doj'
																						placeholder='Select Date of Joining (YYYY-MM-DD)'
																						type='text' required> <span class='add-on'>
																						<i data-date-icon='icon-calendar' required></i>
																					</span>
																				</div>
																			</div>
																		</div>
																		<div class='control-group'>
																			<label for='txtRMgrname'>Reporting Manager name<span
																				style="color:red">(*)</span></label>
																			<div>
																				<input class='span12'
																					 pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" id='txtRMgrname'
																					data-rule-maxlength='25' name='txtRMgrname'
																					type='text' placeholder="Reporting Manager name"
																					data-rule-required='true' required>
																				<p class='help-block'></p>
																			</div>
																		</div>

																		<div class='control-group'>
																			<label for='offemail'>Official Email ID<span
																				style="color:red">(*)</span> </label>
																			<div>
																				<input class='span12' data-rule-email='true'
																					data-rule-required='true' type='email' id='offemail'
																					name='offemail'
																					 pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,63}$" 
																					placeholder="Official Email ID" required> <span
																					id="emailshow" style="color: red;" ></span>
																				<p class='help-block'></p>
																			</div>
																		</div>


																	</div>
																</div>
																<div class='control-group'>
																	<label for='curctc'>Current CTC <span
																		style="color:red">(*)</span></label>
																	<div>
																		<input class='span12' data-rule-required='true'
																			min="1" max="9999999" id='currentctc' 
																			data-rule-maxlength='10' name='currentctc'
																			type='number' placeholder="Current CTC" required>
																	</div>
																</div>
																<div class='control-group'>
																	<label for='expctc'>Expected CTC <span
																		style="color:red">(*)</span></label>
																	<div>
																		<input class='span12' data-rule-required='true'
																			min="1" max="9999999" id='expectedctc'  
																			name='expectedctc' data-rule-maxlength='10'
																			type='number' placeholder="Expected CTC" required>
																	</div>
																</div>
																<div class='control-group'>
																	<label for='npn'>Notice Period Negotiable?<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select data-rule-required='true' class='span12' id='npn'
																			name='npn' onchange="NPNegotiable()" required>
																			<option value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div> 
																<div id="npn_r" style="display: none">
																	<label for="bname">Reason<span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="npn_reason" type="text"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																		    placeholder="Reason"
																			name="npn_reason">
																	</div>
																	</div>
																<div class='control-group'>
																	<label for='work'>Interested to work on
																		payroll of Tekskills in the client place<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select data-rule-required='true' class='span12' id='work_on_tek_payroll'
																			name='work_on_tek_payroll' required>
																			<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>


																<div class='control-group'>
																	<label for='curr_work'>Current Working as permanent / contract
																		Employee<span
																				style="color:red">(*)</span></label><span style="color: red"></span>
																	<div>
																		<select  class='span12' onchange="checkperm()"
																			id='curr_work_isPerm' name='curr_work_isPerm' required>
																			<option value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>
																<!-- onclick = "ShowHideDiv()" --> 

																<div id="iscontract" style="display: none">
																	<label for="Cname">Payroll Company<span	style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="curcompname" type="text"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																			placeholder="Company Name" name="curcompname" >
																	</div>
																	<label for="Duration">Duration(in Year & Months) <span	style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="duration" type="text" pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																			placeholder="Duration" name="duration" >
																	   <span style="color: red">Enter the Year and Months i.e 1 year and 2 months</span>
																	</div>
																</div>

																<div class='control-group'>
																	<label for='prvious_comp_name'>Have any Previous organization/client name<span
																				style="color: red">(*)</span></label><span style="color:red"></span>
																	<div>
																		<select  class='span12' id='prvcname' onchange="checkPvsCmpny()" name='prvcname' required>
																				<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>
																
																
																<div id="pvscmpny" style="display: none">
																<div class='control-group'>
																	<label for='date'>Start Date <span	style="color:red">(*)</span></label>
																		<div id="datetimepicker4" class="input-append">
																			<input class='span12'
																				 id='std' name='std'
																				placeholder='Select Start Date (YYYY-MM-DD)'
																				type='text' > <span class='add-on'>
																				<i data-date-icon='icon-calendar'></i>
																			</span>
																		</div>
																</div>

																<div class='control-group'>
																	<label for='date'>Relieved Date (YYYY-MM-DD) <span	style="color:red">(*)</span></label>																	
																		<div id="datetimepicker5" class="input-append" >
																			<input class='span12' 
																				 id='Rld' name='Rld'
																				placeholder='Select Relived Date (YYYY-MM-DD)'
																				type='text' > <span class='add-on'>
																				<i data-date-icon='icon-calendar'></i>
																			</span>
																		</div>
																</div>
														</div>

																<div class='control-group'>
																	<label for='Bank_statements'>Latest 6 Months Bank
																		statements<span	style="color:red">(*)</span></label>
																	<div>
																		<select  class='span12'
																			id='ltbnkstmt' name='ltbnkstmt' onchange="checkLatestBankStmt()" required>
																				<option value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>

																<div id="depdltbnkstmt" style="display: none">
																	<label for="bname">Name of Bank <span	style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="bankname" type="text"
																			pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" placeholder="Bank Name"
																			name="bankname">
																	</div>
																	<label for="bLocation">Location <span	style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="bLocation" type="text"
																			pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" placeholder="Location"
																			name="bLocation" >
																	</div>
																</div>

																<div class='control-group'>
																	<label for='expctc'>Having all companies
																		documents (offer and relieving letters)<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select  class='span12' id='hav_all_doc'
																			name='hav_all_doc' required>
																				<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>
																
																<div class='control-group'>
																	<label for='reason_for_reloc'>Reason for relocation<span
																				style="color:red">(*)</span></label>
																	<div>
																		<input class='span12' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																			 data-rule-maxlength='25'
																			id='reason_reloc' name='reason_reloc' type='text'
																			placeholder="Reason for relocation" required>
																	</div>
																</div>

																
																<div class='control-group'>
																	<label for='reason_job_change'>Reason for job change<span
																				style="color:red">(*)</span> </label>
																	<div>
																		<input class='span12' pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$"
																			 data-rule-maxlength='25'
																			id='reason_job_change' name='reason_job_change' type='text'
																			placeholder="Reason for job change" required>
																	</div>
																</div>



																<div class='control-group'>
																	<label for='any_inerview'>Any interviews are in
																		pipeline<span style="color:red">(*)</span>
																				</label>
																	<div>
																		<select class='span12' id='any_intervw'
																			name='any_intervw' onchange="interPipe()" required>
																			<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>
																
																
																<div id="anyInterviewpipeline" style="display: none">
																	<label for="cname">Interview With(Company<span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="com_name" type="text"
																			pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" placeholder="company Name"  
																			name="com_name">
																	</div>
																	</div>
																	

																<div class='control-group'>
																	<label for='any_offer'>Had any offer in hand<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select  class='span12' id='any_offer'	name='any_offer' required>
																				<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>

															<div class='control-group'>
																	<label for='f2fwe'>Available for F2F in Week days?<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select  class='span12' id='f2f_WE'
																			name='f2f_WE' required>
																			<option value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																</div>
																
																	<div class='control-group'>
																	<label for='family_background'>Family background<span
																				style="color:red">(*)</span></label>
																	<div>
																		<select class='span12' id='fmbcground' onchange="checkfmgroungd()"
																			name='fmbcground' required>
																			<option  value="">Select</option>
																			<option value="YES">Married</option>
																			<option value="NO">Single</option>
																		</select>
																	</div>
																</div> 
																
																<div id="spwork" style="display: none">
															       <label for="spwork">Spouse does Job <span
																				style="color:red">(*)</span></label>
																	 <div class="control-group">
																		<select  class='span12' id='is_spouse_work' 
																			name='is_spouse_work'>
																				<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																	<label for="kids">Have Kids<span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<select class='span12' id='is_hav_kids' 
																			name='is_hav_kids'>
																			<option  value="">Select</option>
																			<option value="YES">YES</option>
																			<option value="NO">NO</option>
																		</select>
																	</div>
																	
																</div>
																
																
																	<div>
																	<label for="bname">ID proof details <span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="idProofDetails" type="text"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																		    placeholder="ID proof"
																			name="idProofDetails" required>
																	</div>
																	</div>
																	
																		<div >
																	<label for="bname">Interest level in Work Location<span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="intrstlevlworkLoc" type="text"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																		    placeholder="Interest level in Work Location"
																			name="intrstlevlworkLoc" required>
																	</div>
																	</div>
																	
																		<div>
																	<label for="bname">Communication skills rating(from 1 to 10) <span
																				style="color:red">(*)</span></label>
																	<div class="control-group">
																		<input class='span12' id="comskillsRatig" type="number" 
																		     min="1" max="10" placeholder="Communication skills "
																			name="comskillsRatig" required>
																	</div>
																	</div>
																	
																		<div>
																	<label for="bname">Professional references (If Any)<span
																				style="color:red"></span></label>
																	<div class="control-group">
																		<input class='span12' id="professional_Refrnces" type="text"  pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$"
																		    placeholder="Professional references"
																			name="professional_Refrnces">
																	</div>
																	</div>
																		

																		<div class='modal hide fade'
																			id='modal-editCompDetails' style="top: 25%;"
																			tabindex='-1'>
																			<div class='modal-header'>
																				<!-- <button class='close' data-dismiss='modal'
																					type='button'>&times;</button> -->
																				<button class='close' type='button'
																					onclick="hideDiv()">&times;</button>
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
																											<div class="pagination">
																												<table
																													class='data-table table table-bordered table-striped'
																													data-pagination-records='10'
																													data-pagination-top-bottom='true'
																													style='margin-bottom: 0;' id="sampletable1">
																													<thead>
																														<tr>
																															<th
																																style='text-align: center; color: #000080;'>Company
																																PAN ID</th>
																															<th
																																style='text-align: center; color: #000080;'>Company
																																Name</th>
																															<th
																																style='text-align: center; color: #000080;'>Notice
																																Period</th>
																														</tr>
																													</thead>
																													<tbody>
																														<c:forEach var="noticeperiod"
																															items="${ntcprdlist}">
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

																<div class='form-group'>
																	<label for='file'>Resume Upload<span
																		style="color:red">(*)</span></label>
																	<div>
																		<input name="file" data-rule-required='false'
																			id='file' type="file"
																			onchange="ValidateSize(this)" required /> 
																			<span id="fspanid"
																		style="color:red"></span>
																	</div>
																</div>
																
																<!-- <div class='form-group'>
																	<label for='file'>Upload Other Documents<span style="color:red"></span></label>
																	<div>
																		<input name="ofile" data-rule-required='false'
																			id='ofile' type="file"  
																			 /> 
																	</div>
																</div> -->
																
																<input type="submit" id="submitCandidate" name="submitCandidate"
																	class="btn btn-success btn-xs"
																	style="background: #0b3c7c" value="ADD CANDIDATE">
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
						</div>
					</div>
					<!-- <form id="TheForm" method="get" action="displaySourcedProfiles" target="TheWindow">
<input type="hidden" name="jobId" id="jobId_1" />
<input type="hidden" name="jobCode" id="jobCode_1"  />
<input type="hidden" name="comapny" id="comapny_1" />
<input type="hidden" name="bdName" id="bdName_1" />

</form> -->


				</div>
			</div>
		</div>
	</div>
</section>
<script src="resources/assets/javascripts/framework-bootstrap.min.js"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script> 
<script type="text/javascript">$('#sampletable1').DataTable();
</script>
 <script type="text/javascript">$('#interviewtable1').DataTable();</script> 
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
	<!-- 
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script> -->

<script type="text/javascript">
/* $('#sampletable').DataTable({
    dom: 'Bfrtip',
    buttons: [
        {
            extend: 'excelHtml5',
            title: 'View Requirements',
            exportOptions : {columns : ':visible'}

        },
    ]
});  */
	function saveCandidate(jobId, jobCode,clientName) {
		$('#jobDescId').val(jobId);
		$('#jobCode').val(jobCode);
		$('#clientName_Req').val(clientName);
		
		$.ajax({
			type : "get",
			url : "displayMandatorySkillsByJobid?jobdescid=" + jobId,
			cache : false,
			async : false,
			success : function(response) {
				$("#skillrow").empty();
				if (response.length == 0) {
					alert("No mandatory Skills Available");

				} else {
					for (var i = 0; i < response.length; i++) {
						/* var tr = "<tr><td>" + response[i].reqskill + "</td></tr>"; */
						
						/* var skillAppend =response[i].reqskill.text(response);
						$("#skillrow").append(skillAppend); */
						
						$("#skillrow").text(response[i].reqskill);
					}
				}
			},
			error : function() {}
		});

	}

	function showJobDesc(jobid) {
		$.ajax({
			type : "get",
			url : "displayJobDescByJobid?jobid=" + jobid,
			cache : false,
			async : false,
			success : function(response) {
				$("#retrivejobDescription").text(response);
			},
			error : function() {}
		});

	}
	function viewprofileBdm(jobdescid, jobCode,companyName,bdName) {
		
		window.open("displaySourcedProfiles?jobId=" + jobdescid );
		
	}
</script>
<script type="text/javascript">
	$(function() {

		$("#dob").datepicker({
			 dateFormat: 'mm-dd-yy' 

		});
	});
</script>
<script type="text/javascript">
	$(function() {

		$("#dob").datepicker({
			 dateFormat: 'mm-dd-yy'

		});
		$("#datetimepicker4").datetimepicker({
			pickTime : false
			// dateFormat: 'yy-mm-dd' 

		});
		$("#datetimepicker5").datetimepicker({
			pickTime : false
			// dateFormat: 'yy-mm-dd' 

		});
	});
</script>
<script type="text/javascript">
	function checkPanExists() {
		
		var panid = $('#panID').val();
		
		
		if(panid!=''){
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkPanExists?panId=" + panid,
			success : function(response) {
				if(response=="Ok"){
					$('#panshow').text("Pan No not Exists continue....");
				}
				else{
					$('#panshow').text("Pan No already Exists ");
				}

			}
		});
		}

	}
</script>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker2').datetimepicker({
			pickTime : false
		});
	});
</script>
<script>

	$(function() {
		$('#datetimepicker1').datetimepicker({

		});
	});
</script>
<script type="text/javascript">

	function viewJd(jobdescid) {
		$.ajax({
			type : "get",
			url : "view_JdStatus?jobdescid=" + jobdescid,
			cache : false,
			async : false,
			success : function(response) {
				$('#roleCount').empty();
				for (var i = 1; i <= response.length; i++) {
					var tr = "<tr><td>" + response[i].role + "</td>"
						+ "<td>" + response[i].selectedCount + "</td>"
						+ "<td>" + response[i].rejectedCount + "</td></tr>";
					$('#roleCount').append(tr);

				}
			},
			error : function() {
				alert("failure");
			}
		});

	}
</script>

<script type="text/javascript">
	function TP_Availability(jobdescid) {

		//alert(jobdescid);

		$.ajax({
			type : "get",
			url : "panel_availability_view?jobdescid=" + jobdescid,
			cache : false,
			async : false,
			success : function(response) {
				//alert(response.length);

				$('#interview_details').empty();
				for (var i = 0; i < response.length; i++) {

					var tr = "<tr><td>" + response[i].tpname + "</td>"
						+ "<td>" + response[i].tpavalabletime + "</td>"
						+ "<td>" + response[i].interview_type + "</td></tr>";
					$('#interview_details').append(tr);

				}
			},
			error : function() {
				//alert("failure");
			}
		});

	}
</script>

<script type="text/javascript">
	function client_availability(jobdescid) {

		//alert(jobdescid);

		$.ajax({
			type : "get",
			url : "panel_availability_view?jobdescid=" + jobdescid,
			cache : false,
			async : false,
			success : function(response) {

				$('#client_details').empty();
				if (response.length != 0) {
					for (var i = 0; i < response.length; i++) {

						var tr = "<tr><td>" + response[i].clinterviewdate + "</td>"
							+ "<td>" + response[i].clavalabletime + "</td>"
							+ "<td>" + response[i].clavailabletimeto +"</td>"
							+ "<td>" + response[i].clIntMode + "</td></tr>";
						$('#client_details').append(tr);

					}
				} else {

				}

			},
			error : function() {}
		});

	}
</script>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker3').datetimepicker({
			pickTime : false
		});
	});
</script>
<script>
	function doMultipleActionDownload(jobid, jobcode) {
		window.location.href = "Multiplefiledownload?jobid=" + jobid + "&jobcode=" + jobcode;

	}
</script>

<script type="text/javascript">
	function checkEmail() {
		var jobDescId = $('#jobDescId').val();
		var Email = $('#email').val();
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkEmailExists?jobDescId="+jobDescId+"&email=" + Email,
			success : function(response) {
				if(response=="NotExist"){
					$('#emailshow').text('Email ID not exists..Continue');
					$('#showgreen').text('');
					$('#submitCandidate').attr("disabled",false);
					}
				else{
					$('#showgreen').text('Email ID already exists.');
					$('#emailshow').text('');
					$('#submitCandidate').attr("disabled",true);
					}
				
				
				

			}
		});

	}
</script>
<script type="text/javascript">
	function checkContact() {
		
		var jobDescId = $('#jobDescId').val();
		var PhoneNumber = $('#phnNumber').val();
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkContactExists?jobDescId="+jobDescId+"&number=" + PhoneNumber,
			success : function(response) {

				if(response=="NotExist"){
					$('#phoneshow').text('Phone number not exists..Continue');
					$('#submitCandidate').attr("disabled",false);
					$('#phoneshowgreen').text('');
					}
				else{
					$('#phoneshowgreen').text('Phone Number already exists..');
					$('#submitCandidate').attr("disabled",true);
					$('#phoneshow').text('');
					}
			

			}
		});

	}
</script>
<script>
	function viewprofileClientScheduled(jobid) {
		var type = "client";
		$.ajax({
			type : "get",
			url : "view_scheduledCandidates?jobdescid=" + jobid + "&inttype=" + type,
			cache : false,
			async : false,
			success : function(response) {

				$('#interviewrow').empty();
				for (var i = 0; i < response.length; i++) {

					var tr = "<tr><td>" + response[i].candidate.first_name + "</td>"
						+ "<td>" + response[i].candidate.contact_number + "</td>"
						+ "<td>" + response[i].candidate.primaryskill + "</td>"
						+ "<td>" + response[i].candidate.relevantExp + "</td>"
						+ "<td>" + response[i].clinterviewMode + "</td>"
						+ "<td>" + response[i].clinterviewDate + "</td></tr>";
					$('#interviewrow').append(tr);

				}
			},
			error : function() {
				//alert("failure");
			}
		});
	}
	function viewprofileTPScheduled(jobid) {
		var type = "TP";
		$.ajax({
			type : "get",
			url : "view_scheduledCandidates?jobdescid=" + jobid + "&inttype=" + type,
			cache : false,
			async : false,
			success : function(response) {

				$('#interviewrow').empty();
				for (var i = 0; i < response.length; i++) {

					var tr = "<tr><td>" + response[i].candidate.first_name + "</td>"
						+ "<td>" + response[i].candidate.contact_number + "</td>"
						+ "<td>" + response[i].candidate.primaryskill + "</td>"
						+ "<td>" + response[i].candidate.relevantExp + "</td>"
						+ "<td>" + response[i].tpinterviewMode + "</td>"
						+ "<td>" + response[i].tpinterviewDate + "</td></tr>";
					$('#interviewrow').append(tr);

				}
			},
			error : function() {
				//alert("failure");
			}
		});
	}
</script>
<script>
	/*   function checkIntTime(){
	 
	      } */
	$(function() {
		$('#datetimepicker3').datetimepicker({
			onChange : function() {
				alert("call");
				var inttime = $('#interview_time').val();
				var interview_type = $('#interviewType').val();
				var interviewdate = $('#interviewdate').val();

				var jobid = $('#jobDescId').val();
				$.ajax({
					type : "get",
					url : "checkIntervkiewTime?jobdescid=" + jobid + "&inttime=" + inttime + "&interview_type=" + interview_type + "&interviewdate=" + interviewdate,
					cache : false,
					async : false,
					success : function(response) {
						alert(response);
						$('#timespan').text(response);
					},
					error : function() {
						//alert("failure");
					}
				});
			}
		});
	});


	
	function chooseType() {
		var intType = $('#interviewType').val();
		if (intType == "Client") {
			$('interviewdate').prop('required', true);
		}
	}
</script>
<script>
	function hideDiv() {
		$('#modal-editCompDetails').hide();
	//$('#modal-example2').show();
	}
</script>
<script>
	$('#closemodel').click(function() {
		window.location.reload();
	});
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
						$('#fspanid').text('File name already exist')
						 $(file).val('');
						}
					else{
						$('#fspanid').text('')
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
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#depdltbnkstmt').show(); 
	$('#bankname').prop("required",true);
	$('#bLocation').prop("required",true);
	}
	else{
		$('#bankname').prop("required",false);
		$('#bLocation').prop("required",false);
		$('#depdltbnkstmt').hide(); 
	
	}
	
} 
</script>
<script type="text/javascript">
function checkPvsCmpny(){
	
	var sel=$('#prvcname').val();
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#pvscmpny').show(); 
	$('#std').prop("required",true);
	$('#Rld').prop("required",true);
	}
	else{
		$('#std').prop("required",false);
		$('#Rld').prop("required",false);
		$('#pvscmpny').hide(); 
		
	}
	
} 
</script>

<script type="text/javascript">
function checkperm(){
	
	var sel=$('#curr_work_isPerm').val();
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#iscontract').show(); 
	$('#curcompname').prop("required",true);
	$('#duration').prop("required",true);
	}
	
	else{
		$('#curcompname').prop("required",false);
		$('#duration').prop("required",false);
		$('#iscontract').hide(); 
		
	}
	
} 
</script>


<script type="text/javascript">
function interPipe(){
	
	var sel=$('#any_intervw').val();
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#anyInterviewpipeline').show();
	$('#com_name').prop("required",true);
	}
	
	else{
		$('#com_name').prop("required",false);
		$('#anyInterviewpipeline').hide(); 
		
	}
	
} 

function NPNegotiable(){
	
	var sel=$('#npn').val();
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#npn_r').show(); 
	$('#npn_reason').prop("required",true);
	
	}/* else if(sel==""){
		alert("Please select notice period negiotiable ");
	} */
	else{
		$('#npn_reason').prop("required",false);
		$('#npn_r').hide(); 
	
	}
	
}

function checkfmgroungd(){
	
	var sel=$('#fmbcground').val();
	//alert("hi--ltbnkstmt"+sel);
	if(sel=='YES'){
	$('#spwork').show(); 
	$('#is_spouse_work').prop("required",true);
	$('#is_hav_kids').prop("required",true);
	
	
	}
	/* else if(sel==""){
		alert("Please select family background ");
	} */
	else{
		$('#is_spouse_work').prop("required",false);
		$('#is_hav_kids').prop("required",false);
		$('#spwork').hide(); 
		
	}
	
} 
</script>


 <script type="text/javascript">
  function checkForm(form)
  {
    form.mysubmit.disabled = true;
    form.mysubmit.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.mysubmit.disabled = false;
    form.mysubmit.value = "Submit";
    form_being_submitted = false;
  }
</script>

   <script type="text/javascript">
  function checkForm1(form)
  {
    form.submitCandidate.disabled = true;
    form.submitCandidate.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.submitCandidate.disabled = false;
    form.submitCandidate.value = "Submit";
    form_being_submitted = false;
  }
 
</script>
 <script>
  if ( window.history.replaceState ) {
    window.history.replaceState( null, null, window.location.href );
  }
  </script>

</body>
</html>