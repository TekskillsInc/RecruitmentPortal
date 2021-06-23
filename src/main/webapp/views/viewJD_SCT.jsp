
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<link
	href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/plugins/tabdrop/tabdrop.css"
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
<!-- <style>
.ScrollStyle
{
    height: 1000px;
    overflow-y: scroll;
}
</style> -->
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

								<center><Strong style="color: #000080; font-size: 25px;">View Requirements</Strong></center>
							</div>

						</div>
						
					
				<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-12">
								<div class="well bs-component">
											
					<form action="getSearchView" method="GET">
						<fieldset>		
						<%-- <legend>	<center><Strong style="color: #000080; font-size: 25px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbspView Requirements</Strong></center></legend> --%>		
							           
							             <div class='col-lg-4' >
		                                      <select id="clientname" name='clientname' style="width:200px;height:35px;" class="form-control text-center"> 
													<option value="">-- Select Client --</option>
													<c:forEach var="cname" items="${clients}"> 
														<option value="${cname.cmpny_id}">${cname.cmpny_name}</option>
														 </c:forEach> 
													 	    	
														</select>
													
												
														 <select id="bdname" name='bdname' style="width:200px;height:35px;margin-left:60px;"> 
													<option value="">-- Select BDM --</option>
													
													<c:forEach var="bd" items="${bdList}"> 
														<option value="${bd.emp_number}">${bd.userName}</option>
														 </c:forEach> 
														</select>
													<button class="btn btn-primary icon-btn custom-resp-btn" type="submit" id="mysubmit" value="search" style="background:#0b3c7c;width:200px;height:34px;margin-left:60px;position: relative;    bottom: 3px;"> <strong><i class="fa fa-fw fa-lg fa-check-circle"></i>Search</strong></button>
											 <!-- <input type="submit" value="search"  style="background:#0b3c7c;width:200px;height:30px;" > -->
												</div>
                                             	
												</fieldset>
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
									<div class="pagination">
										<table class='data-table table table-bordered table-striped'
											data-pagination-records='10'
											data-pagination-top-bottom='true' style='margin-bottom: 0;'
											id="sampletable">
											<thead>
												<tr>
												<th style='text-align: center; color: #000080;'>Job Id</th>
												
												<th style='text-align: center;color:#000080;'>Job Created Date</th>
												 <th style='text-align: center;color:#000080;'>Client Name</th>
												<th style='text-align: center; color: #000080;'>BDM	Name</th>
												<th style='text-align: center; color: #000080;'>job Code</th>
													<th style='text-align: center; color: #000080;'>Job Description</th>
													<th style='text-align: center; color:#000080;'>Job Category</th>
													<th style='text-align: center; color: #000080;'>JD Download</th>
													<th style='text-align: center; color: #000080;'>View Profiles</th>
													<th style='text-align: center; color: #000080;'>Job	Priority</th>
													<th style='text-align: center; color: #000080;'>Allocated Budget</th>
													<th style='text-align: center; color: #000080;'>Job	status</th>
													<th style='text-align: center; color: #000080;'>Job label</th>
													<th style='text-align: center; color: #000080;'>Job	Code</th>
													<th style='text-align: center; color: #000080;'>Job	Mandatory Skills</th>
													<th style='text-align: center; color: #000080;'>Download BD Mail Proof</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="jdlist" items="${jobdescList}">
													<tr>
													<td>${jdlist.jobDescId}</td>
													<td>${jdlist.createddate}</td>
													<td>${jdlist.client}</td>
													<td>${jdlist.bdName}</td> 
													<td>${jdlist.jobCode}</td>
														
															<td><c:choose>
																<c:when
																	test="${fn:length(jdlist.jobdescription) >= 20}">
																	<div class='text-center'>
																		<a class='btn btn-default btn-small'
																			data-toggle='modal' href='#modal-JD'
																			onclick="showJobDesc('${jdlist.jobDescId}')">
																			${fn:substring(jdlist.jobdescription, 0, 20)}... </a>
																	</div>
																</c:when>
																<c:otherwise>
																		 ${jdlist.jobdescription}
																	</c:otherwise>
															</c:choose></td>
															<td><strong><font color=blue>${jdlist.jdCategory}</font></strong></td>
														<td>
															<div class='text-center'>
																<a class='fa fa-download' data-toggle='modal' href=''
																	onclick="doMultipleActionDownload('${jdlist.jobDescId}','${jdlist.jobCode}')">
																	<i class='icon-download' title="Download this document"
																	style='color: darkblue;'></i>
																</a>
															</div>
														</td>
														<td><a class='btn btn-default btn-xs'
															data-toggle='modal'
															onclick="viewprofileManager('${jdlist.jobDescId}','${jdlist.jobCode}','${jdlist.client}','${jdlist.bdName}')">
																<i class='icon-group' style='color: orange'></i>
														</a></td>
														<td>${jdlist.priority}</td>
														 <td>${jdlist.allocatedbudget}</td>
														 <td class="bg-warning text-dark">${jdlist.jobstatus}
														 <td>${jdlist.lable}</td>
														 <td><a class='btn btn-default btn-xs'
															data-toggle='modal' href='#modal-viewJdstatus'
															onclick="viewJd('${jdlist.jobDescId}')">
															${fn:substring(jdlist.jobCode, 0, 20)}..
															</a></td>
														<td><div class='text-center'>
																<a class='btn btn-default btn-small' data-toggle='modal'
																	href='#modal-JDMandatory'
																	onclick="showJobMandatory('${jdlist.jobDescId}')"><i
																	class='icon-info' style='color: green;'></i></a>
															</div></td>
															<td>
															<div class='text-center'>
																<a class='fa fa-download' data-toggle='modal' href=''
																	onclick="bdmailproofDownload('${jdlist.jobDescId}')">
																	<i class='icon-download' title="Download this document"
																	style='color: darkblue;'></i>
																</a>
															</div>
														</td>
														
														
														<%-- <td><fmt:formatDate value='${jdlist.createdDate}'
																type='date' pattern='yyyy-MM-dd' /></td>
														
														<td><fmt:formatDate value='${jdlist.posEndDate}'
																type='date' pattern='yyyy-MM-dd' /></td> --%>
														

														
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<div class='modal hide fade' id='modal-JD' tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h4 id="retrivejobDescription"></h4>

										</div>
									</div>
									<div class='modal hide fade' id='modal-JDsprofiles' style="width:700px;height:700px;"
										tabindex='-1'>
									<!-- 	<div class="ScrollStyle"> -->
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Scheduled Profiles</h3>
										</div>
										<div class='modal-body'>
											<table id="interviewtable"
												class='data-table table table-bordered table-striped'
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom: 0;'>
												<thead>
													<tr>
														<th style='text-align: center;'>Candidate Name</th>
														<th style='text-align: center;'>Phone Number</th>
														<th style='text-align: center;'>Technology</th>
														<th style='text-align: center;'>Years Of experience</th>
														<th style='text-align: center;'>Interview Time</th>
													</tr>
												</thead>
												<tbody id="interviewrow">
												</tbody>
											</table>
										</div>

									</div>
									<div class='modal hide fade' id='modal-JDMandatory'
										tabindex='-1' onclick='onclickskill()'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>Job Mandatory Skills</h3>
										</div>
										<div class='modal-body'>
											<table id="skilltable"
												class='data-table table table-bordered table-striped'
												data-pagination-records='10'
												data-pagination-top-bottom='true' style='margin-bottom: 0;'>
												<thead>
													<tr>
														<th style='text-align: center;'>Skill</th>
													</tr>
												</thead>
												<tbody id="skillrow">
												</tbody>
											</table>

										</div>

									</div>


									<div class='modal hide fade' id='modal-viewJdstatus'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>View Jd Status</h3>
										</div>
										<span id="sample"></span>
										<div class='modal-body' id=jd_edit_assigns>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="" method="post">


												<div class='row'>
													<div class='span12'>
														<div class='box-content box-no-padding'>
															<div class='responsive-table'>
																<div class='scrollable-area'>
																	<table
																		class='data-table table table-bordered table-striped'
																		data-pagination-records='10'
																		data-pagination-top-bottom='true'
																		style='margin-bottom: 0;' id="sampletable">
																		<thead>
																			<tr>
																				<th style='text-align: center;'>Roles</th>
																				<th style='text-align: center;'>Approved</th>
																				<th style='text-align: center;'>Rejected</th>
																			</tr>
																		</thead>
																		<tbody id="roleCount">

																		</tbody>

																	</table>
																</div>
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
</section>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script type="text/javascript">$('#interviewtable1').DataTable();</script>
<script
	src="resources/assets/javascripts/plugins/datatables/datatable_rec.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
<script
	src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.columnFilter.js"
	type="text/javascript"></script>
<script
	src="resources/assets/javascripts/plugins/tabdrop/bootstrap-tabdrop.js"
	type="text/javascript"></script>

<script>

$( document ).ready(function() {
   var bdname='${bdnames}';
   var clientname='${clientname}';
   var clientVal = $("select[name='clientname']");
	
	 clientVal.find('option[value="' + clientname + '"]').attr('selected', true);
	
	var bdVal = $("select[name='bdname']");
	
	 bdVal.find('option[value="' + bdname + '"]').attr('selected', true);
});




                                                function viewprofileManager(jobdescid,jobcode,clientname,bdName)
                                                {
                                                	
                                                	window.open("view_Profiles_JD?jobId="+jobdescid);
                                                  //  window.location.href="view_Profiles_JD?jobId="+jobdescid;
                                                    }
                                                function showJobDesc(jobid){
                                                	$.ajax({
                                                        type: "get",
                                                        url: "displayJobDescByJobid?jobid="+jobid,
                                                        cache: false,
                                                        async: false,               
                                                        success: function(response){
                                                           $("#retrivejobDescription").text(response);
                                                        },
                                                        error: function(){                                                                                  
                                                        }                                                       
                                                    });     
                                                    s
                                                   }
                                                function showJobMandatory(jobid){
                                                  	$.ajax({
                                                          type: "get",
                                                          url: "displayMandatorySkillsByJobid?jobdescid="+jobid,
                                                          cache: false,
                                                          async: false,               
                                                          success: function(response){
                                                        	  if(response.length==0){
                                                        		  $("#skillrow").empty();
                                                            	  alert("No mandatory Skills Available");
                                                            	  
                                                            	  }
                                                        	  else{
                                                              for(var i=0;i<response.length;i++){
                                                                 var tr="<tr><td>"+response[i].reqskill+"</td></tr>";
                                                             $("#skillrow").append(tr);
                                                              }
                                                             
                                                        	  }
                                                        	  
                                                          },
                                                          error: function(){                                                                                  
                                                          }                                                       
                                                      });     
                                                  	
                                                     }
                                                            
                                                function showScheduledProfiles(jobid){
                                                	
                                                	$.ajax({
                                                        type: "get",
                                                        url: "view_scheduledCandidates?jobdescid="+jobid,
                                                        cache: false,
                                                        async: false,               
                                                        success: function(response){
                                                        	
                                                        	 $('#interviewrow').empty();
                                                        	for(var i=0;i<response.length;i++){
                                                        		
                                                        		var tr="<tr><td>"+response[i].candidate.first_name+"</td>"
                                                        		+"<td>"+response[i].candidate.contact_number+"</td>"
                                                        		+"<td>"+response[i].candidate.primaryskill+"</td>"
                                                        		+"<td>"+response[i].candidate.relevantExp+"</td>"
                                                        		+"<td>"+response[i].interviewtime+"</td></tr>";
                                                        		$('#interviewrow').append(tr); 
                                                        		
                                                        	}
                                                        },
                                                        error: function(){  
                                                        	//alert("failure");
                                                        }            
                                                	});
                                                }       
                                                </script>


<script type="text/javascript">

function viewJd(jobdescid){
	$.ajax({
        type: "get",
        url: "view_JdStatus?jobdescid="+jobdescid,
        cache: false,
        async: false,               
        success: function(response){
        	$('#roleCount').empty();
        	for(var i=0;i<response.length;i++){
        		var tr="<tr><td>"+response[i].role+"</td>"
        		+"<td>"+response[i].selectedCount+"</td>"
        		+"<td>"+response[i].rejectedCount+"</td></tr>";
        		$('#roleCount').append(tr);
        		
        	}
        },
        error: function(){  
        	alert("failure");
        }                                                       
    });     
	
}

</script>

<script type="text/javascript">
    function Interview_insert(jobdescid){
       $("#jobsid").val(jobdescid);
       //alert(jobdescid);

        $.ajax({
              
            type: "get",
            url: "interview_view?jobdescid="+jobdescid,
            cache: false,
            async: false,               
            success: function(response){
             
              $('#interview_details_TL').empty();
              if(response.length!=0){
                 for(var i=0;i<response.length;i++){
                       var tr="<tr><td>"+response[i].intdate+"</td>"
                           +"<td>"+response[i].intmode+"</td>"
                           +"<td>"+response[i].cliinterview+"</td></tr>";
                           /*  +"<td><button id='delete' class='btn btn-primary btn-xs'>Delete</button></td> */
                            $('#interview_details_TL').append(tr);
                      }  
              }
              else{
                $('#InterviewSchedule').modal().hide();
              }
          
          /*$('#InterviewSchedule').modal();
            $('#interview_date').val(response.interviewdate);
              $('#interview_type').val(response.modeofinterview);*/
              
            },
            error: function(){   
              //alert("failure");
            }                                                       
        });   
        
       }
    </script>
<script>
    function doMultipleActionDownload(jobid,jobcode)
    {                                                					
    	window.location.href="Multiplefiledownload?jobid="+jobid+"&jobcode="+jobcode;	
     }  
    </script>
<script>
    function onclickskill(){
    	window.location.href="view_Jobdescription";
    	
    }
/* $('#modal-JDMandatory').dialog('close'); */
    
    </script>
    <script>
    function bdmailproofDownload(jobid)
    {             
    	alert(jobid);
    	window.location.href="sctDownloadmailProof?jobid="+jobid;	
     }  
    </script>

</body>
</html>