<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<section id='content'>
	<div class='container-fluid'>
	<div class='row-fluid' id='content-wrapper' style="margin-top:-180px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">View Exclusive Report</Strong>
					</div>
				
				
				
			</div>
						<div class='box-content'>
							<form class='form form-horizontal validate-form'
								action="ExclusiveReportBySearch" method="Get"
								style='margin-bottom: 0;' enctype="multipart/form-data">

												
								<div class='control-group'>
											<label class='control-label' for='validation_date'>From
												Date</label>
											<div class='controls'>
												<div>												
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='fromDate'
															name='fromDate' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span>
													</div>
												</div>
												<div class='controls'>
													<input class='form-control' data-rule-minlength='2'
														data-rule-required='true' id='sdpicker' name='sdpicker'
														type='hidden'>
												</div>
											</div>
										</div>
										
										<div class='control-group'>
											<label class='control-label' for='validation_date'>To Date</label>
											<div class='controls'>
												<div>
													
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='endDate'
															name='endDate' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time'></i>
														</span>
													</div>
												</div>
												<div class='controls'>
													<input class='form-control' data-rule-minlength='2'
														data-rule-required='true' id='sdpicker' name='sdpicker'
														type='hidden'>
												</div>
											</div>
										</div>
								
								
								<div class='form-actions' style='margin-bottom: 0'>
									<button class='btn btn-primary' type='submit'>Search</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: 20px;">
					<div class='span12 box'>
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-bottom='true'
										data-sorting='false' style='margin-bottom: 0;'>
										<thead>
											<tr>
												<th style='text-align: center; vertical-align: middle;'>Client
													Name</th>
												<th style='text-align: center; vertical-align: middle;'>Requirements</th>
												<th style='text-align: center; vertical-align: middle;'>Positions</th>
												<th style='text-align: center; vertical-align: middle;'>Profiles</th>												
												<th style='text-align: center; vertical-align: middle;'>To Client</th> 
											</tr>
										</thead>
										<tbody>	
										<c:forEach var="exclusiveReports" items="${exclusiveReportsList}">									
												<tr>
													<td>${exclusiveReports.getClient()}</td>
													<td>${exclusiveReports.getRequirements()}</td>
													<td>${exclusiveReports.getPositions()}</td>
													<td>${exclusiveReports.getProfiles()}</td>
													<td>${exclusiveReports.getToClient()}</td> 
													
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

<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>

<script>
	$(function() {
		var d = new Date();

		var month = d.getMonth() + 1;
		var day = d.getDate();

		var output = d.getFullYear() + '-'
				+ (('' + month).length < 2 ? '0' : '') + month + '-'
				+ (('' + day).length < 2 ? '0' : '') + day + " " + d.getHours()
				+ ":" + d.getMinutes() + ":" + d.getSeconds();

		$("#sdpicker").val(output);

	});
</script>
<script>
	$(function() {
		$("#sdpicker,#interviewTime").datepicker({
			dateFormat : 'yy-mm-dd'

		});
	});
</script>
<script>
	$(function() {
		$("#fromDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});
	});
</script>
<script>
	$(function() {
		$("#endDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'
		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {
		if (window.location.href.indexOf("storeJD") > -1) {
			$('#successmsg1').delay(1).fadeIn();
			$('#successmsg1').delay(2500).fadeOut();
		}
	});
</script>
</body>
</html>
