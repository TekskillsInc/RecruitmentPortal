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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
</head>
 <style>
.dataTables_wrapper .dataTables_filter {
	margin: 10px 10px 5px 10px;
	float: right;
	margin-right: 5%!important;
}

</style>
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
									<Strong style="color: #000080; font-size: 25px;">C Category Reports</Strong>
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="row">
										<div class="span12">
											<div class="well bs-component" style="position: relative;">

												<form action="cCategoryReportBySearch" method="GET">
													<fieldset>
														<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>
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
														<div class="span3">
															<div style='margin-bottom: 0; margin-top: 22px;'>
																<button class="btn btn-success btn-xs"
																	style="background: #0b3c7c;" type='submit'>Search</button>
															</div>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class='box-content box-no-padding'>
								<div class='responsive-table'>
									<div class='scrollable-area'>
										<div class="pagination">
											<table
												class='data-table table table-bordered table-striped table-report'
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom:0;'
												id="sampletable" >
												<thead>
													<tr>
														 <th style='text-align: center;color:#000080;'>BD Submitted Date</th>
													    <th style='text-align: center;color:#000080;'>JobCode</th>
													    <th style='text-align: center;color:#000080;'>Client</th>
													    <th style='text-align: center;color:#000080;'>Candidate</th>
													    <th style='text-align: center;color:#000080;'>ContactNo</th>
													    <th style='text-align: center;color:#000080;'>BD</th>
													    <th style='text-align: center;color:#000080;'>TL</th>
													    <th style='text-align: center;color:#000080;'>Recruiter</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="CList" items="${cCatList}">
														<tr>
															<td>${CList.bdmsubmitdate}</td>          
															<td>${CList.jobCode}</td>
															<td>${CList.client}</td>	
															<td>${CList.candidateName}</td>
															<td>${CList.phnNo}</td>
															<td>${CList.bdName}</td>
															<td>${CList.tlName}</td> 
															<td>${CList.recName}</td>
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
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
<script type="text/javascript">
	//$('#sampletable').DataTable();
	$('#sampletable').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
            },
        ]
    }); 
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
		$("#fromDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
</body>
</html>