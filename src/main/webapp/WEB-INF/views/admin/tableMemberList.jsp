<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

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
					<td><% out.println(count); count++; %></td>	
					<td>${listUser.userName}</td>
					<td>${listUser.fullName}</td>
					<td>${listUser.address}</td>
					<td>${listUser.phone}</td>
					<td>${listUser.averagePointByTimes()}</td>
					<td class="form-check d-flex justify-content-center">
	                	<input type= "submit" value = "Edit" onclick="getDataUser(${listUser.idUser})" class="btn btn-success mr-2" data-toggle="modal" data-target="#myModal"/>
						<a type="submit" class="btn btn-danger">
							Del
						</a>
					</td>
				</tr>
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
						<input type="hidden" class="form-control" id="formGroupExampleInput0"
									placeholder="id" value="<c:out value='' />">
						<div class="modal-header">
          					<h4 class="modal-title">Edit member</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>

						<div class="modal-body">
							<div class="form-group">
								<label for="formGroupExampleInput">Full name : </label>
								<input type="text" class="form-control" id="formGroupExampleInput1"
									placeholder="Full name" value="<c:out value='' />">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Address : </label>
								<input type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Adress" value="<c:out value='' />">
							</div>
							<div class="form-group">
								<label for="formGroupExampleInput2">Phone : </label>
								<input type="text" class="form-control" id="formGroupExampleInput3" placeholder="Phone" value="<c:out value='' />" >
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-primary" data-dismiss="modal" value="Save" onclick="postDataUser()">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	function getDataUser(idU){
		$.ajax({
			type : "GET",
			contentType : "application/json;charset=utf-8",
			url : "editu",
			data : {
				id : idU
			},
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("OKOKO");
				
				console.log(data.fullName);
				formGroupExampleInput0.value = data.idUser;
				formGroupExampleInput1.value = data.fullName;
				formGroupExampleInput2.value = data.address;
				formGroupExampleInput3.value = data.phone;
			},
			error : function(e) {
				console.log("LOIII")
				console.log("ERROR: ", e);
			}
		});
	}
	
	function postDataUser(){
		
		$.ajax({
			type : "POST",
			contentType : "application/json;charset=utf-8",
			url : "editu",
			data : 
				JSON.stringify({
					"idUser" : formGroupExampleInput0.value
					"fullName" : formGroupExampleInput1.value,
					"address" : formGroupExampleInput2.value,
					"phone" : formGroupExampleInput3.value
				}),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				if(data.status == 'OK')
					console.log("Success");			

			},
			error : function(e) {
				console.log("LOIII")
				console.log("ERROR: ", e);
			}
		}); 
	}
	
	
</script>
</body>


</html>