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
                <title>Create Class Course</title>

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
                                <h1 class="mt-4">Create Class Course</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/class-course">Class Courses</a> / Create</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a class course</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/class-course/create"
                                                modelAttribute="newClassCourse">

                                                <div class="row g-3">
                                                    <c:set var="errorClassCourseId">
                                                        <form:errors path="classCourseId" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorClassroom">
                                                        <form:errors path="classroom" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPreiod">
                                                        <form:errors path="preiod" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorStudentLimit">
                                                        <form:errors path="studentLimit" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorSemester">
                                                        <form:errors path="semester" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mã lớp học:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorClassCourseId ? 'is-invalid' : ''}"
                                                            path="classCourseId" />
                                                        ${errorClassCourseId}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Tên môn học:</label>
                                                        <form:select class="form-select" path="course.id">
                                                            <c:forEach var="course" items="${courses}">
                                                                <form:option value="${course.id}">${course.name}
                                                                </form:option>
                                                            </c:forEach>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label class="form-label">Phòng học:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorClassroom ? 'is-invalid' : ''}"
                                                            path="classroom" />
                                                        ${errorClassroom}
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label class="form-label">Tiết học:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorPreiod ? 'is-invalid' : ''}"
                                                            path="preiod" />
                                                        ${errorPreiod}
                                                    </div>
                                                    <div class="col-md-2">
                                                        <label class="form-label">Thứ:</label>
                                                        <form:select class="form-select" path="weekday">
                                                            <form:option value="2">2</form:option>
                                                            <form:option value="3">3</form:option>
                                                            <form:option value="4">4</form:option>
                                                            <form:option value="5">5</form:option>
                                                            <form:option value="6">6</form:option>
                                                            <form:option value="7">7</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label class="form-label">Giới hạn:</label>
                                                        <form:input type="number"
                                                            class="form-control ${not empty errorStudentLimit ? 'is-invalid' : ''}"
                                                            path="studentLimit" />
                                                        ${errorStudentLimit}
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label class="form-label">Học kỳ:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorSemester ? 'is-invalid' : ''}"
                                                            path="semester" />
                                                        ${errorSemester}
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label class="form-label">Giảng viên dạy:</label>
                                                        <form:select class="form-select" path="teacher.id">
                                                            <c:forEach var="teacher" items="${teachers}">
                                                                <form:option value="${teacher.id}">${teacher.fullName}
                                                                </form:option>
                                                            </c:forEach>
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