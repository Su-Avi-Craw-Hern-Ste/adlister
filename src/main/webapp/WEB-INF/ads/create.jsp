<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
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
                    <input class="form-check-input" type="radio" name="rarity" id="common">
                    <label class="form-check-label" for="common">
                        Common
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="uncommon">
                    <label class="form-check-label" for="uncommon">
                        Uncommon
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="rare">
                    <label class="form-check-label" for="rare">
                        Rare
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="veryRare">
                    <label class="form-check-label" for="veryRare">
                        Very Rare
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="legendary">
                    <label class="form-check-label" for="legendary">
                        Legendary
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="rarity" id="artifact">
                    <label class="form-check-label" for="artifact">
                        Artifact
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label>Categories</label>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="armor" id="armor" name="categories">
                    <label class="form-check-label" for="armor">
                        Armor
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="weapons" id="weapons" name="categories">
                    <label class="form-check-label" for="weapons">
                        Weapons
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="animals" id="animals" name="categories">
                    <label class="form-check-label" for="animals">
                        Animals
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="materials" id="materials" name="categories">
                    <label class="form-check-label" for="materials">
                        Materials
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="consumables" id="consumables" name="categories">
                    <label class="form-check-label" for="consumables">
                        Consumables
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="tools" id="tools" name="categories">
                    <label class="form-check-label" for="tools">
                        Tools
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="treasures" id="treasures" name="categories">
                    <label class="form-check-label" for="treasures">
                        Treasures
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="Misc" id="misc" name="categories">
                    <label class="form-check-label" for="misc">
                        Misc (anything not in above categories)
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="images">Upload images</label>
                <input type="file" id="images" name="images" accept="image/*" multiple>
            </div>

            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
