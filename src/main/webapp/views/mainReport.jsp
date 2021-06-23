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

						<Strong style="color:#000080;font-size:25px;">View Master Reports</Strong>
					</div>
				
				</div>
				
		    	</div>
			
			
							
									<form class='form form-horizontal validate-form' id="formid" onsubmit="return checkForm(this);"
										action="getMasterReport" method="Get" style='margin-bottom: 0;' enctype="multipart/form-data">
																	
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
											<!-- <button class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit'>Search</button> -->
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

														<th style='text-align: center; vertical-align: middle;color:#000080; bgcolor="red";'>Client</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Type</th>
														<th style='text-align: center; vertical-align: middle;color:#000080; bgcolor="red";'>job Category</th>
														 <th style='text-align: center; vertical-align: middle;color:#000080;'>Account</th> 
														<th style='text-align: center; vertical-align: middle;color:#000080;'>BDM</th>
													    <th style='text-align: center; vertical-align: middle;color:#000080;'>Sender</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Requirement</th>																											
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Technology</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Positions</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Location</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Req -Lable</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Req -Priority</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Received Time</th>
														
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Team-Lead Name</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Assigned ON</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Assigned To</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Assigned ON</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Rec</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Consultant</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Consultant ContNo</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Time</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>ToLeads</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>P-Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT Team</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT ReceTime</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT RespTime</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Profile SubTime</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>SubmittedTo</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>P-No</th> 
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Interview Date</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Status</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Reject Reason</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Comment</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>On-board Date</th>
														<th style='text-align: center; vertical-align: middle;color:#000080;'>Requirement Status</th>							
														
													</tr>
												</thead>
												<tbody>
											 	<c:forEach var="masterReport" items="${mainDto.mainRerportList}">
														<tr>
															<td>${masterReport.client}</td>
															<td>${masterReport.type}</td>
															<td>${masterReport.jdCategory}</td>
															<td>${masterReport.account}</td>
															<td>${masterReport.bdm}</td>
															<td>${masterReport.sender}</td> 
															<td>${masterReport.requirement}</td>
															<td>${masterReport.technology}</td>
															<td>${masterReport.positions}</td>
															<td>${masterReport.locations}</td>
															<td>${masterReport.req_lable}</td>
															<td>${masterReport.priority}</td>
															<td>${masterReport.recievedTime}</td>
														
														 	
															<td>${masterReport.tlName}</td>
															<td>${masterReport.bdmAssignedON}</td>
															<td>${masterReport.assignedTo}</td>
															<td>${masterReport.tlAssignedON}</td>
															
															<td>${masterReport.rec}</td>
															<td>${masterReport.consultant}</td>
															<td>${masterReport.consultantContNo}</td>
															 
															<td>${masterReport.time}</td>
															<td>${masterReport.toLeads}</td>	
															<td>${masterReport.p_status}</td>
															<td>${masterReport.sctTeam}</td>
															<td>${masterReport.sctStatus}</td>
															<td>${masterReport.sctReceTime}</td>
															<td>${masterReport.sctRespTime}</td>
															<td>${masterReport.profileSubTime}</td> 
															<td>${masterReport.submittedTo}</td>
															<td>${masterReport.profileNo}</td> 
															<td>${masterReport.interviewDate}</td>			
															<td>${masterReport.candidateStatus}</td> 
															<td>${masterReport.rejectReason}</td>	
															<td>${masterReport.comment}</td>	
															<td>${masterReport.onboardingDate}</td>	
															<td>${masterReport.requirementStatus}</td>
														</tr>
															
													</c:forEach>
													</tbody>
											</table>										
									</div>
                             </div>
								</div>
							</div>
							</div>
							<center> <a href="ExportMasterReport?fromDate=${fromDate}&toDate=${toDate}" class="btn btn-success btn-xs" >Export to Excel</a></center>
							</div>
							</div>
							</div>
	</div></div></div></div>
	</div>
	</section>

	



	
<!-- 	<script type="text/javascript">$('#sampletable').DataTable();</script> -->


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
<!-- <script src="resources/assets/javascripts/multiple-select.js"></script> -->

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.17.1/moment-with-locales.min.js"></script>

<script>

function checkForm(form)
{
	var fd = $('#fromDate').val();
	var td = $('#endDate').val();
	var start = moment(fd);	
	var end = moment(td);
	var totdays=end.diff(start, "days");
	
	if(totdays>90){
		alert("You can't select more than 90 days");
		window.location.reload();
		return false;
		}
	else{
		 document.getElementById("formid").submit();
		}
}


</script>

	

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
