<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Password</title>
</head>

<body>
	<!-- Form Edit Password -->
	<%
	String email = (String) session.getAttribute("email");
	String msg = null;
	if (request.getAttribute("msg") != null)
		msg = (String) request.getAttribute("msg");
	%>
	<div class="col-lg-7  justify-content-end">
		<%
		if (msg == "Oke rồi đó bạn iu") {
		%>
		<div class="alert alert-success alert-dismissible fade show"
			role="alert"><%=msg%></div>
		<%
		} else if (msg != null) {
		%>
		<div class="alert alert-danger alert-dismissible fade show"
			role="alert"><%=msg%></div>
		<%
		}
		%>
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">Customer Information</h6>
			</div>
			<div class="card-body">
				<form class="mx-5 mt-5 mb-3" action="edit_password" method="POST">
					<input type="hidden" id="email" name="email" value="<%=email%>">
					<div class="row mb-3">
						<label for="oldpass" class="form-label col-3">Old Password</label>
						<input type="password" class="form-control col-8" id="oldpass"
							name="oldpass" /> <label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="newpass" class="form-label col-3">New Password</label>
						<input type="password" class="form-control col-8" id="newpass"
							name="newpass" /> <label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="renewpass" class="form-label col-3">Re New
							Password</label> <input type="password" class="form-control col-8"
							id="renewpass" name="renewpass" /> <label class="required col"
							style="color: red">*</label>
					</div>
					<div class="row mt-4">
						<div class="col text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<a type="button" class="btn btn-secondary text-white"
								href="/multichoice_project/customer_info">Close</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Form Edit Password -->
</body>

</html>