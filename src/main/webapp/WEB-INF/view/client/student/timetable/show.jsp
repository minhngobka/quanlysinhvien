<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Timetable</title>

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
                                    <h1 class="mt-4">Student timetable</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"> <a href="/student">Dashboard</a> / Student
                                            Timetable</li>
                                    </ol>

                                    <div class="container mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between">
                                                    <h3>Thời khóa biểu sinh viên</h3>
                                                </div>
                                                <hr />
                                                <table class="table table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Thứ 2</th>
                                                            <th scope="col">Thứ 3</th>
                                                            <th scope="col">Thứ 4</th>
                                                            <th scope="col">Thứ 5</th>
                                                            <th scope="col">Thứ 6</th>
                                                            <th scope="col">Thứ 7</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationMonday"
                                                                        items="${courseRegistrationsMonday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationMonday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationMonday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationMonday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationMonday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationTuesday"
                                                                        items="${courseRegistrationsTuesday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationTuesday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationTuesday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationTuesday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationTuesday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationWednesday"
                                                                        items="${courseRegistrationsWednesday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationWednesday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationWednesday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationWednesday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationWednesday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationThursday"
                                                                        items="${courseRegistrationsThursday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationThursday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationThursday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationThursday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationThursday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationFriday"
                                                                        items="${courseRegistrationsFriday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationFriday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationFriday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationFriday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationFriday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>
                                                            <th>
                                                                <div class="text-center">
                                                                    <c:forEach var="courseRegistrationSaturday"
                                                                        items="${courseRegistrationsSaturday}">
                                                                        <div
                                                                            class="mb-2 p-2 border rounded bg-light text-dark">
                                                                            <span
                                                                                class="fw-bold">${courseRegistrationSaturday.classCourse.classCourseId}</span>
                                                                            -
                                                                            <span>${courseRegistrationSaturday.classCourse.course.name}</span>
                                                                            <br>
                                                                            <small class="text-muted">
                                                                                Tiết học: <span
                                                                                    class="fw-semibold">${courseRegistrationSaturday.classCourse.preiod}</span>
                                                                                <br>
                                                                                Phòng học: <span
                                                                                    class="fw-semibold">${courseRegistrationSaturday.classCourse.classroom}</span>
                                                                            </small>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </th>

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