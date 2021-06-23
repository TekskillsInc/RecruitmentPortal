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

.dataTables_wrapper .dataTables_filter {
	margin: 10px 10px 5px 10px;
	float: right;
	margin-right: -40%;
}

background-color




:


 


#4CAF50




;
color




:


 


white




;
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
.table-report1 {
	position: relative !important;
	left: 30% !important;
	border-left: 1px solid #dddddd !important;
}

.dataTables_wrapper .dataTables_paginate {
	margin-right: -40%;
	margin-top: -6%;
	margin-bottom: 4%;
}

.dataTables_wrapper .dataTables_info {
	margin-top: 6%;
}
</style>

<style>
.ScrollStyle {
	height: auto;
	overflow: scroll;
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
									<Strong style="color: #000080; font-size: 25px;">
										Recruiters Report</Strong>
								</center>
							</div>

						</div>



						<div class="card">
							<div class="row">
								<div class="span12">
									<div class="well bs-component"
										style="position: relative; height: 60px;">
										<form action="ALLTL_reportbydate" method=get>
											<div class="span3">
												<div class='control-group'>
													<label class='control-label' for='validation_date'>From
														Date</label>
													<div class='controls'>
														<div>
															<div class='datetimepicker input-append'
																id='datetimepicker'>
																<input class='span12' data-format='yyyy-MM-dd'
																	id='fromDate' name='fromDate' placeholder='Select Date'
																	type='text' required> <span class='add-on'>
																	<i data-date-icon='icon-calendar'
																	data-time-icon='icon-time'></i>
																</span>
															</div>
														</div>
														<div class='controls'>
															<input class='form-control' data-rule-minlength='0'
																data-rule-required='true' id='sdpicker' name='sdpicker'
																type='hidden'>
														</div>
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
																	id='endDate' name='endDate' placeholder='Select Date'
																	type='text' required> <span class='add-on'>
																	<i data-date-icon='icon-calendar'
																	data-time-icon='icon-time'></i>
																</span>
															</div>
														</div>
														<div class='controls'>
															<input class='form-control' data-rule-minlength='0'
																data-rule-required='true' id='sdpicker' name='sdpicker'
																type='hidden'>
														</div>
													</div>
												</div>
											</div>
											<div class="span3">
												<div style='margin-bottom: 0;margin-top:22px;'>
													<button class="btn btn-success btn-xs"
														style="background: #0b3c7c;"
														type='submit'>Search</button>
												</div>
											</div>

										</form>

									</div>
								</div>
							</div>
						</div>

						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<div class="pagination">
										<table
											class='data-table table table-bordered table-striped table-report1'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
												<tr>
													<th style='text-align: center; color: #000080;'>TL
														Name</th>
													<th style='text-align: center; color: #000080;'>Recruiter
														Name</th>
													<th style='text-align: center; color: #000080;'>Recruiter
														Sub Count</th>
													<th style='text-align: center; color: #000080;'>SCT
														Cleared Count</th>
													<th style='text-align: center; color: #000080;'>Client
														Status</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="tlList" items="${tlList}">
													<tr>
														<td>${tlList.tlname}</td>
														<td><a class='fa fa-download' href='#modal-recData'
															data-toggle='modal' style="color: darkblue;"
															onclick="getRecSubData('${tlList.recname}','${tlList.recEmpno}','${tlList.tlname}','${tlList.tlemp}','${fromdate}','${todate}')">
																${tlList.recname}</a></td>
														<td>${tlList.recruiterSubmiitedCount}</td>
														<td>${tlList.sctclearedCount}</td>
														<td>${tlList.clientstatus}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<div class='modal hide fade' id='modal-recData' tabindex='-1'>
										<div class='ScrollStyle'>
											<div class='modal-header'>

												<button class='close' data-dismiss='modal' type='button'>&times;</button>
												<center>
													<h5 id='recName' style="color: red;"></h5>
													<h5 id='recName' style="color: red;"></h5>
												</center>
											</div>
											<div class='modal-body'>
												<div class='scrollable-area'>
													<table id="skilltable"
														class='data-table table table-bordered table-striped'
														data-pagination-records='10'
														data-pagination-top-bottom='true'
														style='margin-bottom: 0;'>
														<thead>
															<tr>

																<th style='text-align: center;'>Job Code</th>
																<th style='text-align: center;'>Client Name</th>
																<th style='text-align: center;'>Recruiter Sub Count</th>
																<th style='text-align: center;'>SCT Cleared Count</th>
																<th style='text-align: center;'>ClientStatus</th>
															</tr>
														</thead>
														<tbody id="skillrow">
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

<!-- 
    <script>
    function getJDbyClient(){
    	var cid=$('#clientname').val();
    	
    	$.ajax({
            type: "get",
            url: "view_jdbyclid?compid="+cid,
            cache: false,
            async: false,               
            success: function(response){
            	$('#jobid').empty();
            	for(var i=0;i<response.length;i++){
            		
                		
               		 $('#jobid').append($('<option/>').attr("value", response[i].jobdescid).text(response[i].jobCode));
            		
            	}
               
             
            	
            },
            error: function(){  
            	//alert("failure");
            }            
    	});
    }
    
    </script> -->
<script>
	function getRecSubData(recname, recempno, tlname, tlemp, fromdate, enddate) {

		$.ajax({
			type : "POST",
			url : "getRecSubmissionByjob?recempno=" + recempno + "&tlemp="
					+ tlemp + "&recname=" + recname + "&tlname=" + tlname
					+ "&fromdate=" + fromdate + "&enddate=" + enddate,

			cache : false,
			async : false,
			success : function(response) {
				$('#skillrow').empty();
				$('#tlName').empty();
				$('#recName').empty();
				for (var i = 0; i < response.length; i++) {

					/* $('#tlName').text("Teamlead Name--"+response[i].tlName); */
					$('#recName')
							.text("Recruiter Name--" + response[i].recName);
					var tr = "<tr><td>" + response[i].jobcode + "</td>"
							+ "<td>" + response[i].companyname + "</td>"
							+ "<td>" + response[i].recsub + "</td>" + "<td>"
							+ response[i].sctCleared + "</td>" + "<td>"
							+ response[i].clientCleared + "</td></tr>";
					$('#skillrow').append(tr);

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