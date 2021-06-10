<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body id="home">
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />
<div class="container">
</div>
<style>
    html {
        /*height:100%;*/
        overflow-x: hidden;
    }
    nav{
        position: absolute;
        z-index: 99;
    }
    * {
        margin: 0;
        padding: 0;
    }
    body, html {
        /*height:100%;*/
        font-family:  'Poppins', sans-serif;
    }
    canvas {
        position:absolute;
        height:100%;
        width:100%;
    }
    .logo{
        position: absolute;
        margin: auto;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 99;
        height: auto;
        width: 60%;
        /*filter: contrast(100%);*/
    }
    .logo1{
        position: absolute;
        margin: auto;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        z-index: 70;
        height: auto;
        width: 60%;
        opacity: 0.7;
    }
    .slide-out-blurred-left, .logo1{-webkit-animation:slide-out-blurred-left 85s cubic-bezier(.755,.05,.855,.06) infinite both;animation:slide-out-blurred-left 15s cubic-bezier(.755,.05,.855,.06) infinite both}
    @-webkit-keyframes slide-out-blurred-left{0%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}100%{-webkit-transform:translateX(-1000px) scaleX(2) scaleY(.2);transform:translateX(-1000px) scaleX(2) scaleY(.2);-webkit-transform-origin:100% 50%;transform-origin:100% 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}}@keyframes slide-out-blurred-left{0%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}100%{-webkit-transform:translateX(-1000px) scaleX(2) scaleY(.2);transform:translateX(-1000px) scaleX(2) scaleY(.2);-webkit-transform-origin:100% 50%;transform-origin:100% 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}}    </style>
</style>
<img class="logo" src="<%=request.getContextPath()%>/img/local/LOGO.png" >
<img class="logo1" src="<%=request.getContextPath()%>/img/local/LOGO.png" >
<canvas id="canv" width="32" height="32">
</canvas>
<script src="resources/js/js.js"></script>
</body>
</html>











<script src="resources/js/js.js"></script>

</body>
</html>

