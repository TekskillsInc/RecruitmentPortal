
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
									<div class="pagination">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
												<tr>
												<th style='text-align: center; color: #000080;'>Job Id</th>
												
													<th style='text-align: center; color: #000080;'>Job
														Description ID</th>
													<th style='text-align: center; color: #000080;'>JD
														Download</th>
													<th style='text-align: center; color: #000080;'>Mandatory
														Skills</th>
													<th style='text-align: center; color: #000080;'>Job
														Description</th>
														<th style='text-align: center; color:#000080;'>Job Category</th>
													<th style='text-align: center; color: #000080;'>Job
														label</th>
														<th style='text-align: center; color: #000080;'>Job
														Priority</th>
													<th style='text-align: center; color: #000080;'>Allocated Budget</th>
													
													<th style='text-align: center; color: #000080;'>Submit
														Date</th>
													<th style='text-align: center; color: #000080;'>BDM
														Name</th>
													<th style='text-align: center; color: #000080;'>End
														Date</th>
													<th style='text-align: center; color: #000080;'>Company
														Name</th>
													<th style='text-align: center; color: #000080;'>Status</th>
													
													<th style='text-align: center; color: #000080;'>Assign
														Job</th>
													<!-- <th style='text-align: center; color: #000080;'>Assigned
														To Names</th> -->
													<th style='text-align: center; color: #000080;'>Edit
														Assign</th>


												</tr>
											</thead>
											<tbody>
												<c:forEach var="jdlist" items="${jobdescList}">
													<tr>
													<td>${jdlist.jd.jobdescid}</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-viewJdstatus'
															onclick="viewJd('${jdlist.jd.jobdescid}')">
															
															${fn:substring(jdlist.jd.jobCode, 0, 20)}..
															</a></td>

														<td>
															<div class='text-center'>
																<a class='fa fa-download' data-toggle='modal' href=''
																	onclick="doMultipleActionDownload('${jdlist.jd.jobdescid}','${jdlist.jd.jobCode}')">
																	<i class='icon-download' title="Download this document"
																	style="color: darkblue;"></i>
																</a>
															</div>
														</td>
														<td><div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-JDMandatory'
																	onclick="showJobMandatory('${jdlist.jd.jobdescid}')">i</a>
															</div></td>





														<td><c:choose>
																<c:when
																	test="${fn:length(jdlist.jd.jobDescription) >= 20}">
																	<div class='text-center'>
																		<a class='btn btn-default btn-small'
																			data-toggle='modal' href='#modal-JD'
																			onclick="showJobDesc('${jdlist.jd.jobdescid}')">
																			${fn:substring(jdlist.jd.jobDescription, 0, 20)}... </a>
																	</div>
																</c:when>
																<c:otherwise>
																		 ${jdlist.jd.jobDescription}
																	</c:otherwise>
															</c:choose></td>
															<td><strong><font color=blue>${jdlist.jd.jdCategory}</font></strong></td>
														<td>${jdlist.jd.joblabel}</td>
														<td>${jdlist.jd.jdPriority}</td>
														 <td>${jdlist.jd.allocatedBudget}</td>
														<td><fmt:formatDate value='${jdlist.jd.createdDate}'
																type='date' pattern='yyyy-MM-dd' /></td>
														<td>${jdlist.userName}</td>
														<td><fmt:formatDate value='${jdlist.jd.posEndDate}'
																type='date' pattern='yyyy-MM-dd' /></td>
														<td>${jdlist.jd.company.cmpny_name}</td>

														<td class="bg-warning text-dark">${jdlist.jd.jobstatus}
														</td>

														<td><c:choose>
																<c:when test="${jdlist.jd.flag == 1}">
																	<div class='text-center'
																		style="background-color: red; color: white;">
																		<strong>CLOSED</strong>
																	</div>
																</c:when>
																<c:otherwise>
																	<div class='text-center'>
																		<a class='btn btn-default btn-xs' data-toggle='modal'
																			href='#modal-assignto'
																			onclick="doActionAssign('${jdlist.jd.jobdescid}','${jdlist.jd.jobCode}')">
																			<i class='icon-group' style='color: green;'></i>
																		</a>

																	</div>
																</c:otherwise>
															</c:choose></td>
													<%-- 	<td>
															<div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	href='#modal-viewAssign'
																	onclick="doActionView('${jdlist.jd.jobdescid}'),${jdlist.jd.company.cmpny_name}'"> <i
																	class='icon-user' style='color: orange'></i>

																</a>
															</div>
														</td> --%>
														<td>
															<div class='text-center'>
																<a class='btn btn-default btn-xs' data-toggle='modal'
																	href='#modal-edit'
																	onclick="doActionEdit('${jdlist.jd.jobdescid}','${jdlist.jd.jobCode}','${jdlist.jd.company.cmpny_name}')">
																	<i class='icon-edit' style='color: darkblue'></i>

																</a>
															</div>
														</td>

													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>

									<div class='modal hide fade' id='modal-JD' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h4 id="retrivejobDescription" style="text-align: justify;"></h4>

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
									<!-- 	<div class="ScrollStyle"> -->
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Scheduled Profiles</h3>
										</div>
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

									<!-- <div class='modal hide fade' id='modal-viewAssign'
										tabindex='-1' style='height:30%!important;width:450px;left:59%;top:30%;'>
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
									</div> -->
					<%-- 				<div class='modal hide fade' id='modal-assignto' tabindex='-1'  style='height:50%!important;width:450px;left:59%;top:30%;'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>ASSIGN WORK</h3>
										</div>
										<div class='modal-body' id="mbody">
											<h4 id="jd_assigned" style="color: red;"></h4>
										</div>
										<div class='modal-body' id="jd_assignedto">
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="assignJdToUser"
												method="post" id="assignForm">
												<input type="hidden" id="jobid" name="jobid"> <input
													type="hidden" id="deptid" name="deptid"> <input
													type="hidden" id="jobCode" name="jobCode">
													 <input type="hidden" id="cmpnyname" name="cmpnyname">

												<div class='row'>
													<div class='span12'>
														<div class='control-group'>
															<label>Assign To</label> <Select class='form-control'
																data-rule-required='true' id='assignTo' name='assignTo'
																multiple required>
															</Select>

														</div>
													</div>
												</div>
												<div>
													<div class='' style='margin-bottom: 0'>
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c">ASSIGN TO</button>
													</div>
													<div class="span12">
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
													</div>
												</div>

											</form>
										</div>

									</div> --%>
									<div class='modal hide fade' id='modal-assignto' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3><font color=blue>Assign Job</font></h3>
										</div>
										<div class='modal-body' id="mbody">
											<h4 id="jd_assigned" style="color: red;"></h4>
										</div>
										<div class='modal-body' id="jd_assignedto">
											<!-- <form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="assignJdToUser"
												method="post" id="assignForm"> -->
												<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="assignJdToTl"
												method="post" id="assignForm">
												<input type="hidden" id="jobid" name="jobid"> <input
													type="hidden" id="deptid" name="deptid"> <input
													type="hidden" id="jobCode" name="jobCode">
													 <input type="hidden" id="cmpnyname" name="cmpnyname">

												<div class='row'>
													<div class='span12'>
														<div class='control-group'>
															<label>Assign To</label> <Select class='form-control'
																data-rule-required='true' id='assignTo' name='assignTo'
																multiple required>
															</Select>

														</div>
													</div>
												</div>
												<div>
													<div class='' style='margin-bottom: 0'>
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c">ASSIGN TO</button>
													</div>
													<div class="span12">
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
													</div>
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
												id='editAssignedEmp' method="post" onsubmit="return checkForm(this);">
												
												<input type="hidden" id="jobIdEdit" name="jobIdEdit">
												<input type="hidden" id="deptIdEdit" name="deptIdEdit">
												<input type="hidden" id="unAssignEmp" name="unAssignEmp">
												<input type="hidden" id="jobCodeEdit" name="jobCodeEdit">
												  <input type="hidden" id="cmpnynameEdit" name="cmpnynameEdit">
												<div class='row'>
													<div class='span12'>
														<div class='control-group'>
															<label style="color: red;">Choose to update</label> <Select
																class='form-control'  data-rule-required='true'
																id='assignToedit' name='assignToedit' multiple>

															</Select>

														</div>
													</div>
												</div>
												<!-- <div> -->
													<div class='' style='margin-bottom: 0'>
														<input name="selectj_d" id="selectj_d" type="hidden" />
														<button class="btn btn-success btn-xs"
															style="background: #0b3c7c" id="updateAssaignee">
															Update</button>
													</div>
												<!-- </div> -->
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





<script type="text/javascript">
function doActionAssign(jobid,jobCode,cmpnyname) {
		$.ajax({
			type : "get",
			url : "getUserListByJobID?jobid=" + jobid + "&jobCode=" + jobCode,
			cache : false,
			async : false,
			success : function(response) {

				if (response.length != 0) {
					$('#assignTo').empty();
					//$('#assignTo').append($('<option/>').attr("value", "").text("Select"));
					$("#jobid").val(jobid);
					for (var i = 0, len = response.length; i < len; i = i + 1) {
						$('#assignTo').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
						$('#deptid').val(response[i].deptId);
						$('#jobCode').val(jobCode);
						 $('#cmpnyname').val(cmpnyname);
						$('#jd_assignedto').show();
						$("#mbody").hide();
					}
				} else {
					$("#jd_assigned").text("Check No User Under this Lead or Job Already Assigned assigned to someone ");
					$('#jd_assignedto').hide();
					$("#mbody").show();
				}
			},
			error : function() {}
		});

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
				//	$('#assignToedit').append($('<option/>').attr("value", "").text("Select"));
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
</script>
<script type="text/javascript">

	function doActionView(jobid) {
		var userName = "";
		$.ajax({
			type : "get",
			url : "getAssignedUserByJobID?jobid=" + jobid,
			cache : false,
			async : false,
			success : function(response) {
				if (response.length != 0) {
					$("#jd_assign_name").empty();
					$("#assignee_name").empty();
					for (var i = 0, len = response.length; i < len; i = i + 1) {
						var name = response[i].user.userName;
						userName = name + " " + userName;
						$("#jd_assign_name").text(userName);
						$("#mbody_view").hide();
						$("#mbody_assign_name").show();

					}
				} else {
					$("#assignee_name").text("Job not asdsigned to any user");
					$("#mbody_view").show();
					$("#mbody_assign_name").hide();
				}
			},
			error : function() {}
		});
	}
</script>

<script>

	function showJobMandatory(jobid) {
		$.ajax({
			type : "get",
			url : "displayMandatorySkillsByJobid?jobdescid=" + jobid,
			cache : false,
			async : false,
			success : function(response) {
				$("#skillrow").empty();
				if (response.length == 0) {
					alert("No mandatory Skills Available");

				} else {
					for (var i = 0; i < response.length; i++) {
						var tr = "<tr><td>" + response[i].reqskill + "</td></tr>";
						$("#skillrow").append(tr);
					}
				}
			},
			error : function() {}
		});

	}
</script>








<script>
	function doActionUpload(jobId) {
		$('#jobdesid').val(jobId);
	}
</script>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker({
			pickDate : false
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker').datetimepicker({
			pickDate : true
		});
	});
</script>
<script type="text/javascript">
	function doMultipleActionDownload(jobid, jobcode) {
		window.location.href = "Multiplefiledownload?jobid=" + jobid + "&jobcode=" + jobcode;

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
 $('#submitassaignee').click(function(){
		$('submitassaignee').attr('disabled',true);
    	$('#assignForm').submit();
    
    });
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
    
    </script>
    
<!--       <script type="text/javascript">
  function checkForm(form)
  {
	  
	  //assignToedit
    form.updateAssaignee.disabled = true;
    form.updateAssaignee.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.updateAssaignee.disabled = false;
    form.updateAssaignee.value = "Submit";
    form_being_submitted = false;
  }
</script> -->
</body>
</html>