<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/login_register.css'/>"
	rel="stylesheet" type="text/css">
</head>
<%
	String email = "";
if (request.getAttribute("email") != null)
	email = (String) request.getAttribute("email");
%>
<body>
	<section class="Form my-4 mx-5">
		<div class="container h-100">
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
				<div class="col-lg-7 px-5 pt-5">
					<%
						if (msg != null) {
					%>
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert"><%=msg%></div>
					<%
						}
					%>
					<h1 class="font-weight-bold py-3">MCWA</h1>
					<h4>Sign into your account</h4>
					<form action="<%=request.getContextPath()%>/login" method="POST"
						class="register-form" id="login-form">
						<div class="form-row">
							<div class="col-lg-7">
								<input type="text" name="email" id="email" value="<%=email%>"
									class="form-control my-3 p-4" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<input type="password" name="password" placeholder="Password"
									class="form-control my-3 p-4" />
							</div>
						</div>
						<div class="form-row">
							<div class="col-lg-7">
								<button type="submit"
									class="btn btn-lg btn-dark w-100 font-weight-bold rounded mt-3 mb-5">
									Login</button>
							</div>
						</div>
						<a href="#">Forgot password</a>
						<p>
							Don't have an account? <a href="/multichoice_project/register">Register
								here</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>