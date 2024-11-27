<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Student Course Grade</title>

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
                                    <h1 class="mt-4">Student Course Grade</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / Student
                                            Course Grade</li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Bảng điểm học phần</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Học kỳ</th>
                                                            <th scope="col">MSSV</th>
                                                            <th scope="col">Mã lớp</th>
                                                            <th scope="col">Tín chỉ</th>
                                                            <th scope="col">Điểm học phần</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="studentGradeDTO" items="${studentGradeDTOs}">
                                                            <tr>
                                                                <td>${studentGradeDTO.semester}</td>
                                                                <td>${studentGradeDTO.courseId}</td>
                                                                <td>${studentGradeDTO.courseName}</td>
                                                                <td>${studentGradeDTO.credits}</td>
                                                                <td>${studentGradeDTO.coursePoint}</td>
                                                            </tr>
                                                        </c:forEach>
                                                        <tr class="table-light">
                                                            <td class="text-end fw-bold border-0">&nbsp;</td>
                                                            <td class="border-0">
                                                                <span class="fw-bold">Count: </span>
                                                                <span class="fw-bold">${countStudentCourses}</span>
                                                            </td>
                                                            <td class="border-0">&nbsp;</td>
                                                            <td class="text-end fw-bold border-0">
                                                                <span class="fw-bold">TC: </span>
                                                                <span class="fw-bold">${countStudentCredits}</span>
                                                            </td>
                                                            <td class="border-0">&nbsp;</td>
                                                            <td class="border-0 text-end">&nbsp;</td>
                                                        </tr>


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