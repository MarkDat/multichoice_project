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

		<!-- Edit info -->
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">Customer Information</h6>
			</div>
			<div class="card-body">
				<form class="px-3 my-3" action="customer_info" method="POST">
					<div class="row mb-3">
						<label for="fullname" class="form-label col-3">Fullname</label> <input
							readonly type="text" class="form-control col-8" id="fullname" name="fullname" />
						<label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="email" class="form-label col-3">Email</label> <input
							readonly type="email" class="form-control col-8" id="email" name="email"/> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="address" class="form-label col-3">Address</label> <input
							readonly type="text" class="form-control col-8" id="address" name="address" />
						<label class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="phone" class="form-label col-3">Phone</label> <input
							readonly type="text" class="form-control col-8" id="phone" name="phone"/> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mt-4">
						<div class="col text-center">
							<a id="editinfo" type="button"
								class="btn btn-primary text-white mx-1"> Edit Info </a>
							<button id="save" class="btn btn-primary d-none text-white mx-1"
								type="submit">Save</button>
							<a id="editpass" type="submit" name="submit" value="submit"
								class="btn btn-secondary text-white mx-1"
								href="/multichoice_project/edit_password"> Edit Password </a>

						</div>
					</div>
			</div>
		</div>
		<!-- Edit info -->
		<!-- History -->
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">History</h6>
			</div>
			<div class="card-body">
				<div class="card-body">
					<div
						class="d-flex flex-column justify-contents-center align-items-center">
						<table class="table table-bordered">
							<thead>
								<tr class=" table-success">
									<th>STT</th>
									<th>Bài thi</th>
									<th>Điểm số</th>
									<th>Ngày thi</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>01</td>
									<td>Toán học - đề số 1</td>
									<td>8</td>
									<td>2/1/2015</td>
								</tr>
								<tr>
									<td>02</td>
									<td>Hóa học - đề số 1</td>
									<td>7</td>
									<td>2/1/2015</td>
								</tr>
								<tr>
									<td>03</td>
									<td>Vật ly - đề số 1</td>
									<td>7</td>
									<td>2/1/2015</td>
								</tr>
								<tr>
									<td>04</td>
									<td>Vật ly - đề số 1</td>
									<td>7</td>
									<td>2/1/2015</td>
								</tr>
								<tr>
									<td>05</td>
									<td>Vật ly - đề số 1</td>
									<td>7</td>
									<td>2/1/2015</td>
								</tr>
							</tbody>

						</table>

						<!-- Phân trang -->
						<nav aria-label="Page navigation example"
							class="d-flex justify-content-lg-center">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>

						<div class="">
							<strong class="mx-1">Tổng điểm: <span
								class="text-danger">22.0</span></strong> <strong class="mx-1">Điểm
								trung bình: <span class="text-danger">7.33</span>
							</strong>
							<button class="btn btn-primary">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- History -->

	</div>
	<!-- Content -->

</body>

</html>