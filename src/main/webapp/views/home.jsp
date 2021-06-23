<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

		 
		<section id='content'>
			<div class='container-fluid'>
				<div class='row-fluid' id='content-wrapper' style="margin-top:20px;">
					<div class='span12 box'>
						<div class='box-header brown-background'>
							<div class='title'><strong>COUNT STATISTICAL ANALYSIS</strong></div>
							
						</div>
						<div class='box-content'>
							<div class='row-fluid'>
								<div class='span6 box'>
									<div class='box-header'>
										<div class='title'>
											<div class='icon-inbox'></div>
											Requirements
										</div>
									</div>
									<div class='row-fluid'>
										<div class='span4'>
											<div class='box-content box-statistic'>
												<h3 class='title text-error'><c:out value="${JD_Count}"></c:out></h3>
												<small>Total Positions</small>												
												<div class='text-error icon-star align-right'></div>
											</div>
										
											
											<div class='box-content box-statistic'>
												<a class='' data-toggle='modal' href='#modal-ongoing' role='button'>
													<h3 class='title text-primary'>[${fn:length(JD_ONGNG_Count)}]</h3>
													<small>On Going Req</small>
												</a>
												<div class='text-primary icon-truck align-right'></div>
											</div>											
										</div>
										<div class='span4'>
											<div class='box-content box-statistic'>
												<a class='' data-toggle='modal' href='#modal-requirements' role='button'>
													<h3 class='title text-info'>[${fn:length(findAll_Data)}]</h3>
													<small>Total Req</small>
												</a>
												<div class='text-info icon-time align-right'></div>
											</div>											
											<div class='box-content box-statistic'>
												<a class='' data-toggle='modal' href='#modal-exclusive' role='button'>
													[${fn:length(JD_EXREQ_Count)}]
													<small>Exclusive Req</small>
												</a>
												<div class='text icon-plus align-right'></div>
											</div>
										</div>
										<div class='span4'>
											<div class='box-content box-statistic'>
												<a class='' data-toggle='modal' href='#modal-new' role='button'>
													[${fn:length(JDNEW_Count)}]
													<small>New Req</small>
												</a>
												<div class='text-success icon-inbox align-right'></div>
											</div>
											
											<div class='box-content box-statistic'>
												<a class='' data-toggle='modal' href='#modal-recycle' role='button'>
													[${fn:length(JD_RECREQ_Count)}]
													<small>Recycled Req</small>
												</a>
												<div class='text-warning icon-repeat align-right'></div>
											</div>
										</div>
									</div>
								</div>
							
								<div class='span6 box'>
									<div class='box-header'>
										<div class='title'>
											<div class='icon-inbox'></div>
											Profiles
										</div>
									</div>
									<div class='row-fluid'>
										<div class='span4'>
											<div class='box-content box-statistic'>
											<h3 class='title text-info'><c:out value="${P_Count}"></c:out></h3>
											<small>Total</small>
												<div class='text-info icon-time align-right'></div>
											</div>
											<div class='box-content box-statistic'>
												<h3 class='title text-warning'><c:out value="${Int_Hold_Status}"></c:out></h3>
												<small>On Hold <strong>[ INTERNAL ]</strong></small>
												<div class='text-warning icon-check align-right'></div>
											</div>
										</div>
										<div class='span4'>
											<div class='box-content box-statistic'>
												<h3 class='title text-success'><c:out value="${Int_Cand_Sel_Status}"></c:out></h3>
												<small>Selected <strong>[ INTERNAL ]</strong></small>
												<div class='text-success icon-flag align-right'></div>
											</div>
											<div class='box-content box-statistic'>
												<h3 class='title text-error'><c:out value="${Int_Cand_Rej_Status}"></c:out></h3>
												<small>Rejected <strong>[ INTERNAL ]</strong></small>
												<div class='muted icon-remove align-right' style="color:#F34541;"></div>
											</div>
										</div>
										<div class='span4'>											
											<div class='box-content box-statistic'>
												<h3 class='title text-error'><c:out value="${Ext_Cand_Rej_Status}"></c:out></h3>
												<small>Rejected <strong>[ EXTERNAL ]</strong></small>
												<div class='muted icon-group align-right' style="color:#F34541;"></div>
											</div>
											<div class='box-content box-statistic'>
												<h3 class='title text-success'><c:out value="${Ext_Cand_Status}"></c:out></h3>
												<small>Selected <strong>[ EXTERNAL ]</strong></small>
												<div class='text-success icon-group align-right'></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						 <div class='row-fluid' id='content-wrapper' style="margin-top:20px;">
							<div class='span12 box'>
								<div class='box-header brown-background'>
									<div class='title'><strong>TOTAL PROFILE WORKING STATUS</strong></div>
								</div>
								<div class='box-content'>
									<div class='row-fluid'>
										<div class='span12'>
											<div class='row-fluid recent-activity'>
												<div class='span12 box box-nomargin'>
													<div class='box-content box-no-padding'>
														<ul class='nav nav-tabs nav-tabs-simple'>
														
															<li class='active'>
															<c:forEach var="p" items="${Get_Cmpny_Details}">
															<li>
																<a data-toggle="tab" href="#infosys" id="krish" onclick="doActionComp('${p.cmpny_id}')"><i class='icon-building text-green'></i>
																	 ${p.cmpny_name}
																</a>
															</li>
															</c:forEach>
															<!-- <li>
																<a data-toggle="tab" href="#accenture"><i class='icon-building text-green'></i>
																	ACCENTURE
																</a>
															</li> -->
														</ul>
														<div class='tab-content'>
															<div class='tab-pane fade in active' id='infosys'>
																<div class='responsive-table'>
																	<div class='scrollable-area'>
																		<table class='table table-bordered table-striped' style='margin-bottom:0;'>
																			<thead>
																				<tr>
																					<th style='text-align:center;'>JD</th>
																					<th style='text-align:center;'>JD ID</th>
																					<th style='text-align:center;'>Sourced Profiles</th>
																					<th style='text-align:center;'>Selected Profiles (Int.)</th>
																					<th style='text-align:center;'>Rejected Profiles (Int.)</th>
																					<th style='text-align:center;'>On Hold Profiles (Int.)</th>
																					<th style='text-align:center;'>Selected Profiles (Ext.)</th>
																					<th style='text-align:center;'>Rejected Profiles (Ext.)</th>
																					<th style='text-align:center;'>On Hold Profiles (Ext.)</th>
																				</tr>
																			</thead>
																			<tbody id="Depart" >
																				<!--<tr >
																					 <td>SAP Basis Administration</td>
																					<td>
																						<a class='btn btn-inverse btn-small' data-toggle='modal' href='#modal-example' role='button'>
																							2020
																						</a>
																					</td>
																					<td>10</td>
																					<td>5</td>																					
																					<td>8</td>
																					<td>0</td>
																					<td>5</td>																					
																					<td>8</td>
																					<td>0</td>
																				</tr> -->
																				 																			
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
															
															<!-- <div>
															 <select id=first1>
															 <option></option>
																<option value = 1 >1</option>
																<option value = 2>2</option>
																<option value = 3>3</option>
																<option value = 4>4</option>
																<option value = 5>5</option>
																<option value = 6>6</option>
																<option value = 7>7</option>
																<option value = 8>8</option>
																</select>
															</div>
															
															<div>
															 <select id="second2" onclick="doAction(this.value);">
															 	 
																<option value = 1 >1</option>
																<option value = 2>2</option>
																<option value = 3>3</option>
																<option value = 4>4</option>
																<option value = 5>5</option>
																<option value = 6>6</option>
																<option value = 7>7</option>
																<option value = 8>8</option>
																</select>
															</div>
															Result
															<div>
															 <select id="drop"></select></div> -->
															
											 <script type="text/javascript">
											     function doAction(cid){
												 var saa = "#first1";
												 var sid = $(saa).val();
												
												 $.ajax({
														type: "post",
														url: "popjobdiscription",
														cache: false,
														async: false, 				
														data:"cid="+cid,
														success: function(response){

															$('#popupcheck').html(response.result);
															 
														},
														error: function(){	
																				
															alert('Error while request..');
														}
														
													});
													
											 }
											 </script>
															
															
															
															<div class='tab-pane fade' id='accenture'>
																<div class='responsive-table'>
																	<div class='scrollable-area'>
																		<table class='table table-bordered table-striped' style='margin-bottom:0;'>
																			<thead>
																				<tr>
																					<th style='text-align:center;'>JD</th>
																					<th style='text-align:center;'>JD ID</th>
																					<th style='text-align:center;'>Sourced Profiles</th>
																					<th style='text-align:center;'>Selected Profiles (Int.)</th>
																					<th style='text-align:center;'>Rejected Profiles (Int.)</th>
																					<th style='text-align:center;'>On Hold Profiles (Int.)</th>
																					<th style='text-align:center;'>Selected Profiles (Ext.)</th>
																					<th style='text-align:center;'>Rejected Profiles (Ext.)</th>
																					<th style='text-align:center;'>On Hold Profiles (Ext.)</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																					<td>SAP Basis Administration</td>
																					<td>
																						<a class='btn btn-inverse btn-small' data-toggle='modal' href='#modal-example' role='button'>
																							2020
																						</a>
																					</td>
																					<td>10</td>
																					<td>5</td>																					
																					<td>8</td>
																					<td>0</td>
																					<td>5</td>																					
																					<td>8</td>
																					<td>0</td>
																				</tr>
																			 																			
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
								
								<div class='modal hide fade' id='modal-example' role='dialog' tabindex='-1'>
									<div class='modal-header'>
										<button class='close' data-dismiss='modal' type='button'>&times;</button>
										<h3>Requirements</h3>
									</div>
									<div class='modal-body'>																				
										<p style="text-align:justify;" id="popupcheck"> </p>
									</div>
									
								</div>
							</div>
						</div>
						
						<div class='row-fluid' id='content-wrapper' style="margin-top:20px;">
							<div class='span12 box'>
								<div class='box-header brown-background'>
									<div class='title'><strong>WEEKLY STATUS OF PROFILES</strong></div>
								</div>
								<div class='box-content'>
									<div class='row-fluid'>
										<div class='span12'>
											<div id="chartdiv"></div>
										</div>										
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div>
			</div>
		</section>
    
	
	<div class='modal hide fade' id='modal-requirements' role='dialog' tabindex='-1'>
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Requirements History</h3>
		</div>
		<div class='modal-body'>																				
			<table class='table table-bordered table-striped' style='margin-bottom:0;'>
				<thead>
					<tr>
						<th style='text-align:center; vertical-align:middle;'>Account</th>
						<th style='text-align:center; vertical-align:middle;'>Requirements</th>
						<th style='text-align:center; vertical-align:middle;'>Received Date</th>
						<th style='text-align:center; vertical-align:middle;'>No.of Positions</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="p" items="${findAll_Data}">
					<tr>
						<td>${p.company_id.cmpny_name}</td>																
						<td>${p.jd_id}</td>																
						<td>${p.submit_date}</td>
						<td>${p.no_of_positions}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class='modal hide fade' id='modal-recycle' role='dialog' tabindex='-1'>
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Requirements History</h3>
		</div>
		<div class='modal-body'>																				
			<table class='table table-bordered table-striped' style='margin-bottom:0;'>
				<thead>
					<tr>
						<th style='text-align:center; vertical-align:middle;'>Account</th>
						<th style='text-align:center; vertical-align:middle;'>Requirements</th>
						<th style='text-align:center; vertical-align:middle;'>Received Date</th>
						<th style='text-align:center; vertical-align:middle;'>No.of Positions</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="p" items="${JD_RECREQ_Count}">
					<tr>
						<td>${p.company_id.cmpny_name}</td>																
						<td>${p.jd_id}</td>																
						<td>${p.submit_date}</td>
						<td>${p.no_of_positions}</td>
					</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
	
	<div class='modal hide fade' id='modal-new' role='dialog' tabindex='-1'>
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Requirements History</h3>
		</div>
		<div class='modal-body'>																				
			<table class='table table-bordered table-striped' style='margin-bottom:0;'>
				<thead>
					<tr>
						<th style='text-align:center; vertical-align:middle;'>Account</th>
						<th style='text-align:center; vertical-align:middle;'>Requirements</th>
						<th style='text-align:center; vertical-align:middle;'>Received Date</th>
						<th style='text-align:center; vertical-align:middle;'>No.of Positions</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="p" items="${JDNEW_Count}">
					<tr>
						<td>${p.company_id.cmpny_name}</td>																
						<td>${p.jd_id}</td>																
						<td>${p.submit_date}</td>
						<td>${p.no_of_positions}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	
	<div class='modal hide fade' id='modal-ongoing' role='dialog' tabindex='-1'>
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Requirements History</h3>
		</div>
		<div class='modal-body'>																				
			<table class='table table-bordered table-striped' style='margin-bottom:0;'>
				<thead>
					<tr>
						<th style='text-align:center; vertical-align:middle;'>Account</th>
						<th style='text-align:center; vertical-align:middle;'>Requirements</th>
						<th style='text-align:center; vertical-align:middle;'>Received Date</th>
						<th style='text-align:center; vertical-align:middle;'>No.of Positions</th>
					</tr>
				</thead>
				<tbody>									
				<c:forEach var="p" items="${JD_ONGNG_Count}">
					<tr>
						<td>${p.company_id.cmpny_name}</td>																
						<td>${p.jd_id}</td>																
						<td>${p.submit_date}</td>
						<td>${p.no_of_positions}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	
	<div class='modal hide fade' id='modal-exclusive' role='dialog' tabindex='-1'>
		<div class='modal-header'>
			<button class='close' data-dismiss='modal' type='button'>&times;</button>
			<h3>Requirements History</h3>
		</div>
		<div class='modal-body'>																				
			<table class='table table-bordered table-striped' style='margin-bottom:0;'>
				<thead>
					<tr>
						<th style='text-align:center; vertical-align:middle;'>Account</th>
						<th style='text-align:center; vertical-align:middle;'>Requirements</th>
						<th style='text-align:center; vertical-align:middle;'>Received Date</th>
						<th style='text-align:center; vertical-align:middle;'>No.of Positions</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="p" items="${JD_EXREQ_Count}">
					<tr>
						<td>${p.company_id.cmpny_name}</td>																
						<td>${p.jd_id}</td>																
						<td>${p.submit_date}</td>
						<td>${p.no_of_positions}</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	<script src="resources/assets/javascripts/jquery-1.10.2.js"></script>
	 <script  type="text/javascript">
 
  $( document ).ready(function() {
	  doActionComp('${companyidset}');
  });
 
  </script>
    
    	<script type="text/javascript">
											 function doActionComp(cid){
												 
											
												 $.ajax({
														type: "post",
														url: "companycount",
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
	
	 var arrval=[];
	  var unamearry=[];
		 var ucountarry=[];
	    
	    var chart;
		var graph;
		var categoryAxis;
	  <c:forEach var="t" items="${rdata1}">  { 
		  arrval.push("${t.user_id.user_name}");
				
				} </c:forEach>
				 
				

				arrval.sort();
				 var current = null;
				 var cnt = 0; 
				for (var i = 0; i <arrval.length; i++) {
			        if (arrval[i] != current) {
			            if (cnt > 0) {
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
			        unamearry.push(current);
	                ucountarry.push(cnt);
			    }
		
				 
				 	var chartData1 = [];
				 	for (var j = 0; j < unamearry.length; j++) {
				 	    chartData1.push({"country":unamearry[j],"visits": ucountarry[j],"color": "#754DEB"});        
				 	}



			AmCharts.ready(function () {
			chart = new AmCharts.AmSerialChart();
			chart.dataProvider = chartData1;
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
			categoryAxis.gridCount = chartData1.length; 

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
	
	
	<style type="text/css">
		chartdiv  
		{
			width: 100%;
			height: 400px;
			border:1px solid red;
		}
	</style>
	 <!-- <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script> -->
 <script type="text/javascript">
 
 </script>
	
</body>
</html>
