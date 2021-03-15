<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8" />

	<title>Home Page</title>

</head>

<body>
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th>NO.</th>
				<th>User name</th>
				<th>Full name</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Point/Times</th>
				<th></th>
			</tr>
		</thead>

		<tbody>

			<%!int count = 1;%>
			<c:forEach var="listUser" items="${listUser}">

				<tr>
					<td><% out.println(count);%></td>
					<td>${listUser.userName}</td>
					<td>${listUser.fullName}</td>
					<td>${listUser.address}</td>
					<td>${listUser.phone}</td>
					<td>${listUser.point} / ${listUser.times}</td>
					<td class="form-check d-flex justify-content-center">
						<input type="submit" value="Edit" onclick="getDataUser(${listUser.idUser})"
							class="btn btn-success mr-2" data-toggle="modal" data-target="#myModal" />
							
						<% String del = "del"+count;
							pageContext.setAttribute("del", del);
						%>
						<input type="submit" id="${del}" value="${listUser.status == 0 ? 'Active':'Block'}" onclick="postStatusUser('${del}', ${listUser.idUser}, ${listUser.status})" class="btn-status btn ${listUser.status == 0 ? 'btn-info':'btn-danger'} mr-2" />

					</td>
				</tr>
				<% count++;  %>
			</c:forEach>
			<%count = 1;%>

		</tbody>
	</table>

	<!-- Modal -->



	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div>
					<form action="/admin/edit" method="post">

						<div class="modal-header">
							<h4 class="modal-title">Edit member</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<input type="hidden" class="form-control" id="formGroupExampleInput0" placeholder="id"
							value="<c:out value='' />">
						<div class="modal-body">
							<div class="form-group">
								<label for="formGroupExampleInput">Full name : </label>
								<input type="text" class="form-control" id="formGroupExampleInput1"
									placeholder="Full name" value="<c:out value='' />">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Address : </label>
								<input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Adress"
									value="<c:out value='' />">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Phone : </label>
								<input type="text" class="form-control" id="formGroupExampleInput3" placeholder="Phone"
									value="<c:out value='' />">
							</div>
							
							<input type="hidden" class="form-control" id="formGroupExampleInput4" 
									value="<c:out value='' />">

							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal" value="Save"
									onclick="process()">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<script>
		function getDataUser(idU) {
			$.ajax({
				type: "GET",
				contentType: "application/json;charset=utf-8",
				url: "editu",
				data: {
					id: idU
				},
				dataType: 'json',
				timeout: 100000,
				success: function (data) {
					console.log("OKOKO");
					console.log(data.fullName);
					formGroupExampleInput0.value = data.idUser;
					formGroupExampleInput1.value = data.fullName;
					formGroupExampleInput2.value = data.address;
					formGroupExampleInput3.value = data.phone;
					formGroupExampleInput4.value = data.status;
				},
				error: function (e) {
					console.log("LOIII")
					console.log("ERROR: ", e);
				}
			});
		}


		function postDataUser() {

			$.ajax({
				type: "POST",
				contentType: "application/json;charset=utf-8",
				url: "editu",
				data: JSON.stringify({
					"idUser": formGroupExampleInput0.value,
					"fullName": formGroupExampleInput1.value,
					"address": formGroupExampleInput2.value,
					"phone": formGroupExampleInput3.value
				}),
				dataType: 'json',
				timeout: 100000,
				success: function (data) {
					if (data.status == 'SUCCEED')
						console.log("Succeed");

				},
				error: function (e) {
					console.log("LOIII")
					console.log("ERROR: ", e);
				}
			});
		}

		function memberList(callback) {
			Swal.fire({
				title: 'You are editing member?',
				text: "You won't be able to revert this!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Edit'
			}).then((result) => {
				if (result.isConfirmed) {
					callback();
					Swal.fire({
						position: 'top-end',
						icon: 'success',
						title: 'Your work has been saved',
						showConfirmButton: false,
						timer: 1500,
					});
					setTimeout(() => {
						location.reload();
					}, 1600);


				}
			})
		}

		function process() {
			memberList(postDataUser);
		};


		function postStatusUser(idcount, idUser, status) {
			console.log("CALL postStatusUser");
			let idCount = "#"+idcount;
			console.log("Gia trri : "+idCount);
			$.ajax({
				type: "POST",
				contentType: "application/json;charset=utf-8",
				url: "deleteu",
				data: JSON.stringify({
					"idUser": idUser,
					"status": status
				}),
				dataType: 'json',
				timeout: 100000,
				success: function (data) {
					if (data.status == 'SUCCEED'){
						console.log("Succeed");
						if($(idCount).val()=="Active"){
							$(idCount).removeClass("btn-info");
						  	$(idCount).addClass("btn-danger");
						  	$(idCount).attr('value', 'Block');  
	
						  	
						}else{
							$(idCount).removeClass("btn-danger");
						  	$(idCount).addClass("btn-info");
						  	$(idCount).attr('value', 'Active'); 
						}
					}
					

				},
				error: function (e) {
					console.log("LOIII")
					console.log("ERROR: ", e);
				}
			});
		}

	</script>


</body>


</html>