<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

body {
	background :rgba(52, 206, 187, 0);
	background-size: cover;
	font-family: 'Domine', serif;
	letter-spacing: 2px;
	height:100vh;
}
@media screen and (min-width: 320px) {
}
</style>


<div class="container-fluid"> 
      
      <div class="col-md-11">
      <div class="row">
      <div class="panel panel-primary">
      <br>
      <div class="row">
	<div class="col-md-4">
	<div class="row">
		<div class="col-md-12">
		<center> <img src="resources/assets/images/images.jpg"
                width="320" height="380" style="margin-left:10%;" /></center>
		
		</div>
		</div>
	</div>
	<div class="col-md-8">
		 <div class="row">
		<div class="col-md-12"><p><h3 style="margin-left:20%;">${errMsgContent}</h3>
		</div>
		
		</div>
		<div class="row">
		
		<div class="button-center">
		<center><a href="view_Jobdescription" class="btn btn-primary btn-lg">Go to Home</a></center>
	
	</div>
		</div>
		
	</div></div>
	<%-- 	<div class="row">
		<div class="col-md-12">
		<table>
		<tr>
		<td>&nbsp;&nbsp;</td>
		<td>
		Error Code:${errCode}
		</td>
		<td>&nbsp;</td>
		<td width="70%">&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;</td>
			<td>
			<form action="errorLog" method="post">
	<input type="hidden" value="${errMsg}" id="errmsg" name="errmsg">
	<button class="btn btn-sm btn-success" type="submit" id="download">report error</button>
	</form>
		</td>
		</tr>
		</table>
	</div>
		</div> --%>
	<br>
	</div>
	</div>
	</div>
	</div>