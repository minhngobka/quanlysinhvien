<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Student Infor</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Student Infor</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / Student Infor
                                    </li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Thông tin sinh viên</h3>
                                            <hr />
                                            <div class="mb-3" style="display: none">
                                                <label class="form-label">ID:</label>
                                                <form:input type="text" class="form-control" path="currentStudent.id" />
                                            </div>
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Email:</label>
                                                    <form:input type="email" class="form-control"
                                                        path="currentStudent.user.email" disabled="true" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Mã số sinh viên:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.studentId" disabled="true" />
                                                </div>
                                                <div class="col-md-5">
                                                    <label class="form-label">Họ và tên:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.fullName" disabled="true" />
                                                </div>
                                                <div class="col-md-5">
                                                    <label class="form-label">Số điện thoại:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.phone" disabled="true" />
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="form-label">Năm sinh:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.birthDate" disabled="true" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Địa chỉ:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.address" disabled="true" />
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="form-label">Giới tính:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentStudent.gender" disabled="true" />
                                                </div>
                                                <div class="col-md-12">
                                                    <a href="/student" class="btn btn-success">Home</a>
                                                    <a href="/student/infor/update/${currentStudent.id}"
                                                        class="btn btn-warning mx-2">Update</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>