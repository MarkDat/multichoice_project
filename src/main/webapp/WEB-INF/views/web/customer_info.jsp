<%@page import="com.wild.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.wild.models.User"%>
<%@page import="com.wild.daos.impl.UserDao"%>
<%@page import="com.wild.models.History"%>
<%@page import="com.wild.daos.impl.HistoryDao"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Customer Infor</title>
</head>

<body>

	<!-- Content -->
	<div class="col-lg-7  justify-content-end">
		<%
		String email = (String) session.getAttribute("email");
		UserDao ud = new UserDao();
		User u = ud.findUserByEmail(email);
		%>
		<!-- Edit info -->
		<div class="card border-color mb-3">
			<div class="card-header border-color box-color">
				<h6 class="text-center">Customer Information</h6>
			</div>
			<div class="card-body">
				<form class="px-3 my-3" action="customer_info" method="POST">
					<input type="hidden" id="id" name="id" value="<%=u.getIdUser()%>">
					<div class="row mb-3">
						<label for="fullname" class="form-label col-3">Fullname</label> <input
							readonly type="text" class="form-control col-8" id="fullname"
							value="<%=u.getFullName()%>" name="fullname" /> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="email" class="form-label col-3">Email</label> <input
							readonly type="email" class="form-control col-8" id="email"
							value="<%=u.getEmail()%>" name="email" /> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="address" class="form-label col-3">Address</label> <input
							readonly type="text" class="form-control col-8" id="address"
							value="<%=u.getAddress()%>" name="address" /> <label
							class="required col" style="color: red">*</label>
					</div>
					<div class="row mb-3">
						<label for="phone" class="form-label col-3">Phone</label> <input
							readonly type="text" class="form-control col-8" id="phone"
							value="<%=u.getPhone()%>" name="phone" /> <label
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
								<%int count = 1;	
								float sum = 0;
								HistoryDao h = new HistoryDao();
								List<History> listHistory = h.getListHistoryByIdUser(u.getIdUser());
								for (History his : listHistory) {
								%>
								<tr>
									<td><%=count++%></td>
									<td><%=his.getTittleExam()%></td>
									<td><%=his.getMark()%></td>
									<td><%=his.getModifiedDate()%></td>
								</tr>
								<%sum += his.getMark();
								}
								
								%>
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
								class="text-danger"><%=sum%></span></strong> <strong class="mx-1">Điểm
								trung bình: <span class="text-danger"><%=sum/count%><%count = 1; %></span>
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