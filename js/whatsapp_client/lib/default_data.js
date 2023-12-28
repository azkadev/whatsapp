
var default_data_client_option = {
    "app_name": "Azkadev Whatsapp Client",
    "database_directory": "",
    "database_key": "",
    "print_qr_in_terminal": true,
    "is_mobile_api": false,
    "url_webhook": false,
    "is_skip_fetch_version": true,
};

var default_data_update = {
    "@type": "update",
    "authorization_state": {
        "@type": "",
    },
    "message": {
        "id": "",
        "from": {
            "id": "",
            "first_name": "",
            "last_name": "",
            "type": "private"
        },
        "chat": {
            "id": "",
            "first_name": "",
            "last_name": "",
            "title": ""
        },
        "is_group": false,
        "is_outgoing": false,
        "date": 0,
        "caption": "",
        "text": "",
    }
};






module.exports = {
    default_data_client_option,
    default_data_update,
};