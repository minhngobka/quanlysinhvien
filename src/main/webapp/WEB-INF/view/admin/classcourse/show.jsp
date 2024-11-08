<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Manager Class Courses</title>

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
                                    <h1 class="mt-4">Manager Class Courses</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / Class
                                            Courses
                                        </li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table class courses</h3>
                                                    <a href="/admin/class-course/create" class="btn btn-primary">Create
                                                        a
                                                        class course</a>
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
                                                            <th scope="col">Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="classCourse" items="${classCourses}">
                                                            <tr>
                                                                <th scope="row">${classCourse.classCourseId}</th>
                                                                <td>${classCourse.course.name}</td>
                                                                <td>${classCourse.classroom}</td>
                                                                <td>${classCourse.semester}</td>
                                                                <td>${classCourse.studentLimit}</td>
                                                                <td>
                                                                    <a href="/admin/class-course/${classCourse.id}"
                                                                        class="btn btn-success">View</a>
                                                                    <a href="/admin/class-course/update/${classCourse.id}"
                                                                        class="btn btn-warning mx-2">Update</a>
                                                                    <a href="/admin/class-course/delete/${classCourse.id}"
                                                                        class="btn btn-danger">Delete</a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>

                                                <!-- <nav aria-label="Page navigation example">
                                                    <ul class="pagination justify-content-center">
                                                        <li class="page-item">
                                                            <a class="page-link ${1 eq currentPage ? 'disabled' : ''}"
                                                                href="/admin/product?page=${currentPage-1}"
                                                                aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>

                                                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                            <li class="page-item">
                                                                <a class="page-link ${(loop.index) eq currentPage ? 'active' : ''}"
                                                                    href="/admin/product?page=${loop.index}">
                                                                    ${loop.index}
                                                                </a>
                                                            </li>
                                                        </c:forEach>

                                                        <li class="page-item">
                                                            <a class="page-link ${totalPages eq currentPage ? 'disabled' : ''}"
                                                                href="/admin/product?page=${currentPage+1}"
                                                                aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav> -->

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