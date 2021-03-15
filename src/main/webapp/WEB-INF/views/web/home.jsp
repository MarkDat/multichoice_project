<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>

<body>
	<!-- Content -->
	<div class="col-lg-7">
		<div class="row row-eq-heights">
			<!-- run FOR for display subject-->
			<c:forEach items="${listSup}" var="sup">
				<a class="col-6 col-lg-4 text-decoration-none"
					href="/multichoice_project/sup?id=${sup.getIdSubject()}">
					<div class="card p-2 mb-3">
						<img style="height: 250px"
							src="https://i.pinimg.com/originals/22/72/2b/22722b33f4d7e9d810c6bce2fe678128.jpg"
							class="card-img-top" />
						<div class="card-body">
							<h6 class="card-text text-center">${sup.getNameSubject()}</h6>
						</div>
					</div>
				</a>
			</c:forEach>
			<!-- End run FOR -->
		</div>
	</div>
	<!-- Content -->
</body>

</html>