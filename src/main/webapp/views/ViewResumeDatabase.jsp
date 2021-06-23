<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/jquery.timepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
</head>


<section id='content'>
	<div class='container-fluid'>

		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

						<div class='box-header orange-background'
							style="line-height: 20px;">

							<div class='title' style="line: width:50px;">

								<Strong style="color: #000080; font-size: 25px;">Resume
									Database</Strong>
							</div>



						</div>
						<div class='box-content'>
							<form class='form form-horizontal validate-form'
								action="resumedatabaseBySearch" method="GET"
								style='margin-bottom: 0;'>


								<div class='control-group'>
									<label class='control-label' for='validation_date'>Primary
										Skills</label>
									<div class='controls'>
										<div>

											<input class='span6' id='primaryskills' name='primaryskills'
												placeholder='Enter Skill' type='text' required>
											<button type='submit' class="btn btn-success btn-xs"
												style="background: #0b3c7c" style="background: #0b3c7c">Search</button>
											<!-- <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span> -->

										</div>

									</div>
								</div>
								<!-- 
								<div class='form-actions' style='margin-bottom: 0'>
									<button  type='submit' class="btn btn-success btn-xs" style="background:#0b3c7c"
								style="background: #0b3c7c">Search</button>
								</div> -->
							</form>
					<!-- 	</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix">
	<div class='container-fluid' style="margin-top: -15%;">
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<%-- <input type="hidden" id="jobId" value="${jobId}"> --%>
									<table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-bottom='true'
										style='margin-bottom: 0;' id="sampletable">
										<thead>
											<tr>

												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Rec
													Sub Date</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Rec
													Name</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Job
													Code</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Name</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Number/
													Alt Number</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Email
													ID</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>DOB</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Basic
													Qualification</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Highest
													Qualification</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Skills</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Total
													Experience</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Relevant
													Experience</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Designation</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Current
													CTC</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Expected
													CTC</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Notice
													Period</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>
													Work Location</th>
												<th
													style='text-align: center; vertical-align: middle; color: #000080;'>Download
													Resume</th>


											</tr>
										</thead>
										<tbody>
											<c:forEach var="candidate" items="${resumeList}">
												<tr>
													<td>${candidate.rectrsubdate}</td>
													<td>${candidate.userDto.userName}</td>
													<td>${candidate.jobcode}</td>

													<td>${candidate.first_name}</td>
													<td>${candidate.contact_number}</td>
													<td>${candidate.emailID}</td>
													<td><fmt:formatDate value='${candidate.dob}'
															type='date' pattern='yyyy-MM-dd' /></td>
													<td>${candidate.basic_qualification}</td>
													<td>${candidate.highest_qualification}</td>
													<td>${candidate.primaryskill}</td>
													<td>${candidate.total_experience}</td>
													<td>${candidate.relevantExp}</td>
													<td>${candidate.candDesignation}</td>
													<td>${candidate.currentCTC}</td>
													<td>${candidate.expectedCTC}</td>
													<td>${candidate.noticeperiod}</td>
													<td>${candidate.workLocation}</td>
													<%-- <td>${candidate.userName}</td> --%>
													<%-- <td>${candidate.resumeName}</td> --%>
													<td><c:choose>
															<c:when test="${candidate.resumeName == ''}">
																<div class='text-center'
																	style="background-color: grey; color: white;">
																	<strong></strong>
																</div>
															</c:when>
															<c:otherwise>
																<a
																	href="${pageContext.request.contextPath}/download/${candidate.candidateid}.html"><img
																	src="resources/assets/images/Resume.jpg" width="30"
																	height="30" title="Download this document" /></a>

															</c:otherwise>
														</c:choose></td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<%--  <br>
						<center>
							<button class="btn btn-success btn-xs"
								style="background: #0b3c7c" onclick="goBack()">Cancel</button>
								<a href="recruiter_exportSourcedData?jobId=${jobId}&action=recruiter" class="btn btn-success btn-xs" >Export to Excel</a></center>
					
						<br>
						 --%>

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
<script type="text/javascript">
	$('#sampletable1').DataTable();
</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
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
	function editProfile(candidateid, jobid, jobcode) {
		$
				.ajax({
					type : "get",
					url : "getCandidateInfoByCandidateId?candidateid="
							+ candidateid,
					cache : false,
					async : false,
					success : function(response) {

						$('#jobDescId').val(jobid);
						$('#jobcode').val(jobcode);
						$('#candidateid').val(candidateid);
						$('#panID').val(response.pancard);
						$('#txtFirstName').val(
								response.candidateInfo.first_name);
						$('#txtMiddleName').val(
								response.candidateInfo.middle_name);
						$('#txtLastName').val(response.candidateInfo.last_name);
						$('#h1bstart').val(response.candidateInfo.hbstart_date);
						$('#h1bend').val(response.candidateInfo.hbend_date);
						$('#phnNumber').val(
								response.candidateInfo.contact_number);
						$('#altNumber').val(
								response.candidateInfo.altcnt_number);
						$('#email').val(response.candidateInfo.emailID);
						$('#dob').val(response.candidateInfo.dob);
						$('#basic_qual').val(
								response.candidateInfo.basic_qualification);
						$('#highest_qual').val(
								response.candidateInfo.highest_qualification);
						$('#priSkill').val(response.candidateInfo.primaryskill);
						$('#secSkill').val(response.candidateInfo.secskill);
						$('#totalExp').val(
								response.candidateInfo.total_experience);
						$('#revalentExp').val(
								response.candidateInfo.relevantExp);
						$('#candidatedesg').val(
								response.candidateInfo.candDesignation);
						$('#currentctc').val(response.candidateInfo.currentCTC);
						$('#expectedctc').val(
								response.candidateInfo.expectedCTC);
						$('#noticePeriod').val(
								response.candidateInfo.noticeperiod);
						$('#currentOrg')
								.val(response.candidateInfo.current_org);
						$('#sscPerc').val(response.candidateInfo.ssc);
						$('#plus2Perc').val(response.candidateInfo.bieplus12);
						$('#ugPerc').val(response.candidateInfo.graduation);
						$('#pgPerc')
								.val(response.candidateInfo.post_Graduation);
						$('#location').val(response.candidateInfo.workLocation);
						$('#filename').text(
								response.candidateInfo.file_upload_name);
						$('#interviewType').text(response.modeofinterview);
						$('#interviewType').val(response.modeofinterview);
						if (response.interview.interviewType == "Internal") {
							var date = new Date(
									parseInt(response.interview.interviewdate));
							var interviewDate = getInterviewDate(date);
							var interviewtime = getInterviewTime(date);
							$('#interviewTypeSel').text(
									response.interview.interviewType);
							$('#interviewTypeSel').val(
									response.interview.interviewType);
							$('#interviewstatusSel').text(
									response.interview.interviewstatus);
							$('#interviewstatusSel').val(
									response.interview.interviewstatus);
							$('#interviewmodeSel').text(
									response.interview.modeofinterview);
							$('#interviewmodeSel').val(
									response.interview.modeofinterview);

							$("#interviewdate").val(interviewDate);
							$("#interview_time").val(interviewtime);
						} else {

							var date = new Date(
									parseInt(response.interview.cliIntDate));
							var interviewDate = getInterviewDate(date);
							var interviewtime = getInterviewTime(date);
							$('#interviewTypeSel').text(
									response.interview.interviewType);
							$('#interviewTypeSel').val(
									response.interview.interviewType);
							$('#interviewstatusSel').text(
									response.interview.clientinterview);
							$('#interviewstatusSel').val(
									response.interview.clientinterview);
							$('#interviewmodeSel').text(
									response.interview.clIntMode);
							$('#interviewmodeSel').val(
									response.interview.clIntMode);
							$("#interviewdate").val(interviewDate);
							$("#interview_time").val(interviewtime);
						}

					},

					error : function() {

						alert('Error while request..');

					}
				});
	}
</script>
<script type="text/javascript">
	function doActionCad(candidateid) {
		$.ajax({
			type : "get",
			url : "getCandidatePercentage?candidateid=" + candidateid,
			cache : false,
			async : false,
			success : function(response) {
				$('#candidateName').text(
						"% History of " + response.candidateName);
				if (response.ssc == null) {
					$('#ssc').text("N/A");
				} else {
					$('#ssc').text(response.ssc);
				}
				if (response.interperc == null) {
					$('#plus12').text("N/A");
				} else {
					$('#plus12').text(response.interperc);
				}
				if (response.graduation == null) {
					$('#graduation').text("N/A");
				} else {
					$('#graduation').text(response.graduation);
				}
				if (response.pg == null) {
					$('#pg').text('N/A');
				} else {
					$('#pg').text(response.pg);
				}
			},
			error : function() {
			}

		});
	}
</script>



<script type="text/javascript">
	function doActionstatus(candidateid, name) {
		$.ajax({
			type : "get",
			url : "getCandidateStatusByCandidateID?candidateid=" + candidateid,
			cache : false,
			async : false,
			success : function(response) {

				$('#interviewhistory').text("Interview History of JID");
				$('#Clientstatus').text(response.clientStatus);
				$('#Teamleadstatus').text(response.tlStatus);
				$('#managerstatus').text(response.mgrStatus);
				$('#BDMstatus').text(response.bdmStatus);
				$('#tl_cmnt').text(response.tlComment);
				$('#manager_cmnt').text(response.mgrComment);
				$('#bdm_cmnt').text(response.bdmComment);
				$('#client_cmnt').text(response.clientComment);
				$('#sctstatus').text(response.sctStatus);
				$('#sct_cmnt').text(response.sctComment);

			},
			error : function() {

			}

		});

	}
</script>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker2').datetimepicker({
			pickTime : false
		});
	});
</script>
<script>
	$(function() {
		$("#h1bstartDP,#h1bendDP,#dob").datepicker({
			dateFormat : 'yy-mm-dd'

		});
	});
	/*  $(function() {
	    $('#datetimepicker1').datetimepicker({
	      
	    });
	  }); */
	function getInterviewDate(date) {
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		/*  var hours=date.getHours();
		 var min=date.getMinutes();
		 var sec=date.getSeconds();
		 var ms=date.getMilliseconds(); */
		day = day < 10 ? "0" + day : day;
		month = month < 10 ? "0" + month : month;
		//var formattedDate = year+ "-" +month+ "-" +day+" "+hours+":"+min+":"+sec+":"+ms;  
		var formattedDate = year + "-" + month + "-" + day;
		return formattedDate;
	}
	function getInterviewTime(date) {

		var hours = date.getHours();
		var min = date.getMinutes();
		var sec = date.getSeconds();
		var ms = date.getMilliseconds();
		var formattedTime = hours + ":" + min + ":0";
		return formattedTime;
	}
</script>
<script type="text/javascript">
	$(function() {
		$('#datetimepicker3').datetimepicker({
			pickDate : false
		});
	});
</script>
<script>
	$(function() {
		$('#datetimepicker1').datetimepicker({
			pickTime : false
		});
	});
</script>
<script type="text/javascript">
	function candidatefeedback_View(candidateid, phnno, candidatename) {

		$('#candidateidNameFB').text(candidatename);
		$('#candidateidFB').val(candidateid);
		$('#mobileno').text(phnno);
		$.ajax({
			type : "get",
			url : "view_Feedback?candidateidFBV=" + candidateid,
			cache : false,
			async : false,
			success : function(response) {
				$('#candidatefeedback1').empty();

				for (var i = 0; i < response.length; i++) {
					var tr = "<tr><td>" + response[i].callername + "</td>"
							+ "<td>" + response[i].callerDate + "</td>"
							+ "<td>" + response[i].comments + "</td></tr>";
					$('#candidatefeedback1').append(tr);
				}
			},
			error : function() {
				//alert('Error while request..');
			}
		});
	}
</script>
<script type="text/javascript">
	function saveFeedBack() {
		var candidateidFBS = $('#candidateidFB').val();
		var candidateCommentS = $('#candidateComment').val();

		if (candidateCommentS == "") {
			alert("Please enter feedback");
		} else {
			$.ajax({
				type : "POST",
				url : "store_Feedback?candidateidFBS=" + candidateidFBS
						+ "&candidateCommentS=" + candidateCommentS,
				cache : false,
				async : false,
				success : function(response) {
					alert(response);
					window.location.reload();

				},
				error : function() {
					//alert('Error while request..');
				}

			});
		}

	}
</script>
<script type="text/javascript">
	function checkEmail() {
		var Email = $('#email').val();
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkEmailExists?email=" + Email,
			success : function(response) {
				$('#emailshow').text(response);

			}

		});

	}
</script>
<script type="text/javascript">
	function checkContact() {
		var PhoneNumber = $('#phnNumber').val();
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkContactExists?number=" + PhoneNumber,
			success : function(response) {
				$('#phoneshow').text(response);

			}

		});

	}
</script>

<script type="text/javascript">
	function checkPan() {
		var panid = $('#panID').val();
		$.ajax({
			type : "GET",
			asyn : false,
			url : "checkPanExists?panId=" + panid,
			success : function(response) {
				$('#panshow').text(response);

			}

		});

	}
</script>
<script>
	$('#interview_time').timepicker({
		'timeFormat' : 'H:i:s',
		'step' : 15
	});
	$('#interview_time').on('changeTime', function() {
		$('#update').attr("disabled", "disabled");
		checkTime($(this).val());

	});

	function checkTime(time) {

		//var inttime=$('#interview_time').val();
		var interview_type = $('#interviewType').val();
		var interviewdate = $('#interviewdate').val();

		var candidateid = $('#candidateid').val();
		var jobid = $('#jobDescId').val();
		$
				.ajax({
					type : "get",
					url : "checkIntervkiewTime?jobdescid=" + jobid
							+ "&inttime=" + time + "&interview_type="
							+ interview_type + "&interviewdate="
							+ interviewdate + "&&candidateid=" + candidateid,
					cache : false,
					async : false,
					success : function(response) {
						//alert(response);
						if (response == true) {
							alert("You can schedule interview at this time");
							$('#update').prop("disabled", false);
						} else {
							alert("Already interview scheled interview at this time.. please set another time..");
							$('#update').attr("disabled", "disabled");
						}
						$('#timespan').text(response);
					},
					error : function() {
						//alert("failure");
					}
				});
	}
</script>


</html>