<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/afterLoginNav.jsp" />

    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input id="price" name="price" class="form-control" type="number">
            </div>
            <div class="form-group">
                <label>Rarity</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="common" value="Common">
                    <label class="form-check-label" for="common">
                        Common
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="uncommon" value="Uncommon">
                    <label class="form-check-label" for="uncommon">
                        Uncommon
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="rare" value="Rare">
                    <label class="form-check-label" for="rare">
                        Rare
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="veryRare" value="Very Rare">
                    <label class="form-check-label" for="veryRare">
                        Very Rare
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="legendary" value="Legendary">
                    <label class="form-check-label" for="legendary">
                        Legendary
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="artifact" value="Artifact">
                    <label class="form-check-label" for="artifact">
                        Artifact
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>Categories</label>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Armor" id="armor" name="categories">
                    <label class="form-check-label" for="armor">
                        Armor
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Weapons" id="weapons" name="categories">
                    <label class="form-check-label" for="weapons">
                        Weapons
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Animals" id="animals" name="categories">
                    <label class="form-check-label" for="animals">
                        Animals
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Materials" id="materials" name="categories">
                    <label class="form-check-label" for="materials">
                        Materials
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Consumables" id="consumables" name="categories">
                    <label class="form-check-label" for="consumables">
                        Consumables
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Tools" id="tools" name="categories">
                    <label class="form-check-label" for="tools">
                        Tools
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Treasures" id="treasures" name="categories">
                    <label class="form-check-label" for="treasures">
                        Treasures
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Misc(anything not in above categories)" id="misc" name="categories">
                    <label class="form-check-label" for="misc">
                        Misc(anything not in above categories)
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <button type="button" class="btn btn-primary" id="images">Upload images</button>
                <input type="text" id="hidden">
            </div>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="https://static.filestackapi.com/filestack-js/3.x.x/filestack.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="../../resources/js/keys.js"></script>
<script src="../../resources/js/ads.js"></script>
</body>
</html>
