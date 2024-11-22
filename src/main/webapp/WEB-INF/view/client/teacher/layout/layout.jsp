<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
  <div class="button-menu">
    <i class="fa-solid fa-bars"></i>
  </div>
  <div class="title-user">
    <img src="<c:choose>
      <c:when test="${empty sessionScope.avatar}">
        https://cdn3.iconfinder.com/data/icons/essential-rounded/64/Rounded-31-512.png
      </c:when>
      <c:otherwise>
        /images/teacher/${sessionScope.avatar}
      </c:otherwise> </c:choose
    >" alt="user" />
    <span><%=session.getAttribute("teacherName")%></span>
    <ul class="title-user-menu">
      <li>
        <a class="header-user-link" href="">Settings</a>
      </li>
      <li>
        <a class="header-user-link" href="">Đổi mật khẩu</a>
      </li>
      <li><a class="header-user-link" href=""> Giải đáp thắc mắc </a></li>
    </ul>
  </div>
</div>
<nav>
  <div class="logo-details">
    <i class="fa-solid fa-globe"></i>
    <span class="logo_name">management</span>
  </div>
  <ul class="nav-list">
    <li class="nav-item">
      <a href="/teacher">
        <i class="fa-solid fa-gauge"></i>
        <span class="nav-item-title">DashBoard</span>
      </a>
    </li>

    <li class="nav-item">
      <a href="/teacher/infor">
        <i class="fa-solid fa-person-chalkboard"></i>
        <span class="nav-item-title">Profile</span>
      </a>
    </li>

    <li class="nav-item">
      <a href="/teacher/class">
        <i class="fa-solid fa-graduation-cap"></i>
        <span class="nav-item-title">Class</span>
      </a>
    </li>

    <li class="nav-item">
      <a href="/teacher/class-course">
        <i class="fa-solid fa-school"></i>
        <span class="nav-item-title">classes</span>
      </a>
    </li>
  </ul>
  <div class="nav-bottom">
    <button>
      <i class="fa-solid fa-right-from-bracket"></i>
      <span>Logout</span>
    </button>
  </div>
</nav>

<div class="layout">
  <div class="modal-toast">
    <div class="toast-title">
      <h1>Bạn có muốn đăng xuất hay không?</h1>
      <i class="fa-brands fa-linux"></i>
    </div>
    <div class="button-toast">
      <div class="access">
        <form method="post" action="/logout">
          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />
          <button>
            <i class="fa-solid fa-check"></i>
            <span>Tôi có</span>
          </button>
        </form>
      </div>
      <div class="no-access">
        <button>
          <i class="fa-solid fa-xmark"></i>
          <span>Tôi không</span>
        </button>
      </div>
    </div>
  </div>
</div>
