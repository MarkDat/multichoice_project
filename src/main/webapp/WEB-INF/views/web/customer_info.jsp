<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Infor</title>
</head>

<body>

	<!-- Content -->
	<div class="col-lg-7  justify-content-end">
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">Customer Information</h6>
			</div>
			<div class="card-body">
				<form class="px-3 my-3">
					<div class="row mb-3">
						<label for="fullname" class="form-label col-3">Fullname</label> <input
							readonly type="text" class="form-control col-8" id="fullname" />
						<label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="email" class="form-label col-3">Email</label> <input
							readonly type="email" class="form-control col-8" id="email" /> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="address" class="form-label col-3">Address</label> <input
							readonly type="text" class="form-control col-8" id="address" />
						<label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="phone" class="form-label col-3">Phone</label> <input
							readonly type="text" class="form-control col-8" id="phone" /> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mt-4">
						<div class="col text-center">
							<a id="editinfo" type="button"
								class="btn btn-primary text-white mx-1"> Edit Info </a> <a
								id="save" type="button"
								class="btn btn-primary d-none text-white mx-1"> Save
								</button> <a id="editpass" type="button"
								class="btn btn-secondary text-white mx-1"
								href="/multichoice_project/edit_password"> Edit Passs </a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Content -->

</body>

</html>