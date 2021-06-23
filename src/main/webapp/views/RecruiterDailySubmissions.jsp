<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
</head>
        <section id='content'>
            <div class='container-fluid' >
                <div class='row-fluid' id='content-wrapper' style="margin-top:-220px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">Recruiter Daily Submissions</Strong>
					</div>
				
				
			</div>
                                <div class='box-content' >
                                    <form class='form form-horizontal validate-form'
                                        action="save_Recruiters_submissions" method="post" style='margin-bottom: 0;' onsubmit="return checkForm(this);">
                                        <div class='control-group'>
                                            <label class='control-label'>Select Job<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='jobid' name='jobid'  required="required">
                                                    <option value="">--select jd--</option>
                                                    <c:forEach var="jd" items="${jdList}">
                                                    <option id="${jd.jdID}" value="${jd.jdID}">${jd.jobDescription}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label'>No of Profiles Downloaded:<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input type="number" name="no_pf_dwd" id="no_pf_dwd" class='form-control' placeholder="Enter no of profiles downloaded" required>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label'>No of Profiles Contacted:<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input type="number" name="no_pf_spoken" id="no_pf_spoken" class='form-control' placeholder="Enter no of profiles spoken" required>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label'>Selected/Agreed profile count:<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input type="number" name="sub_pf_ct" id="sub_pf_ct" class='form-control' placeholder="Enter no of profiles submitted" required>
                                            </div>
                                        </div> 
                                        <div class='form-actions' style='margin-bottom: 0'>
                                            <input type="submit"  name="myButton" id="myButton"  class="btn btn-success btn-xs" style="background:#0b3c7c" value="Save Info"/>
                                        </div>
                                        
                                        <div class='box-content box-no-padding'>
                                    <div class='responsive-table'>
                                        <div class='scrollable-area'>
                                        <input type="hidden" id="jobId" value="${dailySubList}">
                                            <table id="sampletable" class='data-table table table-bordered table-striped'
                                                data-pagination-records='10' data-pagination-bottom='true'
                                                data-sorting='false' style='margin-bottom: 0;'>
                                                <thead style="background-color:lavender;">
                                                    <tr>
                                                    <th style='text-align: center; vertical-align: middle;color:#000080;'>JobId</th>
                                                        <th style='text-align: center; vertical-align: middle;color:#000080;'>Job</th>
                                                        <th style='text-align: center; vertical-align: middle;color:#000080;'>Downloaded</th>
                                                        <th style='text-align: center; vertical-align: middle;color:#000080;'>Contacted</th>
                                                        <th style='text-align: center; vertical-align: middle;color:#000080;'>Agreed/Selected</th>
                                                        <th style='text-align: center; vertical-align: middle;color:#000080;'>Submitted Date</th>
                                                         <th style='text-align: center; vertical-align: middle;color:#000080;'>Edit</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="li" items="${dailySubList}">
                                                        <tr>
                                                        <input type="text" style="display:none" name="ejid${li.jobdesc.jobdescid}" id="ejid${li.jobdesc.jobdescid}" value="${li.jobdesc.jobdescid}"/>
                                                        <input type="text" style="display:none" name="ejname${li.jobdesc.jobdescid}" id="ejname${li.jobdesc.jobdescid}" value="${li.jobdesc.jobDescription}"/>
                                                        <input type="text" style="display:none" name="edwd${li.jobdesc.jobdescid}" id="edwd${li.jobdesc.jobdescid}" value="${li.dowloaded}"/>
                                                        <input type="text" style="display:none" name="ectd${li.jobdesc.jobdescid}" id="ectd${li.jobdesc.jobdescid}" value="${li.contacted}"/>
                                                        <input type="text" style="display:none" name="eagd${li.jobdesc.jobdescid}" id="eagd${li.jobdesc.jobdescid}" value="${li.agreed}"/>
                                                            <td>${li.jobdesc.jobdescid}</td>
                                                            <td>${li.jobdesc.jobDescription}</td>
                                                            <td>${li.dowloaded}</td>
                                                            <td>${li.contacted}</td>
                                                            <td>${li.agreed}</td>
                                                            <td>${li.createdDate}</td>
                                                            <td><a href="javascript:void(0);" onclick="editSub(${li.jobdesc.jobdescid})" class="btn btn-primary">Edit</a></td>
                                                            </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                            </table>
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

    </section>
    
   <!-- / jquery -->
 	<script src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
    <script src="resources/assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
	<script src="resources/assets/javascripts/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
	<script src="resources/assets/javascripts/plugins/timeago/jquery.timeago.js" type="text/javascript"></script>
  <script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
   <script type="text/javascript">$('#sampletable').DataTable();</script> 
   <script src="resources/assets/javascripts/plugins/datatables/datatable_rec.js" type="text/javascript"></script>
   <script src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script> 

  <script type="text/javascript">
function editSub(id){
var jid="#ejid"+id;
var jname="#ejname"+id;
var jdwd="#edwd"+id;
var jctd="#ectd"+id;
var jagd="#eagd"+id;
//alert(jdwd);
 var jobid=$(jid).val();
 var jobname=$(jname).val();
 var dwd=$(jdwd).val();
 var ctd=$(jctd).val();
 var sel=$(jagd).val();
// alert("downloaded--"+dwd+"--contactyed--"+ctd+"--selected--"+sel);
 document.getElementById(id).selected="true";
 document.getElementById('no_pf_dwd').value=dwd;
 document.getElementById('no_pf_spoken').value=ctd;
 document.getElementById('sub_pf_ct').value=sel;
 
 
	
}
</script>

   <script type="text/javascript">
  function checkForm(form)
  {
    form.myButton.disabled = true;
    form.myButton.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.myButton.disabled = false;
    form.myButton.value = "Submit";
    form_being_submitted = false;
  }
</script>
    

</html>
