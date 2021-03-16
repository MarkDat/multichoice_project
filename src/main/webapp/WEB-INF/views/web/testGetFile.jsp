<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Exam</title>
</head>
<body>
	<input type="file" id="fileUpload" accept=".xls,.xlsx" /><br />
    <button type="button" id="uploadExcel">Convert</button>
    <pre id="jsonData"></pre>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.3/xlsx.full.min.js"></script>

<script>
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
              document.getElementById("jsonData").innerHTML = jsonObject;
              arrObjQuestion= jsonObject;
              console.log(jsonObject);
              
            });
          };
          fileReader.readAsBinaryString(selectedFile);
        }
      });
   
    function checkFile(file){
    	return file.slice((file.lastIndexOf(".") - 1 >>> 0) + 2);
    }
    
    
    function postDataUser() {

		$.ajax({
			type: "POST",
			contentType: "application/json;charset=utf-8",
			url: "testFile",
			data: arrObjQuestion,
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
  </script>
</body>


</html>