<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Course</title>

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
                                <h1 class="mt-4">Update Course</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/course">Courses</a> / Update</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Cập nhật thông tin môn học</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/course/update"
                                                modelAttribute="newCourse">
                                                <div class="mb-3" style="display: none">
                                                    <label class="form-label">ID:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mã môn học:</label>
                                                        <form:input type="text" class="form-control" path="courseId"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Tên môn học:</label>
                                                        <form:input type="text" class="form-control" path="name"
                                                            disabled="true" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ lý thuyết:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="theoreticalCredits" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ bài tập:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="execiseCredits" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Tín chỉ thực hành:</label>
                                                        <form:input type="number" class="form-control"
                                                            path="practicalCredits" />
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Hệ số:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="coefficient" />
                                                    </div>
                                                    <div class="col-md-8">
                                                        <label class="form-label">Khoa:</label>
                                                        <form:select class="form-select" path="department.id">
                                                            <form:option value="1">Công nghệ thông tin</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <button type="submit" class="btn btn-primary">Update</button>
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