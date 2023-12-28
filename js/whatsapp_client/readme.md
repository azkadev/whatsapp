# Whatsapp Client

### Install library

```bash
npm i whatsapp_client
```

### Import library

```js
var { WhatsappClient } = require("whatsapp_client");
```

### Quickstart
```js
var { WhatsappClient, UpdateWa } = require("whatsapp_client");
var readline = require('readline');
var rl = readline.createInterface({ input: process.stdin, output: process.stdout });
async function question(text) {
   return new Promise(function (resolve) {
       rl.question(text, resolve);
   });
}

async function main() {
	var rl = readline.createInterface({ input: process.stdin, output: process.stdout });
	 async function question(text) {
		return new Promise(function (resolve) {
			rl.question(text, resolve);
		});
	}
    var wa = new WhatsappClient({
        clientOption: {
            "app_name": "Whatsapp Client",
            "database_directory": "./db/client_0",
            "database_key": "",
            "is_mobile_api": false,
            "print_qr_in_terminal": true,
        },
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
            }
            return;
        }

        if (update["@type"] == "updateAuthorizationState") {
            var authorization_state = update["authorization_state"];
            if (authorization_state) {
                if (authorization_state["@type"] == "authorizationStateWaitsScanQr") {
                    console.log("qr");
                    console.log(authorization_state);
                }
                if (authorization_state["@type"] == "authorizationStateWaitPhoneNumber") {
                    console.log("phone_number");
                    var res = await wa.invoke({
                        "method": "setAuthenticationPhoneNumber",
                        "parameters": {
                            "phone_number": await question('Please enter your mobile phone number: ')
                        },
                        waClient: updateWa.update_wa.waClient,
                    });
                    console.log(res);
                    return;
                }

                if (authorization_state["@type"] == "authorizationStateWaitCode") {
                    console.log("code");
                    var res = await wa.invoke({
                        "method": "checkAuthenticationCode",
                        "parameters": {
                            "code": await question('Please enter code: ')
                        },
                        waClient: updateWa.update_wa.waClient,
                    });
                    console.log(res);
                    return;
                }
            }
        }
        if (update["@type"] == "updateNewMessage" && update["message"]) {
            var msg = update["message"];
            var chat_id = msg["chat"]["id"];
            var text = msg["text"];
            console.log(update);
            try {
                if (text) {
                    if (RegExp("[/!\.]ping", "i").test(text)) {
                        await wa.invoke({
                            "method": "readMessage",
                            "parameters": {
                                "chat_id": chat_id,
                                "message_id": msg["id"],
                            },
                            waClient: updateWa.update_wa.waClient,
                        });
                        var res = await wa.invoke({
                            "method": "sendMessage",
                            "parameters": {
                                "chat_id": chat_id,
                                "text": `Pong`,
                            },
                            waClient: updateWa.update_wa.waClient,
                        });
                        console.log(JSON.stringify(res, null, 2));
                    }
                }
            } catch (e) {
                console.log(e);

                await wa.invoke({
                    "method": "sendMessage",
                    "parameters": {
                        "chat_id": chat_id,
                        "text": `Error: ${JSON.stringify(e)}`,
                    },
                    waClient: updateWa.update_wa.waClient,
                });
            }
        }
    });
    await wa.initClient();
}
main();
```