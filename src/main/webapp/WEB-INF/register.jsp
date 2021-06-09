<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>

    <style>
        .hidden {
            visibility: hidden;
        }
        .visible {
            visibility: visible;
        }
    </style>

</head>
<body>
    <jsp:include page="partials/loginNavbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
                <p style="word: red">${usernameError}</p>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="email">
                <p>${emailError}</p>
            </div>
<%--                first password--%>
            <div class="form-group">
                <div class="d-flex justify-content-between">
                    <div class="password_repeat_label">
                        <label class="font-weight-bold" for="password-repeat">Enter your password</label>
                    </div>
                    <p>${passwordError}</p>
                </div>
                <input type="password" class="form-control" id="password">
<%--                    confirmed password--%>
            <div class="form-group">
                <div class="d-flex justify-content-between">
                    <div class="password_repeat_label">
                        <label class="font-weight-bold" for="password-repeat">Confirm your password</label>
                    </div>
                    <div id="password-repeat-hint"><i class="fa fa-check hidden" style="color:green"></i></div>
                </div>
                <input type="password" class="form-control" id="password-repeat">
                <p>${confirmPass}</p>
            </div>
                <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
    <div id="canv" width="32" height="32">

    </div>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="./js/js.js"></script>
    <script src="./resources/js/formValidation.js"></script>
</body>
</html>
