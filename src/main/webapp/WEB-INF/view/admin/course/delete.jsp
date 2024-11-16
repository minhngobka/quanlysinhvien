<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Delete Course</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
      * {
        box-sizing: border-box;
      }
      body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background: url(https://cdn-media.sforum.vn/storage/app/media/wp-content/uploads/2023/12/hinh-nen-vu-tru-72.jpg)
          no-repeat;
        background-size: cover;
        background-position: center;
        max-height: 100vh;
        overflow: hidden;
      }

      .row {
        display: flex;
        flex-direction: column;
        padding: 30px;
        border-radius: 20px;
        background-color: transparent;
        backdrop-filter: blur(10px);
        gap: 10px;
        height: 300px;
        justify-content: space-around;
        box-shadow: -4px 4px 10px rgba(0, 0, 0, 0.2); /* Đẩy bóng sang trái */
      }

      .row h3 {
        font-size: 30px;
        color: #eeeeee;
        text-align: center;
        margin: 0;
      }

      .row i {
        font-size: 50px;
        color: rgb(237, 236, 236);
        text-align: center;
      }

      .row .content {
        display: flex;
        justify-content: space-around;
      }

      .content a {
        text-decoration: none;
        color: black;
        display: block;
        line-height: 30px;
      }

      button {
        border-radius: 10px;
        padding: 0;
        margin: 0;
        height: 50px;
        width: 100px;
        outline: none;
        border: none;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 0 2px rgba(0, 0, 0, 0.2);
      }

      .btn-delete {
        background-color: red;
      }

      .btn-back {
        background-color: #4caf50;
      }
    </style>
  </head>

  <body>
    <div class="row">
      <h3>Delete Course with id = ${id}</h3>
      <i class="fa-solid fa-trash"></i>
      <div class="content">
        <form:form
          method="post"
          action="/admin/course/delete"
          modelAttribute="newCourse"
        >
          <div class="mb-3" style="display: none">
            <label class="form-label">ID:</label>
            <form:input
              value="${id}"
              type="text"
              class="form-control"
              path="id"
            />
          </div>
          <button class="btn-delete">Confirm</button>
        </form:form>
        <button class="btn-back">
          <a href="/admin/course">Back</a>
        </button>
      </div>
    </div>
  </body>
</html>
