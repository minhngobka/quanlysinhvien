<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Quản lý sinh viên" />
                <meta name="author" content="Quản lý sinh viên" />
                <title>Create Course</title>

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
                                <h1 class="mt-4">Create Course</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/course">Courses</a> / Create</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a course</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/course/create"
                                                modelAttribute="newCourse">

                                                <div class="row g-3">
                                                    <c:set var="errorCourseId">
                                                        <form:errors path="courseId" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorName">
                                                        <form:errors path="name" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorTheoreticalCredits">
                                                        <form:errors path="theoreticalCredits"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorExeciseCredits">
                                                        <form:errors path="execiseCredits"
                                                            cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorCoefficient">
                                                        <form:errors path="coefficient" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mã môn học:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorCourseId ? 'is-invalid' : ''}"
                                                            path="courseId" />
                                                        ${errorCourseId}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Tên môn học:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                                                            path="name" />
                                                        ${errorName}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ lý thuyết:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorTheoreticalCredits ? 'is-invalid' : ''}"
                                                            path="theoreticalCredits" />
                                                        ${errorTheoreticalCredits}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ bài tập:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorExeciseCredits ? 'is-invalid' : ''}"
                                                            path="execiseCredits" />
                                                        ${errorExeciseCredits}
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ thực hành:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="practicalCredits" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Hệ số:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorCoefficient ? 'is-invalid' : ''}"
                                                            path="coefficient" />
                                                        ${errorCoefficient}
                                                    </div>
                                                    <div class="col-md-8">
                                                        <label class="form-label">Khoa:</label>
                                                        <form:select class="form-select" path="department.id">
                                                            <form:option value="1">Công nghệ thông tin</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>

                                            </form:form>
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