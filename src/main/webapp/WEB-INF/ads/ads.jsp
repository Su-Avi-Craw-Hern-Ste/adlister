<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
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
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp"/>

<div class="container">
    <form action="/ads" method="post">
        <div class="input-group">
            <input id="search" type="text" class="form-control" name="search" placeholder="Search by title">
            <span class="input-group-text"><button type="submit" class="btn btn-primary"><i
                    class="fa fa-search"></i></button></span>
        </div>
    </form>

    <div class="dropdown">
        <select id="filter" name="filter">
            <option class="dropdown-content" value="none">Filter By</option>
            <option class="dropdown-content" name="armor" value="Armor">Armor</option>
            <option class="dropdown-content" name="weapons" value="Weapons">Weapons</option>
            <option class="dropdown-content" name="animals" value="Animals">Animals</option>
            <option class="dropdown-content" name="materials" value="Materials">Materials</option>
            <option class="dropdown-content" name="consumables" value="Consumables">Consumables</option>
            <option class="dropdown-content" name="tools" value="Tools">Tools</option>
            <option class="dropdown-content" name="treasures" value="Treasures">Treasures</option>
            <option class="dropdown-content" name="misc" value="Misc (anything not in above categories)">Misc</option>
        </select>
    </div>

    <h1 id="main-header">Here Are all the ads!</h1>
    <div class="row">
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-3">
                <div class="card">
                    <img src="<c:out value="${ad.images[0]}"/>" class="card-img-top" alt="ad-image">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${ad.title}"/></h5>
                    </div>
                    <div class="card-text">
                        <p><strong>Price: </strong><c:out value="${ad.price}"/></p>
                        <p><strong>Rarity: </strong><c:out value="${ad.rarity}"/></p>
                    </div>
                    <ul class="list-group list-group-flush">
                        <c:forEach var="category" items="${ad.categories}">
                            <li class="list-group-item"><c:out value="${category}"/></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
<script src="https://static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script></script>
<script src="../js/ads.js"></script>
</body>
</html>
