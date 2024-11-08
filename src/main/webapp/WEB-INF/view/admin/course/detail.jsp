<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Course Information</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <!-- Latest compiled and minified CSS
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                Latest compiled JavaScript
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Course information</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/course">Courses</a> / Information</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Thông tin môn học</h3>

                                            </div>
                                            <hr />
                                            <div class="card" style="width: 60%">
                                                <div class="card-header">
                                                    Course information
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Mã môn học: ${course.courseId}</li>
                                                    <li class="list-group-item">Tên môn học: ${course.name}</li>
                                                    <li class="list-group-item">Tín chỉ lý thuyết:
                                                        ${course.theoreticalCredits}</li>
                                                    <li class="list-group-item">Tín chỉ thực hành:
                                                        ${course.practicalCredits}</li>
                                                    <li class="list-group-item">Tín chỉ bài tập:
                                                        ${course.execiseCredits}
                                                    </li>
                                                    <li class="list-group-item">Hệ số: ${course.coefficient}</li>
                                                    <li class="list-group-item">Khoa: ${course.department.name}</li>
                                                </ul>
                                            </div>
                                            <a href="/admin/course" class="mt-3 btn btn-success">Back</a>

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