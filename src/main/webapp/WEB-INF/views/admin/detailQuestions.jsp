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
            <div id="titleQuestion"> ID EXAM : ${idExam}</div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <!-- Content start -->
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr style="background-color: #DFF0D8;">
                            <th style="width: 5%">STT</th>
                            <th style="width: 10%; text-overflow: " >Code</th>
                            <th style="width: 33%">Câu hỏi</th>
                            <th style="width: 25%">Phương án trả lời</th>
                            <th style="width: 15%">Đáp án</th>
                            <th style="width: 12%">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%! int count = 1; %>
                        
                        <c:forEach var="question" items="${listQuestionDetails}">
                            <tr>
                                <td><% out.println(count); count++; %></td>
                                <td>${question.idQ}</td>
                                <td>${question.content}</td>
                                <td>
                                    <ul class="list-group">
                                        <li class="list-group-item list-group-item-primary">${question.rsA}</li>
                                        <li class="list-group-item list-group-item-secondary">${question.rsB}</li>
                                        <li class="list-group-item list-group-item-success">${question.rsC}</li>
                                        <li class="list-group-item list-group-item-danger">${question.rsD}</li>
                                    </ul>
                                </td>
                                <td id="result">${question.rs}</td>
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
           		<input type="file" id="fileUpload" class="btn btn-primary mr-2" accept=".xls,.xlsx" /><br /><br />
            	<input type="button" class="btn btn-primary mr-2" id="uploadExcel" Value="Send file" />           	
            	<input type="submit" value="Add new" onclick="setDataExamId(${idExam})"
                                        class="btn btn-primary " data-toggle="modal" data-target="#addModal" id="addNewButton"/>
                <a class="btn btn-primary mx-1" href="<c:url value='/admin/tableExamList' />">Back</a>
                
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
                                                id="exampleRadios1" value="" onchange="editOnchange(this.value)"/>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsB"
                                                value="option2" />
                                            <input type="text" class="form-control" placeholder="Câu B"
                                                id="exampleRadios2" value="" onchange="editOnchange(this.value)"/>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsC"
                                                value="option3" />
                                            <input type="text" class="form-control" placeholder="Câu C"
                                                id="exampleRadios3" value="" onchange="editOnchange(this.value)" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoEdit" id="rsD"
                                                value="option4" />
                                            <input type="text" class="form-control" placeholder="Câu D"
                                                id="exampleRadios4" value="" onchange="editOnchange(this.value)" />
                                        </div>
                                        <span class="text-warning">*Chọn đáp án đúng, những đáp án còn lại sẽ là đáp án
                                            sai</span>
											<input class="form-check-input" type="hidden" name="rdoEdit" id="rs"
                                                value="option5"  />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="process()" >OK</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End modal -->
            
            
             <!-- Modal ADD-->
            <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">ADD NEW EXAM</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Mã câu hỏi: </label>
                                    <div class="col-sm-8">
                                        <label class="col-sm-8 col-form-label" id="maCauHoiAdd"></label>
                                    </div>
                                    <label class="col-sm-3 col-form-label">Mã đề: </label>
                                    <div class="col-sm-8">
                                        <label class="col-sm-8 col-form-label" id="maDeAdd"></label>
                                    </div>
                                    <label class="col-sm-3 col-form-label">Câu hỏi: </label>
                                    <textarea class="col-sm-8 col-form-control" id="exampleFormControlTextarea1Add"
                                        rows="3"></textarea>
                                    <img src="#" alt="" style="">
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 col-form-label">Phương án :</label>
                                    <div class="col-sm-8">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoAdd" id="rsAAdd"
                                                value="option1" />
                                            <input type="text" class="form-control" placeholder="Câu A"
                                                id="exampleRadios1Add" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoAdd" id="rsBAdd"
                                                value="option2" />
                                            <input type="text" class="form-control" placeholder="Câu B"
                                                id="exampleRadios2Add" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoAdd" id="rsCAdd"
                                                value="option3" />
                                            <input type="text" class="form-control" placeholder="Câu C"
                                                id="exampleRadios3Add" value="" />
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="rdoAdd" id="rsDAdd"
                                                value="option4" />
                                            <input type="text" class="form-control" placeholder="Câu D"
                                                id="exampleRadios4Add" value="" />
                                        </div>
                                        <span class="text-warning">*Chọn đáp án đúng, những đáp án còn lại sẽ là đáp án
                                            sai</span>
                                        <input class="form-check-input" type="hidden" name="rdoAdd" id="rsAdd"
                                            value="option5" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addProcess(addDataExam, ${idExam})">OK</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <!-- End modal -->
            
            
            
             
			<!-- SCRIPT -->
            <script>          
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
                            document.getElementById('result').innerHTML = data.rs;
                            
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
                

                function checkChecked(){
                	const checkbox = document.querySelector('input[name="rdoEdit"]:checked');
                	return checkbox.value;
                	
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
                			"rs" : checkChecked()
                			
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
                
                function findCheckedId(){
                	const checkbox = document.querySelector('input[name="rdoEdit"]:checked');
                	return checkbox.id;
                	
                }
                
                function editOnchange(ish) {
                	const id = findCheckedId();
                	document.getElementById(id).value = ish;
                	
                	
                }
                
            	
                
                
                /* DELETE */    
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
               
               
      
                
               
               /* Phần của Đạt */
               var selectedFile;
               var arrObjQuestion=null;
               
               document.getElementById("fileUpload").addEventListener("change", function(event) {
                   selectedFile = event.target.files[0];
                 });
               document
                 .getElementById("uploadExcel")
                 .addEventListener("click", function() {
               	  arrObjQuestion=null;
               	  try{
               		  if(checkFile(selectedFile["name"])!='xlsx') {
           					console.log("Must xlsx")
               	    		return;
               		  }
               	  }catch(err){
               		  console.log("Wrong file !catch")
               		  return;
               	  }
               	 
                   if (selectedFile) {
                     console.log("Hi...");
                     var fileReader = new FileReader();
                     fileReader.onload = function(event) {
                       var data = event.target.result;

                       var workbook = XLSX.read(data, {
                         type: "binary"
                       });
                       workbook.SheetNames.forEach(sheet =>{
                         let rowObject = XLSX.utils.sheet_to_row_object_array(
                           workbook.Sheets[sheet]
                         );
                         let jsonObject = JSON.stringify(rowObject);
                        /*  document.getElementById("jsonData").innerHTML = jsonObject; */
                         arrObjQuestion= jsonObject;
                         console.log(jsonObject);
                         postDataUser();
                       });
                     };
                     fileReader.readAsBinaryString(selectedFile);
                   }
                 });
              
               function checkFile(file){
               	return file.slice((file.lastIndexOf(".") - 1 >>> 0) + 2);
               }
               
               function postDataUser() {
            	   arrObjQuestion=JSON.parse(arrObjQuestion);
            	   for (let i = 0 ; i < arrObjQuestion.length;i++) {
            		   arrObjQuestion[i]["idExam"] = ${idExam};
            		 }
            	   
           		$.ajax({
           			type: "POST",
           			contentType: "application/json;charset=utf-8",
           			url: "uploadexcel",
           			data: JSON.stringify(arrObjQuestion),
           			dataType: 'json',
           			timeout: 100000,
           			success: function (data) {
           				if (data.status == 'SUCCEED'){
           					console.log("Succeed");
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
           				if(data.status == 'NOTSAME'){
           					alert("Đáp án chính xác không trùng với A hoặc B hoặc C hoặc D");
           					location.reload();
           				}
           			},
           			error: function (e) {
           				console.log("LOIII")
           				console.log("ERROR: ", e);
           			}
           		});
           	}
               
               
               
           /* ADD NEW AXAM */
           		function checkCheckedAdd(){
                	const checkbox = document.querySelector('input[name="rdoAdd"]:checked');
                	return checkbox.value;
                	
                }
           
           
               function setDataExamId(idExam) {
                   document.getElementById('maDeAdd').innerHTML = idExam;
                   
               }               
               
               function addDataExam(idExam) {
               	$.ajax({
               		type: "POST",
               		contentType: "application/json;charset=utf-8",
               		url: "addNewExam",
               		data: JSON.stringify({
               			"idExam" : idExam,
               			"content" : document.getElementById('exampleFormControlTextarea1Add').value,
            			"rsA" : exampleRadios1Add.value,
            			"rsB" : exampleRadios2Add.value,
            			"rsC" : exampleRadios3Add.value,
            			"rsD" : exampleRadios4Add.value,
            			"rs" : checkCheckedAdd()
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
               
               
               
               function examListAdd(callback, idExam) {
               	Swal.fire({
               		title: 'You are adding exam',
               		text: "You won't be able to revert this!",
               		icon: 'info',
               		showCancelButton: true,
               		confirmButtonColor: '#3085d6',
               		cancelButtonColor: '#d33',
               		confirmButtonText: 'Add'
               	}).then((result) => {
               		if (result.isConfirmed) {
               			callback(idExam);
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

              function addProcess(f, idExam){
            	  updateRadioValues()
            	  examListAdd(f, idExam);
           	   
              }
              
              function updateRadioValues(){
                  rsAAdd.value = document.querySelector('input[id="exampleRadios1Add"]').value;
                  rsBAdd.value = document.querySelector('input[id="exampleRadios2Add"]').value;
                  rsCAdd.value = document.querySelector('input[id="exampleRadios3Add"]').value;
                  rsDAdd.value = document.querySelector('input[id="exampleRadios4Add"]').value;
            	  
              }
           
           
               

               
            </script>



</body>

</html>