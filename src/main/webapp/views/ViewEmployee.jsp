<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
 <style>
.pagination {
    /* display: inline-block; */
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
	
	<div class='row-fluid' id='content-wrapper' style="margin-top:-180px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">View Employees</Strong>
					</div>
				
				
				
			</div>
			
	
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
								<div class="pagination">
									<table class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-top-bottom='true'
										style='margin-bottom: 0;' id="sampletable">
										<thead>
											<tr>
												<th style='text-align: center;color:#000080;'>Employee ID</th>
												<th style='text-align: center;color:#000080;'>Full Name</th>
												<th style='text-align: center;color:#000080;'>User Name</th>
												<th style='text-align: center;color:#000080;'>Department</th>
												<th style='text-align: center;color:#000080;'>Designation</th>
												<th style='text-align: center;color:#000080;'>Lead</th>
												<th style='text-align: center;color:#000080;'>Status</th>
												<th style='text-align: center;color:#000080;'>Created Date</th>
												<th style='text-align: center;color:#000080;'>Edit</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="employee" items="${employeeList}">
												<tr>
													<td>${employee.emp_number}</td>
													<td>${employee.fullname}</td>
													<td>${employee.userName}</td>
													<td>${employee.depertment}</td>
													<td>${employee.empRole}</td>
													<td>${employee.leadName}</td>
													<td>${employee.empStatus}</td>
													<td>${employee.date}</td>
													<td>
														<div class='text-center'>
															<a class='btn btn-success btn-xs' data-toggle='modal' href='#edit_employee'
																onclick="getEmployeeData('${employee.userName}','${employee.emp_number}',
																'${employee.deptId}','${employee.depertment}','${employee.empRole}',
																'${employee.empStatus}','${employee.leadName}','${employee.emp_lead}')">
																<i class='icon-edit'></i>
																
															</a>
														</div>


													</td>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
</div>
</div>
									<div class='modal hide fade' id='edit_employee' role='dialog'
										tabindex='-1'>
										<div class='modal-header'>
											<button class='close' data-dismiss='modal' type='button'>&times;</button>
											<h3>EDIT EMPLOYEE</h3>
										</div>
										<div class='modal-body'>
											<form class='form form-horizontal validate-form'
												style='margin-bottom: 0;' action="updateEmployee" method="get">
												<div class='box-content'>
                                                    <div class='control-group'>
                                                        <label class='control-label' for='role'> Employee ID</label>
                                                        <div class='controls'>
													<input type="text" id="empnumber_edit" name="empnumber_edit"
														value="">
														</div>
                                                    </div>
													<div class='control-group'>
														<label class='control-label' for='role'> User Name</label>
														<div class='controls'>
															<input type="text" name="employeeName_edit"
																data-rule-required='true' id="employeeName_edit" value="" readonly>
														</div>
													</div>
													<div class='control-group'>
														<label class='control-label' for='role'> Status</label>
														<div class='controls'>
														<select name="employeeStatus_edit" id="employeeStatus_edit"
																data-rule-required='true' required>
																<option value="">Select Status</option>
																<option value="Active">Active</option>
																<option value="InActive">InActive</option>
																
															</select>
														
															<!-- <input type="text" name="employeeStatus_edit"
																data-rule-required='true' id="employeeStatus_edit" value=""> -->
														</div>
													</div>
													<div class='control-group'>
														<label class='control-label' for='role'>
															Department</label>
														<div class='controls'>
															<select name="departmentid" id="departmentid"
																data-rule-required='true' required>
																<!-- onchange="getUsersBydepartment()" -->
																<option value="">Select Department</option>
																<c:forEach var="department" items="${departmentList}">
																	<option value="${department.dept_ID}">${department.dept_name}</option>
																</c:forEach>
															</select>
														</div>
													</div>

													<div class='control-group'>
														<label class='control-label' for='validation_designation'>Designation</label>
														<div class='controls'>
															<select name="designation" data-rule-required='true'
																id="designation" onchange="defineRole()" required>
																<option value=''>Select Designation</option>
																<option value='BDM'>BDM</option>
																<option value='SCT'>SCT</option>
																<option value='TEAMLEAD'>TEAMLEAD</option>
																<option value='RECRUITER'>RECRUITER</option>
																<option value='HRMANAGER'>HR MANAGER</option>
																<option value='HRUSER'>HR USER</option>
																

															</select>
														</div>
													</div>
												
													<div class='control-group' id="setLead">
                                            <label class='control-label' for='role'> Select Lead</label>
                                            <div class='controls'>
                                             <select name="employlead" data-rule-required='true' id="employlead" >
                                                </select>
                                               
                                            </div>
                                        </div>
												</div>
												<div class='form-actions' style='margin-bottom: 0'>
													<button class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit'>
													Update
													</button>
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
</section>
    <script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
    <script type="text/javascript">$('#sampletable').DataTable();</script> 
    <script src="resources/assets/javascripts/plugins/datatables/datatable_rec.js" type="text/javascript"></script>
     <script src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>  
     <script src="resources/assets/javascripts/select2.min.js"></script> 

<script type="text/javascript">
$("#setLead").hide();
    	function getUsersBydepartment(){
    	    var departmentid =document.getElementById("departmentid").value;
    
    	    $('#employlead').empty();
    	        $.ajax({
    	            type : "GET",
    	            asyn : false,
    	            url  : "getTeamLeadsByDepartment?departmentid="+departmentid+"&&empRole=TEAMLEAD",
    	            success  : function(response){
    	                  $('#employlead').append($('<option/>').attr("value",'').text("Select Lead"));   
    	                  for (var i = 0; i < response.length; i=i+1) 
    	                  {  
    	                      $('#employlead').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
    	                  }  
    	            }
    	            
    	        });
    	       
    	      //  $('#designation').empty();
    		    
    	    }
	</script>
<script type="text/javascript">
function getEmployeeData(name,empnumber,deptid,department,role,status,leadName,leadNo){

	
	$('#employlead').empty();
	$('#employlead').append($('<option/>').attr("value", leadNo).text(leadName));
	 $.ajax({
         type : "GET",
         asyn : false,
         url  : "getTeamLeadsByDepartment?departmentid="+deptid+"&&empRole=TEAMLEAD",
         success  : function(response){
        	
             $('#employlead').append($('<option/>').attr("value",'" "').text("Select Lead"));   
             
               for (var i = 0; i < response.length; i=i+1) 
               {
                   $('#employlead').append($('<option/>').attr("value", response[i].emp_number).text(response[i].userName));
               }  
         }
         
     });
    	
    $('#empnumber_edit').val(empnumber);
    $('#employeeName_edit').val(name);
    $('#employeeStatus_edit').val(status);
    if(role=="RECRUITER"){
    	 $('#setLead').show();

    /* if(leadName!=null){
    	    } */
    }else{
    	 $('#setLead').hide();
    }
                         $("option").filter(function() {
                               return $(this).text() == department;
                         }).prop('selected', 'selected'); 
                       
                         $("option").filter(function() {
                               return $(this).val()==role;
                         }).prop('selected','selected'); 
                                         
                       /*   $("option").filter(function() {
                             return $(this).val()==role;
                       }).prop('selected','selected');  */
                        
                          
                                

    
  
    }
function defineRole(){
    var designation =document.getElementById("designation").value;
    var deptid =document.getElementById("departmentid").value;
 
    if(designation=="RECRUITER")
        {
        $('#employlead').empty();
         $("#setLead").show();
         $('#employlead').attr("required",true);
         $.ajax({
             type : "GET",
             asyn : false,
             url  : "getTeamLeadsByDepartment?departmentid="+deptid+"&&empRole=TEAMLEAD",
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
        $('#employlead').val(''); 
      /*   $('#leadid').hide(); */
        }
    
}
</script>                                              


</body>
</html>