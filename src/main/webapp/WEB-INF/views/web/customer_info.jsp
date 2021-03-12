<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<<<<<< Updated upstream
<title>Customer Info</title>
=======
<title>Customer Infor</title>
>>>>>>> Stashed changes
</head>

<body>

	<!-- Content -->
	<div class="col-lg-7  justify-content-end">
<<<<<<< Updated upstream
		<!-- Edit info -->
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
								class="btn btn-primary d-none text-white mx-1"> Save </a> <a
								id="editpass" type="button"
								class="btn btn-secondary text-white mx-1"
								href="/multichoice_project/edit_password"> Edit Password </a>
=======
								class="btn btn-primary d-none text-white mx-1"> Save
								</button> <a id="editpass" type="button"
								class="btn btn-secondary text-white mx-1"
								href="/multichoice_project/edit_password"> Edit Passs </a>
>>>>>>> Stashed changes
						</div>
					</div>
				</form>
			</div>
		</div>
<<<<<<< Updated upstream
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
=======
>>>>>>> Stashed changes
	</div>
	<!-- Content -->

</body>

</html>