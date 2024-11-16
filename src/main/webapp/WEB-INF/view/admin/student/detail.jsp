<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Student Information</title>

    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/admin/information.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
  </head>

  <body>
    <jsp:include page="../layout/layout.jsp" />
    <div class="container-main">
      <main>
        <div class="main-header">
          <div class="main-header-title">
            <h2>
              <i class="fa-solid fa-desktop"></i>
              <span>student information</span>
            </h2>
            <p>View Student</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/admin">DashBoard</a>
            / <a href="/admin/student">Student</a>
            / Information
          </div>
        </div>
        <div class="main-content">
          <div class="main-content-information">
            <div class="information-img">
              <img
                src="<c:choose>
                    <c:when test='${empty student.avatar}'>
                      https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png
                    </c:when>
                    <c:otherwise>
                      /images/teacher/${student.avatar}
                    </c:otherwise>
                  </c:choose>"
                alt="student"
              />
              <span>${student.fullName}</span>
            </div>
            <div class="information-detail">
              <div class="information-wrapper">
                <h2>About</h2>
                <div class="grid">
                  <li>
                    <span>Mã số sinh viên</span>
                    <div>${student.studentId}</div>
                  </li>
                  <li>
                    <span>Họ và tên</span>
                    <div>${student.fullName}</div>
                  </li>
                  <li>
                    <span>Email</span>
                    <div>${student.user.email}</div>
                  </li>
                  <li>
                    <span>Số điện thoại</span>
                    <div>${student.phone}</div>
                  </li>
                  <li>
                    <span>Giới tính</span>
                    <div>${student.gender}</div>
                  </li>
                  <li>
                    <span>Năm sinh</span>
                    <div>${student.birthDate}</div>
                  </li>
                  <li>
                    <span>Địa chỉ</span>
                    <div>${student.address}</div>
                  </li>
                </div>
                <div class="information-button">
                  <button>
                    <a href="/admin/student/update/${student.id}">Update</a>
                  </button>
                  <button><a href="/admin/student">Cancel</a></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[2].classList.add("active");
    </script>
  </body>
</html>
