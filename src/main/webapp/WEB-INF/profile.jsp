<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/afterLoginNav.jsp" />

    <div class="container">
        <h1>Welcome, <c:out value="${sessionScope.user.username}"/>!</h1>

        <div class="table-responsive">
            <table class="table table-borderless">
                <tbody>
                <tr>
                    <th scope="row">Image</th>
                    <td><img src=<c:out value="${sessionScope.user.image}"/> alt="profile-image"></td>
                </tr>
                <tr>
                    <th scope="row">Username</th>
                    <td><c:out value="${sessionScope.user.username}"/></td>
                </tr>
                <tr>
                    <th scope="row">Email</th>
                    <td><c:out value="${sessionScope.user.email}"/></td>
                </tr>
                <tr>
                    <th scope="row">Money</th>
                    <td><c:out value="${sessionScope.user.money}"/></td>
                </tr>
                <tr>
                    <th scope="row">Role</th>
                    <td><c:out value="${sessionScope.user.role}"/></td>
                </tr>
                <tr>
                    <th scope="row">Phone number</th>
                    <td><c:out value="${sessionScope.user.phoneNumber}"/></td>
                </tr>
                </tbody>
            </table>
        </div>

        <a href="/ads/create" type="button" class="btn btn-primary">Create Ad</a>
        <a href="/profile/edit" type="button" class="btn btn-primary">Edit Profile</a>
        <a href="/quiz" type="button" class="btn btn-primary">Take a quiz, earn StarBucks!</a>

        <h2>Here are the ads <c:out value="${sessionScope.user.username}"/> has posted:</h2>
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <c:forEach var="ad" items="${ads}">
                <div class="col">
                    <div class="card">
                        <img src="<c:out value="${ad.images[0]}" />" class="card-img-top" alt="ad-image">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${ad.title}" /></h5>
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
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
        $(".card").click((e) => {
            e.preventDefault();
            // go to /ad/adId page to view the details of the clicked ad

        })
    </script>
</body>
</html>
