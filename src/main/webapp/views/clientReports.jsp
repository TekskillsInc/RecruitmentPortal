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

						<Strong style="color:#000080;font-size:25px;">View Client Report</Strong>
					</div>
			</div>
								<div class='box-content'>
									<form class='form form-horizontal validate-form'
										action="clientReportBySearch" method="Get" style='margin-bottom: 0;' enctype="multipart/form-data">
																	
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
 
													<tr style="background-color:lavender">

														<th style='text-align: center; vertical-align: middle; bgcolor="red";'>Client Name</th>
														<th style='text-align: center; vertical-align: middle;'>Total Requirements</th>
														 <th style='text-align: center; vertical-align: middle;'>ReCycle</th> 
														<th style='text-align: center; vertical-align: middle;'>Working</th>
													<th style='text-align: center; vertical-align: middle;'>Not Working</th>
														<th style='text-align: center; vertical-align: middle;'>No Submission</th>																											
														<th style='text-align: center; vertical-align: middle;'>Idle</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="jdCList" items="${jdCountList}">

														<tr>
															<td>${jdCList.cname}</td>
															<td>${jdCList.jcount}</td>
															<td>${jdCList.recycount}</td>
															<td>${jdCList.wcount}</td>
															<td>${jdCList.nwcount}</td> 
															<td>${jdCList.nscount}</td>
															<td>${jdCList.icount}</td>																																		
														</tr>
													</c:forEach>
												
												
													<tr>

															<td>Total</td>
															<td>${totalCountDTO.totaljcount}</td>	
															<td>${totalCountDTO.totalrecycount}</td>
															<td>${totalCountDTO.totalwcount}</td>	
															<td>${totalCountDTO.totalnwcount}</td>
															<td>${totalCountDTO.totalnscount}</td> 
															<td>${totalCountDTO.totalicount}</td>
														
														
														
													</tr> 
											</tbody>

												
											</table>										
									</div>

								</div>

							</div>
							
                            
							</div>
							<center> <a href="exportClientReport?fromDate=${fromDate}&toDate=${toDate}" class="btn btn-success btn-xs" >Export to Excel</a></center>
							</div>
							</div>
							</div>
	</div>
	</section>
	
<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>

	<!-- / jquery -->
	<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript">
</script>
<script src="resources/assets/javascripts/plugins/datatables/dataTables.bootstrap.min.js"
type="text/javascript">
	</script>
	<script type="text/javascript">$('#sampletable').DataTable();</script>
	<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"
	type="text/javascript"></script>

<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
	
<script
	src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script
	src="resources/assets/javascripts/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>

	<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
	<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js" type="text/javascript"></script>





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
