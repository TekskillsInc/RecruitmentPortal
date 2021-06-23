<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

		<section id='content'>
			<div class='container-fluid'>
				
			
		<div class='row-fluid' id='content-wrapper' style="margin-top:-180px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">Add Employees</Strong>
					</div>
				
				
				
			</div>
								<div class='box-content'>
								<div class='responsive-table'>
								<div class='scrollable-area'>
								
									<form class='form form-horizontal validate-form' style='margin-bottom: 0;' action="addEmployee" method="POST" onsubmit="return checkForm(this);">
									<div class='control-group'>
                                            <label class='control-label' for='role'> Department<span style="color:red">*</span></label>
                                            <div class='controls'>
                                             <select name="departmentid" id="departmentid"  data-rule-required='true' required onchange="getUsersBydepartment()" required>
                                               <option>Select Department</option>
                                            <c:forEach var="department" items="${departmentList}" >
                                                <option value="${department.dept_ID}" >${department.dept_name}</option>
                                                </c:forEach>     
                                                </select>
                                               
                                            </div>
                                        </div>
										<div class='control-group'>
                                            <label class='control-label' for='role'> Employee</label>
                                            <div class='controls'>
                                             <select name="employeeid" data-rule-required='true' id="employeeid" 
                                             multiple onchange="checkEmployee()" style="width: 225px;" required>
                                             	
                                                </select>
                                               <span id="empshow" style="color:red;"></span>
                                            </div>
                                        </div>
								<div class='control-group'>
											<label class='control-label' for='validation_designation'>Designation<span style="color:red">*</span></label>
											<div class='controls'>
												<select name="designation" data-rule-required='true' id="designation" onchange="defineRole()" required>
														 <option ></option>
														<!--<option value="BDM" label="BDM">BDM</option>

														<option value="SCT" label="SCT">SCT</option>
														<option value="TEAMLEAD" label="TEAM LEAD">TEAMLEAD</option>
														<option value="RECRUITER" label="RECRUITER">RECRUITER</option> -->
													
												</select>
											</div>
											<br>
											<div class='control-group' id="setLead">
                                            <label class='control-label' for='role'> Select Lead</label>
                                            <div class='controls'>
                                             <select name="employlead" data-rule-required='true' id="employlead" >
                                                </select>
                                               
                                            </div>
                                        </div>
                                        </div>
													 <div class='form-actions' style='margin-bottom:0'>
														<button id="submit" class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit'>
															
															ADD EMPLOYEES
														</button>
													</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div></div></div>
		</section>
		<script type="text/javascript">
$("#setLead").hide();
function getUsersBydepartment(){
	var departmentid =document.getElementById("departmentid").value;
	
	
		 
	    $.ajax({
	        type : "GET",
	        
	        asyn : false,
	        url  : "getUsersByDepartment?departmentid="+departmentid,
	        success  : function(response){
	        	
	        	$('#employeeid').empty();
	        	
	        	  /* $('#employeeid').append($('<option/>').attr("value","").text("Select")); */   
	        	 
	        	  for (var i = 0; i < response.length; i=i+1) 
	              {
	                  $('#employeeid').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
	              }  
	        }
	        
	    });
	    $('#employeeid').select2();	
	    $('#designation').empty();
	    if(departmentid==7){
	    	
	    	$('#designation').append("<option value=''>Select Designation</option><option value='BDM'>BDM</option>");
	}
	    else if(departmentid==1){
	    	
	    	$('#designation').append("<option value=''>Select Designation</option><option value='HRMANAGER'>HR MANAGER</option><option value='HRUSER'>HRUSER</option><option value='NEGOTIATOR'>NEGOTIATOR</option>");
	}
	    else {
	    	
	    	$('#designation').append("<option value=''>Select Designation</option><option value='SCT'>SCT</option><option value='TEAMLEAD'>TEAMLEAD</option><option value='RECRUITER'>RECRUITER</option><option value='DELIVERYTEAM'>DELIVERY TEAM</option>");
	    	}
	    }

function defineRole(){
	var designation =document.getElementById("designation").value;
	

	if(designation=="RECRUITER")
	    {
		 $("#setLead").show();
		 $('#employlead').attr("required",true);
    $.ajax({
        type : "GET",
        asyn : false,
        url  : "getUsersByDesignation?designation="+designation,
        success  : function(response){
              $('#employlead').append($('<option/>').attr("value","").text("Select Lead"));   
            
              for (var i = 0; i < response.length; i=i+1) 
              {
                  $('#employlead').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
                  
              }  
        }
        
    });
   
   
	    }
	else{
		$("#setLead").hide();
		}
	
}
function checkEmployee(){
	var emp=[];
	emp.push($('#employeeid').val());
    $.ajax({
    	type : "GET",
        asyn : false,
        url  : "checkEmployeeExists?empArr="+emp,
        success  : function(response){
            alert(response);
            if(response=="Employee Not Exists continue.."){
            	$('#submit').attr("disabled",false);
            
            	document.getElementById('empshow').innerHTML=response;
                }
            else{
            	$('#submit').attr("disabled",true);
            	document.getElementById('empshow').innerHTML=response;
                }
            
        }
	    
	    });
   	
 
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

 </body>
</html>