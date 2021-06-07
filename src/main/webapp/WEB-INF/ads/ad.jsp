<%--
  Created by IntelliJ IDEA.
  User: shan
  Date: 6/6/21
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="${ad.title}" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />


<div class="container">
    <h1><c:out value="${ad.title}" /></h1>
    <p><strong>Price: </strong><c:out value="${ad.price}" /></p>
    <p><strong>Rarity: </strong><c:out value="${ad.rarity}" /></p>
    <div>
        <strong>Categories: </strong>
        <ul>
            <c:forEach var="category" items="${ad.categories}">
                <li class="list-group-item"><c:out value="${category}" /></li>
            </c:forEach>
        </ul>
    </div>
    <p><strong>Description: </strong><c:out value="${ad.description}" /></p>
    <div>
        <c:forEach var="image" items="${images}">
            <img src="${image}" alt="ad-image">
        </c:forEach>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
