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
	margin-right: 0%;
}

.dataTables_wrapper .dataTables_info {
	padding: 0;
	margin: 50px 11px 10px 10px !important;
}

.table-report {
	position: relative !important;
	border-left: 1px solid #dddddd !important;
	margin-left: 2%;
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
									<Strong style="color: #000080; font-size: 25px;">View
										SCT Report</Strong>
								</center>
							</div>

						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="row">
										<div class="span12">
											<div class="well bs-component"  style="position: relative;">

												<form action="SctReportByBdName" method="GET">
													<fieldset>
														<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>

														<div class='span3'>
														<label class='control-label' for='validation_date'>BDM</label>
													<select id="bdempno" name='bdempno'
																style="width: 200px; height: 35px;margin-top:1%"
																class="form-control text-center" >
															<!-- <option value="">-- Select BDM --</option> -->
														 <option value="">ALL</option>
													     <c:forEach var="bd" items="${bdList}"> 
														<option value="${bd.emp_number}">${bd.userName}</option>
														 </c:forEach> 
														</select>
														</div>
														
															<div class="span3">
															<label class='control-label' for='validation_date'>Category</label>
															<select id="jdcategory" name='jdcategory'
																style="width: 200px; height: 35px;margin-top:1%"
																class="form-control text-center" >
																<!-- <option value="">-- Select Category--</option> -->
																<option value="">ALL</option>
																<option value="A">A</option>
																<option value="B1">B1</option>
																<option value="B2">B2</option>
																<option value="C">C</option>
															</select> 
															</div>
															
																<div class="span3">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>From Date</label>
																<div class='datetimepicker input-append'
																	id='datetimepicker' style="width: 200px; height: 35px;">
																	<input class='span12' data-format='yyyy-MM-dd'
																		id='fromDate' name='fromDate'
																		placeholder='From Date' type='text' value="${fdate}" required>
																</div>
															</div>
															</div>
															<div class="span2">
															<div class='control-group'>
															<label class='control-label' for='validation_date'>To Date</label> 
																	<div class='datetimepicker input-append'
																		id='datetimepicker' style="width: 200px; height: 35px;">
																		<input class='span12' data-format='yyyy-MM-dd'
																			id='endDate' name='endDate' placeholder='To Date'
																			type='text' value="${tdate}" required> 
																	</div>
															</div>
															</div>
															<div class="span6 offset4">
															<div class='control-group'>
															<button class="btn btn-primary icon-btn custom-resp-btn"
																	type="submit" id="mysubmit" value="search"
																	style="background: #0b3c7c; width: 150px; height: 31px;">
																	<strong><i
																		class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong>
																</button>
															</div>
															</div>
													</fieldset>
												</form>
											</div>
											</div>
											</div>
										</div>
									</div>
						
						<b>
						
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
													<th style='text-align: center; color: #000080;'>BD Name</th>
													<th style='text-align: center; color: #000080;'>Delivery lead</th>
													<th style='text-align: center; color: #000080;'>Category Name</th>
													<th style='text-align: center; color: #000080;'>Profiles submitted Count</th>
													<th style='text-align: center; color: #000080;'>Client Name</th>
													<th style='text-align: center; color: #000080;'>Job Id</th>
													<th style='text-align: center; color: #000080;'>SAT Cleared Count</th>
												</tr>
												</thead>
											<tbody>
													<c:forEach var="sctList" items="${sctrepList}">
												<tr>
												<td>${sctList.bdname}</td>
												<td>${sctList.tlname}</td>
												<td>${sctList.catname}</td>
												<td>${sctList.tlclearedCount}</td>
												<td>${sctList.clientname}</td>
												<td>${sctList.jobcode}</td>
												<td>${sctList.sctclearedCount}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class='box-content box-no-padding'>
							<div class="table-responsive">
									<table class="table table-striped" id="ccategoryTable" >
										<thead>
											<tr>
												<th>BdName</th>												
												<th>C-Category Count</th>
											</tr>
											
										</thead>
										<tbody> 
											 <c:forEach var="exec" items="${bdMap}"> 
												<tr>
												<c:choose>
												<c:when test="${not empty exec.key}"><td>${exec.key}</td>
												<td>${exec.value}</td>
												</c:when>
												<c:otherwise>
												<td>Internal BD</td>
												<td>${exec.value}</td>
												</c:otherwise>
												
												</c:choose>
													
													
												</tr>
												 </c:forEach>
										</tbody>
									</table>
								</div>
								</div>
								<div class='box-content box-no-padding'>
								<div class="table-responsive" >
									<table class="table table-striped" id="FteTable" >
										<thead>
											<tr>
												<th>BdName</th>												
												<th>Full-Time External Count</th>
											</tr>
											
										</thead>
										<tbody> 
											 <c:forEach var="execFte" items="${bdMapFte}"> 
												<tr>
												<c:choose>
												<c:when test="${not empty execFte.key && execFte.key == null }"><td>${execFte.key}</td>
												<td>${exec.value}</td>
												</c:when>
												<c:otherwise>
												<td>Internal BD</td>
												<td>${execFte.value}</td>
												</c:otherwise>
												
												</c:choose>
													
													<td>${execFte.value}</td>
												</tr>
												 </c:forEach>
										</tbody>
									</table>
								</div>
								</div>
								
							</div>
							<center> <a href="ExportSctReportsCount" class="btn btn-success btn-xs" >Export to Excel</a></center>
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