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

        <h2>Here are the ads <c:out value="${sessionScope.user.username}"/> has posted:</h2>
        <div class="row row-cols-1 row-cols-md-2 g-4">
            <div class="col">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${ad.title}" /></h5>
                        <d class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</d>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

</body>
</html>
