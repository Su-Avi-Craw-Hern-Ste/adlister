"use strict";

if ($("#rarity").val() === $("#common").val()) {
    $("#common").prop("checked", true);
}

if ($("#rarity").val() === $("#uncommon").val()) {
    $("#uncommon").prop("checked", true);
}

if ($("#rarity").val() === $("#rare").val()) {
    $("#rare").prop("checked", true);
}

if ($("#rarity").val() === $("#veryRare").val()) {
    $("#veryRare").prop("checked", true);
}

if ($("#rarity").val() === $("#legendary").val()) {
    $("#legendary").prop("checked", true);
}

if ($("#rarity").val() === $("#artifact").val()) {
    $("#artifact").prop("checked", true);
}



let categories = $("#categories").val().substring(1, $("#categories").val().length - 1).split(", ");
let categoriesArr = [$("#armor"), $("#weapons"), $("#animals"), $("#materials"), $("#consumables"), $("#tools"), $("#treasures"), $("#misc")];

// check what was the categories and check the categories
for (let category of categories) {
    for (let categoryList of categoriesArr) {
        if (category === categoryList.val()) {
            console.log(categoryList.val());
            categoryList.prop("checked", true);
        }
    }
}


$("#description").val($("#des").val());