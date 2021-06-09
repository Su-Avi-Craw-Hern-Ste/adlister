<%--
  Created by IntelliJ IDEA.
  User: alexhernando-avitia
  Date: 6/9/21
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quiz</title>
</head>
<body>
    <jsp:include page="partials/loginNavbar.jsp" />
    <div class="container">
        <h1>Greetings, ${sessionScope.user.username}!</h1>
        <h3>We'd like to learn a little about you before you begin using FantasyLister&#8482;. For your time, you'll earn StarBucks!</h3>
        <hr>

        <form action="/quiz" method="post">
            <div class="form-group">
                <p>Have you been on an adventure before?</p>
                <div>
                    <input type="radio" id="adventure-yes" name="adventure" value="yes">
                    <label for="adventure-yes">Of course I have!</label>
                    <input type="radio" id="adventure-no" name="adventure" value="no">
                    <label for="adventure-no">Sadly I have not...</label>
                </div>
                <hr>
                <p>How long have you been an adventurer?</p>
                <div>
                    <input type="radio" id="adv-time-novice" name="adv-time" value="novice">
                    <label for="adv-time-novice">Less than a year (Novice)</label>
                    <input type="radio" id="adv-time-apprentice" name="adv-time" value="apprentice">
                    <label for="adv-time-apprentice">One to three years (Apprentice)</label>
                    <input type="radio" id="adv-time-adept" name="adv-time" value="adept">
                    <label for="adv-time-adept">Three to seven years (Adept)</label>
                    <input type="radio" id="adv-time-expert" name="adv-time" value="expert">
                    <label for="adv-time-expert">Seven to twelve years (Expert)</label>
                </div>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>
</html>
