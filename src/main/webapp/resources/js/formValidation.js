"use strict";

$('#password').on ('input', function (e) {
    e.preventDefault();
    let i = 0;
    console.log(i);
    if ($('#confirm_password').val() === $('#password').val()) {
        console.log(i++);
        $('.fa-check').toggleClass('hidden', 'visible');
    }
});

console.log("test");