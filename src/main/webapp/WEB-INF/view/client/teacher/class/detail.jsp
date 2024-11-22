<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Detail Class</title>

    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/admin/list.css" />
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
              <i class="fa-solid fa-user-secret"></i>
              <span>class management</span>
            </h2>
            <p>View Class</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            <a href="/teacher">Dashboard</a> /
            <a href="/teacher/class">Teacher Classes</a> / Infor
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-wrapper">
            <div class="main-content-table">
              <div class="table-header">
                <h2>Class View Board</h2>
              </div>
              <div class="table-main">
                <div class="table-search">
                  <span>Tìm kiếm danh sách học sinh:</span>
                  <div class="table-search-main">
                    <div class="search">
                      <input
                        type="text"
                        placeholder="Nhập mã số hoặc tên"
                        id="searchInput"
                      />
                    </div>
                    <button id="btnSearch">
                      <i class="fa-solid fa-star icon-search"></i>
                    </button>
                  </div>
                </div>
                <table>
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>MSSV</th>
                      <th>Họ và tên</th>
                      <th>Số điên thoại</th>
                      <th>Giới tính</th>
                      <th>Địa chỉ</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="student" items="${students}">
                      <tr>
                        <th>${student.id}</th>
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
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <script src="/js/layout.js"></script>
    <script src="/js/main.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[2].classList.add("active");
    </script>
  </body>
</html>
