<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="com.wild.daos.impl.RankUserDao" %>
<%@page import="java.util.List"%>
<%@page import="com.wild.models.RankUser"%>
<!-- Rank -->
<div class="col-lg-3 order-lg-first">
	<div class="card border-color mb-3">
		<div class="card-header border-color box-color">
			<%
				RankUserDao rud = new RankUserDao();
				List<RankUser> l = rud.findAll();
			%>
			<h6 class="text-center">Vinh danh bảng vàng</h6>
		</div>
		<div class="card-body">
			<table class="table">
				<tr class="table-danger">
					<td>No.1</td>
					<td><%out.print(l.get(0).getName());  %></td>
					<td><%out.print(l.get(0).getTotalMark()); %></td>
				</tr>
				<tr class="table-warning">
					<td>No.2</td>
					<td><%out.print(l.get(1).getName());  %></td>
					<td><%out.print(l.get(1).getTotalMark()); %></td>
				</tr>
				<tr class="table-success">
					<td>No.3</td>
					<td><%out.print(l.get(2).getName());  %></td>
					<td><%out.print(l.get(2).getTotalMark()); %></td>
				</tr>
				<tr class="table-info">
					<td>No.4</td>
					<td><%out.print(l.get(3).getName());  %></td>
					<td><%out.print(l.get(3).getTotalMark()); %></td>
				</tr>
				<tr class="table-info">
					<td>No.5</td>
					<td><%out.print(l.get(4).getName());  %></td>
					<td><%out.print(l.get(4).getTotalMark()); %></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="card border-color my-3">
		<div class="card-header border-color box-color">
			<h6 class="text-center">Hỗ trợ trực tuyến</h6>
		</div>
		<div class="card-body">
			<table class="table">
				<tr class="table-danger">
					<td>Online</td>
					<td>Facebook</td>
				</tr>
				<tr class="table-success">
					<td>Hotline</td>
					<td>0905.863.214</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<!-- Rank -->