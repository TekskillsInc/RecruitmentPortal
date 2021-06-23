<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

 
 
 

<style>
.pagination {
	
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
	<c:choose>
		<c:when test="${role == 'SCT'}">
			<div class='container-fluid'>
				<div class='row-fluid' id='content-wrapper' style="margin-top:-140px;">
					<div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">
								
							  <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color: #000080;font-size:25px">Add Company Notice Period</Strong>
					</div>
				
				
			</div>
								
								
								<div class='box-content'>
								<div class='responsive-table'>
								<div class='scrollable-area'>
									<form class='form form-horizontal validate-form'
										style='margin-bottom: 0;' action="addCompNoticePeriod"
										method="POST"  onsubmit="return checkForm(this);">

										<div class='control-group'>
											<label class='control-label' for='validation_cmpny_pan'>Company
												PAN ID (*)</label>
											<div class='controls'>
												<input pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
													autocomplete="off" data-rule-minlength='2'
													data-rule-maxlength='25' data-rule-required='true'
													id='companypanid' name='companypanid'
													placeholder='Company Pan Id' type='text'
													onchange="checkCompanyPan()" required> <span
													id="compan" style="color: red;"></span>
											</div>
										</div>
										<div class='control-group'>
											<label class='control-label' for='validation_cmpny_name'>Company
												Name (*)</label>
											<div class='controls'>
												<input pattern="[a-zA-Z][a-zA-Z\s]*" data-rule-minlength='2'
													data-rule-maxlength='25' data-rule-required='true'
													id='company_name' name='company_name' autocomplete="off"
													placeholder='Company Name' type='text' required>
											</div>
										</div>
										<div class='control-group'>
											<label class='control-label' for='validation_cmpny_name'>Notice
												Period (*)</label>
											<div class='controls'>
												<input pattern="\d*" data-rule-minlength='2' maxlength="3"
													autocomplete="off" data-rule-required='true'
													id='noticeperiod' name='noticeperiod'
													placeholder='Notice Period' type='text' required>
												Days
											</div>
										</div>

										<div class='form-actions' style='margin-bottom: 0'>
											<button class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit' id="submit">
												 Add Company
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div></div></div>
		</c:when>
	</c:choose>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid'>
					<div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">
						
						
						<div class='box-header orange-background' style="line-height: 10px; ">
				
					<div class='title'>

						<Strong style="color: #000080;font-size:25px">VIEW COMPANIES</Strong>
					</div>
				
				
			</div>
								
						
						
						
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
									<div class="pagination">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
												<tr>
													<th style='text-align: center; color:#000080;'>Company
														PAN ID</th>
													<th style='text-align: center; color:#000080;'>Company
														Name</th>
													<th style='text-align: center; color:#000080;'>Notice
														Period</th>
													<c:choose>
														<c:when test="${role == 'SCT'}">
															<th style='text-align: center; color:#000080;'>Edit
																Details</th>
														</c:when>
													</c:choose>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="noticeperiod" items="${ntcprdlist}">
													<tr>
														<td>${noticeperiod.companypanid}</td>
														<td>${noticeperiod.companyname}</td>
														<td>${noticeperiod.noticeperiod}-Days</td>
															<c:choose>
															<c:when test="${role == 'SCT'}">
																<td><a href='#modal-editCompDetails'
																	onclick="updteCompanyDetails('${noticeperiod.companypanid}','${noticeperiod.companyname}',${noticeperiod.noticeperiod},${noticeperiod.company_id})"
																	class='btn btn-default btn-xs' data-toggle='modal'
																	style="float: inherit;color:red;"><i class='icon-edit'></i></a></td>
															</c:when>
														</c:choose>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div class='modal hide fade' id='modal-editCompDetails'
											style="top: 25%;" tabindex='-1'>
											<div class='modal-header'>
												<button class='close' data-dismiss='modal' type='button'>&times;</button>
												<!-- <h3 id="candidateName"></h3> -->
											</div>
											<div class='modal-body'>
												<div class='row'>
													<div class='col-sm-12'>
														<div class='box'>
															<div class='box-padding'>
																<form class="form-horizontal" style="margin-bottom: 0;"
																	method="post" action="updateNoticePeriod">
																	<div class='step-content'>
																		<div class='row'>
																			<input type="hidden" name="compid" id="compid" />
																			<div class='control-group'>
																				<label class='control-label'
																					for='validation_cmpny_pan'>Company PAN ID
																					(*)</label>
																				<div class='controls'>
																					<input pattern="[a-zA-Z0-9][a-zA-Z0-9\s]*"
																						autocomplete="off" data-rule-minlength='2'
																						data-rule-maxlength='25' data-rule-required='true'
																						id='cid' name='companypanid'
																						placeholder='Company Pan Id' type='text'
																						onchange="updatePANCheck()" required> <br>
																					<span id="companid" style="color: red;"></span>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label class='control-label'
																					for='validation_cmpny_name'>Company Name
																					(*)</label>
																				<div class='controls'>
																					<input pattern="[a-zA-Z][a-zA-Z\s]*"
																						data-rule-minlength='2' data-rule-maxlength='25'
																						data-rule-required='true' id='cname'
																						name='company_name' autocomplete="off"
																						placeholder='Company Name' type='text' required>
																				</div>
																			</div>
																			<div class='control-group'>
																				<label class='control-label'
																					for='validation_cmpny_name'>Notice Period
																					(*)</label>
																				<div class='controls'>
																					<input pattern="\d*" data-rule-minlength='2'
																						maxlength="3" autocomplete="off"
																						data-rule-required='true' id='cnp'
																						name='noticeperiod' placeholder='Notice Period'
																						type='text' required> Days <br />
																					<br /> <input  class="btn btn-success btn-xs" style="background:#0b3c7c" type="submit"
																						id="update" value="Update Details">
																				</div>
																			</div>
																		</div>
																	</div>
																</form>
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

<script	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"	type="text/javascript"></script>
<script	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
<script	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"	type="text/javascript"></script>
<script	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"	type="text/javascript"></script>

<script>
   function checkCompanyPan(){
	   var companid=$('#companypanid').val();
	   var compcid=$('#cid').val();
	  
	    $.ajax({
	    	type : "GET",
	        asyn : false,
	        url  : "checkCompanyPAN?companypanid="+companid,
	        success  : function(response){
	        	if(response=="NotExist"){
	        		$('#compan').html("<font color='green'>Comapny PAN Id not exist, please continue.....</font>");
	        	}else{
	        		$('#compan').html("<font color='red'>Comapny PAN Id Already Added</font>");
	        		document.getElementById("submit").disabled=true;
	        	}
	        }
		    });
   }
   
   function updatePANCheck(){
	   var companid=$('#cid').val();
	  
	    $.ajax({
	    	type : "GET",
	        asyn : false,
	        url  : "checkCompanyPAN?companypanid="+companid,
	        success  : function(response){
	        	if(response=="NotExist"){
	        		$('#companid').html("<font color='green'>Comapny PAN Id not exist, please continue.....</font>");
	        	}else{
	        		$('#companid').html("<font color='red'>Comapny PAN Id Already Added</font>");
	        		document.getElementById("update").disabled=true;
	        	}
	        }
		    });
   }
   
   function updteCompanyDetails(cid,cname,cnp,autoid){
	   $('#cid').val(cid);
	   $('#cname').val(cname);
	   $('#cnp').val(cnp);
	   $('#compid').val(autoid);
	   
   }
   </script>





  <script type="text/javascript">
  function checkForm(form)
  {
    form.submit.disabled = true;
    form.submit.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.submit.disabled = false;
    form.submit.value = "Submit";
    form_being_submitted = false;
  }
</script>
</html>
