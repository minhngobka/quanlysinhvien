<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Courses Registration</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Courses Registration</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / Course
                                            Registration
                                        </li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Danh sách môn học đã đăng ký</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Tên môn học</th>
                                                            <th scope="col">Phòng học</th>
                                                            <th scope="col">Giới hạn</th>
                                                            <th scope="col">Tiết học</th>
                                                            <th scope="col">Thứ</th>
                                                            <th scope="col">Buổi</th>
                                                            <th scope="col">Học kỳ</th>
                                                            <th scope="col">Trạng thái</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="courseRegistration"
                                                            items="${courseRegistrations}">
                                                            <tr>
                                                                <th scope="row">${courseRegistration.id}</th>
                                                                <td>${courseRegistration.classCourse.course.name}</td>
                                                                <td>${courseRegistration.classCourse.classroom}</td>
                                                                <td>${courseRegistration.classCourse.studentLimit}</td>
                                                                <td>${courseRegistration.classCourse.preiod}</td>
                                                                <td>${courseRegistration.classCourse.weekday}</td>
                                                                <td>${courseRegistration.classCourse.timePeriod}</td>
                                                                <td>${courseRegistration.classCourse.semester}</td>
                                                                <td>${courseRegistration.status}</td>
                                                                <td>

                                                                    <a href="/student/course-registration/${courseRegistration.id}"
                                                                        class="btn btn-danger">Hủy</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                                <div class="d-flex">
                                                    <a href="/student/course-registration/access"
                                                        class="btn btn-primary ms-auto">Xác nhận</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Danh sách môn học mở kỳ này</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Mã lớp học</th>
                                                            <th scope="col">Tên môn học</th>
                                                            <th scope="col">Phòng học</th>
                                                            <th scope="col">Giới hạn</th>
                                                            <th scope="col">Tiết học</th>
                                                            <th scope="col">Thứ</th>
                                                            <th scope="col">Buổi</th>
                                                            <th scope="col">Học kỳ</th>
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="classCourse" items="${classCourses}">
                                                            <tr>
                                                                <th scope="row">${classCourse.classCourseId}</th>
                                                                <td>${classCourse.course.name}</td>
                                                                <td>${classCourse.classroom}</td>
                                                                <td>${classCourse.studentLimit}</td>
                                                                <td>${classCourse.preiod}</td>
                                                                <td>${classCourse.weekday}</td>
                                                                <td>${classCourse.timePeriod}</td>
                                                                <td>${classCourse.semester}</td>
                                                                <td>
                                                                    <form method="post"
                                                                        action="/student/course-registration/${classCourse.id}">
                                                                        <input type="hidden"
                                                                            name="${_csrf.parameterName}"
                                                                            value="${_csrf.token}" />
                                                                        <button class="btn btn-success">Đăng ký</button>
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
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