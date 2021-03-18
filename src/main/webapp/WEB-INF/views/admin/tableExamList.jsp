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

	<form action="#">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>NO.</th>
					<th>Exam ID</th>
					<th>Title Exam</th>
					<th>Subject Name</th>
					<th>Grade</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
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
						<td>
							<div class="form-check d-flex justify-content-center">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							</div>
						</td>
						<td class="form-check d-flex justify-content-center">
							<a class="btn btn-info mr-2" href="<c:url value='/admin/detailQuestions?idexam=${list.idExam}' />" value="Info" id="info">Info</a>
						</td>

					</tr>
				</c:forEach>
				<%
			count = 1;
			%>

			</tbody>

		</table>
		<div class=" mb-2 mt-2 d-flex justify-content-end">
			<button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#addModal"
				data-whatever="@mdo">Add new</button>
			<button class="btn btn-primary ml-2">Delete item</button>
		</div>

		<!-- Modal edit-->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Edit</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body ml-5">
						<form>
							<div class="form-group row">
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-5 col-form-label">Nhập tên đề thi</label>
									<div class="col-sm-7">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="Tên đề thi">
									</div>
								</div>

								<fieldset class="form-group">
									<div class="row">

										<legend class="col-form-label col-sm-5 pt-0">Chọn môn</legend>

										<div class="col-sm-7">

											<div class="dropdown col-sm-5 ml-2">
												<button class="btn btn-light dropdown-toggle" type="button"
													id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="true">
													Subject name
													<span class="caret"></span>
												</button>
												<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
													<c:forEach var="listDistinct" items="${listSubjectDistinct}">
														<li><a class="dropdown-item" href="#"
																data-value="${listDistinct.nameSubject}">${listDistinct.nameSubject}</a>
														</li>
													</c:forEach>
												</ul>
											</div>

										</div>
									</div>
								</fieldset>
							</div>
							<div class="modal-footer">

								<button type="submit" class="btn">
									<a class="btn btn-outline-primary" href="#">Submit</a>
								</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- End modal -->


	</form>


	<script type="text/javascript">
	
	
	</script>
</body>

</html>