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
        maxFiles: 10,
        onUploadDone: (response) => {
            console.log(response);
             $("#hidden").val(response.filesUploaded[0].url);
            console.log($("#hidden").val());
        },
        onFileUploadFailed: (response) => {
            console.log(response);

        }
    }
    client.picker(options).open();

}
