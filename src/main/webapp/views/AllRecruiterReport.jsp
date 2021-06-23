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

						<Strong style="color:#000080;font-size:25px;">All Recruiters Submissions Report</Strong>
					</div>
				
				
				
			</div>
						
						<div class='box-content'>
							<form action="getAllRecReports" method="get">
							            <div class='control-group'>
											<label class='control-label' for='validation_date'>FromDate(*)</label>
											<div class='controls'>
												<div>
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='fromDate'
															name='fd' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span>
													</div>
												</div>
												
											</div>
										</div>
										<div class='control-group'>
											<label class='control-label' for='validation_date'>To Date(*)</label>
											<div class='controls'>
												<div>
													
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='endDate'
															name='ed' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span>
													</div>
												</div>
												
											</div>
										</div>
								
								<div class='form-actions' style='margin-bottom: 0'>
									<input type="submit" value="search" class='btn btn-primary' ><!-- onclick="getWeeklySub()" -->
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
					<div class='span12 box'  id="span12_box"><!-- style="display:none;" -->
					
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
								
									<table id="mytable" class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-bottom='true'
										data-sorting='false' style='margin-bottom: 0;' >
										<thead>
											<tr style="background-color:lavender">
												<th style='text-align: center; vertical-align: middle;'>Recruiter</th>
												<th style='text-align: center; vertical-align: middle;'>Team Lead</th>
												<th style='text-align: center; vertical-align: middle;'>Manager</th>
												<th style='text-align: center; vertical-align: middle;'>Int-Sub</th>
												<th style='text-align: center; vertical-align: middle;'>CLI_sub</th>
												<th style='text-align: center; vertical-align: middle;'>Assigned Reqs</th>
												<th style='text-align: center; vertical-align: middle;'>Tapped Reqs</th>
												<th style='text-align: center; vertical-align: middle;'>Re-Cycled</th>
												<th style='text-align: center; vertical-align: middle;'>6 HR SLA</th>
												<th style='text-align: center; vertical-align: middle;'>24 HR SLA</th>
												 
											</tr>
										</thead>
										<tbody id="tbody">
										<c:forEach var="rec_report" items="${recruiterReportlist}"> 
										<tr>
										 <td>${rec_report.recName}</td>
										 <td>${rec_report.teamlead}</td>
										 <td>${rec_report.manager}</td>
										 <td>${rec_report.int_sub}</td>
										 <td>${rec_report.cliSub}</td>
										 <td>${rec_report.assignedReq}</td>
										 <td>${rec_report.tappedReq}</td>
										 <td>${rec_report.recyReq}</td>
										 <td>${rec_report.sixHours}</td>
										 <td>${rec_report.for24Hours}</td>
										</tr>
										</c:forEach>
											<tr>
										       <td style="background-color:crimson">Total</td>
										       <td style="background-color:crimson">submissions</td>
										       <td>--</td>
										       <td>${rdtoCount.intSubCount}</td>
										       <td>${rdtoCount.cliSubCount}</td>
										       <td>${rdtoCount.assReqCount}</td>
										       <td>${rdtoCount.tappedReqCount}</td>
										       <td>${rdtoCount.recReqCount}</td>
										       <td>${rdtoCount.hr6SlaCount}</td>
										       <td>${rdtoCount.hr24SlaCount}</td>
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
		<br>
        <center> <a href="exportAllRecReports?fromDate=${fromDate}&toDate=${toDate}" class="btn btn-success btn-xs" >Export to Excel</a></center>
                            </div>

</section>



<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>



<script>
	$(function() {
		$("#fromDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'dd-mm-yy',
				onSelect: function(selected) {
					  $("#endDate").datepicker("option","minDate", selected)
					  }
		});
	});
</script>
<script>
	$(function() {
		$("#endDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'dd-mm-yy',
				onSelect: function(selected) {
					  $("#fromDate").datepicker("option","maxDate", selected)
					  }
		});
	});
</script>




</body>
</html>
