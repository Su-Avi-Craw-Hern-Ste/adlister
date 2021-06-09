<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/loginNavbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form class="needs-validation" action="/register" method="post">
            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <input id="username" name="username" class="form-control" type="text" required>
                <div class="invalid-feedback">
                    Enter a valid username (Less than 20 characters)
                </div>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="email">
                <div class="invalid-feedback">
                    Enter a valid email (i.e. yourname@gmail.com)
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
                <div class="invalid-feedback">
                    Enter a valid password (Must contain )
                </div>
            </div>

            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                <p>${confirmPass}</p>
            </div>

            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>

    <div id="canv" width="32" height="32">

    </div>

    <script src="./js/js.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>
