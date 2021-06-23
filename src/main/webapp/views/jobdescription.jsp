<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<link href="resources/assets/stylesheets/multi-select.css"
	rel="stylesheet" />
</head>
         <section id='content'>
           <div class='container-fluid'>
			<div class='row-fluid' id='content-wrapper' style="margin-top:-140px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">Add Requirement</Strong>
					</div>
				
				
				
			</div>     
                                
                                <div class='box-content'>
                                    <form class='form form-horizontal validate-form'
                                        action="storeJobDesc" method="post" style='margin-bottom: 0;' enctype="multipart/form-data" onsubmit="return checkForm(this);">
                                        <div class='control-group'>
                                            <label class='control-label' >JobDescription ID <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input data-rule-minlength='2' data-rule-required='true'
                                                    id='jobCode' data-rule-maxlength='25' name='jobCode' pattern="^[0-9a-zA-Z ]+$"
                                                    placeholder='Job Description ID' type='text' required="required" onchange="chkJobCode()">
                                                   
                                            </div>
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="color:red;"  id="jobsuccess"></span>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label' >JobDescription <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <textarea rows="3" cols="100" data-rule-required='true' id='jobdescription'
                                                    name='jobdescription' required="required" ></textarea>
                                            </div>
                                        </div>
                                          <div class='control-group'>
                                            <label class='control-label' for='Technology'>
                                                Technology <span style="color: red">(*)</span></label>
                                            <div class='controls'>
                                                <input 
                                                    id='Technology' name='Technology'
                                                    placeholder='Technology' type='text' required>
                                            </div>
                                            </div>
                                          <div class='control-group'>
                                            <label class='control-label' for='mandatory Skills'>
                                                Mandatory Skills<span style="color:red">(*)</span></label>
                                            <div class='controls' id='mskills'>
                                               <label>Skill# 1  </label> <input  data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='true'
                                                    id='manskills' name='manskills[]'
                                                    placeholder='Mandatory Skills' type='text' required="required"> 
                                                    <button class="btn btn-default" type="button" onclick="addfields();">+</button>
                                                   <div id="addfields"></div>
                                                    <!-- <a href="#" id="pl" onclick="addfields();" class="btn btn-default">+
                                                     </a><a href="#" id="mi" class="btn btn-danger">-
                                                     </a>
                                                     <input type="hidden" id="btncount" name="btncount">
                                                     <span id="moreskills"></span> -->
                                            </div>
                                           </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='JobGivenBy'>
                                                Given By (*)</label>
                                            <div class='controls'>
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='true'
                                                    id='jobGivenBy' name='jobGivenBy'
                                                    placeholder='Given By' type='text' required="required">
                                            </div>
                                            </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='LocationProject'>Location Of The Project<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                 
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='false'
                      
                                                    id='locationProject' name='locationProject'
                                                    placeholder='Location Of The Project' type='text' required>
                                                 
                                            </div>
                                            </div> 
                                            <div class='control-group'>
                                            <label class='control-label' for='DurationProject'>Duration Of The Project</label>
                                            <div class='controls'>
                                                 
                                                <input pattern="^([A-Za-z0-9]+ )+[A-Za-z0-9]+$|^[A-Za-z0-9]+$" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='false'
                                                    id='durationProject' name='durationProject'
                                                    placeholder='Duration Of The Project' type='text'>
                                             
                                            </div>
                                            </div> 
                                        <div class='control-group'>
                                            <label class='control-label'>External / Internal<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true' id='intORext' name='intORext' required>
                                                 <option value="">Choose Job Type</option> 
                                                    <option value="External">External</option>
                                                    <option value="Internal">Internal</option>
                                                    <option value="External Fulltime">External Fulltime</option>
                                                </select>
                                            </div>
                                        </div> 
                                        
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_date'>JobCloseDate</label>
                                            <div class='controls'>
                                               
                                                    <div id="datetimepicker" class="input-append">
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd' id='jobCloseDate'
                                                            name='jobCloseDate' placeholder='Select Date'
                                                            type='text'> <span class='add-on'> 
                                                            <i data-date-icon='icon-calendar'></i>
														</span>
                                                    </div>
                                                
                                                
                                            </div>
                                        </div>

                                        <div class='control-group'>
                                            <label class='control-label'>Select Company <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='company' name='company' required>
                                                <option value="">Select Client</option> 
                                                    <c:forEach var="company" items="${clientList}">
                                                    <option value="${company.cmpny_id}">${company.cmpny_name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class='control-group'>
                                            <label class='control-label' >Enter Account</label>
                                            <div class='controls'>
                                                <input class='form-control' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" data-rule-minlength='2' data-rule-maxlength='25'
                                                      id='account' name='account' placeholder='Enter Account' type='text'>
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_segment'>Enter Segment</label>
                                            <div class='controls'>
                                                <input class='form-control' pattern="^([A-Za-z]+ )+[A-Za-z]+$|^[A-Za-z]+$" id='segment' data-rule-minlength='2' data-rule-maxlength='10' name='segment' placeholder='Enter Segment' type='text'>
                                            </div>
                                        </div> 
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_positions'>No.of
                                                Positions <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <input class='form-control' data-rule-minlength='1' min='1' max='9999999'
                                                    data-rule-required='true' id='totalpositions'
                                                    name='totalpositions' placeholder='Positions'
                                                    type='number' required="required">
                                            </div>
                                        </div>
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Label<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='jd_label' name='jd_label' required>
                                                    <option value="">Choose Label</option>
                                                    <option value="New">New</option>
                                                    <option value="RECYCLE">RECYCLE</option>
                                                    <option value="EXCLUSIVE">EXCLUSIVE</option><!-- Non-Exclusive  Time bond Exclusive  -->
                                                    <option value="NON_EXCLUSIVE">NON-EXCLUSIVE</option>
                                                     <option value="TIME_BOND_EXCLUSIVE">TIME BOND EXCLUSIVE</option>
                                                    <option value="ON_GOING">ON_GOING </option>
                                                </select>
                                            </div>
                                        </div>
                                            <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Priority<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class='form-control' data-rule-required='true'
                                                    id='jd_priority' name='jd_priority' required>
                                                    <option value="">Choose Priority</option>
                                                    <option value="P1">P1</option>
                                                    <option value="P2">P2</option>
                                                    <option value="Requirements">Requirements</option>
                                                    <option value="Drive Requirements">Drive Requirements</option><!-- Non-Exclusive  Time bond Exclusive  -->
                                                </select>
                                            </div>
                                        </div>
                                         <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Status<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <input type ="text" name="jd_status" id="jd_status" value="Open" readonly>
                                            </div>
                                        </div>
                                        
                                        <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Requirement Category<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            <select class="form-control" data-rule-required='true'
                                                    id='jdcategory' name='jdcategory'
                                                       required="required">
                                                        <option value="">--Select Category--</option>
                                                         <option value="A">A</option>
                                                          <option value="B1">B1</option>
                                                          <option value="B2">B2</option>
                                                          <option value="C">C</option>
                                                   
                                                </select>
                                            </div>
                                        </div>
                                        
                                        
                                         
                                 
                                         <div class='control-group'>
                                            <label class='control-label' for='validation_jd_status'>
                                                Allocated Budget\CTC(LPA)<span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                            
                                            <input type ="text" name="allocated_budget" id="allocated_budget" pattern="^([A-Za-z0-9.]+ )+[A-Za-z0-9.]+$|^[A-Za-z0-9.]+$" required >
                                            
                                            
                                               
                                            </div>
                                        </div>
                                       
                                  
                                        <div class='control-group'>
                                            <label class='control-label' >AssignTo <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                <select class="form-control" data-rule-required='true'
                                                    id='assignTo' name='assignTo'
                                                    multiple required="required">
                                                    <c:forEach var="manager" items="${managerList}">
                                                        <option value="${manager.emp_number}">${manager.userName}</option>
                                                    </c:forEach>
                                                
                                                </select>
                                            </div>
                                        </div>
                                           <div class='control-group'>
                                            <label class='control-label' for='validation_date'>Job Received Time <span style="color:red">(*)</span></label>
                                            <div class='controls'>
                                                    <div id="datetimepicker1" class="input-append">
                                                        <input class='span12'  
                                                            data-format='yyyy-MM-dd hh:mm:ss' id='jobreceivedTime'
                                                            name='jobreceivedTime' placeholder='Select Time'
                                                            type='text' required> <span class='add-on'> 
                                                            <i data-date-icon='icon-calendar'></i>
														</span>
                                                    </div>
                                            </div>
                                        </div>
                                        
                                        <div class='control-group'>
                                           <label for='file' > Upload JD Description Doc<span style="color:red">(*)</span></label>
                                            <input type="hidden" id="JdDescription" name="JdDescription"  value="Jd_Doc" >
                                            <input name="file1" data-rule-required='false' id='file1' 
                                            type="file" accept="application/pdf,application/msword,application/vnd.ms-outlook,application/vnd.openxmlformats-officedocument.wordprocessingml.document"  required  onchange="ValidateSize(this)"/>
                                            <span id="fspanid" style="color:red"></span>
                                            </div>
                                            
                                            <div class='control-group'>
                                           <label for='file'> Upload JD Received mail proof<span style="color:red">(*)</span></label>
                                            <input type="hidden" id="Mailproof" name="Mailproof"  value="Mail" >
                                            <input name="file2" data-rule-required='false' id='file2' type="file" accept="application/pdf,application/msword,application/vnd.ms-outlook,application/vnd.openxmlformats-officedocument.wordprocessingml.document"  required  onchange="ValidateSize(this)"/>
                                              </div>
                                                                                                               
                                        <div class='form-actions' style='margin-bottom: 0'>
                                            <input type="submit"  id="subcheck" name="subcheck" class="btn btn-success btn-xs" style="background:#0b3c7c" value="Save JD"/>
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
	<script src="resources/assets/javascripts/multi-select.js"></script>
  
   
   

  <script type="text/javascript">
$(function() {
  $('#datetimepicker').datetimepicker({
    pickTime: false
  });
});
</script>

 <script type="text/javascript">
var value = 0;
var max_limit=10;
function addfields() {
	value++;
	$('#btncount').val(value);
	//alert(cbval);
    var objTo = document.getElementById('addfields');
    var divtest = document.createElement("div");
	divtest.setAttribute("class", "form-group removeclass"+value);
	var rdiv ='removeclass'+value;
    divtest.innerHTML ='<div class="form-group"><label>Skill#' + value +'</label><input type="text" class="form-control" id="manskills" name="manskills[]" placeholder="Enter skills"><input type="hidden" value="'+value+'" name="btncount"><button class="btn btn-danger" type="button" onclick="remove_add_fieldsC('+value+');">-</button></div><div class="clear"></div>';
    if(value<=max_limit){
     	 objTo.appendChild(divtest);
     }
     else if(value>max_limit){
     	 alert("Can't add more than 10 Skills!!");
     } 
}
   function remove_add_fieldsC(rid) {
	   $('.removeclass'+rid).remove();
	   value--;
 }
</script>


    

   <script type="text/javascript">
$(function() {
  $('#datetimepicker1').datetimepicker({
    
  });
});
</script>


 <script>
function ValidateSize(file) {
	
		var maxFileSize = 20480000; // 1MB -> 1000 * 1024
        var FileSize = file.files[0].size ;
        var FileName = file.files[0].name ;
        var FileType = file.files[0].type ;
        //var Filetype = file.files[0].type ;
       // alert(Filetype);
        
       // var fsize=Math.round((FileSize/ 1024)) ;
        
        if (FileSize > maxFileSize) {
            alert('File not accept more than 20 MB');
            $(file).val('');
           // $(file).val(''); //for clearing with Jquery
        }else {

      

            }
        
	
    }
function chkJobCode(){
	var jc=$('#jobCode').val();//\w
	
	$.ajax({
        type : "GET",
        asyn : false,
        url  : "checkJobCodeExists?jc="+jc,
        success  : function(response){
        	//alert(response);
        	  
            if(response!=''){
                 // alert(response+"  already exists,please change.. ");
                   $('#jobsuccess').text('Job Code already exists,please change..');
                   $('#subcheck').attr('disabled', true);
         		
                  
            }else{
            	  $('#jobsuccess').text('success');
            	 if(/^[0-9a-zA-Z ]+$/.test(jc) == false) {
         		    alert('Job code not allow special characters characters.');
         		  // $('#subcheck').attr('disabled', true);
         		}else if((jQuery.trim( jc )).length==0){
         			alert('Job code  not accpets only spaces.');
         			$('#jobCode').val("");
         			//$('#subcheck').attr('disabled', true);
         		}
            	 
            	  $('#subcheck').attr('disabled', false); 
            	  $('#jobsuccess').text('');
            	  
            	
            }
     },
     error : function() {
     }
        });
	

}
</script> 
  <script type="text/javascript">
  function checkForm(form)
  {
    form.subcheck.disabled = true;
    form.subcheck.value = "Please wait...";
    return true;
  }

  function resetForm(form)
  {
    form.subcheck.disabled = false;
    form.subcheck.value = "Submit";
    form_being_submitted = false;
  }
</script>

</html>
