"use strict";

$(document).ready(() => {
    let username = $("#username").text();
    let userLogin = $("#usernameLogin").val();
    if (username === userLogin) {
        $(".form").toggleClass("hidden")
    }
});