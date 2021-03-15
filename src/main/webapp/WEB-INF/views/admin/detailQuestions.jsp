<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            Đề toán - đề số 1
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <!-- Content start -->
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr style="background-color: #DFF0D8;">
                            <th>STT</th>
                            <th>Mã câu hỏi</th>
                            <th>Câu hỏi</th>
                            <th>Phương án trả lời</th>
                            <th>Đáp án</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>001</td>
                            <td>Hôm nay yêu mang áo gì ?</td>
                            <td>
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary">This is a primary list group
                                        item</li>
                                    <li class="list-group-item list-group-item-secondary">This is a secondary list group
                                        item</li>
                                    <li class="list-group-item list-group-item-success">This is a success list group
                                        item</li>
                                    <li class="list-group-item list-group-item-danger">This is a danger list group item
                                    </li>
                                </ul>
                            </td>
                            <td>This is a danger list group item</td>
                            <td>
                                <a class="mr-1" href="#" data-toggle="modal" data-target="#editModal"
                                    data-whatever="@mdo">Edit</a><a href="#">Del</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>001</td>
                            <td>Hôm nay yêu mang áo gì ?</td>
                            <td>
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-primary">This is a primary list group
                                        item</li>
                                    <li class="list-group-item list-group-item-secondary">This is a secondary list group
                                        item</li>
                                    <li class="list-group-item list-group-item-success">This is a success list group
                                        item</li>
                                    <li class="list-group-item list-group-item-danger">This is a danger list group item
                                    </li>
                                </ul>
                            </td>
                            <td>This is a danger list group item</td>
                            <td>
                                <a class="mr-1" href="#" data-toggle="modal" data-target="#editModal"
                                    data-whatever="@mdo">Edit</a><a href="#">Del</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-end mr-5 mb-2">
                <button type="button" class="btn btn-primary mr-2" data-toggle="modal" data-target="#addModal"
                    data-whatever="@mdo">
                    Add new
                </button>
                <button class="btn btn-primary mr-2">Close</button>
            </div>

            <!-- Chỗ nầy là form edit và question lun -->
</body>

</html>