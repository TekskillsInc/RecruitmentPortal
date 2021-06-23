<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.9.2/full/ckeditor.js"></script> 
 <link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
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
    border-radius:50%;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: cyan;}
</style>

<section id='content'>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper' style="margin-top:-220px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">View SCT Status Profiles</Strong>
					</div>
				
			</div>
			
				<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
											
		 			<form action="profilessctdates" method="GET" onsubmit="return checkForm(this);">
		 				<fieldset>
														<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>
														<div class="span3">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>From
																	Date</label>
																<div class='datetimepicker input-append'
																	id='datetimepicker'>
																	<input class='span12' data-format='yyyy-MM-dd'
																		id='fromDate' name='fromdate'
																		placeholder='Select Date' type='text'
																		value='${fromdate}'> <span class='add-on'>
																		<i data-date-icon='icon-calendar'
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
																		<div class='datetimepicker input-append'
																			id='datetimepicker'>
																			<input class='span12' data-format='yyyy-MM-dd'
																				id='endDate' name='todate' placeholder='Select Date'
																				type='text' value='${todate}'> <span
																				class='add-on'> <i
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
															<div style='margin-bottom: 0; margin-top: 22px;'>
																<button class="btn btn-success btn-xs"
																	style="background: #0b3c7c;" type='submit'>Search</button>
															</div>
														</div>
													</fieldset>
											<!-- 	<button class="btn btn-primary icon-btn custom-resp-btn" type="submit" id="mysubmit" value="search" style="background:#0b3c7c;width:200px;height:34px;margin-left:60px;position: relative;    bottom: 3px;"> <strong><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong></button> -->
                                             </form>
                                             
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
								 <div class="pagination" style='display:block;'>
									<input type="hidden" id="jobId" value="${jobId}">
									<table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-bottom='true'
										 style='margin-bottom: 0;'	id="reportsTable">
										<thead>
											<tr>
											<th style='text-align: center; vertical-align: middle;color:#000080;'>Client Name</th>
											<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT Cleared Date</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>BD Name</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Job Description</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Job Category</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Resume</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Candidate Name</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Number/Alt Number</th>
												
												<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT Status</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>SCT Comments</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>BD Comments</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Tl Status</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>TL Comments</th>
												
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Recruiter Name</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>TL Name</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Email ID</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Skill</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Mode of Interview</th>
												<th style='text-align: center; vertical-align: middle;color:#000080;'>Interview Date</th>
												
												
													  
											</tr>
										</thead>
							<tbody>
							
							<c:forEach var="candidate"
													items="${viewcandidateinfolist}">
													<tr>
														<td>${candidate.clientname}</td>
														<td>${candidate.sctClearedDate}</td>
														<td>${candidate.bdname}</td>
													<%-- 	<td>${candidate.jobCodeID}</td> --%>
														<td><p
																style="text-align: initial; white-space: normal; width: 250px; overflow-y: scroll; overflow-x: hidden; height: 55px;">
																${candidate.jobdesc}</p></td>
														<td><strong><font color=blue>${candidate.jdCategory}</font></strong></td>
														<td><a
															href="${pageContext.request.contextPath}/download/${candidate.candidateId}.html"><i
																class="icon-file"></i></a></td>
														
														<c:set var = "string1" value = "${candidate.candidatename}"/>
														<c:set var = "string3" value = "${fn:split(string1, '_')}"/>
														
														<td>${string3[0]}</td>
															<td>${candidate.contactno}</td>
														
														<td>${candidate.sctstatus}</td>
															<td>
															<div>
																<a
																	onclick="clickComment('${candidate.candidateId}','${candidate.jobid}')"
																	data-toggle='modal' href="#modal-upload">Comments</a>
															</div>
														</td>
														
														<td><p
																style="text-align: initial; white-space: normal; width: 250px; overflow-y: scroll; overflow-x: hidden; height: 55px;">
																${candidate.bdcomments}</p></td>
														
													
														<td><strong><font color=blue>${candidate.tlstatus}</font></strong></td>
														<td><p
																style="text-align: initial; white-space: normal; width: 250px; overflow-y: scroll; overflow-x: hidden; height: 55px;">
																${candidate.tlcomments}</p></td>
																
														<td>${candidate.recname}</td>
														<td>${candidate.tlname}</td>
														<td>${string3[1]}</td>
														<td>${candidate.skill}</td>
														<td>${candidate.modofinterview}</td>
														<td>${candidate.intrvdate}</td>
														
														
														
														
													<%-- <c:choose>
															<c:when
																test='${empty candidate.clientinterviewstatus}'>
																<td style="color: Black;"
																	id="intvwstat${candidate.candidateId}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.clientinterviewstatus=="Scheduled"}'>
																<td style="color: green;"
																	id="intvwstat${candidate.candidateId}"><b>${candidate.clientinterviewstatus}</b></td>
															</c:when>
															<c:otherwise>
																<td style="color: red;"
																	id="intvwstat${candidate.candidateId}"><b>${candidate.clientinterviewstatus}</b></td>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when test='${empty candidate.bdstatus}'>
																<td style="color: Black;"
																	id="bdStatus${candidate.candidateId}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.bdstatus=="To Client"}'>
																<td style="color: green;"
																	id="bdStatus${candidate.candidateId}"><b>${candidate.bdstatus}</b></td>
															</c:when>
															<c:when
																test='${candidate.bdstatus!="Selected"}'>
																<td style="color: red;"
																	id="bdStatus${candidate.candidateId}"><b>${candidate.bdstatus}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>

														<c:choose>
															<c:when
																test='${empty candidate.clientstatus}'>
																<td style="color: Black;"
																	id="clintStatus${candidate.candidateId}"><b>N/A</b></td>
															</c:when>
															<c:when
																test='${candidate.clientstatus=="Selected"}'>
																<td style="color: green;"
																	id="clintStatus${candidate.candidateId}"><b>${candidate.clientstatus}</b></td>
															</c:when>
															<c:when
																test='${candidate.clientstatus!="Selected"}'>
																<td style="color: orange;"
																	id="clintStatus${candidate.candidateId}"><b>${candidate.clientstatus}</b></td>
															</c:when>

															<c:otherwise>
															</c:otherwise>
														</c:choose>

						
 --%>



														<%-- <td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="updateBdmStatus('${candidate.candidateId}',
																	'${candidate.candidateInfo.first_name}','${candidate.jobid}',
																	'${candidate.interevieDetails.clientinterview}',
																	'${candidate.empl_lead}','${candidate.sourcedBy}',
																	'${candidate.candidateStatusObj.bdmComment}')"
															href='#modal-bdmStatus'>BDM Status </a></td> --%>

												<%-- 		<c:choose>
															<c:when
																test='${candidate.bdstatus=="To Client"}'>

																<td><a class='btn btn-default btn-xs'
																	style="background: #2c7a41; color: white; text-shadow: none !important;"
																	data-toggle='modal'
																	onclick="updateBdmClientStatus('${candidate.candidateId}',
																	'${candidate.candidateInfo.first_name}','${candidate.jobid}',
																	'${candidate.interevieDetails.clientinterview}',
																	'${candidate.empl_lead}','${candidate.sourcedBy}',
																	'${candidate.candidateStatusObj.onBoardDate}',
																	'${candidate.candidateStatusObj.clientComment}',
																	'${candidate.candidateStatusObj.rejectReason}')"
																	href='#modal-bdmClientStatus'>Client Status </a></td>
															</c:when>
															<c:otherwise>
																<td><button class='btn btn-default btn-xs'>Client
																		Status</button></td>
															</c:otherwise>
														</c:choose> --%>

													
													</tr>
												</c:forEach>
							
							
								<%-- <c:forEach var="candidate" items="${viewcandidateinfolist}">
									<tr>
									<td>${candidate.clientname}</td>
									<td>${candidate.sctClearedDate}</td> 
									<td>${candidate.bdname}</td>
									<td><p style="text-align:initial;white-space:normal;width:250px;overflow-y:scroll;overflow-x:hidden;height:55px;">
									${candidate.jobdesc}</p></td>
									<td><strong><font color=blue>${candidate.jdCategory}</font></strong></td>
									
									  <td> <a href="${pageContext.request.contextPath}/download/${candidate.canid}.html"><i class="icon-file"></i></a></td>
									<td>${candidate.candetails}</td>
									<td>${candidate.cnctno}</td>
									<td><strong><font color=blue>${candidate.tlstatus}</font></strong></td>
									
									<td>${candidate.sctstatus}</td>
									<td><p style="text-align:initial;white-space:normal;width:250px;overflow-y:scroll;overflow-x:hidden;height:55px;">
									${candidate.sctcomments}</p></td>
									<td>
									 <div>
                                      <a onclick="clickComment('${candidate.canid}','${candidate.jobid}')"
                                      data-toggle='modal' href="#modal-upload">Comments</a>
                                      </div>
									</td>
									<td><p style="text-align:initial;white-space:normal;width:250px;overflow-y:scroll;overflow-x:hidden;height:55px;">
									${candidate.bdcomments}</p></td>
									<td><p style="text-align:initial;white-space:normal;width:250px;overflow-y:scroll;overflow-x:hidden;height:55px;">
									${candidate.tlcomments}</p></td>
									<td><p style="text-align:initial;white-space:normal;width:250px;overflow-y:scroll;overflow-x:hidden;height:55px;">
									
									<td>${candidate.recname}</td>
									<td>${candidate.tlname}</td>
									
									<td>${candidate.emailid}</td>
									<td>${candidate.skill}</td>
									<td>${candidate.modofinterview}</td>
									<td>${candidate.intrvdate}</td>
									
									
								
										
									</tr>
								</c:forEach> --%>
							</tbody>
									</table>
									</div>
									</div>
									</div>
									</div>
									
									
										<div class='modal hide fade' id='modal-upload'	tabindex='-1' style="top:0%;width:700px;margin-left:-300px;">
                                            <div class="ckeditor">
										<div class='modal-header'>
											<center><button class='close' data-dismiss='modal' type='button'>&times;</button><h3>View Comments</h3></center>
										
										<div class='modal-body'>
											
											<div style="margin-top:-8px;">
											<textarea id="scmnt" name='scmnt'   data-rule-required='true' rows='1' class="ckeditor" class="form-control" ></textarea>
										</div>
										</div>
										
										 </div>
										 
									</div></div>

								
</div>
									</div>
									</div>
									</div>
									</div>
									</section>
		
									
									

									
	<script src="resources/assets/javascripts/jquery-2.1.4.min.js"></script>

<!-- <script src="resources/assets/javascripts/jquery-1.10.2.js"></script> -->
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>


<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<!--  <script type="text/javascript">$('#reportsTable').DataTable();</script>

<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script> -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
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

<script>
					$(document).ready(function() {
						var d=new Date();
						/* $('#reportsTable').DataTable({
							dom : 'Bfrtip',
							buttons : [
							{
								extend : 'excelHtml5',
								title: 'SCTReport_'+d,
								exportOptions : {
									columns : ':visible'
								}
							},
							'colvis' ]
						}); */
						$('#reportsTable').DataTable({
					        dom: 'Bfrtip',
					        buttons: [
					            {
					            	title: 'SCTReport_'+d,
					                extend: 'excelHtml5',
					            },
					        ]
					    }); 
					});
				</script>
 <script type="text/javascript">
    function clickComment(canid,jobid)
    {
 	$.ajax({
    	type: "POST",
        url: "viewSCT_Comments?jobid="+jobid+"&candidateid="+canid,
        cache: false,
        async: false,               
        success: function(response){
        	
        	CKEDITOR.instances.scmnt.setData(response);
        	
        },
        error: function(){  

        }
        
        }); 
  	  
  	  
    }

</script>

</html>