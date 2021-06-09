"use strict";


"use strict";

// click upload images
$(document).ready(() => {
    $("#images").click((e) => {
        e.preventDefault();
        uploadImages();
        console.log("uploading images");
    });
});

const client = filestack.init(fileStackToken);


function uploadImages() {
    const options = {
        accept: ["image/*"],
        onUploadDone: (response) => {
            console.log(response.filesUploaded[0].url);

            $("#hidden").val(response.filesUploaded[0].url);
            $(".fa-check").toggleClass("hidden");
        },
        onFileUploadFailed: (response) => {
            console.log(response);

        }
    }
    client.picker(options).open();

}