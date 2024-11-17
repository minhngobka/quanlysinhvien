<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

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
    <title>Create Class Course</title>
    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/admin/create.css" />
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
              <i class="fa-solid fa-book-bookmark"></i>
              <span>Class Course Create</span>
            </h2>
            <p>View Class Course</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i> / <a href="/admin">DashBoard</a> /
            <a href="/admin/class-course">ClassCourse</a> / Create
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Create a class course</h2>
              </div>
              <form:form
                class="create-form"
                method="post"
                action="/admin/class-course/create"
                modelAttribute="newClassCourse"
              >
                <div class="row">
                  <c:set var="errorClassCourseId">
                    <form:errors
                      path="classCourseId"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorClassroom">
                    <form:errors path="classroom" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorPreiod">
                    <form:errors path="preiod" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorStudentLimit">
                    <form:errors
                      path="studentLimit"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorSemester">
                    <form:errors path="semester" cssClass="invalid-feedback" />
                  </c:set>
                  <div class="col-md-6">
                    <label class="form-label">Mã lớp học:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorClassCourseId ? 'is-invalid' : ''}"
                      path="classCourseId"
                    />
                    ${errorClassCourseId}
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Tên môn học:</label>
                    <form:select class="form-select" path="course.id">
                      <c:forEach var="course" items="${courses}">
                        <form:option value="${course.id}"
                          >${course.name}
                        </form:option>
                      </c:forEach>
                    </form:select>
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Phòng học:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorClassroom ? 'is-invalid' : ''}"
                      path="classroom"
                    />
                    ${errorClassroom}
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tiết học:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorPreiod ? 'is-invalid' : ''}"
                      path="preiod"
                    />
                    ${errorPreiod}
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
                  <div class="col-md-4">
                    <label class="form-label">Giới hạn:</label>
                    <form:input
                      type="number"
                      class="form-control ${not empty errorStudentLimit ? 'is-invalid' : ''}"
                      path="studentLimit"
                    />
                    ${errorStudentLimit}
                  </div>

                  <div class="col-md-4">
                    <label class="form-label">Học kỳ:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorSemester ? 'is-invalid' : ''}"
                      path="semester"
                    />
                    ${errorSemester}
                  </div>

                  <div class="col-md-4">
                    <label class="form-label">Giảng viên dạy:</label>
                    <form:select class="form-select" path="teacher.id">
                      <c:forEach var="teacher" items="${teachers}">
                        <form:option value="${teacher.id}"
                          >${teacher.fullName}
                        </form:option>
                      </c:forEach>
                    </form:select>
                  </div>

                  <div class="col-md-12">
                    <button type="submit" class="form-submit">Submit</button>
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
