
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
        html {
            background-color: #221a28;
            height:100%;
            overflow-x: hidden;
        }

        * {
            margin: 0;
            padding: 0;
        }
        body, html {
            height:100%;
            font-family:  'Poppins', sans-serif;
        }


        canvas {
            position:absolute;
            height:100%;
            width:100%;
        }

        .main-container {
            margin: 4em ;
            width: 100vw;
        }

        .main-container  .coverflow-container{
            width: 100vw;
        }

        .main-container .controls {
            margin: 0 auto;
            padding: 2em 0 0 0;
            text-align: center;
        }
        .coverflow-container {
            -webkit-box-reflect: below 1px linear-gradient(transparent, rgba(0, 0, 0, .1));
        }
        label {
            color: #999;
            display: inline-block;
            padding: 10px;
            border: 1px solid black;
            cursor: pointer;
            background: #252525;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.9);
        }
        label:hover {
            color: #FFF;
        }
        .coverflow-list {
            width: 100%;
        }
        .coverflow-list .coverflow-item {
            display: inline-block;
            /*background: #414141;*/
            margin-left: -20px;
            margin-bottom:250px ;
            position: relative;
            box-shadow: 0px 4px 0px 0px rgba(0, 0, 0, 0.4);
        }

        /*DROP DOWN CARD INFO*/
        .coverflow-list .coverflow-item .album-cover {
            display: block;
            height: 150px;
            margin: 0;


        }



        .coverflow-list .coverflow-item .album-cover img {
            height: 335px;
            width: 310px;
            opacity: 1;
            border-radius: 5px;
        }
        .coverflow-list .coverflow-item .album-name {
            text-align: center;
            display: block;
            color: #444;
            border-radius: 5px;
        }
        .coverflow-list .coverflow-item label {
            padding: 0;
            border: none;
            display: block;
            text-shadow: none;
        }


        .coverflow-list {
            -webkit-transform: perspective(950px);
            -webkit-transform-style: preserve-3d;
            -webkit-perspective-origin: 100% 30%;
        }
        .coverflow-list .coverflow-item {
            -webkit-transition: all 0.4s ease;
            background: #212121;
            -webkit-transform: rotateY(45deg);
            border-radius: 5px;
        }
        input[type="radio"] {
            display: none;
        }
        input[type="radio"]:checked + .coverflow-item {
            -webkit-transform: rotateY(0deg);
            transform: scale(1.2);
            margin: 0 auto;
            background: #313131;
            transition: all 1.0s ease-in-out;
        }
        input[type="radio"]:checked + .coverflow-item img {
            opacity: 1;
        }
        input[type="radio"]:checked + .coverflow-item figcaption {
            color: #FFFFFF;
        }
        input[type="radio"]:checked + .coverflow-item ~ .coverflow-item {
            -webkit-transform: rotateY(-45deg);
            background: #515151;
        }

        .spacer{
            height: 275px;
            background-color: transparent;
        }

        .spacerTop{
            height: 220px;
        }

        label{
            background-color: #2f3542;
            border-radius: 10px;
            filter: drop-shadow(0 6mm 4mm rgba(24, 12, 28, 0.5));

        }

        input{

        }

        input#phoneNumber{
            background-color: transparent;
            border-bottom: 1px solid floralwhite;
        }

        input {
            all: unset;
            background-color: transparent;
            border-bottom: 1px solid floralwhite;
        }


        h1{
            position: absolute;
            top: 40px;
            left: 40px;
            z-index: 99;
            color: #f4f4f4;
            font-family: 'Poppins', sans-serif;
            font-size: 80px;
            filter: drop-shadow(0 6mm 4mm rgba(24, 12, 28, 0.5));

        }

        .slide-in-blurred-right , h1 {-webkit-animation:slide-in-blurred-right .8s cubic-bezier(.55,.085,.68,.53) both;animation:slide-in-blurred-right .8s cubic-bezier(.55,.085,.68,.53) both}


        /* ----------------------------------------------
         * Generated by Animista on 2021-6-9 14:49:32
         * Licensed under FreeBSD License.
         * See http://animista.net/license for more info.
         * w: http://animista.net, t: @cssanimista
         * ---------------------------------------------- */

        @-webkit-keyframes slide-in-blurred-right{0%{-webkit-transform:translateX(1000px) scaleX(2.5) scaleY(.2);transform:translateX(1000px) scaleX(2.5) scaleY(.2);-webkit-transform-origin:0 50%;transform-origin:0 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}@keyframes slide-in-blurred-right{0%{-webkit-transform:translateX(1000px) scaleX(2.5) scaleY(.2);transform:translateX(1000px) scaleX(2.5) scaleY(.2);-webkit-transform-origin:0 50%;transform-origin:0 50%;-webkit-filter:blur(40px);filter:blur(40px);opacity:0}100%{-webkit-transform:translateX(0) scaleY(1) scaleX(1);transform:translateX(0) scaleY(1) scaleX(1);-webkit-transform-origin:50% 50%;transform-origin:50% 50%;-webkit-filter:blur(0);filter:blur(0);opacity:1}}





        form {
            background-color: transparent;
            position: absolute;
            z-index: 1;



        }
    </style>

</head>
<body>
<jsp:include page="partials/afterLoginNav.jsp" />
<h1>    CHARACTER SELECT </h1>

<form action="/profile/create" method="post" style="border:0px solid #ccc">

    <div class="spacerTop"></div>

    <div class="main-container">
        <div class="coverflow-container">
            <ol class="coverflow-list">
                <input type="radio" id="Healer" name="role" value="Healer">
                <li class="coverflow-item">
                    <label for="Healer">
                        <div class="album-cover">
                            <img src="../img/local/HEALER.png" height="50%" width="50%"/></div>
                    </label>
                </li>

                <input type="radio" id="Assassin" name="role" value="Assassin">
                <li class="coverflow-item">
                    <label for="Assassin">
                        <div class="album-cover">
                            <img src="../img/local/ASSASIN.png" height="50%" width="50%"/>
                        </div>
                    </label>
                </li>

                <input type="radio" id="Fighter" name="role" value="Fighter">
                <li class="coverflow-item">
                    <label for="Fighter">
                        <div class="album-cover">
                            <img src="../img/local/FIGHTER.png" height="50%" width="50%"/>
                        </div>
                    </label>
                </li>

                <input type="radio" id="Hunter" name="role" value="Hunter">
                <li class="coverflow-item">
                    <label for="Hunter">
                        <div class="album-cover">
                            <img src="../img/local/HUNTER.png" height="50%" width="50%"/>
                        </div>
                    </label>
                </li>

                <input type="radio" id="Mage" name="role" value="Mage">
                <li class="coverflow-item">
                    <label for="Mage">
                        <div class="album-cover">
                            <img src="../img/local/MAGE.png" height="50%" width="50%"/>
                        </div>
                    </label>
                </li>
            </ol>


            <div class="spacer"></div>

            <label for="image">Upload image:</label>
            <input type="file" id="image" name="image" accept="image/*">

            <label for="phoneNumber"><b>Phone Number</b></label>
            <input type="tel" id="phoneNumber" placeholder="Enter Phone Number" name="phoneNumber"  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" required>
            <small>Format: 123-456-7890</small>
            <button type="submit" class="btn">Complete</button>
        </div>
    </div>
</form>


<canvas id="canv" width="32" height="32">

</canvas>
<script defer src="../resources/js/js.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../resources/js/keys.js"></script>
<script src="../resources/js/adsUploadImages.js"></script>
</body>
</html>