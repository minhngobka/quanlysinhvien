<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Manager class courses</title>

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
              <span>class course management</span>
            </h2>
            <p>View class course</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/admin">DashBoard</a>
            / ClassCourse
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-wrapper">
            <div class="main-content-table">
              <div class="table-header">
                <h2>ClassCourse View Board</h2>
              </div>
              <div class="table-main">
                <div class="table-search">
                  <span>Tìm kiếm danh sách lớp học các môn:</span>
                  <div class="table-search-main">
                    <div class="search">
                      <input type="text" placeholder="Nhập mã số hoặc tên" />
                    </div>
                    <button>
                      <i class="fa-solid fa-star icon-search"></i>
                    </button>
                  </div>
                </div>
                <table>
                  <thead>
                    <tr>
                      <th>Mã lớp học</th>
                      <th>Tên môn học</th>
                      <th>Phòng học</th>
                      <th>Giới hạn</th>
                      <th>Tiết học</th>
                      <th>Học kỳ</th>
                      <th>action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="classCourse" items="${classCourses}">
                      <tr>
                        <th>${classCourse.classCourseId}</th>
                        <td>
                          <span>${classCourse.course.name}</span>
                        </td>
                        <td>${classCourse.classroom}</td>
                        <td>${classCourse.studentLimit}</td>
                        <td>${classCourse.preiod}</td>
                        <td>${classCourse.semester}</td>
                        <td>
                          <button>
                            <a href="/admin/class-course/${classCourse.id}"
                              >View</a
                            >
                          </button>
                          <button>
                            <a
                              href="/admin/class-course/update/${classCourse.id}"
                              >Update</a
                            >
                          </button>
                          <button>
                            <a
                              href="/admin/class-course/delete/${classCourse.id}"
                              >Delete</a
                            >
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
        <div id="button-create-teacher">
          <a href="/admin/class-course/create">
            <i class="fa-solid fa-plus"></i>
          </a>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[5].classList.add("active");
    </script>
  </body>
</html>
