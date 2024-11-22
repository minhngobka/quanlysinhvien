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
    <title>Create Student</title>
    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/teacher/create.css" />
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
              <span>Student Create</span>
            </h2>
            <p>View Student</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i> /
            <a href="/teacher">Dashboard</a> /
            <a href="/teacher/class-course">Class Courses</a> /
            <a href="/teacher/class-course/${newGrade.classCourse.id}">Infor</a>
            / Grade
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Create a Student</h2>
              </div>
              <form:form
                class="create-form"
                method="post"
                action="/teacher/class-course/${newGrade.classCourse.id}/${newGrade.student.id}"
                modelAttribute="newGrade"
              >
                <div class="mb-3" style="display: none">
                  <label class="form-label">ID:</label>
                  <form:input type="text" class="form-control" path="id" />
                </div>
                <h3>Điểm sinh viên ${newGrade.student.fullName}</h3>
                <hr style="margin-bottom: 20px" />
                <div class="row">
                  <div class="col-md-4">
                    <label class="form-label">Điểm giữa kỳ:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="midtermSorce"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Điểm cuối kỳ:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="finalSorce"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Điểm tổng kết:</label>
                    <form:input
                      type="email"
                      class="form-control"
                      path="totalSorce"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="form-submit">Save</button>
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
    <script>
      const avatarFile = document.getElementById("avatarFile");
      const avatarPreview = document.getElementById("avatarPreview");

      avatarFile.addEventListener("change", function () {
        const file = this.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function () {
            avatarPreview.src = reader.result;
            avatarPreview.style.display = "block";
          };
          reader.readAsDataURL(file);
        }
      });
    </script>
  </body>
</html>
