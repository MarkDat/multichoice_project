<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Exam</title>
</head>

<body>
	<!-- Content -->
	<div class="col-lg-7">
		<div class="row row-eq-heights">
			<!-- table List exam -->
			<table class="table table-hover  table-bordered">
				<thead class="text-center">
					<tr class=" table-success">
						<th scope="col">#</th>
						<th scope="col">Code</th>
						<th scope="col">Name</th>
						<th scope="col">Create date</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<%!int count = 1;%>
					<c:forEach items="${listExam}" var="exam">
						<tr>
							<th scope="row"><%=count++%></th>
							<td>${exam.getIdExam()}</td>
							<td>${exam.getTitleExam()}</td>
							<td>${exam.getCreatedDate()}</td>
							<td class="text-center"><a class="btn btn-info" href="/multichoice_project/exam?id=${exam.getIdExam()}" role="button">Start test</a></td>
						</tr>
					</c:forEach>
					<%
					count = 1;
					%>
				</tbody>
			</table>
			<!-- table List exam -->
		</div>
	</div>
	<!-- Content -->
</body>

</html>