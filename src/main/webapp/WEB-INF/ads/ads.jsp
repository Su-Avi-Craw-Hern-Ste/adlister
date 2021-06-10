<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <style>

        html{
            background-color: #212121;
        }

        body {
            width: 100%;
            height: auto;
            font-family: Poppins;
            background-color: #ffffff;


        }

        h1 {
            color: #cccccc;
        }

        .shop{
            position:fixed;
            height:100vh;
            width:auto;
        }

        nav{
            width: 100vw;
            position: absolute;
            z-index: 1000;
        }



        .cat{
            position: fixed;
            right:40px;
            top: 275px;
            z-index: 99;
            width: 500px;
            height: auto;
            animation: bounce 1s infinite alternate;
            -webkit-animation: bounce 1s infinite alternate;
        }
        @keyframes bounce {
            from {
                transform: translateY(0px);
            }
            to {
                transform: translateY(-15px);
            }
        }
        @-webkit-keyframes bounce {
            from {
                transform: translateY(0px);
            }
            to {
                transform: translateY(-15px);
            }
        }

        .scroll{
            height: 100vh;
            max-height: 100%;
            overflow-y: auto !important;
            width: 100%;


        }

        .holder{
            height: 100vh;
            overflow: hidden;
            width: 100%;
        }




        .card-img-top{
            border-radius: 20px;

        }

        .row{
            flex-direction: column;
        }

        input {
            background-color: transparent;
            border-bottom: 1px solid floralwhite;
        }

        .form-control{
            border: 0;
            background-color: rgba(119, 119, 119, 0.1);
            backdrop-filter: blur(4px);
            padding:0;
            font-size: 4em;
            color: #f4f4f4;
        }

        search.form-control{
            color: white;
        }

        input:focus-visible{
            color: #f4f4f4;
        }



        .form-control:focus{
            background-color: transparent;
            border-color: transparent;
            box-shadow: transparent;
            color: white;
            border-bottom: 1px solid floralwhite;
        }
        .spacer3{
            height: 150px;
        }

        .card{
            opacity: 0.9;
            filter: drop-shadow(16px 16px 20px red) invert(95%);
            transition: all .2s ease-in-out;
            width: 75%;
            height: auto;


        }

        .card:hover{
            filter: drop-shadow(16px 16px 20px red) invert(100%);
            transform: scale(1.0);
        }

        .card-img-wrapper {
            display: flex;
            width: 100%;
            height: auto;
        }





    </style>
</head>
<body>

<jsp:include page="/WEB-INF/partials/adsNavbar.jsp"/>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp"/>
<img class="cat" src="<%=request.getContextPath()%>/img/local/NEKO.png" >
<img class="shop" src="<%=request.getContextPath()%>/img/local/NBM.png" >
<div class="spacer3"></div>


<div class="container">
    <form action="/ads" method="post">
        <div class="input-group">
            <input id="search" type="text" class="form-control" name="search" placeholder="NEKO'S BLACK MARKET">
            <span class="input-group-text"><button type="submit" class="btn btn-primary"><i
                    class="fa fa-search"></i></button></span>
        </div>
    </form>

    <div class="dropdown">
        <select id="filter" name="filter">
            <option class="dropdown-content" value="none">Filter By</option>
            <option class="dropdown-content" name="armor" value="Armor">Armor</option>
            <option class="dropdown-content" name="weapons" value="Weapons">Weapons</option>
            <option class="dropdown-content" name="animals" value="Animals">Animals</option>
            <option class="dropdown-content" name="materials" value="Materials">Materials</option>
            <option class="dropdown-content" name="consumables" value="Consumables">Consumables</option>
            <option class="dropdown-content" name="tools" value="Tools">Tools</option>
            <option class="dropdown-content" name="treasures" value="Treasures">Treasures</option>
            <option class="dropdown-content" name="misc" value="Misc (anything not in above categories)">Misc</option>
        </select>
    </div>

    <h1 id="main-header">Here Are all the ads!</h1>
    <div class="row">
        <c:forEach var="ad" items="${ads}">
            <a type="submit" href="<c:out value="ad?id=${ad.id}" />" role="button">
                <div class="col-md-3">
                    <div class="card">
                        <input type="hidden" name="id" value="${ad.id}">
                        <img src="<c:out value="${ad.images[0]}" />" class="card-img-top" alt="ad-image">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${ad.title}"/></h5>
                        </div>

                        <div class="card-text">
                            <p><strong>Price: </strong><c:out value="${ad.price}"/></p>
                            <p><strong>Rarity: </strong><c:out value="${ad.rarity}"/></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <c:forEach var="category" items="${ad.categories}">
                                <li class="list-group-item"><c:out value="${category}"/></li>
                            </c:forEach>
                        </ul>
                        <div class="card-text">
                            <a href="#" class="cart position-relative d-inline-flex">
                                <i class="fas fa fa-shopping-cart fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
            <div class="holder">
                <div class="scroll">
                    <div class="row row-cols-6 row-cols-sm-2 row-cols-md-3 g-3">
                        <c:forEach var="ad" items="${ads}">
                            <a type="submit" href="<c:out value="ad?id=${ad.id}" />" role="button">
                                <div class="col">
                                    <div class="card">
                                        <input type="hidden" name="id" value="${ad.id}">
                                        <img src="<c:out value="${ad.images[0]}" />" class="card-img-wrapper" alt="ad-image">
                                        <div class="card-body">
                                            <h5 class="card-title"><c:out value="${ad.title}"/></h5>
                                        </div>
                                        <div class="card-text">
                                            <p><strong>Price: </strong><c:out value="${ad.price}"/></p>
                                            <p><strong>Rarity: </strong><c:out value="${ad.rarity}"/></p>
                                        </div>
                                        <ul class="list-group list-group">
                                            <c:forEach var="category" items="${ad.categories}">
                                                <li class="list-group-item"><c:out value="${category}"/></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
<script src="https://static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script></script>
<script src="../js/ads.js"></script>
</body>
</html>