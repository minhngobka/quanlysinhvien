<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile teacher</title>
    <link href="/css/layout.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/teacher/create.css" />
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
              <span>teacher profile</span>
            </h2>
            <p>View Teacher</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            /
            <a href="/teacher">DashBoard</a>
            / Profile
          </div>
        </div>
        <div class="main-content">
          <div class="main-content-create">
            <div class="create-wrapper">
              <div class="create-header">
                <h2>Profile a teacher</h2>
              </div>
              <div class="create-form">
                <div class="row">
                  <div class="col-md-6">
                    <label class="form-label">Email:</label>
                    <form:input
                      type="email"
                      class="form-control"
                      path="currentTeacher.user.email"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Mã giảng viên:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.teacherId"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Họ và tên:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.fullName"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-4">
                    <label class="form-label">Số điện thoại:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.phone"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-2">
                    <label class="form-label">Năm sinh:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.birthDate"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Địa chỉ:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.address"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-2">
                    <label class="form-label">Giới tính:</label>
                    <form:input
                      type="text"
                      class="form-control"
                      path="currentTeacher.gender"
                      disabled="true"
                    />
                  </div>
                  <div class="col-md-6 button-style">
                    <a href="/teacher" class="btn btn-success">Home</a>
                    <a
                      href="/teacher/infor/update/${currentTeacher.id}"
                      class="btn btn-warning mx-2"
                      >Update</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[1].classList.add("active");
    </script>
  </body>
</html>
