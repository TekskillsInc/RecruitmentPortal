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

						<Strong style="color:#000080;font-size:25px;">View Audit Report</Strong>
					</div>
				
				
				
			</div>
						<div class='box-content'>
							<form class='form form-horizontal validate-form'
								action="auditReportBySearch" method="GET"
								style='margin-bottom: 0;' >

								
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
								<div class='scrollable-area' ><!-- style="overflow-y:scroll;" -->
									<table class='data-table table table-bordered table-striped' style="width:50%"
										data-pagination-records='10' data-pagination-bottom='true'
										data-sorting='false' style="margin-bottom: 0;"> 
										<thead>
	                                    <tr style="background-color:lavender">
											<th style='text-align: center; vertical-align: middle;'>Audit Summary Report</th>
											<th style='text-align: center; vertical-align: middle;'>Count</th>						
										</tr>
										</thead>
										<tbody>	
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Total Received Requirements </th>
											<td style="vertical-align: top; width: 242px;">${auditsList.getThisweekReqsCount()}</td>						
										</tr>
										 <tr>
											<th style='text-align: center; vertical-align: middle;'>Re-Cycled Requirements</th>
											<td style="vertical-align: top; width: 242px;">${auditsList.getRecycleReqsCount()}</td>
										</tr> 
										<tr>
											<th style='text-align: center; vertical-align: middle;'>New Req's Count</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getNewReqCount()}</td>
										</tr>	
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Ongoing  Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getOnGoingCount()}</td>
										</tr>	
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Exclusive Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getExclusiveReqCount()}</td>
										</tr>
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Complex Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getComplexReqCount()}</td>
										</tr>
										
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Total Working Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getTotalWorkingReqCount()}</td>
										</tr>
										
										<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>Old Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getOldReqCount()}</td>
										</tr> 
											<tr>
											<th style='text-align: center; vertical-align: middle;'>Idle Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getIdleReqsCount()}</td>
										</tr>
										<tr>
											<th style='text-align: center; vertical-align: middle;'>No Submissions @ Last Week</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getNoSubmissionReq()}</td>
										</tr>--%>
										
										<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>Working Requirements @This week</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getTotalWorkingReqCount()}</td>
										</tr> --%>
										
										<tr>
											<th style='text-align: center; vertical-align: middle;'>Not Working Requirements </th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getNotworkingReqCount()}</td>
										</tr>
										
												<tr>
											<th style='text-align: center; vertical-align: middle;'>No Submissions requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getNoSubmissionReq()}</td>
										</tr>
										
											<tr>
											<th style='text-align: center; vertical-align: middle;'>Idle Requirements </th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getIdleReqthisweekCount()}</td>
										</tr>
										
										<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA Reached requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getsLAReachedreqCount()}</td>
										</tr>
										
										
											<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA not met Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getSlaNotReachedreqsCount()}</td>
										</tr>
										
										<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA Not Applicable requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getSlaNotReachedreqsCount()}</td>
										</tr>
										
											
										<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>External SLA reached Profiles</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getExtSLAreachedProfilesCount()}</td>
										</tr>	 --%>
										
										<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>Internal SLA reached Profiles</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getSlaInternalReachedProfilesCount() }</td>
										</tr> --%>	
										
										
											<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA Reached Profiles @All</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getsLAReachedProfilesAllCount()}</td>
										</tr>		
										
											<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA not reached Profiles</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getsLAnotreachedProfilesCount()}</td>
										</tr>	
										
										<%-- 
											<tr>
											<th style='text-align: center; vertical-align: middle;'>SLA not applicable Profiles</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getsLAnotapplicableProfilesCount()}</td>
										</tr>	
								 --%>
									<tr>
											<th style='text-align: center; vertical-align: middle;'>Total No. of Positions</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getTotalnooofpositionCount()}</td>
										</tr>	
									<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>SLA % on Working Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getSlaperonNoOfTotalReqsCount()}</td>
										</tr> --%>	
									
											<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>SLA % on Working Requirements</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getSlaperonNoOfWorkingReqsCount()}</td>
										</tr>	 --%>	
										
											<%-- <tr>
											<th style='text-align: center; vertical-align: middle;'>% of Requirements tapped</th>
										 	<td style="vertical-align: top; width: 242px;">${auditsList.getPerReqsTappedCount()}%</td>
										</tr>	 --%>
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
	<center> <a href="exportAuditReports?fromDate=${fromDate}&toDate=${toDate}" class="btn btn-success btn-xs" >Export to Excel</a></center>
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
</body>
</html>
