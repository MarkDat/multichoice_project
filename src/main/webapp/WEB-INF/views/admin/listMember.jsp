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
				<th>User name</th>
				<th>Full name</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Point/Times</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>NO.</th>
				<th>User name</th>
				<th>Full name</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Point/Times</th>
			</tr>
		</tfoot>
		<tbody>
			<%!int count = 1;%>
			<c:forEach var="list" items="${listUser}">

				<tr>
					<td>
						<%
						out.println(count);
						count++;
						%>
					</td>
					<td>${listUser.userName}</td>
					<td>${listUser.fullName}</td>
					<td>${listUser.}</td>
					<td>${listUser.}</td>
					<td>${listUser.}</td>
				</tr>
			</c:forEach>



		</tbody>
	</table>

</body>

</html>