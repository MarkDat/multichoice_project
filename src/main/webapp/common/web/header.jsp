<%@page import="java.util.List"%>
<%@page import="com.wild.daos.impl.GradeDao"%>
<%@page import="com.wild.models.Grade"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="/multichoice_project/trang-chu">Multiple
			Choice Web App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<!-- List menu -->
			<ul class="navbar-nav ml-auto d-flex">
				<li class="nav-item active"><a class="nav-link"
					href="/multichoice_project/trang-chu">Home <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						Grades </a>
					<ul class="dropdown-menu bg-dark" aria-labelledby="navbarDropdown">

						<%
						GradeDao a = new GradeDao();
						List<Grade> listGrade = a.getAll();
						for (Grade grade : listGrade) {
						%>
						<li><a class="dropdown-item bg-dark text-white"
							href="/multichoice_project/grade?id=<%=grade.getIdGrade()%>">
								<%=grade.getNameGrade()%>
						</a></li>
						<%
						}
						%>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item bg-dark text-white" href="#">Something
								else here</a></li>
					</ul></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
			</ul>
			<!-- List menu -->

			<!-- Button login signin -->
			<div class="mx-2">
				<a class="btn btn-outline-secondary"
					href="/multichoice_project/login" role="button">Log in</a> <a
					class="btn btn-outline-secondary"
					href="/multichoice_project/register" role="button">Sign in</a>
			</div>
			<!-- Button login signin -->

			<!-- Button logout -->
			<div class="mx-2">
				<div class="btn-group">
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Locdeptraino1</button>
					<div class="dropdown-menu ">
						<a class="dropdown-item "
							href="/multichoice_project/customer_info">More Infomation</a> <a
							class="dropdown-item " href="#">History</a> <a
							class="dropdown-item " href="#">Rank</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item " href="/multichoice_project/login">Log
							out</a>
					</div>
				</div>
			</div>
			<!-- Button logout -->
		</div>
	</div>
</nav>
<!-- Header -->
