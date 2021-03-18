<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<title>Trang chủ</title>

	<!-- Custom fonts for this template-->
	<link href="<c:url value='/template/admin/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"
		type="text/css" />

	<!-- Page level plugin CSS-->
	<link href="<c:url value='/template/admin/vendor/datatables/dataTables.bootstrap4.css'/>" rel="stylesheet"
		type="text/css" />

	<!-- Custom styles for this template-->
	<link href="<c:url value='/template/admin/css/sb-admin.css'/>" rel="stylesheet" type="text/css" />
</head>

<body id="page-top">
	<%@ include file="/common/admin/header.jsp"%>

	<div id="wrapper">
		<%@ include file="/common/admin/sidebarLeft.jsp"%>

		<div id="content-wrapper">
			<div class="container-fluid">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Data Table Example
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<div class="row mb-3">
								<div class="col-sm-12 col-md-6">
									<!-- Dropbox -->
									<div>
										<i class="fab fa-dropbox fa-lg"></i> List name:
										<button type="button" class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown" id="display">
											Select your choice
										</button>
										<div class="dropdown-menu">
										
											<a class="dropdown-item" href="<c:url value='/admin/tableMemberList' />" value="Members list" id="members-list">Members list</a>
											<a class="dropdown-item" href="<c:url value='/admin/tableExamList' />" value="Exam list" id="exam-list">Exam list</a>
											<a class="dropdown-item" href="#" value="..." >Test</a>
										</div>
										
									</div>
								</div>
							</div>
							<!-- Content are here -->
							<dec:body />
							<!-- Content are here -->
						</div>
					</div>
				</div>

				<p class="small text-center text-muted my-5">
					<em>More table examples coming soon...</em>
				</p>
			</div>
			<!-- /.container-fluid -->

			<!--Footer -->
			<%@ include file="/common/admin/footer.jsp"%>
			<!--Footer -->
		</div>
		
		
	</div>
	<script  type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.3/xlsx.full.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/template/admin/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/template/admin/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

	<!-- Page level plugin JavaScript-->
	<script src="<c:url value='/template/admin/vendor/chart.js/Chart.min.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/datatables/jquery.dataTables.js'/>"></script>
	<script src="<c:url value='/template/admin/vendor/datatables/dataTables.bootstrap4.js'/>"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/template/admin/js/sb-admin.min.js'/>"></script>

	<!-- Demo scripts for this page-->
	<script src="<c:url value='/template/admin/js/demo/datatables-demo.js'/>"></script>
	<script src="<c:url value='/template/admin/js/demo/chart-area-demo.js'/>"></script>

	<script>
	$(document).ready(function() {
		  $('#display').click(function() {
		    $("#display").val('');
		  })
		});
		
	</script>
</body>

</html>