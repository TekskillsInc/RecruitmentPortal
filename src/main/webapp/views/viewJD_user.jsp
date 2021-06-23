
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
 <link rel="stylesheet" href="resources/assets/select2/select2.min.css"	rel="stylesheet" />

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
</style> -->
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
											
					<form action="getSearchView" method="GET" onsubmit="return checkForm(this);">
						<fieldset>		
							           
							             <div class='col-lg-4' >
		                                      <select id="clientname" name='clientname' style="width:200px;height:35px;" class="form-control text-center"> 
													<option value="">-- Select Client --</option>
													<c:forEach var="cname" items="${clients}"> 
														<option value="${cname.cmpny_id}">${cname.cmpny_name}</option>
														 </c:forEach> 
													 	    	
														</select>
													
												
														 <select id="bdname" name='bdname' style="width:200px;height:35px;margin-left:60px;"> 
													<option value="">-- Select BDM --</option>
													
													<c:forEach var="bd" items="${bdList}"> 
														<option value="${bd.emp_number}">${bd.userName}</option>
														 </c:forEach> 
														</select>
													<button class="btn btn-primary icon-btn custom-resp-btn" type="submit" id="mysubmit" value="search" style="background:#0b3c7c;width:200px;height:34px;margin-left:60px;position: relative;    bottom: 3px;"> <strong><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong></button>
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
									<div class="pagination">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
								<tr>
								<th style='text-align: center; color: #000080;'>Job Id</th>
								<th style='text-align: center; color: #000080;'>Created	Date</th>
								<!-- <th style='text-align: center; color: #000080;'>Count</th> -->
								<th style='text-align: center; color: #000080;'>Client	Name</th>
								<th style='text-align: center; color: #000080;'>BDM	Name</th>
								<th style='text-align: center; color: #000080;'>Job	Description</th>
								<th style='text-align: center; color:#000080;'>Job Category</th>
								<th style='text-align: center; color: #000080;'>JD Download</th>
								<th style='text-align: center; color: #000080;'>Assign Job</th>
								
								<th style='text-align: center; color: #000080;'>Assigned To Names</th>
								<th style='text-align: center; color: #000080;'>Edit Assign</th>
								<th style='text-align: center; color: #000080;'>View JD Profiles</th>
								<th style='text-align: center; color: #000080;'>Job	Priority</th>
								<th style='text-align: center; color: #000080;'>Allocated Budget</th>
								<th style='text-align: center; color: #000080;'>Status</th>
								<th style='text-align: center; color: #000080;'>Job	label</th>
								<th style='text-align: center; color: #000080;'>Job	Description ID</th>
									<th style='text-align: center; color: #000080;'>Mandatory Skills</th>
										<th style='text-align: center; color: #000080;'>Client	Availability</th>
									<th style='text-align: center; color: #000080;'>profiles@Client	Scheduled</th>
									<!-- <th style='text-align: center; color: #000080;'>TechPanel	Availability</th>
									<th style='text-align: center; color: #000080;'>profiles@TP	Scheduled</th> -->
								
								<!-- 	<th style='text-align: center; color: #000080;'>End	Date</th>
									
									<c:if test="${role == 'TEAMLEAD'}">
									<th style='text-align: center; color: #000080;'>File Upload</th>
									<th style='text-align: center; color: #000080;'>File Download</th>
									</c:if> -->

								</tr>
											</thead>
											<tbody>
												<c:forEach var="jdlist" items="${jobdescList}">
													<c:choose>
												<c:when test="${jdlist.counts>=0}">
												<tr>
												<td>${jdlist.jobDescId}</td>
													<td>${jdlist.createddate}</td>
													<%-- <td>${jdlist.count}</td> --%>
													<td>${jdlist.client}</td>
													<td>${jdlist.bdName}</td>
														
														<td><c:choose>
																<c:when
																	test="${fn:length(jdlist.jobdescription) >= 20}">
																	<div class='text-center'>
																		<a  data-toggle='modal'
																			href='#modal-JD'
																			onclick="showJobDesc('${jdlist.jobDescId}')">
																			${fn:substring(jdlist.jobdescription, 0, 20)}... </a>
																	</div>
																</c:when>
																<c:otherwise>
																		 ${jdlist.jobdescription}
																	</c:otherwise>
															</c:choose></td>
															
															<td><strong><font color=blue>${jdlist.jdCategory}</font></strong></td>
															<td><div class='text-center'>
																<a class='fa fa-download' data-toggle='modal' href=''
																	onclick="doMultipleActionDownload('${jdlist.jobDescId}','${jdlist.jobCode}')">
																	<i class='icon-download' title="Download this document"
																	style="color: darkblue;"></i>
																</a>
															</div>
														</td>
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
																			href='#modal-assignto'
																			onclick="doActionAssign('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}')">
																			<i class='icon-group' style='color: green;'></i>
																		</a>

																	</div>
																</c:otherwise>
															</c:choose></td>
															<td>
															<div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	href='#modal-viewAssign'
																	onclick="doActionView('${jdlist.jobDescId}')"> <i
																	class='icon-user' style='color: orange'></i>

																</a>
															</div>
														</td>
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
																	href='#modal-edit'
																	onclick="doActionEdit('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}')">
																	<i class='icon-edit' style='color: darkblue'></i>

																</a>
															</div>
															</c:otherwise>
															</c:choose>
														</td>
													
													<td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="viewprofileManager('${jdlist.jobDescId}','${jdlist.bdName}','${jdlist.jobCode}','${jdlist.client}')">
																<i class='icon-group' style="color: darkorange;"></i>
														</a></td>						
														
														<td>${jdlist.priority}</td>
														 <td>${jdlist.allocatedbudget}</td>
														 <td class="bg-warning text-dark">${jdlist.jobstatus}
														</td>
														
														<td>${jdlist.lable}</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-viewJdstatus'
															onclick="viewJd('${jdlist.jobDescId}')">
															${fn:substring(jdlist.jobCode, 0, 20)}..</a></td>
													
														<td><div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-JDMandatory'
																	onclick="showJobMandatory('${jdlist.jobDescId}')"><i
																	class='icon-info' style="color: darkblue;"></i></a>
															</div></td>
														
											<%-- 			<c:choose>
															<c:when test="${role == 'TEAMLEAD'}">
																<td><a class='btn btn-default btn-xs'
																	data-toggle='modal' href='#modal-TPAvailability'
																	onclick="TPAvailability_view('${jdlist.jobDescId}')"><i
																		class="icon-calendar" style="color: purple;"></i></a></td>
															</c:when>
															<c:otherwise>
																<td><a class='btn btn-default btn-xs'
																	data-toggle='modal' href='#modal-TPAvailability_TMS'
																	onclick="TPAvailability_view('${jdlist.jobDescId}')"><i
																		class="icon-calendar" style="color: purple;"></i></a></td>
															</c:otherwise>
														</c:choose>
														
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-JDsprofiles'
															onclick="viewprofileTPScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: darkblue;"></i>
														</a></td> --%>

														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-ClientAvailability'
															onclick="ClientAvailability_View('${jdlist.jobDescId}')"><i
																class='icon-calendar' style="color: violet;"></i></a></td>

														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-JDsprofiles'
															onclick="viewprofileClientScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: darkblue;"></i>
														</a></td>
													<%-- 	<c:if test="${role == 'TEAMLEAD'}">
															<td>
																<div class='text-center'>
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		href='#modal-upload'
																		onclick="doActionUpload('${jdlist.jobDescId}')">
																		<i class='icon-upload' style='color: darkgreen'></i>

																	</a>
																</div>

															</td>

															<td>
																<div class='text-center'>
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		href=''
																		onclick="doActionDownload('${jdlist.jobDescId}')">
																		<i class='icon-download'
																		title="Download this document" style='color: darkred;'></i>
																	</a>
																</div>
															</td>
														</c:if> --%>
													</tr>
												</c:when>
												<c:otherwise>
												
												
												
													<tr style="background-color: #ffb499;">
													<td>${jdlist.jobDescId}</td>
													<td>${jdlist.createddate }</td>
													
													<td>${jdlist.client}</td>
													<td>${jdlist.bdName}</td>
														
														<td><c:choose>
																<c:when
																	test="${fn:length(jdlist.jobdescription) >= 20}">
																	<div class='text-center'>
																		<a class='btn btn-default btn-xs' data-toggle='modal'
																			href='#modal-JD'
																			onclick="showJobDesc('${jdlist.jobDescId}')">
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
																			href='#modal-assignto'
																			onclick="doActionAssign('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}')">
																			<i class='icon-group' style='color: green;'></i>
																		</a>

																	</div>
																</c:otherwise>
															</c:choose></td>
															<td>
															<div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	href='#modal-viewAssign'
																	onclick="doActionView('${jdlist.jobDescId}')"> <i
																	class='icon-user' style='color: orange'></i>

																</a>
															</div>
														</td>
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
																<button class='btn btn-default btn-xs' 
																	 title="Please assign jd before updating" disabled>
																	<i class='icon-edit' style='color: darkblue'></i>

																</button>
															</div>
															</c:otherwise>
															</c:choose>
														</td>
													
													<td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="viewprofileManager('${jdlist.jobDescId}','${jdlist.bdName}','${jdlist.jobCode}','${jdlist.client}')">
																<i class='icon-group' style="color: darkorange;"></i>
														</a></td>						
														
														<td>${jdlist.priority}</td>
														 <td>${jdlist.allocatedbudget}</td>
														 <td class="bg-warning text-dark">${jdlist.jobstatus}
														</td>
														<td>${jdlist.lable}</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-viewJdstatus'
															onclick="viewJd('${jdlist.jobDescId}')">
															${fn:substring(jdlist.jobCode, 0, 20)}..</a></td>
													
														<td><div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-JDMandatory'
																	onclick="showJobMandatory('${jdlist.jobDescId}')"><i
																	class='icon-info' style="color: darkblue;"></i></a>
															</div></td>
														
														<%-- <c:choose>
															<c:when test="${role == 'TEAMLEAD'}">
																<td><a class='btn btn-default btn-xs'
																	data-toggle='modal' href='#modal-TPAvailability'
																	onclick="TPAvailability_view('${jdlist.jobDescId}')"><i
																		class="icon-calendar" style="color: purple;"></i></a></td>
															</c:when>
															<c:otherwise>
																<td><a class='btn btn-default btn-xs'
																	data-toggle='modal' href='#modal-TPAvailability_TMS'
																	onclick="TPAvailability_view('${jdlist.jobDescId}')"><i
																		class="icon-calendar" style="color: purple;"></i></a></td>
															</c:otherwise>
														</c:choose>
														
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-JDsprofiles'
															onclick="viewprofileTPScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: darkblue;"></i>
														</a></td> --%>

														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-ClientAvailability'
															onclick="ClientAvailability_View('${jdlist.jobDescId}')"><i
																class='icon-calendar' style="color: violet;"></i></a></td>

														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-JDsprofiles'
															onclick="viewprofileClientScheduled('${jdlist.jobDescId}')">
																<i class='icon-time' style="color: darkblue;"></i>
														</a></td>
													<%-- 	<c:if test="${role == 'TEAMLEAD'}">
															<td>
																<div class='text-center'>
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		href='#modal-upload'
																		onclick="doActionUpload('${jdlist.jobDescId}')">
																		<i class='icon-upload' style='color: darkgreen'></i>

																	</a>
																</div>

															</td>

															<td>
																<div class='text-center'>
																	<a class='btn btn-default btn-xs' data-toggle='modal'
																		href=''
																		onclick="doActionDownload('${jdlist.jobDescId}')">
																		<i class='icon-download'
																		title="Download this document" style='color: darkred;'></i>
																	</a>
																</div>
															</td>
														</c:if> --%>
													</tr>
													</c:otherwise>
												</c:choose>
												</c:forEach>

											</tbody>
										</table>
									</div>

									<div class='modal hide fade' id='modal-JD' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Job Description</h3>
											<div class='modal-body'>
											<h4 id="retrivejobDescription" style="text-align: justify;"></h4>
											</div>
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
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom: 0;'>
												<thead>
													<tr>
														<th style='text-align: center;'>Skill</th>
													</tr>
												</thead>
												<tbody id="skillrow">
												</tbody>
											</table>

											<span id="jdmandatory" style="text-align: justify;"></span>
										</div>

									</div>
									<div class='modal hide fade' id='modal-JDsprofiles' style="width:700px;height:700px;"
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
												data-pagination-top-bottom='true' style='margin-bottom: 0;border-left:1px solid #dddddd'>
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

									<div class='modal hide fade' id='modal-viewAssign'
										tabindex='-1' style='height:30%!important;width:450px;left:44%;top:20%;'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Assigned To </h3>
										</div>

										<div class='modal-body' id="mbody_view">
											<h4 id="assignee_name" style="color: red;"></h4>
										</div>
										<div class='modal-body'>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="" method="get">
												<div class='row'>
													<div class='span12'>
														<div class='control-group' id="mbody_assign_name">
															<h4 id='jd_assign_name' style="margin-left: 15px;"></h4>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									<div class='modal hide fade' id='modal-assignto' tabindex='-1' style="height:50%!important; width: 40%!important;left: 60%;">
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>ASSIGN WORK</h3>
										</div>
										<div class='modal-body' id="mbody">
											<h4 id="jd_assigned" style="color: red;"></h4>
										</div>
										<div class='modal-body' id="jd_assignedto">
											<!-- <form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="assignJdToUser"
												method="post" id="assignForm"> -->
												<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="assignJdToRecruiter"
												method="post" id="assignForm" onsubmit="return assignForm1(this);">
												<input type="hidden" id="jobid" name="jobid"> <input
													type="hidden" id="deptid" name="deptid"> <input
													type="hidden" id="assjobCode" name="assjobCode">
													 <input type="hidden" id="cmpnyname" name="cmpnyname">

																								
													   <div class='control-group'>
														<label class='control-label' for='validation_cmpny_name'>Assign To<span style="color:red">*</span></label>
														<div class='controls'>
															<Select class='form-control' id='assignTo' name='assignTo'
																multiple required>
															</Select>
														</div>
														</div>
													<div class='control-group'>
													<div class='controls'>
														<input type="submit" class="btn btn-success btn-xs"
															style="background: #0b3c7c" name="submitassaignee" id="submitassaignee" value="ASSIGN TO">
													</div>
													</div>
												
												<div>
													
											<%-- 		<div class="span12">
														<div id="tlreqcount">
															<table border="1">
																<tr>
																	<th>Team Lead</th>
																	<th>Assigned Req</th>
																</tr>

																<tbody></tbody>
																<c:forEach var="load" items="${workloadList}">
																	<tr>
																		<td>${load.employeeName}</td>
																		<td align="center">${load.count }</td>
																	</tr>
																</c:forEach>
															</table>
														</div>
													</div> --%>
												</div>

											</form>
										</div>

									</div>

									<div class='modal hide fade' id='modal-TPAvailability_TMS'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>TechPanel Availability</h3>
											<div class='row'>
												<div class='span12'>

													<div class='modal-header'>
														<button class='close' data-dismiss='modal' type='button'>&times;</button>
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
																			<th style='text-align: center;'>Interviewer Name</th>
																			<th style='text-align: center;'>Available Date</th>
																			<th style='text-align: center;'>Available Time</th>
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

										</div>
									</div>

									<!--  For TL -->
								<div class='modal hide fade' id='modal-example3'
									tabindex='-1'>
										<div class='modal-header'>
										<button class='close' data-dismiss='modal' id="closemodel"
											type='button'>&times;</button>
										
									</div>
									<div class='modal-body'>
									<h3>
											 <span Style="color:red">You Don't have Access to assign requirement as you are un-assigned to this requirement</span>
										</h3>
									</div>

								</div>

									<div class='modal hide fade' id='modal-TPAvailability'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Tech Panel Availability</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_client_Interview>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="TechPanelAvailability"
												method="post">

												<input type="hidden" name="jobsid" id="jobid_tl">


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
																				title="only characters allowed"
																				data-rule-minlength='2' data-rule-maxlength='25'
																				data-rule-required='false' id='interviewname'
																				name='interviewname' placeholder='Interviewer Name'
																				type='text' required>

																		</div>
																	</div>
																	<div class='control-group'>
																		<label class='control-label' for='validation_date'>Available
																			Date</label>
																		<div class='controls'>
																			<div>
																				<div class='datetimepicker input-append'
																					id='datetimepicker'>
																					<input class='span12' data-format='yyyy-MM-dd'
																						id='interview_date' name='interview_date'
																						placeholder='Select Date' type='text' required>
																					<span class='add-on'> </span> <i
																						data-date-icon='icon-calendar'
																						data-time-icon='icon-time'></i>

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
																		<input type="submit" class="btn btn-success btn-xs"
																			style="background: #0b3c7c" value="Save" />
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
																				<th style='text-align: center;'>Available Date</th>
																				<th style='text-align: center;'>Available Time</th>
																				<th style='text-align: center;'>Mode Of
																					Interview</th>
																			</tr>
																		</thead>
																		<tbody id="Tp_details1">
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

									<div class='modal hide fade' id='modal-ClientAvailability'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Client Interview Schedule</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_client_Interview>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="SaveClientAvailabily"
												method="post">

												<input type="hidden" name="jobsid" id="jobid_cl">

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
																				<th style='text-align: center;'>Schedule Date</th>
																				<th style='text-align: center;'>Available Time</th>
																				<th style='text-align: center;'>Available Time To</th>
																				<th style='text-align: center;'>Mode Of
																					Interview</th>
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

									<div class='modal hide fade' id='modal-upload' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>File Upload</h3>
										</div>

										<div class='modal-body' id=jd_edit_assigns>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="uploadAssignedJdToUser"
												enctype="multipart/form-data" method="post">
												<input type="hidden" name="jobdesid" id="jobdesid" />


												<!-- <div class='control-group'> -->
												<label for='file'>File Upload</label>
												<div>
													<input name="file" data-rule-required='false' id='file'
														onchange="fileupload(this)" type="file"
														accept=".xlsx, .xls" required /> <font color='red'><button
															class="btn btn-success btn-xs"
															style="background: #0b3c7c">Submit</button> </font>

												</div>

											</form>
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
											<!-- 	</div> -->

										</div>


									</div>


									<div class='modal hide fade' id='modal-edit' tabindex='-1' style="height: 50%!important; width: 40%!important;left: 60%;">
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
												style='margin-bottom: 0;' action="editAssignedJdToRecruiter"
												id='editAssignedEmp' method="post">
												<input type="hidden" id="jobIdEdit" name="jobIdEdit">
												<input type="hidden" id="deptIdEdit" name="deptIdEdit">
												<input type="hidden" id="unAssignEmp" name="unAssignEmp">
												<input type="hidden" id="jobCodeEdit" name="jobCodeEdit">
												<input type="hidden" id="cmpnynameEdit" name="cmpnynameEdit">
												
												<div class='control-group'>
														<label class='control-label' for='validation_cmpny_name'>Assign To<span style="color:red">*</span></label>
														<div class='controls'>
															<Select class='form-control' id='assignToedit' name='assignToedit'
																multiple required>
															</Select>
														</div>
														</div>
													<div class='control-group'>
													<div class='controls'>
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c" id="updateAssaignee">
															Update</button>
													</div>
													</div>

												<!-- <div class='row'>
													<div class='span12'>
														<div class='control-group'>
															<label style="color: red;">Choose to update</label> <Select
																class='form-control' data-rule-required='true'
																id='assignToedit' name='assignToedit' multiple>

															</Select>

														</div>
													</div>
												</div>
												<div>
													<div class='' style='margin-bottom: 0'>
														<input name="selectj_d" id="selectj_d" type="hidden" />
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c" id="updateAssaignee">
															Update</button>
													</div>
												</div> -->
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
</section>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
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
<script src="resources/assets/javascripts/multi-select.js"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>
<script
	src="resources/assets/select2/select2.min.js" type="text/javascript"></script>
<script type="text/javascript">		
	$('#assignTo,#assignToedit').select2({
	    placeholder: "Select Team member",
	    });
    </script>

<script type="text/javascript">
                                             function doActionAssign(jobid,jobCode,cmpnyname){
                                            	   
                                                 $.ajax({
                                                        type: "get",
                                                        url: "getUserListByJobID?jobid="+jobid,
                                                        cache: false,
                                                        async: false,               
                                                        success: function(response){
                                                           
                                                             if(response.length!=0){
                                                            	$('#assignTo').empty();
                                                                //$('#assignTo').append($('<option/>').attr("value","").text("Select"));
                                                                $("#jobid").val(jobid);
                                                                for (var i = 0, len = response.length; i < len; i=i+1) 
                                                                {
                                                                    $('#assignTo').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
                                                                    $('#deptid').val(response[i].deptId);
                                                                    $('#assjobCode').val(jobCode);
                                                                    $('#cmpnyname').val(cmpnyname);
                                                                    $('#jd_assignedto').show();
                                                                    $("#mbody").hide();
                                                                }  
                                                                }
                                                            else{
                                                            	 $("#jd_assigned").text("Check No User Under this Lead or Job Already Assigned assigned to someone ");
                                                            	 $('#jd_assignedto').hide();
                                                                 $("#mbody").show();
                                                                }                                                      
                                                            },
                                                            error: function(){  
                                                                                
                                                            }
                                                        
                                                        });
                                                    
                                                    }
                                             </script>
<script type="text/javascript">
                                             function doActionEdit(jobid,jobcode,cmpnyname){
                                                 $.ajax({
                                                        type: "get",
                                                        url: "editUserListByJobID?jobid="+jobid,
                                                        cache: false,
                                                        async: false,               
                                                        success: function(response){
                                                        	
                                                        	 
                                                        	if(response.length!=0){
                                                        		 $('#assignToedit').empty();
                                                                 $("#jobIdEdit").val(jobid);
                                                                 $("#jobCodeEdit").val(jobcode);
                                                                 $("#cmpnynameEdit").val(cmpnyname);
                                                                // $('#assignToedit').append($('<option/>').attr("value","").text("Select"));
                                                                  for (var i = 0, len = response.length; i < len; i=i+1) 
                                                                 {
                                                                	 
                                                               		 
                                                                     $('#assignToedit').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
                                                                     $('#deptIdEdit').val(response[i].deptId);
                                                                     $("#mbody_edit").hide();
                                                                     $('#jd_edit_assigns').show();
                                                                } 
                                                                
                                                                
                                                                 
                                                           
                                                                 $("#updateAssaignee").attr("disabled",false);   
                                                             }
                                                               
                                                            else{
                                                            	if(response.length==0){
                                                               	 $("#updateAssaignee").attr("disabled",true);
                                                               	 alert("Please assign jd before updating"); 
                                                               	 
                                                                }
                                                            	else{
                                                                    $("#jd_edit").text("PLEASE ASSIGN JD BEFORE EDITTING");
                                                                    $('#jd_edit_assigns').hide();
                                                                  $("#mbody_edit").show();
                                                            	}
                                                                }  
                                                             var userName="";
                                                             
                                                             $.ajax({
                                                                 type: "get",
                                                                 url: "getAssignedUserByJobID?jobid="+jobid,
                                                                 cache: false,
                                                                 async: false,               
                                                                 success: function(response){
                                                                          for (var i = 0, len = response.length; i < len; i=i+1) 
                                                                          {
                                                                              
                                                                              var name=response[i].user.userName;
                                                                              $("option").filter(function() {
                                                                        			return $(this).text() == name;
                                                                        		}).prop('selected', 'selected'); 
                                                                        		}  
                                                                          $('#assignToedit').multipleSelect();
                                                                              
                                                                            
                                                                 },
                                                                 error: function(){                                                                                  
                                                                 }                                                       
                                                             });   
                                                            
                                                                } ,                                                     
                                                            
                                                            error: function(){  
                                                                                
                                                            }
                                                        
                                                        });
                                                    
                                                    }
                                                </script>
<script type="text/javascript">
       
                                                    function doActionView(jobid){
                                                    	 var userName="";
                                                        $.ajax({
                                                            type: "get",
                                                            url: "getAssignedUserByJobID?jobid="+jobid,
                                                            cache: false,
                                                            async: false,               
                                                            success: function(response){
                                                            	 if(response.length!=0){
                                                            		 $("#jd_assign_name").empty();
                                                            		 $("#assignee_name").empty();
                                                                     for (var i = 0, len = response.length; i < len; i=i+1) 
                                                                     {
                                                                         var name=response[i].user.userName;
                                                                         userName=name+" "+userName;
                                                                         $("#jd_assign_name").text(userName);
                                                                         $("#mbody_view").hide();
                                                                         $("#mbody_assign_name").show();
                                                                       
                                                                     }  
                                                                     }
                                                                 else{
                                                                     $("#assignee_name").text("Job not assigned to any user");
                                                                     $("#mbody_view").show();
                                                                     $("#mbody_assign_name").hide();
                                                                     }                                                      
                                                            },
                                                            error: function(){                                                                                  
                                                            }                                                       
                                                        });                                                 
                                                    }
                                                </script>

												<script>
                                                function viewprofileManager(jobdescid,bdname,jobCode,cmpny_name)
                                                {
                                                	window.open("view_Profiles_JD?jobId="+jobdescid);
                                                   
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
        	//alert("failure");
        }                                                       
    });     
	
}

</script>

<script type="text/javascript">
    function TPAvailability_view(jobdescid){
    	$("#jobid_tl").val(jobdescid);
     	 $.ajax({
            type: "get",
           
            url: "panel_availability_view?jobdescid="+jobdescid,
            cache: false,
            async: false,               
            success: function(response){
              $('#Tp_details').empty();
              $('#Tp_details1').empty();
              
              for(var i=0;i<response.length;i++){
                 
                 
            	  var tr="<tr><td>"+response[i].tpname+"</td>"
            	  +"<td>"+response[i].tpavailabledate+"</td>"
            	  +"<td>"+response[i].tpavalabletime+"</td>"
            		+"<td>"+response[i].interview_type+"</td></tr>";
            		
      		 $('#Tp_details').append(tr);
      		 $('#Tp_details1').append(tr);
                  
            } 
            },
            error: function(){   
            	//alert("failure");
            }                                                       
        });   
        
       }

 </script>

<script type="text/javascript">
    function ClientAvailability_View(jobdescid){
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
                           /*  +"<td><button id='delete' class='btn btn-primary btn-xs'>Delete</button></td> */
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
<script>
		function doActionUpload(jobId){
		$('#jobdesid').val(jobId);
		 }                  
		 </script>

<script type="text/javascript">
  $(function() {
    $('#datetimepicker1').datetimepicker({
    	pickDate: false
    });
  });
</script>
<script type="text/javascript">
$('#usernameId,#fullname').select2();
$( document ).ready(function() {
	   var bdname='${bdnames}';
	   var clientname='${clientname}';
	   var clientVal = $("select[name='clientname']");
		
		 clientVal.find('option[value="' + clientname + '"]').attr('selected', true);
		
		var bdVal = $("select[name='bdname']");
		
		 bdVal.find('option[value="' + bdname + '"]').attr('selected', true);
	});

  $(function() {
    $('#datetimepicker').datetimepicker({
    	pickDate: true
    });
  });
</script>
<script type="text/javascript">
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
<script type="text/javascript">
    $('#updateAssaignee').click(function(){
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
    	    $('#updateAssaignee').attr('disabled',true);
    		$('#editAssignedEmp').submit();
    	
    });
    

 </script>
    
<script type="text/javascript">
  function assignForm1(form)
  {
	  var assignTo=$('#assignTo').val();
	  if(assignTo==null){
    	  alert( 'Please select' );
    	  return false;
          }
    form.submitassaignee.disabled = true;
    form.submitassaignee.value = "Please wait...";
    return true;
  }
  function resetForm(form)
  {
    form.submitassaignee.disabled = false;
    form.submitassaignee.value = "Submit";
    form_being_submitted = false;
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

<!-- <script type="text/javascript">
/* <input type="submit" class="btn btn-success btn-xs"
	style="background: #0b3c7c" id="updateAssaignee" name="updateAssaignee" value="Update"> */
  function editassignForm1(form)
  {
	  var assignTo=$('#assignTo').val();
	  if(assignTo==null){
    	  alert( 'Please select' );
    	  return false;
          }
	//$('#assignForm').submit();
    form.submitassaignee.disabled = true;
    form.submitassaignee.value = "Please wait...";
    return true;
  }
  function resetForm(form)
  {
    form.submitassaignee.disabled = false;
    form.submitassaignee.value = "Submit";
    form_being_submitted = false;
  }
</script> -->
</body>
</html>