<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Quản lý sinh viên" />
                <meta name="author" content="Quản lý sinh viên" />
                <title>Create Teacher</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <!-- Latest compiled and minified CSS
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                Latest compiled JavaScript
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Create Teacher</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/teacher">Teachers</a> / Create</li>
                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a teacher</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/teacher/create"
                                                modelAttribute="newTeacher" enctype="multipart/form-data">

                                                <div class="row g-3">
                                                    <c:set var="errorEmail">
                                                        <form:errors path="user.email" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorPassword">
                                                        <form:errors path="user.password" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorTeacherId">
                                                        <form:errors path="teacherId" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <c:set var="errorFullName">
                                                        <form:errors path="fullName" cssClass="invalid-feedback" />
                                                    </c:set>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email:</label>
                                                        <form:input type="email"
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            path="user.email" />
                                                        ${errorEmail}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mật khẩu:</label>
                                                        <form:input type="password"
                                                            class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                            path="user.password" />
                                                        ${errorPassword}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Mã giảng viên:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorTeacherId ? 'is-invalid' : ''}"
                                                            path="teacherId" />
                                                        ${errorTeacherId}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Họ và tên:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty errorFullName ? 'is-invalid' : ''}"
                                                            path="fullName" />
                                                        ${errorFullName}
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Số điện thoại:</label>
                                                        <form:input type="text" class="form-control" path="phone" />
                                                    </div>
                                                    <div class="col-md-6">
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
                                                        <label class="form-label">Vai trò:</label>
                                                        <form:select class="form-select" path="user.role.name">
                                                            <form:option value="TEACHER">TEACHER</form:option>
                                                            <form:option value="ADMIN">ADMIN</form:option>
                                                        </form:select>
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
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>