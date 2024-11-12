<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
      integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="/css/login.css" />
  </head>
  <body>
    <div class="layout">
      <div class="content">
        <div class="content-notice">
          <div class="teams">
            <img
              src="https://upload.wikimedia.org/wikipedia/vi/e/ef/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_B%C3%A1ch_Khoa_H%C3%A0_N%E1%BB%99i.svg"
              alt="HUST"
            />
            <span>Nhóm 17</span>
          </div>
          <div class="description">
            <h1>Welcome!</h1>
            <h2>Đến với trang web quản lý sinh viên</h2>
            <p>Phần mềm được thực hiện bởi nhóm 17</p>
          </div>
        </div>
      </div>
      <div class="modal-form">
        <form method="post" action="/login">
          <h2>Sign In</h2>
          <div class="userName">
            <label>Username</label>
            <input type="text" type="email" name="username" />
            <i class="fa fa-user"></i>
          </div>
          <div class="password">
            <label>Password</label>
            <input type="password" name="password" />
            <i class="fa fa-eye-slash"></i>
          </div>
          <div>
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
          </div>
          <div class="remember-forgot">
            <div class="remember">
              <input type="checkbox" />
              <span>Remember me</span>
            </div>
            <div class="forgot">
              <a href="#">Forgot password?</a>
            </div>
          </div>
          <button>Sign In</button>
        </form>
      </div>
    </div>
    <input type="hidden" id="loginError" value="${param.error != null}" />
    <script>
      const eye = document.querySelector("form .password .fa");
      eye.addEventListener("click", () => {
        if (eye.classList.contains("fa-eye-slash")) {
          eye.classList.remove("fa-eye-slash");
          eye.classList.add("fa-eye");
          document
            .querySelector("form .password input")
            .setAttribute("type", "text");
        } else {
          eye.classList.remove("fa-eye");
          eye.classList.add("fa-eye-slash");
          document
            .querySelector("form .password input")
            .setAttribute("type", "password");
        }
      });

      const inputPassword = document.querySelector("form .password input");
      inputPassword.addEventListener("input", () => {
        if (inputPassword.value.length > 0) {
          document.querySelector("form .password").classList.add("typing");
        } else {
          document.querySelector("form .password").classList.remove("typing");
        }
      });

      const inputUsername = document.querySelector("form .userName input");
      inputUsername.addEventListener("input", () => {
        if (inputUsername.value.length > 0) {
          document.querySelector("form .userName").classList.add("typing");
        } else {
          document.querySelector("form .userName").classList.remove("typing");
        }
      });
    </script>
  </body>
</html>
