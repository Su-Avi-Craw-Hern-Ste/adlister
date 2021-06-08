"use strict";


// $(document).ready(() => {
    // click upload images,
    $("#images").click((e) => {
        e.preventDefault();
        uploadImages();
        console.log("uploading images");
    });
// });


// const apiKey = fileStackToken;
const client = filestack.init("AOdETeOJaQ1em9xVAb3zRz");


function uploadImages() {
    const options = {
        accept: ["image/*"],
    }
    client.picker(options).open();

}