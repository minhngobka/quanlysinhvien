<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Update Student</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newStudent.avatar}";
                        if (orgImage) {
                            const urlImage = "/images/student/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Update Student</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active"> <a href="/admin">Dashboard</a> / <a
                                            href="/admin/student">Students</a> / Update</li>
                                </ol>

                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Cập nhật thông tin sinh viên</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/student/update"
                                                modelAttribute="newStudent" enctype="multipart/form-data">
                                                <div class="mb-3" style="display: none">
                                                    <label class="form-label">ID:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label">Email:</label>
                                                        <form:input type="email" class="form-control"
                                                            path="user.email" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">MSSV:</label>
                                                        <form:input type="text" class="form-control" path="studentId" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Họ và tên:</label>
                                                        <form:input type="text" class="form-control" path="fullName" />
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label">Năm sinh:</label>
                                                        <form:input type="text" class="form-control" path="birthDate" />
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
                                                        <label for="avatarFile" class="form-label">Hình đại
                                                            diện:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            name="studentAvatarFile" accept=".png, .jpg, .jpeg" />
                                                    </div>
                                                    <div class="col-md-12">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview">
                                                    </div>
                                                    <div class="col-md-12">
                                                        <button type="submit" class="btn btn-primary">Update</button>
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