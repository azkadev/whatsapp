var { WhatsappClient } = require("./whatsapp_client_core");

var { UpdateWa } = require("./whatsapp_client_update");
var { default_data_client_option, default_data_update } = require("./default_data");

module.exports = {
    WhatsappClient, UpdateWa,

    default_data_client_option,
    default_data_update,
};