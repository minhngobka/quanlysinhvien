<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Course</title>

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
              <span>Subject update</span>
            </h2>
            <p>View Subject</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/admin">DashBoard</a>
            / <a href="/admin/course">Subject</a>
            / Update
          </div>
        </div>
        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Update a course</h2>
              </div>
              <form:form
                class="create-form"
                method="post"
                action="/admin/course/update"
                modelAttribute="newCourse"
              >
                <div class="mb-3" style="display: none">
                  <label class="form-label">ID:</label>
                  <form:input type="text" class="form-control" path="id" />
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <label class="form-label">Mã môn học:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="courseId"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Tên môn học:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="name"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tín chỉ lý thuyết:</label>
                    <form:input
                      type="number"
                      class="form-control"
                      path="theoreticalCredits"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Tín chỉ bài tập:</label>
                    <form:input
                      type="number"
                      class="form-control"
                      path="execiseCredits"
                    />
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
                      class="form-control"
                      path="coefficient"
                    />
                  </div>
                  <div class="col-md-8">
                    <label class="form-label">Khoa:</label>
                    <form:select class="form-select" path="department.id">
                      <form:option value="1">Công nghệ thông tin</form:option>
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
      document.querySelectorAll(".nav-item")[3].classList.add("active");
    </script>
  </body>
</html>
