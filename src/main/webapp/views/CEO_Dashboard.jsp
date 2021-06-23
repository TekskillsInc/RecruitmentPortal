<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecruitmentPortal</title>
</head>
<body>
<section id='content'>

			
	<div class='container-fluid'>
	
	<div class='row-fluid' id='content-wrapper' style="margin-top:-180px;">
                    <div class='span6'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;width:575px;">
				
					<div class='title' >

						<Strong style="color:#000080;font-size:25px;">Reports Overview</Strong>
					</div>
				</div>
					</div>
				
				</div>
				</div>
			<!-- Header close-->
			<c:forEach var="mgr_report" items="${mgr_report_list}">
			<input type="hidden" value="${mgr_report.mgr_name}" name="mgr_name" id="mgr_name"/>
			<input type="hidden" value="${mgr_report.mgr_ttlReq}" name="mgr_req" id="mgr_req"/>
			<input type="hidden" value="${mgr_report.mgr_ttlSub}" name="mgr_sub" id="mgr_sub"/>
			<input type="hidden" value="${mgr_report.mgr_ttlOnbrd}" name="mgr_obd" id="mgr_obd"/> 
			</c:forEach>
			<!-- First row  -->
			<input type="hidden" name="treq" id="treq" value="${treq}" />
			<input type="hidden" name="tsub" id="tsub" value="${tsub}" />
			<input type="hidden" name="tcselected" id="tcselected" value="${tcselected}" />
			
			<c:forEach var="reportOverViewlist" items="${reportOverViewlist}">
			<input type="hidden" name="client" id="client" value="${reportOverViewlist.getClientName()}" />
			<input type="hidden" name="req" id="req" value="${reportOverViewlist.getRequirements()}" />
			<input type="hidden" name="sub" id="sub" value="${reportOverViewlist.getSubmitted()}" />
			<input type="hidden" name="cselected" id="cselected" value="${reportOverViewlist.getClientSelected()}" />
			
			</c:forEach>
		
		<!-- 	<div class="span12" style="width:1200px;"> -->
			<!-- part 1 -->
			<!-- <div class='box-content'> -->
			
			<div class='row-fluid' id='content-wrapper' style="margin-top:-10px;">			
				<div class="span12">
				<div class='box-content'>
				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box' style="width:600px;">
						<div class='box-header orange-background' style="padding:5px">
							<div class='title'>
								<strong style="color:black;"><i>Requirements v/s Submissions</i></strong>
							</div>
							 
				
						</div>
						<div class='box-content box-statistic'>
						 <div class="embed-responsive embed-responsive-16by9" >						
							<canvas id="barChartDemo" class="embed-responsive-item" style="width:100px;"></canvas>
							
						</div> 
						<br>	
				       <center>			
				        <span style="color:Green">**Client Selected**</span>
						<span style="color:Blue">**Submitted**</span>
						<span style="color:Red">**Requirements**</span>
				
				       </center>
	                  </div> 
					</div>
				  </div>
				</div>
			</div>
				<!-- part2 -->
				<div class='row-fluid' id='content-wrapper' style="margin-top:-10px;">			
				<div class="span12">
				<div class='box-content'>
				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box' style="width:600px;">
						<div class='box-header orange-background' style="padding:5px">
							<div class='title'>
								<strong style="color:black;"><i>Requirements v/s Submissions v/s client selected</i></strong>
							</div>
							 
				
						</div>
						<div class='box-content box-statistic'>
						 <div class="embed-responsive embed-responsive-16by9" >						
							<canvas id="barChartDemo1" class="embed-responsive-item" style="width:250px;"></canvas>
							
						</div> 
						<br>	
				       <center>			
				        <span style="color:Green">**Client Selected**</span>
						<span style="color:Blue">**Submitted**</span>
						<span style="color:Red">**Requirements**</span>
				
				       </center>
							</div> 
					</div>
				</div>
			</div>
		</div>			
			<!-- first row close  -->
			<!-- second row -->
			<div class='row-fluid' id='content-wrapper' style="margin-top:-10px;">			
				<div class="span12">
				<div class='box-content'>
				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box' style="width:600px;">
						<div class='box-header orange-background' style="padding:5px">
							<div class='title'>
								<strong style="color:black;"><i>Assigned v/s Submitted v/s OnBoarded</i></strong>
							</div>
							 
				
						</div>
						<div class='box-content box-statistic' >
						 <div class="embed-responsive embed-responsive-16by9" >						
							<canvas id="ASO" class="embed-responsive-item" ></canvas>
							
						</div> 
						<br>	
				       <center>
				
				        <span style="color:Green">**Total Positions**</span>
						<span style="color:Blue">**Submitted**</span>
						<span style="color:Red">**OnBoarded**</span>
				
				       </center>
	            </div> 
					</div>
				</div>
				</div>
				</div>
				
				   
			
			
			</div>
			<!-- second row end -->
		</div>
	</div>
</section>
						

							
				
	 
<%
		 float avldjan=100.0f;
	     float avldfeb=200.0f;
	     float avldmar=150.0f;
	     float avldapr=10.0f;
	 %>	
	 
	 
  <script type="text/javascript" src="resources/assets/javascripts/charts/chart.js"></script> 
  <script type="text/javascript">
  var m_name =document.getElementsByName("mgr_name");
  var mgr_name =[];	  
  for(var i = 0; i < m_name.length; i++){
	  mgr_name[i]= document.getElementsByName("mgr_name")[i].value;
  }
  
  var m_req =document.getElementsByName("mgr_req");
  var mgr_req =[];	  
  for(var i = 0; i < m_req.length; i++){
	  mgr_req[i]= document.getElementsByName("mgr_req")[i].value;
    
  }
  
  var m_sub =document.getElementsByName("mgr_sub");
  var mgr_sub =[];	  
  for(var i = 0; i < m_sub.length; i++){
	  mgr_sub[i]= document.getElementsByName("mgr_sub")[i].value;
	 
  }
  
  var m_obd =document.getElementsByName("mgr_obd");
  var mgr_obd =[];	  
  for(var i = 0; i < m_obd.length; i++){
	  mgr_obd[i]= document.getElementsByName("mgr_obd")[i].value;
  }
      var ASO_data = {
    		 
      	labels: mgr_name,
      	datasets: [
      		 {
      			label: "Positions",
      			legendText:"Assigned",
      			fillColor: "rgba(74,247,70,1)",
      			strokeColor: "rgba(220,220,220,0)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data:mgr_req
      			//data:['Assigned','submitted','onboarded']
      		}, 
      		{
      			label: "Submitted",
      			legendText:"Submitted",
      			fillColor: "rgba(70,74,247,1)",
      			strokeColor: "rgba(151,187,205,0)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",    
      			data:mgr_sub
      			
      		},
      		{
      			label: "Onboarded",
      			legendText:"Onboarded",
      			fillColor: "rgba(231,10,15,1)",
      			strokeColor: "rgba(220,220,220,0)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data:mgr_obd
      			
      		} 
      		
      	]
      };
      var pdata = [
      	{
      		value: 300,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "Red"
      	},
      	{
      		value: 50,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Green"
      	},
      	{
      		value: 100,
      		color: "#FDB45C",
      		highlight: "#FFC870",
      		label: "Yellow"
      	}
      ]
      var ctxb = $("#ASO").get(0).getContext("2d");
      var ASO_barChart = new Chart(ctxb).Bar(ASO_data);
    </script> 
    <!-- report 1&2 -->
    <script type="text/javascript">
      var data = {
      	labels: ["Week Basis"],
      	datasets: [
      		 {
      			label: "Assigned",
      			legendText:"Assigned",
      			fillColor: "rgba(74,247,70,1)",
      			strokeColor: "rgba(220,220,220,0)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data:[document.getElementById('tcselected').value]    			
      		}, 
      		{
      			label: "Submitted",
      			legendText:"Submitted",
      			fillColor: "rgba(70,74,247,1)",
      			strokeColor: "rgba(151,187,205,0)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",    
      			data:[document.getElementById('tsub').value]    			
      		},
      		{
      			label: "Onboarded",
      			legendText:"Onboarded",
      			fillColor: "rgba(231,10,15,1)",
      			strokeColor: "rgba(220,220,220,0)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data:[document.getElementById('treq').value]    			
      		}   		
      	]
      };
      var pdata = [
      	{
      		value: 120,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "Red"
      	},
      	{
      		value: 20,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Green"
      	},
      	{
      		value: 60,
      		color: "#FDB45C",
      		highlight: "#FFC870",
      		label: "Yellow"
      	}
      ]
      
      var refC =document.getElementsByName("client");
	  var client =[];	  
	  for(var i = 0; i < refC.length; i++){
		  client[i]= document.getElementsByName("client")[i].value;
	  }
	 
	  
	  var reqc =document.getElementsByName("req");
	  var req =[];	  
	  for(var i = 0; i < reqc.length; i++){
		  req[i]= document.getElementsByName("req")[i].value;
	  }
	  
	  var subc =document.getElementsByName("sub");
	  var sub =[];	  
	  for(var i = 0; i < subc.length; i++){
		  sub[i]= document.getElementsByName("sub")[i].value;
	  }
	  
	  var cselectedc =document.getElementsByName("cselected");
	  var cselected =[];	  
	  for(var i = 0; i < cselectedc.length; i++){
		  cselected[i]= document.getElementsByName("cselected")[i].value;
	  }
	  
	  
      var data1 = {    		 
    	      	labels: client,
    	      	datasets: [
    	      		 {
    	      			label: "Assigned",
    	      			legendText:"Assigned",
    	      			fillColor: "rgba(74,247,70,1)",
    	      			strokeColor: "rgba(220,220,220,0)",
    	      			pointColor: "rgba(220,220,220,1)",
    	      			pointStrokeColor: "#fff",
    	      			pointHighlightFill: "#fff",
    	      			pointHighlightStroke: "rgba(220,220,220,1)",
    	      			data:cselected    			
    	      		}, 
    	      		{
    	      			label: "Submitted",
    	      			legendText:"Submitted",
    	      			fillColor: "rgba(70,74,247,1)",
    	      			strokeColor: "rgba(151,187,205,0)",
    	      			pointColor: "rgba(151,187,205,1)",
    	      			pointStrokeColor: "#fff",
    	      			pointHighlightFill: "#fff",
    	      			pointHighlightStroke: "rgba(151,187,205,1)",    
    	      			data:sub    			
    	      		},
    	      		{
    	      			label: "Onboarded",
    	      			legendText:"Onboarded",
    	      			fillColor: "rgba(231,10,15,1)",
    	      			strokeColor: "rgba(220,220,220,0)",
    	      			pointColor: "rgba(220,220,220,1)",
    	      			pointStrokeColor: "#fff",
    	      			pointHighlightFill: "#fff",
    	      			pointHighlightStroke: "rgba(220,220,220,1)",
    	      			data:req    			
    	      		}   		
    	      	]
    	      };
    	      var pdata = [
    	      	{
    	      		value: 120,
    	      		color:"#F7464A",
    	      		highlight: "#FF5A5E",
    	      		label: "Red"
    	      	},
    	      	{
    	      		value: 20,
    	      		color: "#46BFBD",
    	      		highlight: "#5AD3D1",
    	      		label: "Green"
    	      	},
    	      	{
    	      		value: 60,
    	      		color: "#FDB45C",
    	      		highlight: "#FFC870",
    	      		label: "Yellow"
    	      	}
    	      ]   
      var ctxb = $("#barChartDemo").get(0).getContext("2d");
      var barChart = new Chart(ctxb).Bar(data);
      var ctxb1 = $("#barChartDemo1").get(0).getContext("2d");
      var barChart = new Chart(ctxb1).Bar(data1);
    </script>   
</body>
</html>