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
    <title>Create Subject</title>
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
              <span>Subject Create</span>
            </h2>
            <p>View Subject</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i> / <a href="/admin">DashBoard</a> /
            <a href="/admin/course">Subject</a> / Create
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Create a subject</h2>
              </div>
              <form:form
                class="create-form"
                method="post"
                action="/admin/course/create"
                modelAttribute="newCourse"
              >
                <div class="row g-3">
                  <c:set var="errorCourseId">
                    <form:errors path="courseId" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorName">
                    <form:errors path="name" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorTheoreticalCredits">
                    <form:errors
                      path="theoreticalCredits"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorExeciseCredits">
                    <form:errors
                      path="execiseCredits"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorCoefficient">
                    <form:errors
                      path="coefficient"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <div class="col-md-6">
                    <label class="form-label">Mã môn học:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorCourseId ? 'is-invalid' : ''}"
                      path="courseId"
                    />
                    ${errorCourseId}
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Tên môn học:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                      path="name"
                    />
                    ${errorName}
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tín chỉ lý thuyết:</label>
                    <form:input
                      type="number"
                      class="form-control ${not empty errorTheoreticalCredits ? 'is-invalid' : ''}"
                      path="theoreticalCredits"
                    />
                    ${errorTheoreticalCredits}
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tín chỉ bài tập:</label>
                    <form:input
                      type="number"
                      class="form-control ${not empty errorExeciseCredits ? 'is-invalid' : ''}"
                      path="execiseCredits"
                    />
                    ${errorExeciseCredits}
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tín chỉ thực hành:</label>
                    <form:input
                      type="number"
                      class="form-control"
                      path="practicalCredits"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Hệ số:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorCoefficient ? 'is-invalid' : ''}"
                      path="coefficient"
                    />
                    ${errorCoefficient}
                  </div>
                  <div class="col-md-8">
                    <label class="form-label">Khoa:</label>
                    <form:select class="form-select" path="department.id">
                      <form:option value="1">Công nghệ thông tin</form:option>
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
      document.querySelectorAll(".nav-item")[3].classList.add("active");
    </script>
  </body>
</html>
