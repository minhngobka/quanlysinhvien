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
              <i class="fa-solid fa-desktop"></i>
              <span>Student Create</span>
            </h2>
            <p>View Student</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i> / <a href="/admin">DashBoard</a> /
            <a href="/admin/student">Student</a> / Create
          </div>
        </div>

        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Create a Student</h2>
              </div>
              <form:form
                method="post"
                class="create-form"
                action="/admin/student/create"
                modelAttribute="newStudent"
                enctype="multipart/form-data"
              >
                <div class="row g-3">
                  <c:set var="errorEmail">
                    <form:errors
                      path="user.email"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorPassword">
                    <form:errors
                      path="user.password"
                      cssClass="invalid-feedback"
                    />
                  </c:set>
                  <c:set var="errorStudentId">
                    <form:errors path="studentId" cssClass="invalid-feedback" />
                  </c:set>
                  <c:set var="errorFullName">
                    <form:errors path="fullName" cssClass="invalid-feedback" />
                  </c:set>

                  <div class="col-md-6">
                    <label class="form-label">Email:</label>
                    <form:input
                      type="email"
                      class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                      path="user.email"
                    />
                    ${errorEmail}
                  </div>

                  <div class="col-md-6">
                    <label class="form-label">Mật khẩu:</label>
                    <form:input
                      type="password"
                      class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                      path="user.password"
                    />
                    ${errorPassword}
                  </div>

                  <div class="col-md-6">
                    <label class="form-label">MSSV:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorStudentId ? 'is-invalid' : ''}"
                      path="studentId"
                    />
                    ${errorStudentId}
                  </div>

                  <div class="col-md-6">
                    <label class="form-label">Họ và tên:</label>
                    <form:input
                      type="text"
                      class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                      path="fullName"
                    />
                    ${errorFullName}
                  </div>

                  <div class="col-md-4">
                    <label class="form-label">Số điện thoại:</label>
                    <form:input type="text" class="form-control" path="phone" />
                  </div>

                  <div class="col-md-6">
                    <label class="form-label">Lớp học:</label>
                    <form:select class="form-select" path="classe.id">
                      <c:forEach var="classe" items="${classes}">
                        <form:option value="${classe.id}"
                          >${classe.name}</form:option
                        >
                      </c:forEach>
                    </form:select>
                  </div>

                  <div class="col-md-2">
                    <label class="form-label">Giới tính:</label>
                    <form:select class="form-select" path="gender">
                      <form:option value="MALE">Nam</form:option>
                      <form:option value="FEMALE">Nữ</form:option>
                      <form:option value="ORTHER">Khác</form:option>
                    </form:select>
                  </div>

                  <div class="col-md-12">
                    <label class="form-label">Địa chỉ:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="address"
                    />
                  </div>

                  <div class="col-md-6">
                    <label for="avatarFile" class="form-label"
                      >Hình đại diện:</label
                    >
                    <input
                      class="form-control"
                      type="file"
                      id="avatarFile"
                      name="studentAvatarFile"
                      accept=".png, .jpg, .jpeg"
                    />
                  </div>

                  <div class="col-md-12">
                    <img
                      style="max-height: 250px; display: none"
                      alt="avatar preview"
                      id="avatarPreview"
                    />
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
      document.querySelectorAll(".nav-item")[2].classList.add("active");
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
