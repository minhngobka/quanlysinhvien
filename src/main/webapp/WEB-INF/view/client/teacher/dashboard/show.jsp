mmain<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Quản lý sinh viên" />
    <meta name="author" content="Quản lý sinh viên" />
    <title>Dashboard - Quản lý sinh viên</title>
    <link href="/css/layout.css" rel="stylesheet" />
    <link href="/css/teacher/dashboard.admin.css" rel="stylesheet" />
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
              <i class="fa-solid fa-graduation-cap"></i>
              <span
                >Hanoi University of Science and Technology (<a
                  href="https://www.hust.edu.vn/vi/"
                  target="_blank"
                  >HUST</a
                >)</span
              >
            </h2>
            <p>Xin chào giáo viên <%=session.getAttribute("teacherName")%></p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            / DashBoard
          </div>
        </div>
        <div class="main-content">
          <div class="grid">
            <div class="grid-item">
              <a href="/admin/class">
                <i class="fa-solid fa-landmark"></i>
                <div class="grid-item-content">
                  <h3>${countClasses}</h3>
                  <p>Subject</p>
                </div>
              </a>
            </div>
          </div>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[0].classList.add("active");
    </script>
  </body>
</html>
