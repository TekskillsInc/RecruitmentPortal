 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.dropdown-content a:hover {background-color: none}
</style>
<header>
			<div class='navbar'>
				<div class='navbar-inner' style="background-color:black;">
					<div class='container-fluid'>
						<a class='brand' href='home'>
							<span style="font-weight:bold;">
								<img src="resources/assets/images/common/logo-web.png"
				class="pull-left" width="170" height="43" border="0" />
							</span>
						</a>
						<a class='toggle-nav btn pull-left' href='#' style="background-color:black;">
							<i class='icon-reorder'></i>
						</a> 
						<ul class='nav pull-right'>
							<li class='dropdown dark user-menu' style="background-color:black;">
								<a class='dropdown-toggle' data-toggle='dropdown' href='#'>
									<span class='user-name hidden-phone' style="font-weight:bold;"><c:out value="${username}" /></span>
									<b class='caret'></b>
								</a>
								<!-- <ul class='dropdown-menu'>
									<li>
										<a href='login.html'>
											<i class='icon-power-off'></i>&nbsp;
											Sign out
										</a>
									</li>
								</ul> -->
								<ul class='dropdown-menu' >

						<li><a href='logout'> <i
								class='icon-signout'></i> Sign out
						</a><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></li>
					</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</header>
<body>

</body>
</html> 