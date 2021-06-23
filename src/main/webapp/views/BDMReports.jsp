<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.ckeditor.com/4.9.2/full/ckeditor.js"></script>
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
	media="all" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
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

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not (.active ) {
	background-color: cyan;
}
</style>

<section id='content'>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'
			style="margin-top: -220px;">
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

						<div class='box-header orange-background'
							style="line-height: 20px;">

							<div class='title' style="line: width:50px;">

								<Strong style="color: #000080; font-size: 25px;">View
									BDM Profiles</Strong>
							</div>



						</div>
						
								
				<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row">
							<div class="span12">
								<div class="well bs-component">
											
					<form action="bdreportbyclient" method="GET" onsubmit="return checkForm(this);">
						<fieldset>
														<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>
														<div class="span2">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>From
																	Date</label>
																<div class='datetimepicker input-append'
																	id='datetimepicker'>
																	<input class='span12' data-format='yyyy-MM-dd'
																		id='fromDate' name='fromdate'
																		placeholder='Select Date' type='text'>
																</div>
																<div class='controls'>
																	<input class='form-control' data-rule-minlength='0'
																		data-rule-required='true' id='sdpicker'
																		name='sdpicker' type='hidden'>
																</div>
															</div>
														</div>
														<div class="span2">
															<div class='control-group'>
																<label class='control-label' for='validation_date'>To
																	Date</label>															
																	<div class='datetimepicker input-append'
																		id='datetimepicker'>
																		<input class='span12' data-format='yyyy-MM-dd'
																			id='endDate' name='todate' placeholder='Select Date'
																			type='text'> 
																	</div>
																	<div class='controls'>
																		<input class='form-control' data-rule-minlength='0'
																			data-rule-required='true' id='sdpicker'
																			name='sdpicker' type='hidden'>
																	</div>
															</div>
														</div>
														<div class="span2">
															<label class='control-label'>Select Client</label> <select
																id="dynamic_select" name='clientname'
																style="width: 150px; height: 35px;"
																class="form-control text-center">
																<option value="">-- Select Client --</option>
																<c:forEach var="cname" items="${clients}">
																	<option value="${cname.cmpny_id}">${cname.cmpny_name}</option>
																</c:forEach>
															</select>
														</div>
														<div class="span2">
															<label class='control-label'>Select BDM</label> <select
																id="dynamic_select" name='bdname'
																style="width: 150px; height: 35px;">
																<option value="">-- Select BDM --</option>

																<c:forEach var="bd" items="${bdList}">
																	<option value="${bd.emp_number}">${bd.userName}</option>
																</c:forEach>
															</select>
														</div>
														<div class="span3">
															<div style='margin-bottom: 0; margin-top: 22px;'>
																<button class="btn btn-success btn-xs"
																	style="background: #0b3c7c;" type='submit'>Search</button>
															</div>
														</div>
										</fieldset>
												<!-- <button class="btn btn-primary icon-btn custom-resp-btn" type="submit" id="mysubmit" value="search" style="background:#0b3c7c;width:200px;height:34px;margin-left:60px;position: relative;    bottom: 3px;"> <strong><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong></button> -->
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
									<div class="pagination" style='display: block;'>
										<input type="hidden" id="jobId" value="${jobId}">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10' data-pagination-bottom='true'
											style='margin-bottom: 0;' id="sampletable2">
											<thead>
												<tr>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Job
														Code</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Job
														Description</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Job
														Category</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Skill</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BD
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Recruiter
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Candidate
														Name</th>
													 <th
														style='text-align: center; vertical-align: middle; color: #000080;'>Email
														ID</th> 
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Candidate
														Resume</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Number/Alt
														Number</th>
													
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>TL
														Name</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Tl
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>TL
														Comments</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Comments</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>SCT
														Cleared Date</th>



													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Mode
														of Interview</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Interview
														Date</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Interview
														Status</th>
													
													
													
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>
														BDm Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>
														Profile Status @ Client</th>
												
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>BDM
														Status</th>
													<th
														style='text-align: center; vertical-align: middle; color: #000080;'>Client
														Status</th> 

												
												


												</tr>
											</thead>
											<tbody>
												<c:forEach var="candidate"
													items="${viewcandidateinformationlist}">
													<tr>
														<td>${candidate.clientname}</td>
														<td>${candidate.jobCodeID}</td>
														<td><p
																style="text-align: initial; white-space: normal; width: 250px; overflow-y: scroll; overflow-x: hidden; height: 55px;">
																${candidate.jobdesc}</p></td>
														<td><strong><font color=blue>${candidate.jdCategory}</font></strong></td>
														<td>${candidate.skill}</td>
														<td>${candidate.bdname}</td>
														<td>${candidate.recname}</td>
														<c:set var = "string1" value = "${candidate.candidatename}"/>
														<c:set var = "string3" value = "${fn:split(string1, '_')}"/>
														
														<td>${string3[0]}</td>
														<td>${string3[1]}</td>
														<%-- <td>${candidate.emailid}</td> --%>
														<td><a
															href="${pageContext.request.contextPath}/download/${candidate.candidateId}.html"><i
																class="icon-file"></i></a></td>
														<td>${candidate.contactno}</td>
														
														<td>${candidate.tlname}</td>
														<td><strong><font color=blue>${candidate.tlstatus}</font></strong></td>
														<td><p
																style="text-align: initial; white-space: normal; width: 250px; overflow-y: scroll; overflow-x: hidden; height: 55px;">
																${candidate.tlcomments}</p></td>
														<td>${candidate.sctstatus}</td>


														<td>
															<div>
																<a
																	onclick="clickComment('${candidate.candidateId}','${candidate.jobid}')"
																	data-toggle='modal' href="#modal-upload">Comments</a>
															</div>
														</td>
														<td>${candidate.sctClearedDate}</td>
														

														<td>${candidate.modofinterview}</td>
														<td>${candidate.intrvdate}</td>
													<c:choose>
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

						

															<td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="updateBdmStatus('${candidate.candidateId}','${candidate.jobid}',
															'${candidate.tlempno}','${candidate.recempno}')" href='#modal-bdmStatus'>BDM Status </a></td>
															
														<c:choose>
															<c:when
																test='${(candidate.bdstatus == "To Client") && (candidate.clientinterviewstatus == "Scheduled") && (empty candidate.clientstatus) }'>

																<td><a class='btn btn-default btn-xs'
																	style="background: #2c7a41; color: white; text-shadow: none !important;"
																	data-toggle='modal'
																	onclick="updateBdmClientStatus('${candidate.candidateId}','${string3[0]}','${candidate.jobid}',
															,'${candidate.clientinterviewstatus}','${candidate.tlempno}','${candidate.recempno}')" href='#modal-bdmClientStatus'>Client Status </a></td>
															
																
															</c:when>
															<c:otherwise>
																<td><button class='btn btn-default btn-xs'>Client
																		Status</button></td>
															</c:otherwise>
														</c:choose> 

													
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class='modal hide fade' id='modal-upload' tabindex='-1'
										style="top: 0%; width: 700px; margin-left: -300px;">
										<div class="ckeditor">
											<div class='modal-header'>
												<center>
													<button class='close' data-dismiss='modal' type='button'>&times;</button>
													<h3>View Comments</h3>
												</center>

												<div class='modal-body'>

													<div style="margin-top: -8px;">
														<textarea id="scmnt" name='scmnt'
															data-rule-required='true' rows='1' class="ckeditor"
															class="form-control"></textarea>
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
				<br>
				<center>
					<button class="btn btn-success btn-xs" style="background: #0b3c7c"
						onclick="goBack()">Cancel</button>
				</center>
				<br>

			</div>
		</div>
	</div>



	

	<div class='modal hide fade' id='modal-bdmClientStatus' tabindex='-1'
		style="height: 50% !important;">
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' id="closemodel"
				type='button'>&times;</button>
			<h3>
				<i class="icon-user"></i> Update Client Status
			</h3>
		</div>
		<div class='modal-body'>
			<div class='row'>
				<div class='col-sm-12'>
					<div class='box'>
						<div class='box-padding'>
							<form class="form-horizontal" style="margin-bottom: 0;"
								method="post" action="update_BdmClientReportStatus"
								enctype="multipart/form-data" id="clntformid">

								<input type="hidden" id="cjobID" name="jobid"> <input
									type="hidden" id="cempLead" name="empLead"> <input
									type="hidden" id="csourcedBy" name="sourcedBy"> <input
									type="hidden" id="cbcandiId" name="candidateid"> <input
									type="hidden" id="canName1" name="candidateName"> <!-- <input
									type="hidden" id="cbdmName" name="bdName"> --> <input
									type="hidden" id="cinterviewStatus" name="cinterviewStatus">
								<!-- <input type="hidden" id="profileatclient" name="profileatclient"> -->
								<input type="hidden" id="clbdStatus" name="bdStatus">


								<div class='control-group'>

									<label class='control-label'>Update Status</label>
									<div class='controls'>
										<div>
											<select class="selectBox" id="clientStatusnew" name="cliStatus"
												onchange="changeReason()">
												<option value="">Update Status</option>
												<option value="No Show">No Show</option>
												<option value="Scheduled">Scheduled</option>
												<option value="Feedback Pending">Feedback Pending</option>
												<option value="Selected">Selected</option>
												<option value="Rejected">Rejected</option>
												<option value="On Hold">On Hold</option>
												<option value="Backfooted">Backfooted</option>
												<option value="Interviewed">Interviewed</option>
												<option value="On Boarded">On Boarded</option>
												<option value="Screen Rejected">Screen Rejected</option>
												<%-- <option value="${candidate.clientstatus}" selected>${candidate.clientstatus}</option>  --%>
											</select>
										</div>

									</div>
								</div>


								<div class='control-group' id='chooseReason'>
									<label class='control-label'>Reject Reason <span
										style="color: red">(*)</span></label>
									<div class='controls'>
										<select class='input-large' id="reject_reason"
											name="choosereject_reason">
											<option value=''>Select Reason</option>
											<option value='Technical Fitment'>Technical Fitment</option>
											<option value='Culture Fitment'>Culture Fitment</option>
											<option
												value='Duplicated ( Already submitted by other vendor )'>Duplicated
												( Already submitted by other vendor )</option>
											<option value='Experience Constraint'>Experience
												Constraint</option>
											<option value='Salary / Rate Constraint'>Salary /
												Rate Constraint</option>
											<option value='Comm Skills'>Comm Skills</option>
											<option value='Location Constraint'>Location
												Constraint</option>
											<option value='Not for Contract'>Not for Contract</option>
										</select>
									</div>
								</div>

								<div class='control-group' id="onbrdid">
									<label class='control-label' for='validation_date'>On-boarded
										Date</label>
									<div class='controls'>
										<div>
											<div class='datetimepicker input-append' id='datetimepicker1'>
												<input class='span12' data-format='yyyy-MM-dd'
													id='onBoardDatenew' name='onBoardDate'
													placeholder='Select Date' type='text'> <span
													class='add-on'> <i data-date-icon='icon-calendar'
													data-time-icon='icon-time'></i> 
												</span>
											</div>
										</div>

									</div>
								</div>


								<div class='control-group' id="txtArea">
									<label class='control-label'>Client Comments</label>
									<div class='controls'>
										<textarea id="clientcomment" name="clientcoment"
											pattern="[a-zA-Z][a-zA-Z0-9\s*]" data-rule-required='true'
											rows="3" cols="20" maxlength="75" required></textarea>
									</div>
								</div>
								<center>
									<button type="button" onclick="ClientSubmit()"
										class="btn btn-success btn-xs" style="background: #0b3c7c">SUBMIT</button>
								</center>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class='modal hide fade' id='modal-bdmStatus' tabindex='-1'
		style="height: 50% !important;">
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' id="closemodel"
				type='button'>&times;</button>
			<h3>
				<i class="icon-user"></i> Update BDM Status
			</h3>
		</div>
		<div class='modal-body'>
			<div class='row'>
				<div class='col-sm-12'>
					<div class='box'>
						<div class='box-padding'>
							<form class="form-horizontal" style="margin-bottom: 0;"
								method="post" action="update_BdmReportStatus"
								enctype="multipart/form-data" onsubmit="return checkForm(this);">

								<input type="hidden" id="bjobID" name="jobid"> <input
									type="hidden" id="empLead" name="empLead"> <input
									type="hidden" id="sourcedBy" name="sourcedBy"> 
									<input type="hidden" id="bdu_candidateid" name="bdu_candidateid">


								<div class='control-group'>
									<label class='control-label'>Update Status <span
										style="color: red">(*)</span></label>
									<div class='controls'>
										<select class="selectBox" id="bdchoseStatus"
											name="bdResltStatus" onchange="chooseBDStatus()" required>
											<option value="">Update Status</option>
											<option value="To Client">To Client</option>
											<option value="Rejected">Rejected</option>
											<option value="Screen reject">Screen reject</option>
											<option value="On Hold">On Hold</option>
											<option value="To Client-SCT Pending">To Client-SCT
												Pending</option>
											
										</select>

									</div>
								</div>
								<div class='control-group'>
									<label class='control-label'>BDM Comments</label>
									<div class='controls'>
										<textarea name="comment" id="bdcomentsid"
											pattern="[a-zA-Z][a-zA-Z0-9\s*]" data-rule-required='true'
											rows="5" cols="20" maxlength="75" required></textarea>
									</div>
								</div>

								<center>
									<button type="submit" id="bsubmit"
										class="btn btn-success btn-xs" style="background: #0b3c7c">SUBMIT</button>
								</center>
								<span id="bspan" style="color: red;"></span>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>




<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
<script src="resources/assets/javascripts/jquery-1.11.4-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<!-- <script type="text/javascript">$('#sampletable2').DataTable();</script>
<script type="text/javascript">$('#sampletable3').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script> -->
	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
<script src="resources/assets/javascripts/jquery.timepicker.js"
	type="text/javascript"></script>
<script src="resources/assets/javascripts/jquery.timepicker.min.js"
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

<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>
<script type="text/javascript">
	//$('#sampletable').DataTable();
	$('#sampletable2').DataTable({
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
            },
        ]
    }); 
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
function goBack(){
    //window.history.back();
	  window.close();
}
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

<script>
 function  changeReason(candidateid) {
  var clientstatus=$("#clientStatus"+candidateid).val();
 
    		
    		
    			
    			 if((clientstatus=='Rejected')||(clientstatus=='Screen Rejected')){
    				 $('#chooseReason'+candidateid).show();
        			 $('#txtArea'+candidateid).hide();
        		}
        	 else{
        		 $('#chooseReason'+candidateid).hide();
        		 $('#txtArea'+candidateid).show();
        		 
        			
        	 } 
    		
  };
    </script>

<script>
	function updateBdmStatus(candidateid,jobID,tlemp,recemp){
	
		 var bdStatus=$('#bdStatus'+candidateid).text();
		 var bdsName=$('#bdsName').text();
		 $('#bjobID').val(jobID);
		 $('#empLead').val(tlemp);
		 $('#sourcedBy').val(recemp);
		 $('#bdu_candidateid').val(candidateid);
		$('#modal-bdmStatus').show();
		
	}
		
	</script> 
    
    <script>
$('#chooseReason').hide();

/* $('#txtArea').hide(); */
 function  changeReason() {
  var clientstatus=$("#clientStatus1").val();

  			if(clientstatus=='On Boarded'){
			  $('#onbrdid').show(); 
			  $('#chooseReason').hide();  
			}  
  		else if((clientstatus=='Rejected')||(clientstatus=='Screen Rejected')){
  		//else if(clientstatus=='Screen Rejected'){  				
    				 $('#chooseReason').show();  
    				 $('#onbrdid').hide();       			 
        		}
        	 else{        	        		 
        		 $('#chooseReason').hide();
        		 $('#chooseReason').val('');
        		 //$('#onbrdid').hide(); 
        	 }     		
  }
    </script>
    
<script>
$('#onbrdid').hide(); 
		function ClientSubmit(){
			var clistatus=$('#clientStatusnew').val();
			
			
			var onBoardDate=$('#onBoardDatenew').val();
			var interviewStatus=$('#cinterviewStatus').val();

			var reject_reason=$('#reject_reason').val();
						
			if(clistatus==""){
				$("#clientStatusnew").attr("required", true);
				alert("Please select status");
				}
			 					
			/* else if((clistatus=='Scheduled')||(clistatus=='Backfooted')||(clistatus=='Interviewed')||(clistatus=='Selected')||(clistatus=='On Hold')||(clistatus=='No Show')||(clistatus=='Feedback Pending'))
				{
				if(interviewStatus=='Pending'){
					  alert("Interview status is "+interviewStatus+", please schedule interview");
				  }
				else{
					//alert("Interview status is :"+interviewStatus);
					document.getElementById("clntformid").submit();
					}		
				} */
			else if(clistatus=='On Boarded'){
				  var onBoardDate=$("#onBoardDate1").val();
				/*  if(interviewStatus=='Pending'){
					  //alert("Please schedule interview");
					 alert("Interview status is "+interviewStatus+", please schedule interview");
				  }
				  else  */if(onBoardDate==''){
					  $('#onbrdid').show(); 
					  alert("Please select On-Boarded date");
				  }
				  else{
					  document.getElementById("clntformid").submit();
					  //alert("Candidate already On-Boarded");
					  }
			}

			else if(clistatus=='Rejected'){ 
				var rj=$("#reject_reason").val();
				if(interviewStatus=='Pending'){
					  alert("Interview status is "+interviewStatus+", please schedule interview");
				  }
				//else{
					 
				else if(rj==""){
						 $("#reject_reason").attr("required", true);
						 alert("Please select reject reason");
						 }
					 else{
					 document.getElementById("clntformid").submit();
					 }
					//}	

			}
			else if(clistatus=='Screen Rejected'){  
				$('#chooseReason').show();  
				 $('#onbrdid').hide(); 
				 var rj=$("#reject_reason").val();
				 if(rj==""){
					 $("#reject_reason").attr("required", true);
					 alert("Please select reject reason");
					 
					 }
				 else{
				 document.getElementById("clntformid").submit();
				 }
			}
			else{
				 $('#chooseReason').hide();
        		 $('#chooseReason').val('');
        		 $('#onbrdid').hide(); 
				document.getElementById("clntformid").submit();
				}
			}
		</script>

<script>
function updateBdmClientStatus(candidateid,name,jobID,interviewStatus,empLead,sourcedBy){
	

		 var clintStatus=$('#clintStatus'+candidateid).text();
		 var bdStatus=$('#bdStatus'+candidateid).text();		 
		 var bdsName=$('#bdsName').text();

		 $('#cjobID').val(jobID);
		 $('#cempLead').val(empLead);
		 $('#csourcedBy').val(sourcedBy);
		 $('#cbcandiId').val(candidateid);
		 $('#canName1').val(name);
		 
		 $('#cinterviewStatus').val(interviewStatus);
		 
		
		 //$('#profileatclient').val(clintStatus);
		 
		 $('#clbdStatus').val(bdStatus);
		// $('#clientcomment').val(clintcomment);
		/*  if((clintStatus=='Rejected')||(clintStatus=='Screen Rejected')){  				
			 $('#chooseReason').show(); 
			 $('#reject_reason').val(cli_rej_reason);       			 
			}
		else{        	        		 
			 $('#chooseReason').hide();
			 }     
		  */
		$('#modal-bdmClientStatus').show();
		}

	$(function() {
		  $('#datetimepicker1').datetimepicker({
		   pickTime:false
		  });
		});

 	</script>
 	
 	
 	
 	
<script>
		function chooseBDStatus(){
			var bdchoseStatus=$('#bdchoseStatus').val();
			var bdResltStatus=$('#bdResltStatus').val();
			if(bdchoseStatus==bdResltStatus){
				$('#bspan').text('You already sumitted status as :'+bdResltStatus);
				$('#bsubmit').attr("disabled",true);	
				}
			else{
				$('#bspan').text('');
				$('#bsubmit').attr("disabled",false);
				}
			}
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
        	alert(response);
        
        	
        	CKEDITOR.instances.scmnt.setData(response);
        	
        },
        error: function(){  

        }
        
        }); 
  	  
  	  
    }

</script>
  <script type="text/javascript">
  function checkForm(form)
  {
    form.bsubmit.disabled = true;
    form.bsubmit.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.bsubmit.disabled = false;
    form.bsubmit.value = "Submit";
    form_being_submitted = false;
  }
</script>
</html>