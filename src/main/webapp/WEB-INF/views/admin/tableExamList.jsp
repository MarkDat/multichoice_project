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
								<input class="form-check-input" type="checkbox" value="${list.idExam}" name="rdoDelete" id="flexCheckDefault">
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
			<input type="submit" class="btn btn-primary ml-2" data-toggle="modal" data-target="#addModal"
				data-whatever="@mdo" value="Add new"/>
			<input type="button" class="btn btn-primary ml-2" id="deleteButton" onclick="deleteProcess()" value="Delete Item"/>
		</div>

		<!-- Modal edit-->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add New Exam	</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body ml-5">
						<form>
							<div class="form-group row">
								<div class="form-group row">
									<label for="inputEmail3" class="col-sm-5 col-form-label" >Nhập tên đề thi</label>
									<div class="col-sm-7">
										<input type="email" class="form-control" id="inputSubject"
											placeholder="Tên đề thi">
									</div>
								</div>

								<fieldset class="form-group">
									<div class="row">

										<legend class="col-form-label col-sm-5 pt-0">Chọn môn</legend>

										<div class="col-sm-7">
												<div>
													<select class="form-control mr-12" style="width: 200px;" name="listSubjects">
														<option id="" value="Choose your subject" selected>Choose your subject</option>
														<c:forEach var="listDistinct" items="${listSubjectDistinct}">
													  		<option value="${listDistinct.idSubject}" id="selectOption">${listDistinct.nameSubject}</option>
													  	</c:forEach>
													</select>	
												</div>
										</div>
									</div>
								</fieldset>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-outline-primary" data-dismiss="modal" value="Add"
									onclick="addExamTableProcess()">Add</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- End modal -->


	</form>


	<script>
	
	
		var arrayValues = [];
		function checkChecked(){
	    	const checkbox = document.querySelectorAll('input[name="rdoDelete"]:checked');
	    	
	    	for (let i = 0; i < checkbox.length; i++) {
	    		  let item = checkbox[i].value;
	    		  arrayValues.push(item);
	    	}
	    	
	    	console.log(arrayValues);
	    }
		
		function convertArrayToArrayObject(arr){
			for (let i = 0; i < arr.length; i++) {
				arr[i] = {"idExam":arr[i]};
	    	}
			return arr;
		}
		
		
		 function deleteCheckedItems() {
			checkChecked();
			arrayValues= convertArrayToArrayObject(arrayValues);
			console.log(arrayValues);
         	$.ajax({
         		type: "POST",
         		contentType: "application/json;charset=utf-8",
         		url: "deleteExamItems",
         		data: JSON.stringify(arrayValues),
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
		 
		 
		 function examListDelete(callback, idQ) {
         	Swal.fire({
         		title: 'You are deleting exam',
         		text: "You won't be able to revert this!",
         		icon: 'warning',
         		showCancelButton: true,
         		confirmButtonColor: '#3085d6',
         		cancelButtonColor: '#d33',
         		confirmButtonText: 'Delete'
         	}).then((result) => {
         		if (result.isConfirmed) {
         			callback(idQ);
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
		 
		 function deleteProcess(){
			 examListDelete(deleteCheckedItems); 
         }
		 
		 
		 /*  */
		 /*  */
		 function postDataExamTable() {

			$.ajax({
				type: "POST",
				contentType: "application/json;charset=utf-8",
				url: "addNewExamTable",
				data: JSON.stringify({
					"idSubject" : $('select[name=listSubjects] option').filter(':selected').val(),
					"titleExam": inputSubject.value,
					"nameSubject" : $('select[name=listSubjects] option').filter(':selected').text()
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

		function addExamTable(callback) {
			Swal.fire({
				title: 'You are adding exam to table ?',
				text: "You won't be able to revert this!",
				icon: 'info',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Add'
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

		function addExamTableProcess() {
			addExamTable(postDataExamTable);
		};
		 
		 
		 
		 
		 
		 
		 
	
	</script>
</body>

</html>