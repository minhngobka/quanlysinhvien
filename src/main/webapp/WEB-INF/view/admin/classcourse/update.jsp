<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <html lang="en">

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Update Class course</title>

        <link href="/css/layout.css" rel="stylesheet" />
        <link rel="stylesheet" href="/css/admin/create.css" />
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
                  <span>class course update</span>
                </h2>
                <p>View Class Course</p>
              </div>
              <div class="main-header-routing">
                <i class="fa-solid fa-house"></i>
                /
                <a href="/admin">DashBoard</a>
                / <a href="/admin/class-course">ClassCourse</a>
                / Update
              </div>
            </div>
            <div class="main-content">
              <div class="main-content-create">
                <div class="create-wrapper">
                  <div class="create-header">
                    <h2>Update a class course</h2>
                  </div>
                  <form:form class="create-form" method="post" action="/admin/class-course/update"
                    modelAttribute="newClassCourse">
                    <div class="mb-3" style="display: none">
                      <label class="form-label">ID:</label>
                      <form:input type="text" class="form-control" path="id" />
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <label class="form-label">Mã lớp học:</label>
                        <form:input type="text" class="form-control" path="classCourseId" />
                      </div>
                      <div class="col-md-6">
                        <label class="form-label">Tên môn học:</label>
                        <form:select class="form-select" path="course.id">
                          <c:forEach var="course" items="${courses}">
                            <form:option value="${course.id}">${course.name}
                            </form:option>
                          </c:forEach>
                        </form:select>
                      </div>
                      <div class="col-md-4">
                        <label class="form-label">Phòng học:</label>
                        <form:input type="text" class="form-control" path="classroom" />
                      </div>
                      <div class="col-md-4">
                        <label class="form-label">Tiết học:</label>
                        <form:input type="text" class="form-control" path="preiod" />
                      </div>
                      <div class="col-md-2">
                        <label class="form-label">Thứ:</label>
                        <form:select class="form-select" path="weekday">
                          <form:option value="2">2</form:option>
                          <form:option value="3">3</form:option>
                          <form:option value="4">4</form:option>
                          <form:option value="5">5</form:option>
                          <form:option value="6">6</form:option>
                          <form:option value="7">7</form:option>
                        </form:select>
                      </div>
                      <div class="col-md-2">
                        <label class="form-label">Buổi:</label>
                        <form:select class="form-select" path="timePeriod">
                          <form:option value="Sáng">Sáng</form:option>
                          <form:option value="Chiều">Chiều</form:option>
                        </form:select>
                      </div>
                      <div class="col-md-4">
                        <label class="form-label">Giới hạn:</label>
                        <form:input type="number" class="form-control" path="studentLimit" />
                      </div>

                      <div class="col-md-4">
                        <label class="form-label">Học kỳ:</label>
                        <form:input type="text" class="form-control" path="semester" />
                      </div>

                      <div class="col-md-4">
                        <label class="form-label">Giảng viên dạy:</label>
                        <form:select class="form-select" path="teacher.id">
                          <c:forEach var="teacher" items="${teachers}">
                            <form:option value="${teacher.id}">${teacher.fullName}
                            </form:option>
                          </c:forEach>
                        </form:select>
                      </div>
                      <div class="col-md-12">
                        <button type="submit" class="form-submit">Update</button>
                      </div>
                    </div>
                  </form:form>
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