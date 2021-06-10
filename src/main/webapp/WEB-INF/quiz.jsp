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
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Create profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/afterLoginNav.jsp" />
    <div class="container">
        <h1>Greetings, ${sessionScope.user.username}!</h1>
        <h3>We'd like to learn a little about you before you begin using FantasyLister&#8482;. For your time, you'll earn 2000 StarBucks!</h3>
        <h3>You may only take this quiz once!</h3>
        <hr>
        <input type="hidden" name="quiz-complete" value="false">
        <form action="/quiz" method="post">
            <div class="form-group">
                <p><em><strong>Have you been on an adventure before?</strong></em></p>
                <div>
                    <input type="radio" id="adventure-yes" name="adventure" value="yes">
                    <label for="adventure-yes">Of course I have!</label>
                    <input type="radio" id="adventure-no" name="adventure" value="no">
                    <label for="adventure-no">Sadly I have not...</label>
                </div>
                <hr>
                <p><em><strong>How long have you been an adventurer?</strong></em></p>
                <div>
                    <div>
                        <input type="radio" id="adv-time-novice" name="adv-time" value="novice">
                        <label for="adv-time-novice">Less than a year (Novice)</label>
                    </div>
                    <div>
                        <input type="radio" id="adv-time-apprentice" name="adv-time" value="apprentice">
                        <label for="adv-time-apprentice">One to three years (Apprentice)</label>
                    </div>
                    <div>
                        <input type="radio" id="adv-time-adept" name="adv-time" value="adept">
                        <label for="adv-time-adept">Three to seven years (Adept)</label>
                    </div>
                    <div>
                        <input type="radio" id="adv-time-expert" name="adv-time" value="expert">
                        <label for="adv-time-expert">Seven to twelve years (Expert)</label>
                    </div>
                    <div>
                        <input type="radio" id="adv-time-master" name="adv-time" value="master">
                        <label for="adv-time-master">Twelve years or more (Master)</label>
                    </div>
                    <div>
                        <input type="radio" id="adv-time-legend" name="adv-time" value="legend">
                        <label for="adv-time-legend">I've lost track of the time! (Legend)</label>
                    </div>
                </div>
                <hr>
                <p><em><strong>How many adventurers are in your group typically?</strong></em></p>
                <div>
                    <div>
                        <input type="radio" id="group-num1" name="adv-group" value="one">
                        <label for="group-num1">Lone wolf; I travel alone.</label>
                    </div>
                    <div>
                        <input type="radio" id="group-num2" name="adv-group" value="two">
                        <label for="group-num2">Just my best friend and I.</label>
                    </div>
                    <div>
                        <input type="radio" id="group-num3" name="adv-group" value="three">
                        <label for="group-num3">Three members is the ideal amount.</label>
                    </div>
                    <div>
                        <input type="radio" id="group-num4" name="adv-group" value="four">
                        <label for="group-num4">My pack is four and we are strong.</label>
                    </div>
                    <div>
                        <input type="radio" id="group-num4+" name="adv-group" value="four-plus">
                        <label for="group-num4+">My group knows no bounds! We are stronger in numbers!</label>
                    </div>
                </div>
                <hr>
                <p><em><strong>Describe your ideal adventure.</strong></em></p>
                <div>
                    <label>
                        <textarea name="ideal-adventure"></textarea>
                    </label>
                </div>
                <hr>
                <input type="hidden" name="user-money" value="${sessionScope.user.money}">
                <input type="hidden" name="quiz-complete" value="true">
                <input type="submit" class="btn btn-primary btn-block">
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="./js/js.js"></script>
</body>
</html>
