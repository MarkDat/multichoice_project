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
				<div class="card-body">
					<h5 class="card-title">
						Kết quả: <strong class="text-danger">${countResult }/${listQuestion.size()}</strong>
					</h5>
					<p class="card-text">
						Điểm: <strong class="text-danger">${mark }</strong>
					</p>
				</div>
			</div>
			<!-- box card -->

			<!-- question area -->
			<div class="list-group list-group-flush">
				<%!int count = 1;%>
				<c:forEach items="${listQuestion}" var="q">
					<div class="list-group-item"><c:choose>
							<c:when
								test="${ q.getRsA().equals(q.getRs()) && q.getChoseA() or 
										q.getRsB().equals(q.getRs()) && q.getChoseB() or
										q.getRsC().equals(q.getRs()) && q.getChoseC() or
										q.getRsD().equals(q.getRs()) && q.getChoseB()}">
								<strong class="text-success"> <u>CÂU HỎI <%=count++%>:
								</u>
								</strong>
								<span class="text-success">Đúng</span>
								<br>
							</c:when>
							<c:otherwise>
								<strong class="text-danger"> <u>CÂU HỎI <%=count++%>:
								</u>
								</strong>
								<span class="text-danger">Sai</span>
								<br>
							</c:otherwise>
						</c:choose> <span>${q.getContent()} </span>
						<ol type="A">
							<li>${q.getRsA()}<c:if
									test="${ q.getRsA().equals(q.getRs()) }">
									<i class="fa fa-check text-success" aria-hidden="true"></i>
								</c:if> <c:if test="${ q.getChoseA() }">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</c:if>
							</li>
							<li>${q.getRsB()}<c:if
									test="${ q.getRsB().equals(q.getRs()) }">
									<i class="fa fa-check text-success" aria-hidden="true"></i>
								</c:if> <c:if test="${ q.getChoseB() }">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</c:if>
							</li>
							<li>${q.getRsC()}<c:if
									test="${ q.getRsC().equals(q.getRs()) }">
									<i class="fa fa-check text-success" aria-hidden="true"></i>
								</c:if> <c:if test="${ q.getChoseC() }">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</c:if>
							</li>
							<li>${q.getRsD()}<c:if
									test="${ q.getRsD().equals(q.getRs()) }">
									<i class="fa fa-check text-success" aria-hidden="true"></i>
								</c:if> <c:if test="${ q.getChoseD() }">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</c:if>
							</li>
						</ol></div>
				</c:forEach>
				<%
				count = 1;
				%>
				<div class="col-12 my-3">
							<button type="submit" class="btn btn-primary">Continute test</button>
						</div>
			</div>
		</div>
	</div>
	<!-- End Content -->
</body>

</html>