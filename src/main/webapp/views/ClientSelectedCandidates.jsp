
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.field-error .control-label, .field-error .help-block, .field-error .form-control-feedback
	{
	color: red;
}

.field-success .control-label, .field-success .help-block,
	.field-success .form-control-feedback {
	color: #3c763d;
}
h5 {
  text-decoration: underline;
}

/* .docbutton {
    display: block;
    width: 115px;
    height: 25px;
    
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
} */


</style>
<!-- <link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"> -->
<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css">
<!-- <link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" /> -->

<link rel="stylesheet" type="text/css"
	href="resources/assets/stylesheets/formValidation.css">
<link rel="stylesheet" type="text/css"
	href="resources/assets/stylesheets/formValidation.min.css">
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
   transition: background-color .3s;
	
	
}
.pagination a.active {
/*  background-color: dodgerblue; */
  color: blue;
  border-radius: 5px;
}
.pagination ul>li>a:hover, .pagination ul>li>a:focus, .pagination ul>.active>a, .pagination ul>.active>span
{
background-color: black;
}
.pagination a:hover:not(.active) {background-color: #ddd;}

/* .pagination a.active {
	background-color: #4CAF50;
	color: cyan;
}

.pagination a:hover:not (.active ) {
	background-color: blue;
} */

.dataTables_wrapper .dataTables_filter {
    margin: 10px 10px 5px 10px;
    float: right;
    margin-right: 10%;
}
</style>
<!-- <style>
.ScrollStyle
{
    height: 1000px;
    overflow-y: scroll;
}
</style>  -->
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

								<center><Strong style="color: #000080; font-size: 25px;"> Candidate List</Strong></center>
							</div>

						</div>
						
					
				<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
								
									<div class='box-content box-no-padding'>
							<div class='table-responsive'>
								 <div class='scrollable-area'>
									<div class="pagination"> 
										<table class="table table-striped"
											
											id="sampletablea">
											<thead>
								<tr>
								<th style='text-align: center; color: #000080;'>Client Selected Date</th>
								<th style='text-align: center; color: #000080;'>Candidate Name</th>
								<!-- <th style='text-align: center; color: #000080;'>Count</th> -->
								<th style='text-align: center; color: #000080;'>BDM </th>
								<th style='text-align: center; color: #000080;'>Client</th>
								<th style='text-align: center; color: #000080;'>Resume</th>
								
								<th style='text-align: center; color: #000080;'>On-boarding date as per Client /BD</th>
								<th style='text-align: center; color: #000080;'>Docs Verification Status</th>
								<th style='text-align: center; color: #000080;'>Negotiation Status</th>
								<th style='text-align: center; color: #000080;'>LOI Status</th>
								<th style='text-align: center; color: #000080;'>Action</th>
							    <c:if test="${role=='NEGOTIATOR' || role=='HRMANAGER'}">
								<th style='text-align: center; color: #000080;'>LOI Preview</th>
								</c:if>
								</tr>
											</thead>
											
											
											<tbody>
												<c:forEach var="jdlist" items="${candList}">
												
												<tr>
													<td>${jdlist.clientselecteddate}</td>
													<td>${jdlist.candidatename}</td>
													<td>${jdlist.bdname}</td>
													<td>${jdlist.client}</td>
													<td><a href="${pageContext.request.contextPath}/download/${jdlist.candidateid}.html"><i class="icon-file"></i></a></td>
													
													<td>${jdlist.on_board_date}</td>
													<c:choose>
													<c:when test="${jdlist.doc_verify_status=='Approved'}">
													<td><font color=green>Approved</font></td>
													</c:when>
													<c:when test="${jdlist.doc_verify_status=='ApprovedByManagement'}">
													<td><font color=green>Approved By Management</font></td>
													</c:when>
													<c:when test="${jdlist.doc_verify_status=='Rejected'}">
													<td><font color=red>Rejected</font></td>
													</c:when>
													<c:when test="${jdlist.doc_verify_status=='Onhold'}">
													<td><font color=red>On Hold</font></td>
													</c:when>
													<c:otherwise>
													<td><font color=red>Pending</font></td>
													</c:otherwise>
													</c:choose>
													
													<c:choose>													
													<c:when test="${jdlist.nego_status=='Negotiation Completed'}">
													<td><font color=darkgreen>Completed</font>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation Rejected'}">
													<td>
													<font color=red>Rejected</font>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation InProgress'}">
													<td><font color=red>InProgress</font>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation Pending'}">
													<td><font color=red>Pending</font></td>
													</c:when>
													<c:otherwise>
													<td><font color=red>Pending</font>
													</td>
													</c:otherwise>
													</c:choose>
													
													<c:choose>
													<c:when test="${jdlist.hr_loi_status=='Released'}">
													<td><font color=green>Released</font></td>
													</c:when>
													<c:otherwise>
													<td><font color=red>Pending</font></td>
													</c:otherwise>
													</c:choose>
										
													
													<c:choose>
													<c:when test="${role=='NEGOTIATOR'}">
													 <c:choose>													
													<c:when test="${jdlist.nego_status=='Negotiation Completed'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=green><b>Negotiation completed</b></font></h5>
													</a>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation Rejected'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=red><b>Negotiation Rejected</b></font></h5>
													</a>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation InProgress'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=red><b>Negotiation InProgress</b></font></h5>
													</a>
													</td>
													</c:when>
													<c:when test="${jdlist.nego_status=='Negotiation Pending'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=red><b>Negotiation Pending</b></font></h5>
													</a>
													</td>
													</c:when>
													<%-- <c:when test="${jdlist.doc_verify_status=='Rejected'}">
													<td>
													<span><font color=red>Documents Rejected</font></span>
													</td>
													</c:when> --%>
													<c:otherwise>
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=blue><b>Start Negotiation</b></font></h5>
													</a>
													</td>
													</c:otherwise>
													</c:choose>
													</c:when>
													
													<c:when test="${role=='HRMANAGER'}">
													 <c:choose>
													<c:when test="${jdlist.nego_status=='Negotiation Completed' && (jdlist.doc_verify_status=='Approved' || jdlist.doc_verify_status=='ApprovedByManagement')}">
													<c:choose>
													<c:when test="${jdlist.hr_loi_status=='Released'}">
													<td><a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=green><b>LOI Issued</b></font></h5></a>
													</td>
													</c:when>
													<c:otherwise>
													<td><a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=blue><b>Release LOI</b></font></h5>
													</a></td>
													</c:otherwise>
													</c:choose>
													</c:when>
													<c:otherwise>
													<td>
													<h5><font color=red><b>Waiting for Approval</b></font></h5>
													</td>
													</c:otherwise>
													</c:choose>
													</c:when>
													
													
													<c:when test="${role=='HRUSER'}">
													 <c:choose>
													<c:when test="${jdlist.doc_verify_status=='Approved'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}"><h5><font color=green><b>Approved</b></font></h5></a>
													</td>
													</c:when>
													<c:when test="${jdlist.doc_verify_status=='ApprovedByManagement'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}"><h5><font color=green><b>Approved By Management</b></font></h5></a>
													</td>
													</c:when>													
													<c:when test="${jdlist.doc_verify_status=='Rejected'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=red><b>Rejected</b></font></h5>
													</a>
													</td>
													</c:when>
													<c:when test="${jdlist.doc_verify_status=='Onhold'}">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=red><b>On Hold</b></font></h5>
													</a>
													</td>
													</c:when>
													<c:otherwise>
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=blue><b>Verify Documents</b></font></h5>
													</a>
													
													</td>
													</c:otherwise>
													</c:choose>
													</c:when>
													
													<c:when test="${role=='TEAMLEAD' || role=='RECRUITER'}">
													
													
													<c:choose>
													<c:when test="${(jdlist.doc_verify_status=='Approved' || jdlist.doc_verify_status=='ApprovedByManagement')&& (jdlist.nego_status=='Negotiation Completed') }">
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}"> 
													<h5><font color=green><b>View Details</b></font></h5>
													</a>
												
													</td>
													</c:when>
													<c:otherwise>
													<td>
													<a href="negotiateCandidate?canid=${jdlist.candidateid}&bdname=${jdlist.bdname}&recname=${jdlist.recname}
													&jobid=${jdlist.jobid}&clientname=${jdlist.client}">
													<h5><font color=blue><b>Add Documents</b></font></h5>
													</a>
													</td>
													</c:otherwise>
													
													</c:choose>
													</c:when>
													</c:choose>
													 <c:if test="${role=='NEGOTIATOR' || role=='HRMANAGER'}">
													<c:choose>
													<c:when test="${jdlist.hr_loi_status=='Released'}">
													<td>
													<b><a href='preObtFiledownload?candidateid=${jdlist.candidateid}&&filename=${jdlist.loifilename}&&fileType=LOI'>
													<font style="color:blue;"><i class="icon-download"></i></font></a></b>
													<%-- <button class="button" onclick="previewLOI('${jdlist.candidateid}','LOI')"></button> --%>
													</td>
													</c:when>
													<c:otherwise>
													<td>NA</td>
													</c:otherwise>
													</c:choose>
													</c:if>
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
				</div>
			</div>
		</div>
	</div>
</div>		
</div>

</div>
</section>

<script src="resources/newdt/jquery.dataTables.min.js"></script>
<script src="resources/newdt/dataTables.bootstrap4.min.js"></script>
<!-- <script type="text/javascript">$('#sampletablea').DataTable(); -->

<script type="text/javascript">
$('#sampletablea').DataTable( {
    "order": [[ 0, "desc" ]]
} );
/* $(document).ready(function() {
   
} ); */
</script>
<script type="text/javascript">
function previewLOI(canId,fileType){
	/* ajax({
        type: "GET",
        processData: false,
        url : "previewLOI?canId="+canId+"&fileType="+fileType,
        contentType: "application/xml; charset=utf-8",
        success: function(response)
        {
        	alert("response"+response);
            var iframe = $('<iframe>');
            iframe.attr('src','/pdf/yourpdf.pdf?options=first&second=here');
            $('#targetDiv').append(iframe);
        }
    }); */
	$.ajax({
		type : "get",
		url : "previewLOI?candidateid=" + canId + "&fileType=" + fileType ,
		cache : false,
		async : false,
		success : function(response) {
			alert("response"+response);
			if(response!=''){
				alert("this file is already attached to "+response)
				$(file).val('');
			}else{
				
			}
		},
		error : function() {
		}
	});
	
}
</script>	
</body>
</html>