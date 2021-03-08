<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>

<body>
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> Data Table Example
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row mb-3">
					<div class="col-sm-12 col-md-6">
						<!-- Dropbox -->
						<div class="dropdown">
							<i class="fab fa-dropbox fa-lg"></i> List name:
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">Danh sách đề thi</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">Link 1</a> <a
									class="dropdown-item" href="#">Link 2</a> <a
									class="dropdown-item" href="#">Link 3</a>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>NO. </th>
							<th>Exam ID</th>
							<th>Title Exam</th>
							<th>Subject Name</th>
							<th>Grade</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>NO. </th>
							<th>Exam ID</th>
							<th>Title Exam</th>
							<th>Subject Name</th>
							<th>Grade</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="list" items="${list}">
							
							<tr>
								<td></td>
								<td>${list.idExam}</td>
								<td>${list.titleExam}</td>
								<td>${list.nameSubject}</td>
								<td>${list.nameGrade}</td>
								
							</tr>
						</c:forEach>



					</tbody>
				</table>
			</div>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at
			11:59 PM</div>
	</div>

</body>

</html>