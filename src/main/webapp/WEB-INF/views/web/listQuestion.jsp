<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Question</title>
</head>

<body>
	<!-- Content -->
	<div class="col-lg-7">
		<div class="row d-flex justify-content-around">
			<!-- box card -->
			<div class="card col-6 my-3 "
				style="width: 18rem; background-color: #D8D8D9;">
				<div class="card-body" style="background-color: #EEEEEE;">
					<h5 class="card-title">Bài thi trắc nghiệm</h5>
					<h6 class="card-subtitle mb-2 text-muted">Tên đề thi trắc
						nghiệm</h6>
					<p class="card-text">${exam.getTitleExam()}</p>
				</div>
			</div>

			<div class="border col-5  my-3 text-center py-4	">
				<p>
					Thời gian: <strong>0 phút, 12 giây</strong>
				</p>
				<%
				java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
				%>
				<p>
					Ngày thi: <strong> <%=df.format(new java.util.Date())%></strong>
				</p>
			</div>
			<!-- box card -->

			<!-- question area -->
			<form class="list-group list-group-flush" name="Checkout"
				id="Checkout" action="result" method="GET">
				<c:choose>
					<c:when test="${listQuestion.isEmpty()}">
						<center>
							<strong>Currently, the system is updating more. Please
								come back next time</strong>
						</center>
					</c:when>
					<c:otherwise>
						<%!int count = 1;%>
						<c:forEach items="${listQuestion}" var="ques">
							<div class="list-group-item">
								<strong><u> CÂU HỎI <%=count++%>:
								</u></strong><span>${ques.getContent()}</span>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="${ques.getIdQ()}" value="${ques.getRsA() }" /> <label
										class="form-check-label">${ques.getRsA()}</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="${ques.getIdQ()}" value="${ques.getRsB() }" /> <label
										class="form-check-label">${ques.getRsB()}</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="${ques.getIdQ()}" value="${ques.getRsC() }" /> <label
										class="form-check-label">${ques.getRsC()}</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio"
										name="${ques.getIdQ()}" value="${ques.getRsD() }" /> <label
										class="form-check-label">${ques.getRsD()}</label>
								</div>
							</div>
						</c:forEach>
						<input type="hidden" name="idExam" value="${exam.getIdExam()}" />
						<%
						count = 1;
						%>
						<div class="col-12 my-3">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</c:otherwise>
				</c:choose>

			</form>

			<script type="text/javascript">
				window.onload = function() {
					window.setTimeout(document.Checkout.submit
							.bind(document.Checkout), 5000);
				};
			</script>


			<!-- question area -->
		</div>
	</div>
	<!-- Content -->
</body>

</html>