<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Exam</title>
</head>

<body>
	<!-- Content -->
		Số lượng câu : ${listQuestion.size()} <br>
		Số lượng câu làm dc : ${countResult } <br>
		Điểm : ${mark } <br>
	  <c:forEach items="${listQuestion}" var="q">
	  	 	Câu :
	  	 		<ul>
	  	 			<li>${q.getRsA()}
	  	 				
	  	 				${ q.getRsA().equals(q.getRs()) ? "MÁY":"" }
	  	 				
	  	 				${
	  	 					
	  	 					q.getChoseA()==true ? "OK":""
	  	 				 }
	  	 				 
	  	 				 ${
	  	 				 	q.getRsA().equals(q.getRs()) && q.getChoseA()==true ? "CHUẨN":"KHÔNG CHUẨN"
	  	 				  }
	  	 			</li>
	  	 			<li>${q.getRsB()}
	  	 				${ q.getRsB().equals(q.getRs()) ? "MÁY":"" }
	  	 				${
	  	 					q.getChoseB()==true ? "OK":""
	  	 				 }
	  	 				  ${
	  	 				 	q.getRsB().equals(q.getRs()) && q.getChoseB()==true ? "CHUẨN":"KHÔNG CHUẨN"
	  	 				  }
	  	 			</li>
	  	 			<li>${q.getRsC()}
	  	 				${ q.getRsC().equals(q.getRs()) ? "MÁY":"" }
	  	 				${
	  	 					q.getChoseC()==true ? "OK":""
	  	 				 }
	  	 				  ${
	  	 				 	q.getRsC().equals(q.getRs()) && q.getChoseC()==true ? "CHUẨN":"KHÔNG CHUẨN"
	  	 				  }
					</li>
	  	 			<li>${q.getRsD()}
	  	 				${ q.getRsD().equals(q.getRs()) ? "MÁY":"" }
	  	 				${
	  	 					q.getChoseD()==true ? "OK":""
	  	 				 }
	  	 				  ${
	  	 				 	q.getRsD().equals(q.getRs()) && q.getChoseD()==true ? "CHUẨN":"KHÔNG CHUẨN"
	  	 				  }
	  	 			</li>
	  	 		</ul>
	  </c:forEach>
	<!-- Content -->
</body>

</html>