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
	<div class="col-lg-7  justify-content-end">
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">Customer Information</h6>
			</div>
			<div class="card-body">
				  <form class="mx-5 mt-5 mb-3">
          <div class="row mb-3">
            <label for="old-pass" class="form-label col-3">Old Password</label>
            <input type="password" class="form-control col-8" id="old-pass" />
            <label class="required col" style="color: red">*</label>
          </div>
          <div class="row mb-3">
            <label for="new-pass" class="form-label col-3">New Password</label>
            <input type="password" class="form-control col-8" id="new-pass" />
            <label class="required col" style="color: red">*</label>
          </div>
          <div class="row mb-3">
            <label for="re-new-pass" class="form-label col-3"
              >Re New Password</label
            >
            <input
              type="password"
              class="form-control col-8"
              id="re-new-pass"
            />
            <label class="required col" style="color: red">*</label>
          </div>
          <div class="row mt-4">
            <div class="col text-center">
							<button type="submit" class="btn btn-primary">Submit</button>
							<a type="button" class="btn btn-secondary text-white"  href="/multichoice_project/customer_info">Close</a>
            </div>
          </div>
        </form>
			</div>
		</div>
	</div>
	<!-- End Form Edit Password -->
</body>

</html>