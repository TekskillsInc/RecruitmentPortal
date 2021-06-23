<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">

<section id='content'>
	<div class='container-fluid'>
		
					<div class='row-fluid' id='content-wrapper' style="margin-top:-220px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">Candidate EmailID's By Skills</Strong>
					</div>
				
				
				
			</div>
						
						
						
						
						<div class='box-content'>
						<form class='form form-horizontal validate-form'
								action="getmailsbyskill" method="GET"
								style='margin-bottom: 0;' >
						<!-- 	<form class='form form-horizontal validate-form'
								action="massmailingBySearch" method="GET"
								style='margin-bottom: 0;' > -->

								
								<div class='control-group' >
											<label class='control-label' for='validation_date'>Primary Skills</label>
											<div class='controls'>
												<div>												
													
														<input class='span6'  
															 id='primaryskills'
															name='primaryskills' placeholder='Enter Skill'
															type='text' required> <button class="btn btn-success btn-xs" style="background:#0b3c7c"type='submit'>Search</button>
													
												</div>
												
											</div>
										</div>
								<!-- 		
								<div class='form-actions' style='margin-bottom: 0'>
									<button class="btn btn-success btn-xs" style="background:#0b3c7c"type='submit'>Search</button>
								</div> -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<div class='container-fluid' style="margin-top: -15%">
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: 20px;">
					<div class='span12 box'>
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area' >
									<table class='data-table table table-bordered table-striped' style="width:100%"
										data-pagination-records='10' data-pagination-bottom='true'
										data-sorting='false' style="margin-bottom: 0;" id="sampletable"> 
										<input type="hidden" name="skill" id="skills" value="${skills}">
										<thead>
	                                    <tr style="background-color:lavender">
	                                    <th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Name</th>
	                                    <th style='text-align: center; vertical-align: middle;color:#000080;'>Mobile Numbers</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Email ID's</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Total Experience</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Location</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Notice Period</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Submitted Date</th>
										<th style='text-align: center; vertical-align: middle;color:#000080;'>Skill</th>
											
															
										</tr>
										</thead>
										<tbody>	
										<c:forEach var="list" items="${eList}">
										<tr>
										<td>${list.userName}</td>
										<td>${list.contact_number}</td>
										<td>${list.emailID}</td>
										<td>${list.total_experience}</td>
										<td>${list.workLocation}</td>
										<td>${list.noticeperiod}</td>
										<td>${list.resumeData}</td>
										<td id="skill">${list.primaryskill}</td>
										
										
										
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
	<%--  <center> <a href="downloadmassids?skills=${skills}" class="btn btn-success btn-xs" >Export to Excel</a></center> --%> 
</section>

<!-- / jquery -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<!-- <script type="text/javascript">$('#sampletable').DataTable();</script> -->
<script type="text/javascript">$('#sampletable1').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
	<script
	src="resources/assets/javascripts/jquery.timepicker.js"
	type="text/javascript"></script>
	<script
	src="resources/assets/javascripts/jquery.timepicker.min.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script
	src="resources/assets/javascripts/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js"
	type="text/javascript"></script>

<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
    <script src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js" type="text/javascript"></script>


<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>


<script>
var skill=$('#skills').val()
$('#sampletable').DataTable({
    dom: 'Bfrtip',
    buttons: [
        {
            extend: 'excelHtml5',
		title: skill,
		exportOptions : {columns : ':visible'}
        },
    ]
});
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
