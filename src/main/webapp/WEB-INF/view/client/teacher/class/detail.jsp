<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Detail Class</title>

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
                                    <h1 class="mt-4">Detail Class</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/teacher">Dashboard</a> / <a
                                                href="/teacher/class">Teacher Classes</a> / Infor
                                        </li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Table class students</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">MSSV</th>
                                                            <th scope="col">Họ và tên</th>
                                                            <th scope="col">Số điên thoại</th>
                                                            <th scope="col">Giới tính</th>
                                                            <th scope="col">Địa chỉ</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="student" items="${students}">
                                                            <tr>
                                                                <th scope="row">${student.id}</th>
                                                                <td>${student.studentId}</td>
                                                                <td>${student.fullName}</td>
                                                                <td>${student.phone}</td>
                                                                <td>${student.gender}</td>
                                                                <td>${student.address}</td>
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