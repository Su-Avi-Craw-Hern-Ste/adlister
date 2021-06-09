"use strict";

$("#password-repeat").on ('input', function (e) {
    e.preventDefault();
    let i = 0;
    console.log(i);
    if ($('#password').val() === $('#password-repeat').val()) {
        console.log(i++);
        $('.fa-check').toggleClass('hidden', 'visible');
    }
});

console.log("test");