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

        <label for="image">Upload image:</label>
        <input type="file" id="image" name="image" accept="image/*">

        <label for="phoneNumber"><b>Phone Number</b></label>
        <input type="tel" id="phoneNumber" placeholder="Enter Phone Number" name="phoneNumber"  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
        <small>Format: 123-456-7890</small>
        <button type="submit" class="btn">Complete</button>
    </div>
</form>

</body>
</html>
