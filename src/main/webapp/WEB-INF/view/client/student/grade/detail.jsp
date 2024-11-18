<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Student Point Detail</title>

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
                                <h1 class="mt-4">Student Point Detail</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / <a
                                            href="/student/grade">Student Learning Results</a> / Detail
                                    </li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <div class="mb-3" style="display: none">
                                                <label class="form-label">ID:</label>
                                                <form:input type="text" class="form-control" path="currentGrade.id" />
                                            </div>
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Tên môn học:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.classCourse.course.name" disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Mã học phần:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.classCourse.course.courseId"
                                                        disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Học kì:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.classCourse.semester" disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Lớp học:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.classCourse.classCourseId" disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Tín chỉ:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="courseDTO.credits" disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Điểm giữa kì:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.midtermSorce" disabled="true" />
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="form-label">Điểm cuối kì:</label>
                                                    <form:input type="text" class="form-control"
                                                        path="currentGrade.finalSorce" disabled="true" />
                                                </div>

                                                <div class="col-md-12">
                                                    <a href="/student/grade" class="btn btn-success mx-2">Back</a>
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