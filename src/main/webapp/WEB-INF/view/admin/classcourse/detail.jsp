<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Class Course Information</title>

        <link href="/css/layout.css" rel="stylesheet" />
        <link rel="stylesheet" href="/css/admin/information.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
      </head>

      <body>
        <jsp:include page="../layout/layout.jsp" />
        <div class="container-main">
          <main>
            <div class="main-header">
              <div class="main-header-title">
                <h2>
                  <i class="fa-solid fa-desktop"></i>
                  <span>class course information</span>
                </h2>
                <p>View class course</p>
              </div>
              <div class="main-header-routing">
                <i class="fa-solid fa-house"></i>
                /
                <a href="/admin">DashBoard</a>
                / <a href="/admin/class-course">ClassCourse</a>
                / Information
              </div>
            </div>
            <div class="main-content">
              <div class="main-content-information">
                <div class="information-detail">
                  <div class="information-wrapper">
                    <h2>Thông tin lớp môn học</h2>
                    <div class="grid">
                      <li>
                        <span>Mã lớp học</span>
                        <div>${classCourse.classCourseId}</div>
                      </li>
                      <li>
                        <span>Tên môn học</span>
                        <div>${classCourse.course.name}</div>
                      </li>
                      <li>
                        <span>Học kỳ</span>
                        <div>${classCourse.semester}</div>
                      </li>
                      <li>
                        <span>Giảng viên</span>
                        <div>${classCourse.teacher.fullName}</div>
                      </li>
                      <li>
                        <span>Phòng học</span>
                        <div>${classCourse.classroom}</div>
                      </li>
                      <li>
                        <span>Tiết</span>
                        <div>${classCourse.preiod}</div>
                      </li>
                      <li>
                        <span>Thứ</span>
                        <div>${classCourse.weekday}</div>
                      </li>
                      <li>
                        <span>Buổi</span>
                        <div>${classCourse.timePeriod}</div>
                      </li>
                      <li>
                        <span>Giới hạn số sinh viên</span>
                        <div>${classCourse.studentLimit}</div>
                      </li>
                    </div>
                    <div class="information-button">
                      <button><a href="/admin/class-course">Cancel</a></button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </main>
        </div>
        <script src="/js/layout.js"></script>
        <script>
          document.querySelectorAll(".nav-item")[5].classList.add("active");
        </script>
      </body>

      </html>