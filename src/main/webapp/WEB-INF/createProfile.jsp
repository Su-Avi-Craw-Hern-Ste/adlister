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
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Sign up" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<form action="action_page.php" style="border:1px solid #ccc">
    <div class="container">
        <h1>Create Profile</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <label for="money"><b>Money</b></label>
        <input type="number" id="money" placeholder="Enter Amount" name="money" required>

        <p>Select a Class</p>
        <div>
            <input type="radio" id="Healer" name="role" value="Healer" checked>
            <label for="Healer">Healer</label>
        </div>
        <div>
            <input type="radio" id="Assassin" name="role" value="Assassin" >
            <label for="Assassin"></label>
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

        <label for="img">Select image:</label>
        <input type="file" id="img" name="img" accept="image/*">

        <label for="phone"><b>Phone</b></label>
        <input type="tel" id="phone" placeholder="Enter Phone Number" name="phone"  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
        <small>Format: 123-456-7890</small>
        <button type="submit" class="registerbtn">Create Profile</button>
    </div>
    </div>
</form>

</body>
</html>
