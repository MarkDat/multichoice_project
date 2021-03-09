<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="#">Multiple Choice Web App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<!-- List menu -->
			<ul class="navbar-nav ml-auto d-flex">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Khối A</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Khối B</a></li>
				<li class="nav-item"><a class="nav-link" href="#">IQ Test</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About Us</a>
				</li>
			</ul>
			<!-- List menu -->

			<!-- Button login signin -->
			<div class="mx-2">
				<button type="button" onclick="location.href='<c:url value="/login" />'" class="btn btn-outline-secondary">
					Log in</button>
				<button type="button" onclick="location.href='<c:url value="/register" />'" class="btn btn-outline-secondary">
					Sign in</button>
			</div class="mx-2">
			<!-- Button login signin -->

			<!-- Button logout -->
			<div>
				<div class="btn-group">
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Locdeptraino1</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">More Infomation</a> <a
							class="dropdown-item" href="#">History</a> <a
							class="dropdown-item" href="#">Rank</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Log out</a>
					</div>
				</div>
				<button type="button" class="btn btn-outline-secondary">
					Log out</button>
			</div>
			<!-- Button logout -->
		</div>
	</div>
</nav>
<!-- Header -->