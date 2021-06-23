<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
 <head>
   <%

String uname=null;

   if(session.getAttribute("username")==null){
             response.sendRedirect("loginform.jsp");  
         }
   else{
    uname=(String)session.getAttribute("username");
   
   

   }
  %>
 
 
 
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

						<Strong style="color:#000080;font-size:25px;">Add Clients</Strong>
					</div>
				
				
				
			</div>
								<div class='box-content'>
									<form class='form form-horizontal validate-form' style='margin-bottom: 0;' action="saveClient" method="POST"  onsubmit="return checkForm(this);">
										<div class='control-group'>
											<label class='control-label' for='validation_cmpny_name'>Client Name (*)</label>
											<div class='controls'>
												<input pattern="[a-zA-Z][a-zA-Z\s]*" data-rule-minlength='2' data-rule-maxlength='25' data-rule-required='true' id='company_name' name='company_name' placeholder='Client Name' type='text' required>
											</div>
										</div>
										
										<div class='form-actions' style='margin-bottom:0'>
											<button class="btn btn-success btn-xs" style="background:#0b3c7c" type='submit' name="myButton" id="myButton"  >
												
												ADD CLIENT
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
       

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