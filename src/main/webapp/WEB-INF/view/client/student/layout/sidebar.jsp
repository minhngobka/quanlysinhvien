<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Features</div>
                        <a class="nav-link" href="/student">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <a class="nav-link" href="/student/infor">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Hồ sơ
                        </a>
                        <a class="nav-link" href="/student/class">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Lớp sinh viên
                        </a>
                        <a class="nav-link d-flex align-items-center" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts" aria-expanded="true" aria-controls="collapseLayouts">
                            <div class="me-2">
                                <i class="fas fa-table-columns"></i>
                            </div>
                            <span>Kết quả học tập</span>
                            <div class="ms-auto">
                                <i class="fas fa-angle-down"></i>
                            </div>
                        </a>
                        <div class="collapse show" id="collapseLayouts">
                            <nav class="nav flex-column ps-3">
                                <a class="nav-link" href="#" id="course-grade-link">Bảng điểm học
                                    phần</a>
                                <a class="nav-link" href="#" id="check-input-grade-link">Bảng điểm kỳ mới nhất</a>
                            </nav>
                        </div>

                        <a class="nav-link" href="/student/course-registration">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Đăng ký môn học
                        </a>
                        <a class="nav-link" href="/student/timetable">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Thời khóa biểu
                        </a>

                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    <%=request.getUserPrincipal().getName().toString()%>
                </div>
            </nav>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy liên kết "Bảng điểm học phần"
                const courseGradeLink = document.getElementById("course-grade-link");
                const checkInputGradeLink = document.getElementById("check-input-grade-link");

                // Đảm bảo liên kết "Bảng điểm học phần" luôn trỏ đến đường dẫn tuyệt đối "/student/student-course-grade"
                courseGradeLink.setAttribute("href", "/student/student-course-grade");
                checkInputGradeLink.setAttribute("href", "/student/student-check-input-grade-term");
            });
        </script>