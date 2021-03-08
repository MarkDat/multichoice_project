<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav
	class="navbar navbar-expand navbar-dark bg-dark static-top d-flex justify-content-between">
	<div class="d-flex align-item-center">
		<a class="navbar-brand mr-1" href="<c:url value='/admin/home'/>">Multiple Choice Web
			App</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
	</div>
	<div>
		<strong class=" text-light mr-1">Hi, []</strong>
		<a class="btn btn-outline-secondary text-light" href="<c:url value='/logout'/>"><i
			class="ace-icon fa fa-power-off"></i> Log out</a>
	</div>
</nav>