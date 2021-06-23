<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
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
    border-radius:50%;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
		<section id='content'>
			<div class='container-fluid'>
			<div class='row-fluid' id='content-wrapper' style="margin-top:-180px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">View BD Reports</Strong>
					</div>
				
				</div>
				
		    	</div>
			
									<form class='form form-horizontal validate-form'
										action="getBDMReport" method="Get" style='margin-bottom: 0;' enctype="multipart/form-data">
																	
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
											
											<button class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit'>Search</button>
										</div>
										</form>
								</div>
								
							</div>
						</div>
					</div>
					
			
				<div class='box-content'>
								<div class='responsive-table'>
								<div class='scrollable-area'>
								<div class="pagination">
			<div class='container-fluid'>
			<div class='row-fluid' id='content-wrapper'>
					<div class='span12'>										
						<div class='row-fluid' style="margin-top: 20px;">
			<div class='span12 box'>
			<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
								  <div class="pagination">
									<table class='data-table table table-bordered table-striped'
                                                data-pagination-records='10' data-pagination-bottom='true'
                                                 style='margin-bottom: 0;' id="sampletable">

												<thead>
 
													<tr style="background-color:lavender">

                                                       <!--  <th style='text-align: center; vertical-align: middle;color:#000080; bgcolor="red";'>S.no</th> -->
														<th style='text-align: center; vertical-align: middle;color:#000080; bgcolor="red";'>RequirementID</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Client</th>
														<th style='text-align: center; vertical-align: middle;color:#000080; bgcolor="red";'>Name of the Candidate</th>
														 <th style='text-align: center; vertical-align: middle;color:#000080;'>Contact Number </th> 
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Skills</th>
													    <th style='text-align: center; vertical-align: middle;color:#000080;'>BD Name</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Team Lead</th>																											
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Recruiter</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Resume Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Interview Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SAT Member Name</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SAT Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Exemption Approved </th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Onboarding status & Date</th>
													</tr>
												</thead>
												<tbody>
											  <c:forEach var="BDMReport" items="${mainDto.BDMReportList}"> 
														<tr>
															<td>${BDMReport.requirement}</td>
															<td>${BDMReport.client}</td>
															<td>${BDMReport.consultant}</td>
															<td>${BDMReport.consultantContNo}</td>
															<td>${BDMReport.technology}</td>
															<td>${BDMReport.bdm}</td> 
															<td>${BDMReport.tlName}</td>
															<td>${BDMReport.rec}</td>
															<td>${BDMReport.p_status}</td>
															<td>${BDMReport.candidateStatus}</td>
															<td>${BDMReport.sctTeam}</td>
															<td>${BDMReport.sctStatus}</td>
															<td>${BDMReport.comment}</td>
															<td>${BDMReport.onboardingDate}</td>
														
														 	<!-- 
															<td></td> -->
															
														</tr>
															
												 </c:forEach>
													</tbody>
											</table>										
									</div>
                             </div>
								</div>
							</div>
							</div>
							<div style="text-align:center">
	 <a href="ExportBDMReport?fromDate=${fromDate}&toDate=${toDate}" class="btn btn-info btn-xs" >Export to Excel </a>
	 </div>
							</div>
							</div>
							</div>
	</div></div></div></div>
	</div>
	</section>

	



	



<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
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
<script src="resources/assets/javascripts/multiple-select.js"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>




	

	<script>
  $(function() { 
    var d = new Date();

    var month = d.getMonth()+1;
    var day = d.getDate();

    var output =  d.getFullYear()+'-'+((''+month).length<2 ? '0' : '') + month +'-'+
    ((''+day).length<2 ? '0' : '') + day+ " "
    + d.getHours() + ":" 
           + d.getMinutes() + ":" + d.getSeconds();
       
       
    $( "#sdpicker").val(output);
    
  });

 </script>
  <script>
  $( function() {
    $( "#sdpicker,#interviewTime" ).datepicker({
         dateFormat: 'yy-mm-dd' 
        
    });
  } );
  </script>
<script>
  $( function() {
    $( "#fromDate" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd' 
    });
  } );
  </script>
<script>
  $( function() {
    $( "#endDate" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd'
    });
  } );
  </script>
	
	
	<script type="text/javascript">
		$(document).ready(function() {
		 	if(window.location.href.indexOf("storeJD") > -1) {
			       $('#successmsg1').delay(1).fadeIn();
			       $('#successmsg1').delay(2500).fadeOut();
		    }		 	
		});	
	</script>
</body>
</html>
