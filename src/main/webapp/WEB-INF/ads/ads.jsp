<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <style>
        body {
            background-image: url("/img/local/NBM.png");
            background-position: center;
            background-repeat: no-repeat;
            background-color: transparent;
            background-size: cover;
            width: 100%;
            height: auto;
            transform: translateZ(0);

        }

        h1 {
            color: #cccccc;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <div class="card">
                <img src="" class="card-img-top" alt="ad-image">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${ad.title}" /></h5>
                </div>
            </div>
            <h2></h2>
            <div class="card-text">
                <p><c:out value="${ad.price}" /></p>
                <p><c:out value="${ad.rarity}" /></p>
            </div>
            <ul class="list-group list-group-flush">
                <c:forEach var="category" items="${categories}">
                    <li class="list-group-item"><c:out value="category" /></li>
                </c:forEach>
            </ul>
            <p><c:out value="${ad.description}" /></p>
        </div>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="//static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
</body>
</html>
