<!DOCTYPE html> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko"> 
<head> 
	<meta charset="UTF-8" /> 
	<title>테스트변경</title> 
	<style> 
	@import url("https://fonts.googleapis.com/css2?family=Spartan:wght@700&display=swap");
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}
body, html {
  height: 100vh;
  width: 100vw;
}

body {
  background: white;
  background-size: cover;
  display: flex;
  flex-direction: column;
  overflow: hidden;
  font-family: "Spartan", sans-serif;
  color: #2d2d2d;
}

::-moz-selection {
  background: rgba(170, 170, 170, 0.3);
}

::selection {
  background: rgba(170, 170, 170, 0.3);
}

.heading {
  margin: 80px 0 0 80px;
  font-size: 64px;
  width: -webkit-max-content;
  width: -moz-max-content;
  width: max-content;
  display: flex;
  flex-direction: column;
}
.heading > div {
  overflow: hidden;
}
.heading > div > p {
  width: -webkit-max-content;
  width: -moz-max-content;
  width: max-content;
  white-space: nowrap;
  margin: 0;
  line-height: 117%;
}

.green {
  color: #32c267;
}

div.heading > div {
  -webkit-animation-delay: 0;
          animation-delay: 0;
}
div.heading > div:nth-child(2) > p {
  -webkit-animation-delay: 0.05s;
          animation-delay: 0.05s;
}

div.heading > div {
  -webkit-animation-delay: 0;
          animation-delay: 0;
}
div.heading > div:nth-child(3) > p {
  -webkit-animation-delay: 0.075s;
          animation-delay: 0.075s;
}

.slide-up {
  -webkit-animation: slide-up 0.9s cubic-bezier(0.65, 0, 0.35, 1) both;
          animation: slide-up 0.9s cubic-bezier(0.65, 0, 0.35, 1) both;
}

@-webkit-keyframes slide-up {
  0% {
    transform: translateY(100px);
  }
  100% {
    transform: translateY(0);
  }
}

@keyframes slide-up {
  0% {
    transform: translateY(100px);
  }
  100% {
    transform: translateY(0);
  }
}

	 </style>
</head> 
<body> 
	<div class="heading">
	  <div>
	    <p class="slide-up"><span class="green">Hello</span>,</p>
	  </div>
	  <div class="notosanskr">
	    <p class="slide-up">회원가입</p>
	  </div>
	  <div>
	    <p class="slide-up">Sign Up</p>
	  </div>
	</div>
</body> 
</html>

