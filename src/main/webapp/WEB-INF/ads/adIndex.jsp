<%--
  Created by IntelliJ IDEA.
  User: shan
  Date: 6/9/21
  Time: 7:05 PM
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
<jsp:include page="/WEB-INF/partials/afterLoginNav.jsp" />

<div class="container">
  <h1><c:out value="${ad.title}" /></h1>
  <input type="hidden" id="usernameLogin" value="<c:out value="${user.username}" />">
  <p id="username"><c:out value="${user.username}" /></p>
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
    <c:forEach var="image" items="${ad.images}">
      <img src="${image}" alt="ad-image">
    </c:forEach>
  </div>
</div>


<form action="/ads/edit" method="post">
  <button type="submit">Edit</button>
</form>

<form action="/ads/delete" method="post">
  <input type="hidden" name="ad_id" value="${ad.id}">
  <button type="submit">Delete</button>
</form>

<a href="${pageContext.request.contextPath}/profile">Back to profile</a>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../../resources/js/deleteAd.js"></script>
</body>
</html>
