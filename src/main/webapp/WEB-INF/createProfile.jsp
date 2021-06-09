<%--
  Created by IntelliJ IDEA.
  User: emmanuelstephen
  Date: 6/4/21
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Create profile" />
    </jsp:include>
    <style >
        .hidden {
            visibility: hidden;
        }
        /*.visible {*/
        /*    visibility: visible;*/
        /*}*/
    </style>
</head>
<body>
<jsp:include page="partials/afterLoginNav.jsp" />
<form action="/profile/create" method="post" style="border:1px solid #ccc">
    <div class="container">
        <h1>Create Profile</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <p>Select a Character</p>
        <div>
            <input type="radio" id="Healer" name="role" value="Healer">
            <label for="Healer">Healer</label>
        </div>
        <div>
            <input type="radio" id="Assassin" name="role" value="Assassin" >
            <label for="Assassin">Assassin</label>

        </div>
        <div>
            <input type="radio" id="Fighter" name="role" value="Fighter" >
            <label for="Fighter">Fighter</label>
        </div>
        <div>
            <input type="radio" id="Hunter" name="role" value="Hunter" >
            <label for="Hunter">Hunter</label>
        </div>
        <div>
            <input type="radio" id="Mage" name="role" value="Mage" >
            <label for="Mage">Mage</label>
        </div>

        <div class="form-group">
            <button type="button" class="btn btn-primary" id="images">Upload images</button>
            <input type="hidden" name="image" id="hidden">
            <div id="imageUploadHint"><i class="fa fa-check hidden" style="color:green"></i></div>
        </div>

        <label for="phoneNumber"><b>Phone Number</b></label>
        <input type="tel" id="phoneNumber" placeholder="Enter Phone Number" name="phoneNumber"  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
        <small>Format: 123-456-7890</small>
        <button type="submit" class="btn">Complete</button>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../resources/js/keys.js"></script>
<script src="../resources/js/adsUploadImages.js"></script>
</body>
</html>
