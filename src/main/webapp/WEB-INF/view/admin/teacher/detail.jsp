<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Teacher Information</title>

    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/teacher.information.css" />
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
              <span>teacher information</span>
            </h2>
            <p>View Teacher</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/admin">DashBoard</a>
            / <a href="/admin/teacher">Teacher</a>
            / Information
          </div>
        </div>
        <div class="main-content">
          <div class="main-content-information">
            <div class="information-img">
              <img
                src="<c:choose>
                    <c:when test='${empty teacher.avatar}'>
                      https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png
                    </c:when>
                    <c:otherwise>
                      /images/teacher/${teacher.avatar}
                    </c:otherwise>
                  </c:choose>"
                alt="teacher"
              />
              <span>${teacher.fullName}</span>
            </div>
            <div class="information-detail">
              <div class="information-wrapper">
                <h2>About</h2>
                <div class="grid">
                  <li>
                    <span>Mã giảng viên</span>
                    <div>${teacher.teacherId}</div>
                  </li>
                  <li>
                    <span>Họ và tên</span>
                    <div>${teacher.fullName}</div>
                  </li>
                  <li>
                    <span>Email</span>
                    <div>${teacher.user.email}</div>
                  </li>
                  <li>
                    <span>Số điện thoại</span>
                    <div>${teacher.phone}</div>
                  </li>
                  <li>
                    <span>Giới tính</span>
                    <div>${teacher.gender}</div>
                  </li>
                  <li>
                    <span>Địa chỉ</span>
                    <div>${teacher.address}</div>
                  </li>
                </div>
                <div class="information-button">
                  <button>
                    <a href="/admin/teacher/update/${teacher.id}">Update</a>
                  </button>
                  <button><a href="/admin/teacher">Cancel</a></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[1].classList.add("active");
    </script>
  </body>
</html>
