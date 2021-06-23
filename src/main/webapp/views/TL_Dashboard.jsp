<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TL DASHBOARD</title>
<link href="resources/assets/javascripts/charts/chart.js" media="all" rel="stylesheet" type="text/css" /> 
</head>
<body>
<section id='content'>
	<div class='container-fluid'>
			<div class='row-fluid' id='content-wrapper' style="margin-top:-100px;">
                    <div class='span6'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">Dashboard</Strong>
					</div>
				
				
				
			</div>
			<!-- Header close-->
					
			<c:forEach var="db" items="${tlDblist}">
			<input type="hidden" name="recname" id="recname" value="${db.recname}"/> 	
			<%-- <c:forEach var="Dblist" items="${tlDblist}">  --%>
			
			<input type="hidden" name="totjdcount" id="totjdcount" value="${db.totaljdcount}"/>	
			<input type="hidden" name="RecTotalcount" id="RecTotalcount" value="${db.rectotalsubmittedcount}"/>	
			<input type="hidden" name="sctTotalcount" id="sctTotalcount" value="${db.scttotalselectedcount}"/>
			</c:forEach>			
			<%-- </c:forEach> --%>
		
	<div class='row-fluid' style="margin-top: 10px;">
			<div class="span12">
				
			<!-- part 1 -->
			<!-- <div class='box-content'> -->
			<div  class="span12">
				<div class='row-fluid' style="margin-top: 10px;">
					<div class='span12 box'>
						<div class='box-header orange-background' style="padding:5px">
							<div class='title'>
								<strong style="color:black;"><i>JD's Count v/s Recruiter Submitted Count v/s SCT Selected Count</i></strong>															
							</div>						
						</div>
						<div class='box-content box-statistic'>
						 <div class="embed-responsive embed-responsive-16by9" >						
							<canvas id="REC" class="embed-responsive-item" style="width:250px;"></canvas>
							
						</div> 
						<br>	
				       <center>			
				       <span style="color:Green">**Total JD's Count** </span>
					   <span style="color:Blue">**Recruiter Submitted Count**</span>
					   <span style="color:Red">**SCT Selected Count**</span>
				
				       </center>
	                  </div> 
					</div>
				  </div>
				</div>
			</div>
			
		</div>			
		
		</div>
	</div>
</section>
   <script type="text/javascript" src="resources/assets/javascripts/charts/chart.js"></script> 
  <script type="text/javascript">
  
  var Rec_name =document.getElementsByName("recname");
  var recname =[];	  
  for(var i = 0; i < Rec_name.length; i++){
 	  recname[i]= document.getElementsByName("recname")[i].value;
  }

  var Total_Jd =document.getElementsByName("totjdcount");
  var totjdcount=[];	  
  for(var i = 0; i < Total_Jd.length; i++){
 	 totjdcount[i]= document.getElementsByName("totjdcount")[i].value;
  }
  
  var Rec_Total =document.getElementsByName("RecTotalcount");
  var RecTotalcount=[];	  
  for(var i = 0; i < Rec_Total.length; i++){
 	 RecTotalcount[i]= document.getElementsByName("RecTotalcount")[i].value;
  }
  var SCT_Total =document.getElementsByName("sctTotalcount");
  var sctTotalcount=[];	  
  for(var i = 0; i < SCT_Total.length; i++){
 	 sctTotalcount[i]= document.getElementsByName("sctTotalcount")[i].value;
  }
 
  console.log(recname);
  console.log(totjdcount);
  console.log(RecTotalcount);
  console.log(sctTotalcount);
  
  var REC_data = {		 
	   		labels: recname,
	   	 	datasets: [{
				label: "Total Positions",
				legendText:"Total JD's count",
				fillColor: "rgba(0,128,0,0.7)",
				strokeColor: "rgba(220,220,220,0)",
				pointColor: "rgba(220,220,220,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(220,220,220,1)",
				data : totjdcount
			},
			 {		 
	   		
				label: "Submitted",
				legendText:"Submitted Count",
				fillColor: "rgba(70,74,247,0.7)",
				strokeColor: "rgba(151,187,205,0)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(151,187,205,1)",
				data : RecTotalcount
			},
			{		 
	    		
				label: "Selected",
				legendText:"Submitted Count",
				fillColor: "rgba(255,0,0,0.6)",
				strokeColor: "rgba(151,187,205,0)",
				pointColor: "rgba(151,187,205,1)",
				pointStrokeColor: "#fff",
				pointHighlightFill: "#fff",
				pointHighlightStroke: "rgba(151,187,205,1)",
				data : sctTotalcount
			}
			
			]  };
  
  var pdata = [{
 		value: 50,
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
		value: 50,
		color: "#46BFBD",
		highlight: "#5AD3D1",
		label: "Blue"
	},]
  

  var ctxb = $("#REC").get(0).getContext("2d");	     
  new Chart(ctxb).Bar(REC_data); 
  
  var ctxb1 = $("#SCT").get(0).getContext("2d");	     
  new Chart(ctxb1).Bar(SCT_data);
  
 
    </script> 
</body>
</html>