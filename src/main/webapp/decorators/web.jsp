<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css'/>"
	rel="stylesheet" type="text/css">
</head>
<body>
	<!-- Header -->
	<%@ include file="/common/web/header.jsp"%>

	<!-- Body -->
	<div class="container-fluid">
		<div class="row">
			<!-- Changing content -->
			<dec:body />
			<!-- Changing content -->
			<!-- Sidebar-Left -->
			<%@ include file="/common/web/sidebar_left.jsp"%>
			<!-- Sidebar-Left -->
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp"%>

	<!-- Bootstrap core JavaScript -->
	<script
		src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
		<script
		src="<c:url value='/template/web/js/customer.js'/>"></script>
</body>
</html>