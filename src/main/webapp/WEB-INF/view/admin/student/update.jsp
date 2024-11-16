<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Update Student</title>

    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/admin/create.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />

    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        const orgImage = "${newStudent.avatar}";
        if (orgImage) {
          const urlImage = "/images/student/" + orgImage;
          $("#avatarPreview").attr("src", urlImage);
          $("#avatarPreview").css({ display: "block" });
        }
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
  </head>

  <body>
    <jsp:include page="../layout/layout.jsp" />
    <div class="container-main">
      <main>
        <div class="main-header">
          <div class="main-header-title">
            <h2>
              <i class="fa-solid fa-desktop"></i>
              <span>student update</span>
            </h2>
            <p>View Student</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/admin">DashBoard</a>
            / <a href="/admin/student">Student</a>
            / Update
          </div>
        </div>
        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Update a student</h2>
              </div>
              <form:form
                class="create-form"
                method="post"
                action="/admin/student/update"
                modelAttribute="newStudent"
                enctype="multipart/form-data"
              >
                <div class="mb-3" style="display: none">
                  <label class="form-label">ID:</label>
                  <form:input type="text" class="form-control" path="id" />
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label class="form-label">Email:</label>
                        <form:input type="email" class="form-control" path="user.email"
                            disabled="true" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">MSSV:</label>
                        <form:input type="text" class="form-control" path="studentId"
                            disabled="true" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Họ và tên:</label>
                        <form:input type="text" class="form-control" path="fullName" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Năm sinh:</label>
                        <form:input type="text" class="form-control" path="birthDate" />
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Số điện thoại:</label>
                        <form:input type="text" class="form-control" path="phone" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Lớp học:</label>
                        <form:select class="form-select" path="classe.id">
                            <c:forEach var="classe" items="${classes}">
                                <form:option value="${classe.id}">${classe.name}
                                </form:option>
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
                        <form:input type="text" class="form-control" path="address" />
                    </div>
                    <div class="col-md-6">
                        <label for="avatarFile" class="form-label">Hình đại
                            diện:</label>
                        <input class="form-control" type="file" id="avatarFile"
                            name="teacherAvatarFile" accept=".png, .jpg, .jpeg" />
                    </div>
                    <div class="col-md-12">
                        <img style="max-height: 250px; display: none;"
                            alt="avatar preview" id="avatarPreview">
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
      document.querySelectorAll(".nav-item")[1].classList.add("active");
    </script>
    <script>
      const avatarFile = document.getElementById("avatarFile");
      const avatarPreview = document.getElementById("avatarPreview");

      avatarFile.addEventListener("change", function () {
        const file = this.files[0];
        console.log(file);
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
