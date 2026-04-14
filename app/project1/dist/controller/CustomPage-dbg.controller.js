sap.ui.define([
    "sap/fe/core/PageController",
    "sap/m/MessageToast"
], function (PageController, MessageToast) {
    "use strict";

    return PageController.extend("project1.controller.CustomPage", {

        onInit: function () {
            PageController.prototype.onInit.apply(this, arguments);
        },

        onPress: () => {
            MessageToast.show("Button Clicked");
        }

    });
});