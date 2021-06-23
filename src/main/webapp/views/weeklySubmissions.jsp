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

						<Strong style="color:#000080;font-size:25px;">View Weekly Submissions</Strong>
					</div>
				
				
				
			</div>
						
						
						<div class='box-content'>
							<form action="/" method="post">

								
								<div class='control-group'>
											<label class='control-label' for='validation_date'>From
												Date(*)</label>
											<div class='controls'>
												<div>
													
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='fromDate'
															name='fromDate' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span>
													</div>
												</div>
												
											</div>
										</div>
										<div class='control-group'>
											<label class='control-label' for='validation_date'>To Date(*)</label>
											<div class='controls'>
												<div>
													
													<div class='datetimepicker input-append'
														id='datetimepicker'>
														<input class='span12'  
															data-format='yyyy-MM-dd' id='endDate'
															name='endDate' placeholder='Select Date'
															type='text' required> <span class='add-on'> <i
															data-date-icon='icon-calendar' data-time-icon='icon-time' ></i>
														</span>
													</div>
												</div>
												
											</div>
										</div>
								
								<div class='form-actions' style='margin-bottom: 0'>
									<input type="button" value="search" class='btn btn-primary' onclick="getWeeklySub()">
								</div> 
							 </form> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class='container-fluid'>
		<div class='row-fluid' id='content-wrapper'>
			<div class='span12'>
				<div class='row-fluid' style="margin-top: 20px;">
					<div class='span12 box' style="display:none;" id="span12_box">
					
						<div class='box-content box-no-padding'>
							<div class='responsive-table'>
								<div class='scrollable-area'>
								
									<table id="mytable" class='data-table table table-bordered table-striped'
										data-pagination-records='10' data-pagination-bottom='true'
										data-sorting='false' style='margin-bottom: 0;' >
										<thead>
											<tr style="background-color:lavender">
												<th style='text-align: center; vertical-align: middle;'>From Date</th>
												<th style='text-align: center; vertical-align: middle;'>To Date</th>
												<th style='text-align: center; vertical-align: middle;'>Submissions/count</th>
												 
											</tr>
										</thead>
										<tbody id="tbody">
										
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
</section>


<!-- / jquery -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
function getWeeklySub(){
	
	var fd=$("#fromDate").val();
	var ed=$("#endDate").val();
	  //alert(fd+","+ed);
	$.ajax({
		type: "POST",
		url: "getWeeklySub",																						  
		datatype:'json',
		async: false,    

		data:"fd="+fd+"&ed="+ed,

		success: function(response){
		//alert('success');
		$('#span12_box').css("display", "");
		var tr= '<tr>' +
			        '<td>' + response.fd + '</td>' +
			        '<td>' +response.ed + '</td>' +
			        '<td>' + response.count + '</td>' +
			        '</tr>';
		

			$('#mytable > tbody').append(tr);	
				
		  },
		  error: function(response)
		  {
			alert('error/please select fromdate,todate');	
		  }
  });
}
	
</script>




<script>
	$(function() {
		$("#fromDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd',
				onSelect: function(selected) {
					  $("#endDate").datepicker("option","minDate", selected)
					  }
		});
	});
</script>
<script>
	$(function() {
		$("#endDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd',
				onSelect: function(selected) {
					  $("#fromDate").datepicker("option","maxDate", selected)
					  }
		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {
		if (window.location.href.indexOf("storeJD") > -1) {
			$('#successmsg1').delay(1).fadeIn();
			$('#successmsg1').delay(2500).fadeOut();
		}
	});
</script>

</body>
</html>
