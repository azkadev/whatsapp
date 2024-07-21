/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';

class WaBotApiScript {
  final String file_name;
  final String script;
  const WaBotApiScript({
    required this.file_name,
    required this.script,
  });
}

List<WaBotApiScript> waBotApiScripts = [
  WaBotApiScript(file_name: ".gitignore", script: r"""
*
!.gitignore
"""),
  WaBotApiScript(
    file_name: "package.json",
    script: json.encode(
      {
        "name": "whatsapp-bot-api",
        "version": "0.0.0",
        "description": "",
        "bin": "server.js",
        "main": "server.js",
        "scripts": {
          "test": "echo \"Error: no test specified\" && exit 1",
        },
        "keywords": [],
        "author": "",
        "license": "ISC",
        "dependencies": {
          "fastify": "^4.17.0",
          "galaxeus_lib": "^0.0.7",
          "glob": "^10.2.7",
          "node-fetch": "^2.6.0",
          "whatsapp_client": "^0.0.38",
        },
      },
    ),
  ),
  WaBotApiScript(
    file_name: "server.js",
    script: r"""
var { default: fastify } = require("fastify");
var { WhatsappClient, UpdateWa } = require("whatsapp_client");

var path = require('node:path');
var uri = require('node:url');
var fs = require("node:fs");
// var { default: fetch } = require("node-fetch");
var { glob } = require("glob");

var { Crypto } = require("galaxeus_lib");

var crypto = new Crypto({
    key: (process.env["whatsapp_client_crypto_key"] ?? "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb"),
});


async function main() {
    var args = new Args();
    console.log("init wa");

    var app_name = args.after("--app_name") ?? "Azkadev Whatsapp";
    var database_directory = args.after("--database_directory") ?? "./db_wa/";
    var host = args.after("--host") ?? "0.0.0.0";
    var port = args.after("--port") ?? 9990;

    if (!fs.existsSync(database_directory)) {
        fs.mkdirSync(database_directory);
    }


    var wa = new WhatsappClient({
        clientOption: {
            "app_name": app_name,
            "database_directory": path.join(database_directory, "client_0"),
            "database_key": "",
            "is_mobile_api": false,
            "print_qr_in_terminal": true,
            "is_skip_fetch_version": true,
        },
    });

    var app = fastify({
        "logger": false,
    });
    app.all("/", async function (req, res) {
        return res.send({
            "@type": "ok"
        });
    });

    app.all("/api", async function (req, res) {
        if (req.method.toLocaleLowerCase() != "post") {
            return res.status(400).send({
                "@type": "error"
            });
        }

        var query = req.query;
        var jsonData = {};

        try {
            jsonData = req.body;
        } catch (e) {
        }

        if (!jsonData) {
            return res.status(400).send({
                "@type": "error",
                "message": "data_must_be_json",
            });
        }

        try {

            var result_data = await handleUpdate({
                body: jsonData,
                query: query,
                wa: wa,
                database_directory: database_directory,
            });
            if (result_data) {
                if (result_data["@type"] == "error") {
                    return res.status(400).send(result_data);
                }
                return res.status(200).send(result_data);
            }
        } catch (e) {

            console.log(e);
            return res.status(500).send({
                "@type": "error",
                "message": "server_error_script"
            });
        }


        return res.status(404).send({
            "@type": "error",
            "message": "method_not_found"
        });


    });


    app.listen({
        "host": host,
        "port": port,
    });



    wa.on("update", async function (updateWa) {
        if (!updateWa.update_wa) {
            return;
        }
        if (!updateWa.update_wa.update) {
            return;
        }
        var update = updateWa.update_wa.update;
        if (!update) {
            return;
        }
        if (typeof update["@type"] != "string") {
            var events = update;
            if (events['creds.update']) {
            }
            if (events['connection.update']) {
                var update = events['connection.update'];
                var { connection, lastDisconnect, qr } = update;
                if (connection == "connecting") {

                    if (typeof updateWa.update_wa.waClient.count != "number") {
                        updateWa.update_wa.waClient.count = 0;
                    }
                    updateWa.update_wa.waClient.count += 1;

                    // console.log(JSON.stringify(updateWa.update_wa.waClient.msg_retry_count, null, 2));
                    return;
                }
            }

            // console.log(JSON.stringify(update, null, 2));
            return;
        }

        try {
            if (update["@type"] == "updateAuthorizationState") {

                if (update["authorization_state"]) {
                    if (update["authorization_state"]["@type"] == "authorizationStateReady") {
                        if (update["authorization_state"]["client"]) {
                            var path_data_db = path.join(database_directory, `${path.basename(updateWa.update_wa.client_option.database_directory)}_client.json`);
                            var waClientData = JSON.parse(fs.readFileSync(path_data_db, {
                                "encoding": "utf8"
                            }));

                            if (waClientData["url"]) {

                                var url_webhook = updateUrlQuery({
                                    url: waClientData["url"],
                                    query: {
                                        "client_user_id": update["authorization_state"]["client"]["id"],
                                    },
                                });
                                waClientData["url"] = url_webhook;
                                fs.writeFileSync(path_data_db, JSON.stringify(jsonDataClient, null, 2))
                            };

                        }
                    }
                }
            }
        } catch (e) {

        }

        try {

            var waClientData = JSON.parse(fs.readFileSync(path.join(database_directory, `${path.basename(updateWa.update_wa.client_option.database_directory)}_client.json`), {
                "encoding": "utf8"
            }));
            if (waClientData["url"]) {
 
                // encodeURI()
                await fetch((new uri.URL(waClientData["url"])).toString(), {
                    "method": "post",
                    "headers": {
                        "content-type": "application/json",
                        // "wa-client": getUrlQueryWa({
                        //     "url": waClientData["url"],
                        // }),
                    },
                    "body": JSON.stringify(update),
                });
            } else if (updateWa.update_wa.client_option.url_webhook) { 
                await fetch((new uri.URL(updateWa.update_wa.client_option.url_webhook)).toString(), {
                    "method": "post",
                    "headers": {
                        "content-type": "application/json",
                        // "wa-client": getUrlQueryWa({
                        //     "url": updateWa.update_wa.client_option.url_webhook
                        // }),
                    },
                    "body": JSON.stringify(update),
                });
            }
        } catch (e) {
            console.log(e);
        }



    });

    var files = await glob("*_client.json", {
        "cwd": database_directory,
        "nodir": true,
        "realpath": true,
    });
    for (var index = 0; index < files.length; index++) {
        var file_path = files[index];
        try {
            var res = JSON.parse(fs.readFileSync(path.join(database_directory, file_path), {
                "encoding": "utf8"
            }));

            await wa.initNewClient({
                clientOption: {
                    database_directory: path.join(database_directory, `${res["id"]}`),
                    database_key: res["key"],
                    "app_name": wa.whatsapp_client.client_option.app_name,
                    "print_qr_in_terminal": true,
                    "is_mobile_api": false,
                    "url_webhook": res["url"],
                }
            });
        } catch (e) {

        }
    }
}

async function handleUpdate({
    body = {
        "@type": ""
    },
    query = {

    },
    wa = new WhatsappClient(),
    database_directory = "",

}) {


    var method = body["@type"];
    var token = String(body["@token"]);
    var tokens = token.split(":");
    var waClientData = wa.getClient({
        id: function () {
            try {
                return tokens[0];
            } catch (e) {
                return "";

            }
        }(),
        key: function () {
            try {
                return tokens[1];
            } catch (e) {
                return "";

            }
        }(),
        is_from_client: false,
    });
    var waClient = waClientData["waClient"];

    if (RegExp("^(createClient)$", "i").test(method)) {
        if (typeof body["id"] != "string") {
            return {
                "@type": "error",
                "message": "id_must_format_string",
                "description": "Id must be string"
            };
        }
        if (!String(body["id"])) {
            return {
                "@type": "error",
                "message": "id_must_be_not_empty",
                "description": "Id must be not empty"
            };
        }
        if (!RegExp("^([a-z0-9_]+)$", "i").test(body["id"])) {
            return {
                "@type": "error",
                "message": "id_must_format_bad",
                "description": "Id Format must be [ a-z 0-9 _ ]"
            };
        }
        if (typeof body["url"] != "string") {
            return {
                "@type": "error",
                "message": "url_must_format_string",
                "description": "Url must be string"
            };
        }
        if (!String(body["url"])) {
            return {
                "@type": "error",
                "message": "url_must_be_not_empty",
                "description": "Url must be not empty"
            };
        }
        var id = String(body["id"]);
        var path_folder = path.join(database_directory, `${id}`);
        if (fs.existsSync(path_folder)) {
            return {
                "@type": "error",
                "description": "Please Create Other ID",
                "message": "client_exist",
            };
        }
        if (!fs.existsSync(database_directory)) {
            fs.mkdirSync(database_directory);
        }
        var url = String(body["url"]);
        var key = generateUuid();
        var new_token = `${id}:${key}`;
        var url_webhook = updateUrlQuery({
            url: url,
            query: {
                "client_token": new_token,
            },
        });
        var jsonData = {
            "@type": "clientData",
            "token": new_token,
            "url": url_webhook,
        };
        var jsonDataClient = {
            "id": id,
            "key": key,
            "token": new_token,
            "is_mobile_api": (body["is_mobile_api"] == true),
            "url": url_webhook,
        };
        fs.writeFileSync(path.join(database_directory, `${id}_client.json`), JSON.stringify(jsonDataClient, null, 2));
        wa.initNewClient({
            clientOption: {
                "app_name": wa.whatsapp_client.client_option.app_name,
                "database_directory": path_folder,
                "database_key": key,
                "print_qr_in_terminal": true,
                "is_mobile_api": (body["is_mobile_api"] == true),
                "url_webhook": url_webhook,
            }
        });
        return jsonData;
    }

    if (!token) {
        return {
            "@type": "error",
            "message": "token_must_be_not_empty"
        };
    }

    if (waClientData["@type"] == "error") {
        return waClientData;
    }
    if (RegExp("^(stopClient)$", "i").test(method)) {

        waClient.end();
        return {
            "@type": "ok",

        };
    }

    if (RegExp("^(getWebhook)$", "i").test(method)) {
        var waClientData = JSON.parse(fs.readFileSync(path.join(database_directory, `${path.basename(tokens[0])}_client.json`), {
            "encoding": "utf8",
        }));
        return {
            "@type": "waClientData",
            ...waClientData,
        };
    }

    if (RegExp("^(setWebhook)$", "i").test(method)) {
        if (typeof body["url"] != "string") {
            return {
                "@type": "error",
                "message": "url_must_format_string",
                "description": "Url must be string"
            };
        }

        if (!String(body["url"])) {
            return {
                "@type": "error",
                "message": "url_must_be_not_empty",
                "description": "Url must be not empty"
            };
        }

        var waClientData = JSON.parse(fs.readFileSync(path.join(database_directory, `${path.basename(tokens[0])}_client.json`), {
            "encoding": "utf8",
        }));
        waClientData["url"] = body["url"];
        fs.writeFileSync(path.join(database_directory, `${path.basename(tokens[0])}_client.json`), JSON.stringify(waClientData, null, 2));
        return {
            "@type": "ok",
        };
    }

    return await wa.invoke({
        method: method,
        parameters: body,
        waClient: waClient,
    });

}

function getUrlQueryWa({
    url = "",
    query = {

    }
}) { 
    try {

        return (new uri.URL(url)).searchParams.get("wa");
    } catch (e) {

    }
    return "";
}


function updateUrlQuery({
    url = "",
    query = {

    }
}) {
    var url_api = new URL(url);
    var search_params = new URLSearchParams(url_api.search);

    var wa_decrypt_json = {};
    try {

        var wa_old = (search_params.get("wa"));
        wa_decrypt_json = JSON.parse(crypto.decrypt({
            "data": wa_old,
        }));
    } catch (e) {

    }

    var wa_encrypt = crypto.encrypt({
        "data": JSON.stringify({
            ...wa_decrypt_json,
            ...query,
        }),
    });

    search_params.set("wa", wa_encrypt);
    // for (var key in query) {
    //     if (Object.hasOwnProperty.call(query, key)) {
    //         var element = query[key];
    //         search_params.set(key, element);
    //     }
    // }
    url_api.search = search_params.toString()
    return decodeURIComponent(url_api.toString());
}

function generateUuid() {
    var hex = "0123456789abcdefghijklmnopqrstuvwxyz_-";
    var model = "AAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    var str = "";
    var bools = [
        true,
        false,
    ];
    for (var i = 0; i < model.length; i++) {
        var rnd = Math.floor(Math.random() * hex.length);
        var result = model[i] == "x" ? hex[rnd] : model[i];
        if (bools[Math.floor(Math.random() * bools.length)]) {
            str += result.toUpperCase();
        } else {
            str += result;
        }

    }
    return str;
}



class Args {
    constructor(args) {
        var result_args = [...process.argv];
        result_args.shift();
        result_args.shift();
        if (args) {
            result_args = args;
        }
        this.args = result_args;
    }

    after(key) {
        if (typeof key == "string") {
            for (var index = 0; index < this.args.length; index++) {
                var element = this.args[index];
                if (element == key) {
                    try {
                        return this.args[index + 1];
                    } catch (e) {
                        return null;
                    }
                }
            }
            return null;
        } else if (typeof key == "object") {
            return null;
        } else {
            return null;
        }
    }


    constains(key) {
        if (typeof key == "string") {
            return this.args.includes(key);
        } else if (typeof key == "object") {
            for (var index = 0; index < key.length; index++) {
                var element = key[index];

                if (this.args.includes(element)) {
                    return true;
                }

            }
            return false;
        } else {
            return false;
        }
    }

}
main();
""",
  ),
];
