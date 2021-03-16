<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>

    <!-- DataTables Example -->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-table"></i>
            <div id="titleQuestion">Đề toán - đề số 1</div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <!-- Content start -->


                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr style="background-color: #DFF0D8;">
                            <th style="width: 5%">STT</th>
                            <th style="width: 15%; text-overflow: " >Mã câu hỏi</th>
                            <th style="width: 33%">Câu hỏi</th>
                            <th style="width: 20%">Phương án trả lời</th>
                            <th style="width: 15%">Đáp án</th>
                            <th style="width: 12%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%! int count = 1; %>
                        <c:forEach var="question" items="${listQuestionDetails}">
                            <tr>
                                <td><% out.println(count); count++; %></td>
                                <td>${question.idExam}</td>
                                <td>${question.content}</td>
                                <td>
                                    <ul class="list-group">
                                        <li class="list-group-item list-group-item-primary">${question.rsA}</li>
                                        <li class="list-group-item list-group-item-secondary">${question.rsB}</li>
                                        <li class="list-group-item list-group-item-success">${question.rsC}</li>
                                        <li class="list-group-item list-group-item-danger">${question.rsD}</li>
                                    </ul>
                                </td>
                                <td>${question.rs}</td>
                                <td class="">
                                    <input type="submit" value="Edit" onclick="getDataExam(${question.idQ})"
                                        class="btn btn-warning mx-1" data-toggle="modal" data-target="#editModal" />

                                    <input type="submit" value="Del" class="btn btn-danger mx-1"  idQ="${question.idQ}" id="buttonDel" onclick="deleteProcess(deleteDataExam, ${question.idQ})"/>


                                </td>
                            </tr>
                        </c:forEach>
                        <% count = 1; %>
                    </tbody>
                </table>
            </div>
            <div class="mt-2 mb-2 float-right">
                <a class="btn btn-primary mr-2" href="<c:url value='/admin/tableExamList' />">Back</a>
            </div>


            <!-- Chỗ nầy là form edit và question lun -->



            <!-- Modal edit-->
            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Mã câu hỏi: </label>
                                    <div class="col-sm-8">
                                        <label class="col-sm-8 col-form-label" id="maCauHoi"></label>
                                    </div>
                                    <label class="col-sm-3 col-form-label">Mã đề: </label>
                                    <div class="col-sm-8">
                                        <label class="col-sm-8 col-form-label" id="maDe"></label>
                                    </div>
                                    <label class="col-sm-3 col-form-label">Câu hỏi: </label>
                                    <textarea class="col-sm-8 col-form-control" id="exampleFormControlTextarea1"
                                        rows="3"></textarea>
                                    <img src="#" alt="" style="">
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Phương án :</label>
                                    <div class="col-sm-8">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsA"
                                                value="option1" />


                                            <input type="text" class="form-control" placeholder="Câu A"
                                                id="exampleRadios1" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsB"
                                                value="option2" />
                                            <input type="text" class="form-control" placeholder="Câu B"
                                                id="exampleRadios2" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsC"
                                                value="option3" />
                                            <input type="text" class="form-control" placeholder="Câu C"
                                                id="exampleRadios3" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsD"
                                                value="option4" />
                                            <input type="text" class="form-control" placeholder="Câu D"
                                                id="exampleRadios4" value="" />
                                        </div>
                                        <span class="text-warning">*Chọn đáp án đúng, những đáp án còn lại sẽ là đáp án
                                            sai</span>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="process()">OK</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End modal -->

            <script>          
                function handleCheckRadio(data) {
                	$("#rsA").attr('checked', false);
                	$("#rsB").attr('checked', false);
                	$("#rsC").attr('checked', false);
                	$("#rsD").attr('checked', false);
                	const rs = data.rs;
                    const entries = Object.entries(data).slice(6,11);
                    let result = "";
                    for (const [key, value] of entries) {
                            if (value === rs) {
                                result = "#" + key;
                                $(result).attr('checked', true);
                                console.log(result);
                                result = "";
                                break;
                        	}


                    }
                }


                function getDataExam(idQ) {
                    $.ajax({
                        type: "GET",
                        contentType: "application/json;charset=utf-8",
                        url: "editExam",
                        data: {
                            idQ: idQ
                        },
                        dataType: 'json',
                        timeout: 100000,
                        success: function (data) {
                            console.log("OKOKO");
                            console.log(data.fullName);
                            document.getElementById('maCauHoi').innerHTML = data.idQ;
                            document.getElementById('maDe').innerHTML = data.idExam;
                            $("textarea#exampleFormControlTextarea1").val(data.content);
                            console.log(data);
                            exampleRadios1.value = data.rsA;
                            exampleRadios2.value = data.rsB;
                            exampleRadios3.value = data.rsC;
                            exampleRadios4.value = data.rsD;
                            rsA.value = data.rsA;
                            rsB.value = data.rsB;
                            rsC.value = data.rsC;
                            rsD.value = data.rsD;
                            setTimeout(() => {
                            	handleCheckRadio(data);
                            }, 500); 
                            
                        },
                        error: function (e) {
                            console.log("LOIII")
                            console.log("ERROR: ", e);
                        }
                    });
                }

                function checkCheckd(rs, object){
                	let check = false;
                	

                	
                	
                }



                function postDataExam() {

                	$.ajax({
                		type: "POST",
                		contentType: "application/json;charset=utf-8",
                		url: "editExam",
                		data: JSON.stringify({
                			"idQ" : document.getElementById('maCauHoi').innerHTML,
                			"content" : document.getElementById('exampleFormControlTextarea1').value,
                			"rsA" : exampleRadios1.value,
                			"rsB" : exampleRadios2.value,
                			"rsC" : exampleRadios3.value,
                			"rsD" : exampleRadios4.value,
                			"rs" : 
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


                function examListEdit(callback) {
                	Swal.fire({
                		title: 'You are editing exam',
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
                	examListEdit(postDataExam);
                }
                
            
                function deleteDataExam(idQ) {
                	$.ajax({
                		type: "POST",
                		contentType: "application/json;charset=utf-8",
                		url: "deleteExam",
                		data: JSON.stringify({
                			"idQ" : idQ
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

               function deleteProcess(f, idQ){
            	   examListDelete(f, idQ);
            	   
               }
               

               
               
                
               
            </script>



</body>

</html>