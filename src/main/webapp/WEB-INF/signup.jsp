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
        <h1>Sign Up</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>

        <label for="username"><b>Username</b></label>
        <input type="text" id="username" placeholder="Enter Username" name="username" required>

        <label for="email"><b>Email</b></label>
        <input type="text" id="email" placeholder="Enter Email" name="email" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" id="psw" placeholder="Enter Password" name="psw" required>

        <label for="money"><b>Money</b></label>
        <input type="number" id="money" placeholder="Enter Amount" name="money" required>

        <p>Select a Class</p>
        <div>
            <input type="radio" id="Healer" name="class" value="Healer" checked>
            <label for="Healer">Healer</label>
        </div>
        <div>
            <input type="radio" id="Assassin" name="class" value="Assassin" checked>
            <label for="Assassin"></label>
        </div>
        <div>
            <input type="radio" id="Fighter" name="class" value="Fighter" checked>
            <label for="Fighter">Fighter</label>
        </div>
        <div>
            <input type="radio" id="Hunter" name="class" value="Hunter" checked>
            <label for="Hunter">Hunter</label>
        </div>
        <div>
            <input type="radio" id="Mage" name="class" value="Mage" checked>
            <label for="Mage">Mage</label>
        </div>

        <label for="img">Select image:</label>
        <input type="file" id="img" name="img" accept="image/*">

        <label for="phone"><b>Phone</b></label>
        <input type="tel" id="phone" placeholder="Enter Phone Number" name="phone"  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
        <small>Format: 123-456-7890</small>
        <button type="submit" class="registerbtn">Register</button>
    </div>
    </div>
</form>

</body>
</html>
