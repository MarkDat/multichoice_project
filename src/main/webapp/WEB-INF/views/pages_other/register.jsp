<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/login_register.css'/>"
	rel="stylesheet" type="text/css">
</head>

<body>
	<section class="Form my-4 mx-5">
		<div class="container">
			<div class="row no-gutters bg-white">
				<div class="col-lg-5">
					<img
						src="https://i.pinimg.com/564x/38/f5/06/38f50654e2d3ba2fc9b636c92e024c5e.jpg"
						class="w-100 d-none d-lg-flex h-100" alt="" />
				</div>
				<%
					String msg = null;
				if (request.getAttribute("msg") != null)
					msg = (String) request.getAttribute("msg");
				%>
				<div class="col-lg-7 px-5 pt-2">
					<%
						if (msg != null) {
					%>
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert"><%=msg%></div>
					<%
						}
					%>
					<h1 class="font-weight-bold py-3">MCWA</h1>
					<h4>Quick and easy!</h4>
					<form action="<%=request.getContextPath()%>/register" method="POST">
						<div class="form-row">
							<div class="col-lg-6">
								<input type="text" placeholder="Full Name"
									class="form-control my-3 p-4" name="fullname" required />
							</div>
							<div class="col-lg-6">
								<input type="text" placeholder="Username"
									class="form-control my-3 p-4" name="username" required />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-12">
								<input type="email" placeholder="Email"
									class="form-control my-3 p-4" name="email" required />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-12">
								<input type="text" placeholder="Phone"
									class="form-control my-3 p-4" name="phone" required />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-12">
								<input type="text" placeholder="Address"
									class="form-control my-3 p-4" name="address" required />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-6">
								<input type="password" placeholder="Password"
									class="form-control my-3 p-4" name="password" required />
							</div>
							<div class="col-lg-6">
								<input type="password" placeholder="Confirm Password"
									class="form-control my-3 p-4" name="repassword" required />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-6">
								<button type="submit"
									class="btn btn-lg btn-dark w-100 font-weight-bold rounded my-3">
									Register</button>
							</div>
						</div>
						<a href="#">Forgot password</a>
						<p>
							Do you already have an account?<a
								href="/multichoice_project/login"> Login here</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>