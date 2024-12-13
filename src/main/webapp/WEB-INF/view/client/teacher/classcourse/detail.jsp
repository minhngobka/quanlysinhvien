<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <html lang="en">

        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Detail Class Course</title>

          <link href="/css/layout.css" rel="stylesheet" />
          <link rel="stylesheet" href="/css/admin/list.css" />
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
                    <i class="fa-solid fa-user-secret"></i>
                    <span>detail class course management</span>
                  </h2>
                  <p>View Class</p>
                </div>
                <div class="main-header-routing">
                  <i class="fa-solid fa-house"></i>
                  /
                  <a href="/teacher">Dashboard</a> /
                  <a href="/teacher/class-course">Class Courses</a> / Infor
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
                            <input type="text" placeholder="Nhập mã số hoặc tên" id="searchInput" />
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
                            <th>action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:if test="${empty courseRegistrations}">
                            <tr>
                              <td colspan="7" class="no-data">Không tìm thấy kết quả phù hợp</td>
                            </tr>
                          </c:if>
                          <c:forEach var="courseRegistration" items="${courseRegistrations}">
                            <tr>
                              <th>${courseRegistration.student.id}</th>
                              <td>${courseRegistration.student.studentId}</td>
                              <td>${courseRegistration.student.fullName}</td>
                              <td>${courseRegistration.student.phone}</td>
                              <td>${courseRegistration.student.gender}</td>
                              <td>${courseRegistration.student.address}</td>
                              <td>
                                <button>
                                  <a
                                    href="/teacher/class-course/${courseRegistration.classCourse.id}/${courseRegistration.student.id}">View</a>
                                </button>
                              </td>
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
            document.querySelectorAll(".nav-item")[3].classList.add("active");
          </script>
        </body>

        </html>