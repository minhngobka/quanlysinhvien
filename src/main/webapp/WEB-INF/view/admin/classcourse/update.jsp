<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Class Course</title>

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
                                <h1 class="mt-4">Update Class Course</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/class-course">Class Courses</a> / Update</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Cập nhật thông tin lớp môn học</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/class-course/update"
                                                modelAttribute="newClassCourse">
                                                <div class="mb-3" style="display: none">
                                                    <label class="form-label">ID:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mã lớp học:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="classCourseId" />
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
                                                        <form:input type="text" class="form-control" path="classroom" />
                                                    </div>
                                                    <div class="col-md-5">
                                                        <label class="form-label">Tiết học:</label>
                                                        <form:input type="text" class="form-control" path="preiod" />
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
                                                        <form:input type="number" class="form-control"
                                                            path="studentLimit" />
                                                    </div>

                                                    <div class="col-md-4">
                                                        <label class="form-label">Học kỳ:</label>
                                                        <form:input type="text" class="form-control" path="semester" />
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