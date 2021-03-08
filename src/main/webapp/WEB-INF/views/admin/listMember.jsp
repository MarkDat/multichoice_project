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

	<table class="table table-bordered" id="dataTable" width="100%"
		cellspacing="0">
		<thead>
			<tr>
				<th>NO.</th>
				<th>Exam ID</th>
				<th>Title Exam</th>
				<th>Subject Name</th>
				<th>Grade</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>NO.</th>
				<th>Exam ID</th>
				<th>Title Exam</th>
				<th>Subject Name</th>
				<th>Grade</th>
			</tr>
		</tfoot>
		<tbody>
			<%!int count = 1;%>
			<c:forEach var="list" items="${list}">

				<tr>
					<td>
						<%
						out.println(count);
						count++;
						%>
					</td>
					<td>${list.idExam}</td>
					<td>${list.titleExam}</td>
					<td>${list.nameSubject}</td>
					<td>${list.nameGrade}</td>

				</tr>
			</c:forEach>



		</tbody>
	</table>

</body>

</html>