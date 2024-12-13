<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

      <html lang="en">

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Quản lý sinh viên" />
        <meta name="author" content="Quản lý sinh viên" />
        <title>Create Class</title>
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
                  <i class="fa-solid fa-book-bookmark"></i>
                  <span>Class Create</span>
                </h2>
                <p>View Class</p>
              </div>
              <div class="main-header-routing">
                <i class="fa-solid fa-house"></i> / <a href="/admin">DashBoard</a> /
                <a href="/admin/class">Class</a> / Create
              </div>
            </div>

            <div class="main-content">
              <div class="main-content-create">
                <div class="create-wrapper">
                  <div class="create-header">
                    <h2>Create a class</h2>
                  </div>
                  <form:form class="create-form" method="post" action="/admin/class/create" modelAttribute="newClass">
                    <div class="row">
                      <c:set var="errorClassId">
                        <form:errors path="classId" cssClass="invalid-feedback" />
                      </c:set>
                      <c:set var="errorName">
                        <form:errors path="name" cssClass="invalid-feedback" />
                      </c:set>
                      <div class="col-md-2">
                        <label class="form-label">Mã lớp:</label>
                        <form:input type="text" class="form-control ${not empty errorClassId ? 'is-invalid' : ''}"
                          path="classId" />
                        ${errorClassId}
                      </div>
                      <div class="col-md-6">
                        <label class="form-label">Tên ngành:</label>
                        <form:input type="text" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                          path="name" />
                        ${errorName}
                      </div>
                      <div class="col-md-4">
                        <label class="form-label">Giáo viên chủ nhiệm:</label>
                        <form:select class="form-select" path="teacher.id">
                          <c:forEach var="teacher" items="${teachers}">
                            <form:option value="${teacher.id}">${teacher.fullName}
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
          document.querySelectorAll(".nav-item")[4].classList.add("active");
        </script>
      </body>

      </html>