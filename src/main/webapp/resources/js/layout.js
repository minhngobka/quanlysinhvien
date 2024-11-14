const menu = document.querySelector(".button-menu");

menu.addEventListener("click", () => {
  const header = document.getElementById("header");
  header.classList.toggle("close");
  const nav = document.querySelector("nav");
  nav.classList.toggle("close");
});

document.querySelector(".nav-bottom button").addEventListener("click", () => {
  document.querySelector(".layout").classList.add("open");
});

document.querySelector(".layout .no-access").addEventListener("click", () => {
  document.querySelector(".layout").classList.remove("open");
});
