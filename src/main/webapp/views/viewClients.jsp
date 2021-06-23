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
			<div class='row-fluid' id='content-wrapper' style="margin-top:-140px;">
                    <div class='span12'>
                        <div class='row-fluid'>
                            <div class='span12 box bordered-box orange-border'
						style="margin-top: 20px;">

                         <div class='box-header orange-background' style="line-height:20px;">
				
					<div class='title' style="line:width:50px;">

						<Strong style="color:#000080;font-size:25px;">View Clients</Strong>
					</div>
				
				
				
			</div>
								
								<div class='box-content box-no-padding'>
									<div class='responsive-table'>
										<div class='scrollable-area'>
										<div class="pagination">
											<table id="sampletable" class='data-table table table-bordered table-striped' data-pagination-records='10' data-pagination-top-bottom='true' style='margin-bottom:0;'>
												<thead>
													<tr>
														<th style='text-align:center;color:#000080;'>Client Name</th>														
														<th style='text-align:center;color:#000080;'>Client Added On</th>														
													</tr>
												</thead>
												<tbody>
												<c:forEach var="client" items="${clientList}">	<tr>
														<td>${client.cmpny_name}</td>
														<td><fmt:formatDate value='${client.submit_date}'  type='date'  pattern='yyyy-MM-dd'/></td>
													</tr></c:forEach>
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
		</section>

<script src="resources/assets/javascripts/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">$('#sampletable').DataTable();</script>
<script src="resources/assets/javascripts/plugins/datatables/datatable_rec.js" type="text/javascript"></script>
<script src="resources/assets/javascripts/plugins/datatables/jquery-ui.js"></script>
	
  </body>
</html>