
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
.dataTables_wrapper .dataTables_filter {
	margin: 10px 10px 5px 10px;
	float: right;
	margin-right: -17%;
}

.dataTables_wrapper .dataTables_info {
	padding: 0;
	margin: 50px 11px 10px 10px !important;
}

.table-report {
	position: relative !important;
	border-left: 1px solid #dddddd !important;
	margin-left: 17%;
}

#table-req {
	
}

.dataTables_wrapper .dataTables_paginate {
	margin-right: -18%;
	margin-top: -5%;
	margin-bottom: 5%;
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

								<center>
									<Strong style="color: #000080; font-size: 25px;">All
										TL Reports</Strong>
								</center>
							</div>

						</div>


						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="row">
										<div class="span12">
											<div class="well bs-component" style="position: relative;">

												<form action="Tl_Dashboard_For_Recruiter" method="GET">
													<fieldset>
														<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>

														<div class='span3'>
															<select id="clientname" name='clientname'
																style="width: 200px; height: 35px; margin-top: 10%"
																class="form-control text-center"
																onchange="getJDbyClient()" required>
																<option value="">-- Select Client --</option>
																<c:forEach var="cname" items="${clients}">
																	<option value="${cname.cmpny_id}">${cname.cmpny_name}</option>
																</c:forEach>
															</select>

														</div>
														<div class="span3">
															<select id="jobid" name="jobid" required
																style="width: 200px; height: 35px;margin-top: 10%;"
																class="form-control text-center">
																<option value="">-- Select JD --</option>
															</select>
														</div>
														<div class="span3">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>From
																	Date</label>
																<div class='datetimepicker input-append'
																	id='datetimepicker'>
																	<input class='span12' data-format='yyyy-MM-dd'
																		id='fromDate' name='fromDate'
																		placeholder='Select Date' type='text' required>
																	<span class='add-on'> <i
																		data-date-icon='icon-calendar'
																		data-time-icon='icon-time'></i>
																	</span>
																</div>
																<div class='controls'>
																	<input class='form-control' data-rule-minlength='0'
																		data-rule-required='true' id='sdpicker'
																		name='sdpicker' type='hidden'>
																</div>
															</div>
														</div>
														<div class="span3">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>To
																	Date</label>
																<div class='controls'>
																	<div>

																		<div class='datetimepicker input-append'
																			id='datetimepicker'>
																			<input class='span12' data-format='yyyy-MM-dd'
																				id='endDate' name='endDate'
																				placeholder='Select Date' type='text' required>
																			<span class='add-on'> <i
																				data-date-icon='icon-calendar'
																				data-time-icon='icon-time'></i>
																			</span>
																		</div>
																	</div>
																	<div class='controls'>
																		<input class='form-control' data-rule-minlength='0'
																			data-rule-required='true' id='sdpicker'
																			name='sdpicker' type='hidden'>
																	</div>

																	<!-- <input type="submit" value="search"  style="background:#0b3c7c;width:200px;height:30px;" > -->
																</div>
															</div>
														</div>
														<div class="span3 offset4">
														<button class="btn btn-primary icon-btn custom-resp-btn"
															type="submit" id="mysubmit" value="search"
															style="background: #0b3c7c; width: 200px; height: 34px;">
															<strong><i
																class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong>
														</button>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>

							<b>
								<center>
									Client :<font color="red"> &nbsp${comname}&nbsp&nbsp</font> &&
									&nbsp&nbsp JD:&nbsp <font color="red">${jobdec} </font>
								</center>
							</b>

							<div class='box-content box-no-padding'>
								<div class='responsive-table'>
									<div class='scrollable-area'>
										<div class="pagination">
											<table
												class='data-table table table-bordered table-striped table-report'
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom: 0;'
												id="sampletable">
												<thead>
													<tr>
														<th style='text-align: center; color: #000080;'>TL
															Name</th>
														<th style='text-align: center; color: #000080;'>Recruiter
															Count</th>
														<th style='text-align: center; color: #000080;'>Recruiter
															Sub Count</th>
														<th style='text-align: center; color: #000080;'>TL
															Cleared Count</th>
														<th style='text-align: center; color: #000080;'>SCT
															Cleared Count</th>
														<th style='text-align: center; color: #000080;'>Client
															Cleared Count</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="tlList" items="${tlList}">
														<tr>
															<td>${tlList.tlname}</td>
															<td>${tlList.recruitercount}</td>
															<td>${tlList.recruiterSubmiitedCount}</td>
															<td>${tlList.tlclearedCount}</td>
															<td>${tlList.sctclearedCount}</td>
															<td>${tlList.clientclearedCount}</td>

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
</section>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$('#sampletable').DataTable();
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






<script>
	function getJDbyClient() {
		//alert("true");

		// var jobid=document.getElementById("jobid").innerHTML="please select JOB ID";

		var cid = $('#clientname').val();

		$
				.ajax({
					type : "get",
					url : "view_jdbyclid?compid=" + cid,
					cache : false,
					async : false,
					success : function(response) {
						$('#jobid').empty();

						$('#jobid').append(
								$('<option/>').attr("value", "").text(
										"--Select JD--"));

						for (var i = 0; i < response.length; i++) {

							$('#jobid').append(
									$('<option/>').attr("value",
											response[i].jobdescid).text(
											response[i].jobCode));

						}

					},
					error : function() {
						//alert("failure");
					}
				});
	}

	$(function() {
		$("#endDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});
	});

	$(function() {
		$("#fromDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</body>
</html>