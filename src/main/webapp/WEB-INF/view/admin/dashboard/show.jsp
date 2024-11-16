mmain<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
    <title>Dashboard - Quản lý sinh viên</title>
    <link href="/css/layout.css" rel="stylesheet" />
    <link href="/css/admin/dashboard.admin.css" rel="stylesheet" />
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
              <i class="fa-solid fa-graduation-cap"></i>
              <span
                >Hanoi University of Science and Technology (<a
                  href="https://www.hust.edu.vn/vi/"
                  target="_blank"
                  >HUST</a
                >)</span
              >
            </h2>
            <p>Trang chủ admin phần mềm quản lý sinh viên CNTT</p>
          </div>
          <div class="main-header-routing">
            <i class="fa-solid fa-house"></i>
            / DashBoard
          </div>
        </div>
        <div class="main-content">
          <div class="grid">
            <div class="grid-item">
              <a href="/admin/student">
                <i class="fa-solid fa-users"></i>
                <div class="grid-item-content">
                  <h3>${countStudents}</h3>
                  <p>number of students</p>
                </div>
              </a>
            </div>
            <div class="grid-item">
              <a href="/admin/teacher">
                <i class="fa-solid fa-chalkboard-user"></i>
                <div class="grid-item-content">
                  <h3>${countTeachers}</h3>
                  <p>number of teachers</p>
                </div>
              </a>
            </div>
            <div class="grid-item">
              <a href="/admin/course">
                <i class="fa-solid fa-book-atlas"></i>
                <div class="grid-item-content">
                  <h3>${countCourses}</h3>
                  <p>number of subjects</p>
                </div>
              </a>
            </div>
            <div class="grid-item">
              <a href="/admin/class-course">
                <i class="fa-solid fa-landmark"></i>
                <div class="grid-item-content">
                  <h3>${countClassCourses}</h3>
                  <p>number of classes</p>
                </div>
              </a>
            </div>
          </div>
        </div>
        <div class="text">
          <svg viewBox="0 0 700 600" preserveAspectRatio="xMinYMin meet">
            <g transform="translate(350,300)">
              <text
                text-anchor="middle"
                transform="translate(27,141)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 49px;
                  fill: rgb(31, 119, 180);
                "
              >
                Data Structures
              </text>
              <text
                text-anchor="middle"
                transform="translate(48,62)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 42px;
                  fill: rgb(255, 127, 14);
                "
              >
                Searching
              </text>
              <text
                text-anchor="middle"
                transform="translate(-45,22)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 39px;
                  fill: rgb(44, 160, 44);
                "
              >
                Sorting
              </text>
              <text
                text-anchor="middle"
                transform="translate(-151,-17)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 38px;
                  fill: rgb(214, 39, 40);
                "
              >
                Optimization
              </text>
              <text
                text-anchor="middle"
                transform="translate(-153,20)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 36px;
                  fill: rgb(148, 103, 189);
                "
              >
                Java
              </text>
              <text
                text-anchor="middle"
                transform="translate(162,26)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 36px;
                  fill: rgb(140, 86, 75);
                "
              >
                C++
              </text>
              <text
                text-anchor="middle"
                transform="translate(-147,-83)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 36px;
                  fill: rgb(227, 119, 194);
                "
              >
                Array
              </text>
              <text
                text-anchor="middle"
                transform="translate(98,-78)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 35px;
                  fill: rgb(127, 127, 127);
                "
              >
                Shortest Path
              </text>
              <text
                text-anchor="middle"
                transform="translate(38,-126)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 34px;
                  fill: rgb(188, 189, 34);
                "
              >
                Tree
              </text>
              <text
                text-anchor="middle"
                transform="translate(-147,-118)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 34px;
                  fill: rgb(23, 190, 207);
                "
              >
                Discrete Math
              </text>
              <text
                text-anchor="middle"
                transform="translate(6,-23)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 34px;
                  fill: rgb(31, 119, 180);
                "
              >
                OOP
              </text>
              <text
                text-anchor="middle"
                transform="translate(-147,58)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 34px;
                  fill: rgb(255, 127, 14);
                "
              >
                Complexity
              </text>
              <text
                text-anchor="middle"
                transform="translate(-126,175)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 33px;
                  fill: rgb(44, 160, 44);
                "
              >
                Dynamic Programming
              </text>
              <text
                text-anchor="middle"
                transform="translate(64,-161)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 33px;
                  fill: rgb(214, 39, 40);
                "
              >
                Software Development
              </text>
              <text
                text-anchor="middle"
                transform="translate(-113,98)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 32px;
                  fill: rgb(148, 103, 189);
                "
              >
                NP-hard
              </text>
              <text
                text-anchor="middle"
                transform="translate(-29,-195)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 32px;
                  fill: rgb(140, 86, 75);
                "
              >
                Tree Traversal
              </text>
              <text
                text-anchor="middle"
                transform="translate(120,-17)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 32px;
                  fill: rgb(227, 119, 194);
                "
              >
                Hashing
              </text>
              <text
                text-anchor="middle"
                transform="translate(-157,-159)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 31px;
                  fill: rgb(127, 127, 127);
                "
              >
                Stack
              </text>
              <text
                text-anchor="middle"
                transform="translate(-83,213)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 31px;
                  fill: rgb(188, 189, 34);
                "
              >
                Queue
              </text>
              <text
                text-anchor="middle"
                transform="translate(81,96)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 31px;
                  fill: rgb(23, 190, 207);
                "
              >
                DFS
              </text>
              <text
                text-anchor="middle"
                transform="translate(-197,140)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 30px;
                  fill: rgb(31, 119, 180);
                "
              >
                Python
              </text>
              <text
                text-anchor="middle"
                transform="translate(226,70)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 30px;
                  fill: rgb(255, 127, 14);
                "
              >
                Binary Tree
              </text>
              <text
                text-anchor="middle"
                transform="translate(-49,-72)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 29px;
                  fill: rgb(44, 160, 44);
                "
              >
                Heap
              </text>
              <text
                text-anchor="middle"
                transform="translate(159,-120)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 29px;
                  fill: rgb(214, 39, 40);
                "
              >
                MergeSort
              </text>
              <text
                text-anchor="middle"
                transform="translate(253,-44)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 29px;
                  fill: rgb(148, 103, 189);
                "
              >
                Backtracking
              </text>
              <text
                text-anchor="middle"
                transform="translate(147,173)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 29px;
                  fill: rgb(140, 86, 75);
                "
              >
                ReactJS
              </text>
              <text
                text-anchor="middle"
                transform="translate(121,-194)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 28px;
                  fill: rgb(227, 119, 194);
                "
              >
                BFS
              </text>
              <text
                text-anchor="middle"
                transform="translate(45,-232)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 28px;
                  fill: rgb(127, 127, 127);
                "
              >
                Divide &amp; Conquer
              </text>
              <text
                text-anchor="middle"
                transform="translate(264,-7)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 28px;
                  fill: rgb(188, 189, 34);
                "
              >
                QuickSort
              </text>
              <text
                text-anchor="middle"
                transform="translate(31,218)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 28px;
                  fill: rgb(23, 190, 207);
                "
              >
                Database
              </text>
              <text
                text-anchor="middle"
                transform="translate(-219,212)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 27px;
                  fill: rgb(31, 119, 180);
                "
              >
                Linked List
              </text>
              <text
                text-anchor="middle"
                transform="translate(75,16)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 27px;
                  fill: rgb(255, 127, 14);
                "
              >
                Greedy
              </text>
              <text
                text-anchor="middle"
                transform="translate(177,209)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 27px;
                  fill: rgb(44, 160, 44);
                "
              >
                SelectionSort
              </text>
              <text
                text-anchor="middle"
                transform="translate(6,249)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 27px;
                  fill: rgb(214, 39, 40);
                "
              >
                Probability
              </text>
              <text
                text-anchor="middle"
                transform="translate(251,28)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 25px;
                  fill: rgb(148, 103, 189);
                "
              >
                Graph
              </text>
              <text
                text-anchor="middle"
                transform="translate(-237,-59)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 25px;
                  fill: rgb(140, 86, 75);
                "
              >
                Matrix
              </text>
              <text
                text-anchor="middle"
                transform="translate(-139,246)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 25px;
                  fill: rgb(227, 119, 194);
                "
              >
                HeapSort
              </text>
              <text
                text-anchor="middle"
                transform="translate(151,103)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 25px;
                  fill: rgb(127, 127, 127);
                "
              >
                AI
              </text>
              <text
                text-anchor="middle"
                transform="translate(-226,-194)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 23px;
                  fill: rgb(188, 189, 34);
                "
              >
                User Interface
              </text>
              <text
                text-anchor="middle"
                transform="translate(-56,276)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 22px;
                  fill: rgb(23, 190, 207);
                "
              >
                Security
              </text>
              <text
                text-anchor="middle"
                transform="translate(95,279)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 22px;
                  fill: rgb(31, 119, 180);
                "
              >
                Operating System
              </text>
              <text
                text-anchor="middle"
                transform="translate(253,-94)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 21px;
                  fill: rgb(255, 127, 14);
                "
              >
                Dijkstra
              </text>
              <text
                text-anchor="middle"
                transform="translate(-148,-231)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 21px;
                  fill: rgb(44, 160, 44);
                "
              >
                Game Theory
              </text>
              <text
                text-anchor="middle"
                transform="translate(153,244)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 21px;
                  fill: rgb(214, 39, 40);
                "
              >
                Networking
              </text>
              <text
                text-anchor="middle"
                transform="translate(-271,108)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 19px;
                  fill: rgb(148, 103, 189);
                "
              >
                Bitwise
              </text>
              <text
                text-anchor="middle"
                transform="translate(-167,277)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 19px;
                  fill: rgb(140, 86, 75);
                "
              >
                BubbleSort
              </text>
              <text
                text-anchor="middle"
                transform="translate(216,-199)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 17px;
                  fill: rgb(227, 119, 194);
                "
              >
                Spanning Tree
              </text>
              <text
                text-anchor="middle"
                transform="translate(-260,16)rotate(0)"
                style="
                  font-family: Roboto;
                  font-style: normal;
                  font-weight: bold;
                  font-size: 13px;
                  fill: rgb(127, 127, 127);
                "
              >
                Bellman-Ford
              </text>
            </g>
          </svg>
        </div>
      </main>
    </div>
    <script src="/js/layout.js"></script>
    <script>
      document.querySelectorAll(".nav-item")[0].classList.add("active");
    </script>
  </body>
</html>
