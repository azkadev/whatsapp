var { default: makeWASocket, delay, DisconnectReason, fetchLatestBaileysVersion, makeCacheableSignalKeyStore, makeInMemoryStore, useMultiFileAuthState, PHONENUMBER_MCC } = require("@whiskeysockets/baileys");
var { default_data_client_option, default_data_update } = require("./default_data");
class UpdateWa {
    constructor({

        update = default_data_update,
        client_data = {
            "id": "",
            "key": "",
        },
        client_option = default_data_client_option,
        waClient = makeWASocket(),
    } = {}) {

        this.update_wa = {
            update: update,
            client_data: client_data,
            client_option: client_option,
            waClient: waClient,
        };
    }
}

module.exports = {
    UpdateWa,
};