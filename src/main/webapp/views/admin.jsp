<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

						<Strong style="color:#000080;font-size:25px;">VIEW REPORTS</Strong>
					</div>
				
				
				
			</div>
								<div class='box-content'>
									<form class='form form-horizontal validate-form' action="reports" method="GET" style='margin-bottom: 0;'>
										<div class='row'>
											<div class='span12'>
											<div class='control-group'>
													<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSelect Report</label>
													<div>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
														 <select id="dynamic_select" name='departname' onchange="window.open(this.value)" required> 
													
															<option value=>-- Select Report --</option>
															<!-- <option value="viewAuditReport">Audit Reports</option>
													 	    <option value="viewClientReports">Client Reports</option>
															<option value="viewProfileReports">Profiles Report</option>
															<option value="viewExclusiveReports">Exclusive Report</option>
															<option value="weeklySubRep">Weekly Submissions Report</option>
															<option value="viewAuditReport">Audit Report</option>
															<option value="AllRecReports">All Recruiters Report</option>
															<option value="SCTReports">SCT Report</option> -->
															<option value="getMainReport">Master Report</option>
														</select>
														<p class='help-block'></p>
													</div>
												</div>
											
											
																
											
											 
											 
											 
										</div>
											
										</div>								
									</form>
								</div>
							</div>
						</div>
						
						
						<% String s = request.getParameter("userName"); %>
			
				    <% if (s==null || s.isEmpty()) { %> 
				      
				
				   <div class='box-content' style= null>
										
										<% } else { %>
				    
				   <div class='box-content' >
							<div class='row-fluid'>
								<div class='span12'>
									<%--  <div > <strong><b><%= request.getParameter("userName") %></b></strong>  </div>  --%>
									<div id="chartdiv"></div>
								</div>										
							</div> <% } %>
						</div>
						<div class='box-content'>
							<div class='row-fluid'>
								<div class='span12'>
									<div id="chartdiv1"></div>
								</div>										
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
			</div>
		</section>
   
 
 <script type="text/javascript">
											 function doAction(cid){
			
											
												 $.ajax({
														type: "post",
														url: "adminchek",
														cache: false,
														async: false, 				
														data:"cid="+cid,
														success: function(response){

															 $('#Depart').html(response.result);
 
													
														},
														error: function(){	
																				
															//alert('Error while request..');
														}
														
													});
													
											 }
											 </script>
 
 
 
 
 
 

    
	<script type="text/javascript">
		var chart;
		var graph;
		var categoryAxis;
        var urlval=window.location.href;
        var firstspilt=urlval.split("&");
        var usrname=firstspilt[1].split("=");
        var fulluser=usrname[1];
        
		var chartData = 
		[
		  {
				"country": fulluser, 
				"visits": ${fn:length(rdata)},
				"color": "#006699"
			},
		]; 
		

			AmCharts.ready(function () {
			chart = new AmCharts.AmSerialChart();
			chart.dataProvider = chartData;
			 
			chart.categoryField = "country";
			chart.position = "left";
			chart.angle = 30;
			chart.depth3D = 15;
			chart.startDuration = 1;

			categoryAxis = chart.categoryAxis;
			categoryAxis.labelRotation = 45;
			categoryAxis.dashLength = 10;
			categoryAxis.gridPosition = "start";
			categoryAxis.autoGridCount = false;
			categoryAxis.gridCount = chartData.length;
			 
			graph = new AmCharts.AmGraph();
			graph.valueField = "visits";
			graph.type = "column";	
			graph.colorField = "color";
			graph.lineAlpha = 0;
			graph.fillAlphas = 0.8;
			graph.balloonText = "[[category]]: <b>[[value]]</b>";
			chart.addGraph(graph);
			chart.write('chartdiv');
		});
			
 
	</script>
	<script type="text/javascript">
	
	 var arrval=[];
	  var unamearry=[];
		 var ucountarry=[];
	    
	    var chart11;
		var graph11;
		var categoryAxis11;
	  <c:forEach var="t" items="${rdata1}">  { 
		  arrval.push("${t.user_id.user_name}");
		  arrval.push("${t.second_round_uid.user_name}");
				
				} </c:forEach>
				 
				

				arrval.sort();
				 var current = null;
				 var cnt = 0; 
			//alert(arrval);
				for (var i = 0; i <arrval.length; i++) {
			        if (arrval[i] != current) {
			            if (cnt > 0) {
			             //  document.write(current + ' slected profiles --> ' + cnt + ' No<br>');
			                unamearry.push(current);
				            ucountarry.push(cnt);

			            }
			            current = arrval[i];
			            cnt = 1;
			        } else {
			            cnt++;
			        }
			    }
				
							    if (cnt > 0) {
			     //  document.write(current + ' slected profiles --> ' + cnt + ' No');			        			       
			        unamearry.push(current);
	                ucountarry.push(cnt);
			    }
			//   alert(unamearry);
		//   alert(ucountarry);
			    
			 // for ( j = 0; j <unamearry.length; j++) {
				 
				 /* 	var chartData1 = [];
				 	for (var j = 0; j < unamearry.length; j++) {
				 	    chartData1.push({"country":unamearry[j],"visits": ucountarry[j],"color": "#009999"});        
				 	} */
 
 


			AmCharts.ready(function () {
			chart11 = new AmCharts.AmSerialChart();
			chart11.dataProvider = chartData1;
			chart11.categoryField = "country";
			chart11.position = "left";
			chart11.angle = 30;
			chart11.depth3D = 15;
			chart11.startDuration = 1;

			categoryAxis11 = chart11.categoryAxis;
			categoryAxis11.labelRotation = 45;
			categoryAxis11.dashLength = 10;
			categoryAxis11.gridPosition = "start";
			categoryAxis11.autoGridCount = false;
			categoryAxis11.gridCount = chartData1.length; 

			graph11 = new AmCharts.AmGraph();
			graph11.valueField = "visits";
			graph11.type = "column";	
			graph11.colorField = "color";
			graph11.lineAlpha = 0;
			graph11.fillAlphas = 0.8;
			graph11.balloonText = "[[category]]: <b>[[value]]</b>";
			chart11.addGraph(graph11);
			chart11.write('chartdiv1');
		});
			
	</script> 
	
	<style type="text/css">
		chartdiv  
		{
			width: 100%;
			height: 400px;
			border:1px solid red;
		}
	</style>
	<style type="text/css">
		chartdiv1  
		{
			width: 100%;
			height: 400px;
			border:1px solid red;
		}
	</style>
  </body>
</html>