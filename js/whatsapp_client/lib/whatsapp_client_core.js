var { Boom } = require('@hapi/boom');
var parsePhoneNumber = require('libphonenumber-js');
var NodeCache = require('node-cache');
var { default: P } = require('pino');
var EventEmitter = require('events');
var path = require('node:path');

var QRCode = require('qrcode');
var { default: makeWASocket, delay, DisconnectReason, fetchLatestBaileysVersion, makeCacheableSignalKeyStore, makeInMemoryStore, useMultiFileAuthState, PHONENUMBER_MCC } = require("@whiskeysockets/baileys");
var { UpdateWa } = require("./whatsapp_client_update");
var { default_data_client_option, default_data_update } = require("./default_data");
var fs = require("node:fs");


BigInt.prototype.toJSON = function () {
	return this.toString();
};

class WhatsappClient {
	constructor({
		clientOption = default_data_client_option,

		eventEmitter = new EventEmitter(),
		whatsapp_clients = {
			// "test": {
			// 	"key": "",
			// 	"waClient": makeWASocket(),
			// },
		},
	} = {
			clientOption: default_data_client_option,
			eventEmitter: new EventEmitter(),
			whatsapp_clients: {},
		},
	) {
		this.whatsapp_client = {
			// option: option,
			client_option: clientOption,
			event_emitter: eventEmitter,
		};

		this.whatsapp_clients = whatsapp_clients;
	}


	on(type_update = "update", callback = async function (update = new UpdateWa({

	})) {
	}) {
		return this.whatsapp_client.event_emitter.on(type_update, async function (data) {
			if (data) {
				try {
					if (!data.update_wa) {
						return;
					}
					await callback(data);
				} catch (e) {

				}
			}
		});
	}


	emit(type_update = "update", data) {
		return this.whatsapp_client.event_emitter.emit(type_update, data);
	}


	async initClient() {

		return await this.initNewClient({
			clientOption: this.whatsapp_client.client_option,
		});

	}

	async initNewClient({
		clientOption = default_data_client_option,
	} = {
			clientOption: default_data_client_option,
		}) {

		var logger = P({
			level: "fatal",
		});

		var msgRetryCounterCache = new NodeCache();
		var store = makeInMemoryStore({ logger });
		store.readFromFile(`${clientOption.database_directory}.json`);
		setInterval(() => {
			store.writeToFile(`${clientOption.database_directory}.json`);
		}, 10_000);

		return await this.startSock({
			logger: logger,
			msgRetryCounterCache: msgRetryCounterCache,
			store: store,
			clientOption: clientOption,
		});
	}


	async startSock({
		logger = P({
			level: "fatal",
		}),
		msgRetryCounterCache = new NodeCache(),
		store = makeInMemoryStore({
			logger: P({
				level: "fatal",
			})
		}),
		clientOption = default_data_client_option,
	}) {
		var whatsapp_client = this;
		var { state, saveCreds } = await useMultiFileAuthState(`${clientOption.database_directory}_data`);
		var baileys_version = await async function () {
			try {
				if (clientOption["is_skip_fetch_version"] != true) {
					return await fetchLatestBaileysVersion();
				}
			} catch (e) {

			}
			return {
			};
		}();
		var { version, isLatest } = baileys_version;
		var newCLientOption = {

		};

		if (version) {
			newCLientOption["version"] = version;
		}


		var sock = makeWASocket({
			...newCLientOption,
			logger: logger,

			printQRInTerminal: clientOption.print_qr_in_terminal,
			mobile: clientOption.is_mobile_api,
			auth: {
				creds: state.creds,
				keys: makeCacheableSignalKeyStore(state.keys, logger),
			},
			msgRetryCounterCache: msgRetryCounterCache,
			generateHighQualityLinkPreview: true,
			browser: [clientOption.app_name, "MacOS", "3.0",],


			getMessage: async function (key) {
				if (store) {
					var msg = await store.loadMessage(key.remoteJid ?? "", key.id ?? "");
					return msg?.message || undefined;
				}
				return {
					conversation: 'hello'
				};
			},
		});
		var directory_name = path.basename(clientOption.database_directory);
		whatsapp_client.whatsapp_clients[directory_name] = {
			"key": clientOption.database_key,
			"waClient": sock,
		};

		sock.invoke = this.whatsapp_client.request;
		sock.request = this.whatsapp_client.request;
		store.bind(sock.ev);
		if (!clientOption.is_mobile_api) {
			sock.multi = true;
		}
		if (clientOption.is_mobile_api && !sock.authState.creds.registered) {
			whatsapp_client.emit("update", new UpdateWa({
				update: {
					"@type": "updateAuthorizationState",
					"authorization_state": {
						"@type": "authorizationStateWaitPhoneNumber"
					}
				},
				client_data: {
					"id": directory_name,
					"key": clientOption.database_key,
				},
				client_option: clientOption,
				waClient: sock,
			}));
		}


		sock.ev.process(async function (events) {
			if (events['connection.update']) {
				var update = events['connection.update'];
				var { connection, lastDisconnect, qr } = update;
				if (connection === 'close') {

					if (lastDisconnect.error && lastDisconnect.error.output && lastDisconnect.error.output.payload) {

						if (lastDisconnect.error.output.payload.error == "Unauthorized") {
							delete whatsapp_client.whatsapp_clients[directory_name];
							sock.end();

							var files = [
								path.join(clientOption.database_directory.replace(RegExp(`${directory_name}`), ""), `${directory_name}_data`),
								path.join(clientOption.database_directory.replace(RegExp(`${directory_name}`), ""), `${directory_name}_client.json`),
								path.join(clientOption.database_directory.replace(RegExp(`${directory_name}`), ""), `${directory_name}.json`),
							];
							for (let index = 0; index < files.length; index++) {
								var file = files[index];
								if (fs.existsSync(file)) {
									fs.rmSync(file, {
										"force": true,
										"recursive": true,
									});
								}

							}

							return null;
						}


					}

					if (lastDisconnect.error?.output?.statusCode !== DisconnectReason.loggedOut) {
						await whatsapp_client.startSock({
							logger: logger,
							msgRetryCounterCache: msgRetryCounterCache,
							store: store,
							clientOption: clientOption,
						});
					} else {
						await whatsapp_client.startSock({
							logger: logger,
							msgRetryCounterCache: msgRetryCounterCache,
							store: store,
							clientOption: clientOption,
						});
					}
					return;
				}


				if (qr) {
					if (clientOption.print_qr_in_terminal) {

						QRCode.toString(qr, { type: 'terminal', "small": true }, function (err, url) {
							console.log(url)
						});
					}
					whatsapp_client.emit("update", new UpdateWa({
						update: {
							"@type": "updateAuthorizationState",
							"authorization_state": {
								"@type": "authorizationStateWaitScanQr",
								"qr": qr
							}
						},
						client_data: {
							"id": directory_name,
							"key": clientOption.database_key,
						},
						client_option: clientOption,
						waClient: sock,
					}));
				}

				whatsapp_client.emit("update", new UpdateWa({
					update: events,
					client_data: {
						"id": directory_name,
						"key": clientOption.database_key,
					},
					client_option: clientOption,
					waClient: sock,
				}));
			} else if (events['creds.update']) {
				await saveCreds();

				var cred_update = events['creds.update'];
				if (cred_update.me) {

					var client_me_data = { ...cred_update.me };

					try {
						client_me_data.id = whatsapp_client.toIdNumber(client_me_data.id);
					} catch (e) {

					}
					whatsapp_client.emit("update", new UpdateWa({
						update: {
							"@type": "updateAuthorizationState",
							"authorization_state": {
								"@type": "authorizationStateReady",
								"client": {
									"@type": "clientData",
									...client_me_data,
								}
							}
						},
						client_data: {
							"id": directory_name,
							"key": clientOption.database_key,
						},
						client_option: clientOption,
						waClient: sock,
					}));

				}


				whatsapp_client.emit("update", new UpdateWa({
					update: events,
					client_data: {
						"id": directory_name,
						"key": clientOption.database_key,
					},
					client_option: clientOption,
					waClient: sock,
				}));
			} else if (events['messages.upsert']) {
				var m = events['messages.upsert'];
				async function runMsg(message) {
					var update_raw = await whatsapp_client.serialize(message, sock);

					whatsapp_client.emit("update", new UpdateWa({
						update: update_raw,
						client_data: {
							"id": directory_name,
							"key": clientOption.database_key,
						},
						client_option: clientOption,
						waClient: sock,
					}));

				}
				for (var index = 0; index < m.messages.length; index++) {
					var message = m.messages[index];
					try {
						await runMsg(message);
					} catch (e) {
						console.log(e);
					}
				}
			} else {

				whatsapp_client.emit("update", new UpdateWa({
					update: events,
					client_data: {
						"id": directory_name,
						"key": clientOption.database_key,
					},
					client_option: clientOption,
					waClient: sock,
				}));
			}
		});
		return sock;
	}


	async serialize(msg = {}, waClient = makeWASocket()) {
		// console.log(msg);
		// var waClient = sock;
		var new_scheme_data = {
			"@type": "message",
			"id": "",
			"from": {
				"id": 0,
				"first_name": "",
				"last_name": "",
				"type": "private"
			},
			"chat": {
				"id": 0,
				"first_name": "",
				"last_name": "",
				"title": ""
			},
			"is_group": false,
			"is_outgoing": false,
			"date": 0,
		};
		// if (msg["key"]) {
		//     new_scheme_data["key"] = msg["key"];
		// } else {
		//     delete new_scheme_data["key"];
		// }
		try {
			new_scheme_data["is_group"] = msg.key.remoteJid.endsWith('@g.us');
		} catch (e) {

		}
		try {
			const berak = Object.keys(msg.message)[0];
			new_scheme_data["type"] = berak;
		} catch (e) {
		}
		if (new_scheme_data["is_group"]) {
			new_scheme_data["from"]["id"] = this.toIdNumber(msg["key"]["participant"]);
		} else {
			new_scheme_data["from"]["id"] = this.toIdNumber(msg.key.remoteJid);
		}
		if (msg.key.fromMe) {
			new_scheme_data["from"] = await this.invoke({
				method: "getMe",
				waClient: waClient,
			});
			new_scheme_data["from"]["id"] = this.toIdNumber(waClient.user.id);

		}
		if (msg["pushName"] && typeof msg["pushName"] == "string") {
			new_scheme_data["from"]["first_name"] = msg["pushName"];
			if (new_scheme_data["is_group"] == false) {
				new_scheme_data["chat"]["first_name"] = msg["pushName"];
			}
		}
		new_scheme_data["chat"]["id"] = this.toIdNumber(msg.key.remoteJid);

		if (new_scheme_data["is_group"]) {
			new_scheme_data["chat"]["type"] = "group";
		} else {
			new_scheme_data["chat"]["type"] = "private";
		}
		new_scheme_data["id"] = msg["key"]["id"];

		new_scheme_data["date"] = (typeof msg.messageTimestamp == "number") ? msg.messageTimestamp : 0;

		if (new_scheme_data["date"] == 0) {
			try {
				new_scheme_data["date"] = Number(msg.messageTimestamp);
			} catch (e) {
			}
		}
		new_scheme_data["is_outgoing"] = msg.key.fromMe;

		if (new_scheme_data["is_group"] == true) {
			// console.log(msg.key.remoteJid);
			// console.log(this.toIdString(new_scheme_data["chat"]["id"]));
			// console.log(msg.key.remoteJid == this.toIdString(new_scheme_data["chat"]["id"]));

			try {
				var chat_data = await waClient.groupMetadata(this.toIdString(new_scheme_data["chat"]["id"]));

				new_scheme_data["chat"]["title"] = chat_data["subject"];
				new_scheme_data["chat"]["owner_user_id"] = this.toIdNumber(chat_data["owner"]);
				new_scheme_data["chat"]["description"] = chat_data["desc"];
				new_scheme_data["chat"]["is_channel"] = chat_data["announce"];
				new_scheme_data["chat"]["is_restrict"] = chat_data["restrict"];
				new_scheme_data["chat"]["is_admin"] = false;
				if (new_scheme_data["chat"]["is_channel"] == true) {
					new_scheme_data["chat"]["type"] = "channel";
				}

				try {
					for (var index = 0; index < chat_data["participants"].length; index++) {
						var participant = chat_data["participants"][index];
						if (participant["id"] != waClient.user.id.split(':')[0] + '@s.whatsapp.net') {
							continue;
						}
						if (RegExp("admin", "i").test(participant["admin"])) {
							new_scheme_data["chat"]["is_admin"] = true;
							new_scheme_data["chat"]["is_restrict"] = false;
						}
					}
				} catch (e) {

				}
			} catch (e) {
			}
		}
		if (new_scheme_data["is_group"] == true) {
			delete new_scheme_data["chat"]["first_name"];
			delete new_scheme_data["chat"]["last_name"];
			delete new_scheme_data["from"]["last_name"];
		} else {
			delete new_scheme_data["chat"]["title"];
			delete new_scheme_data["chat"]["last_name"];
			delete new_scheme_data["from"]["last_name"];
		}

		if (msg["message"] && typeof msg["message"] == "object") {
			// get text from user 
			if (typeof msg["message"]["conversation"] == "string" && msg["message"]["conversation"]) {
				new_scheme_data["text"] = msg["message"]["conversation"];
			}

			// get text from me
			if (msg["message"]["extendedTextMessage"] && typeof msg["message"]["extendedTextMessage"] == "object") {
				if (typeof msg["message"]["extendedTextMessage"]["text"] == "string" && msg["message"]["extendedTextMessage"]["text"]) {
					new_scheme_data["text"] = msg["message"]["extendedTextMessage"]["text"];
				}
			}

			if (msg["message"]["imageMessage"] && typeof msg["message"]["imageMessage"] == "object") {

				if (typeof msg["message"]["imageMessage"]["caption"] == "string" && msg["message"]["imageMessage"]["caption"]) {
					new_scheme_data["caption"] = msg["message"]["imageMessage"]["caption"];
					delete msg["message"]["imageMessage"]["caption"];
				}
				new_scheme_data["photo"] = msg["message"]["imageMessage"];

			}
			if (msg["message"]["videoMessage"] && typeof msg["message"]["videoMessage"] == "object") {

				if (typeof msg["message"]["videoMessage"]["caption"] == "string" && msg["message"]["videoMessage"]["caption"]) {
					new_scheme_data["caption"] = msg["message"]["videoMessage"]["caption"];
					delete msg["message"]["videoMessage"]["caption"];
				}
				new_scheme_data["video"] = msg["message"]["videoMessage"];

			}
			if (msg["message"]["pollCreationMessage"] && typeof msg["message"]["pollCreationMessage"] == "object") {
				new_scheme_data["poll"] = msg["message"]["pollCreationMessage"];
			}
			if (msg["message"]["documentMessage"] && typeof msg["message"]["documentMessage"] == "object") {
				new_scheme_data["document"] = msg["message"]["documentMessage"];
			}
			if (msg["message"]["audioMessage"] && typeof msg["message"]["audioMessage"] == "object") {
				new_scheme_data["audio"] = msg["message"]["audioMessage"];
			}
			if (msg["message"]["stickerMessage"] && typeof msg["message"]["stickerMessage"] == "object") {
				new_scheme_data["sticker"] = msg["message"]["stickerMessage"];
			}
			if (msg["message"]["contactMessage"] && typeof msg["message"]["contactMessage"] == "object") {
				new_scheme_data["contact"] = msg["message"]["contactMessage"];
			}
			if (msg["message"]["liveLocationMessage"] && typeof msg["message"]["liveLocationMessage"] == "object") {
				if (typeof msg["message"]["liveLocationMessage"]["caption"] == "string" && msg["message"]["liveLocationMessage"]["caption"]) {
					new_scheme_data["caption"] = msg["message"]["liveLocationMessage"]["caption"];
					delete msg["message"]["liveLocationMessage"]["caption"];
				}
				new_scheme_data["location_live"] = msg["message"]["liveLocationMessage"];
			}
			if (msg["message"]["locationMessage"] && typeof msg["message"]["locationMessage"] == "object") {
				if (typeof msg["message"]["locationMessage"]["caption"] == "string" && msg["message"]["locationMessage"]["caption"]) {
					new_scheme_data["caption"] = msg["message"]["locationMessage"]["caption"];
					delete msg["message"]["locationMessage"]["caption"];
				}
				new_scheme_data["location"] = msg["message"]["locationMessage"];
			}

		}

		// new_scheme_data["isBaileys"] = msg.key.id.startsWith('BAE5') || msg.key.id.startsWith('3EB0');

		try {
			var message_context = msg.message;
			for (var root_key in message_context) {
				if (Object.hasOwnProperty.call(message_context, root_key)) {
					var root_message = message_context[root_key];
					for (var key in root_message) {
						if (Object.hasOwnProperty.call(root_message, key)) {
							var element = root_message[key];
							try {
								if (key == "contextInfo") {

									if (typeof element["forwardingScore"] == "number") {
										new_scheme_data["forward_count"] = element["forwardingScore"];
									}

									if (element["isForwarded"] == true) {
										new_scheme_data["is_forward"] = true;
									}

									if (typeof element["forwardedNewsletterMessageInfo"] == "object") {

										if (element["forwardedNewsletterMessageInfo"]["newsletterJid"]) {

											new_scheme_data["forward_from_chat"] = {
												"id": this.toIdNumber(element["forwardedNewsletterMessageInfo"]["newsletterJid"]),
												"type": "channel",
											};
										}
									}

									if (!element["participant"]) {
										continue;
									}

									// new_scheme_data["reply_to_message"] = await this.serialize(element, waClient);
									new_scheme_data["reply_to_message"] = {
										"id": "",
										"from": new_scheme_data["from"],
										"chat": new_scheme_data["chat"],

										"is_group": false,
										"is_outgoing": false,
										"date": 0,
									};

									new_scheme_data["reply_to_message"]["from"]["id"] = this.toIdNumber(element["participant"]);
									try {
										new_scheme_data["reply_to_message"]["is_outgoing"] = element["participant"] === waClient.user.id.split(':')[0] + '@s.whatsapp.net' ? true : false;
									} catch (e) {

									}
									if (element["quotedMessage"] && typeof element["quotedMessage"] == "object") {
										if (element["quotedMessage"]["conversation"] && typeof element["quotedMessage"]["conversation"] == "string") {

											new_scheme_data["reply_to_message"]["text"] = element["quotedMessage"]["conversation"];
										}
									}

									if (element["ephemeralSettingTimestamp"]) {
										new_scheme_data["reply_to_message"]["date"] = Number(element["ephemeralSettingTimestamp"]);
									}

									new_scheme_data["reply_to_message"]["id"] = element["stanzaId"];

									if (element["quotedMessage"]) {
										if (element["quotedMessage"]["conversation"] && typeof element["quotedMessage"]["conversation"] == "string") {
											new_scheme_data["reply_to_message"]["text"] = element["quotedMessage"]["conversation"];
										}



										// get text from me
										if (element["quotedMessage"]["extendedTextMessage"] && typeof element["quotedMessage"]["extendedTextMessage"] == "object") {
											if (typeof element["quotedMessage"]["extendedTextMessage"]["text"] == "string" && element["quotedMessage"]["extendedTextMessage"]["text"]) {
												new_scheme_data["reply_to_message"]["text"] = element["quotedMessage"]["extendedTextMessage"]["text"];
											}
										}

										if (element["quotedMessage"]["imageMessage"] && typeof element["quotedMessage"]["imageMessage"] == "object") {

											if (typeof element["quotedMessage"]["imageMessage"]["caption"] == "string" && element["quotedMessage"]["imageMessage"]["caption"]) {
												new_scheme_data["reply_to_message"]["caption"] = element["quotedMessage"]["imageMessage"]["caption"];
												delete element["quotedMessage"]["imageMessage"]["caption"];
											}
											new_scheme_data["reply_to_message"]["photo"] = element["quotedMessage"]["imageMessage"];

										}
										if (element["quotedMessage"]["videoMessage"] && typeof element["quotedMessage"]["videoMessage"] == "object") {

											if (typeof element["quotedMessage"]["videoMessage"]["caption"] == "string" && element["quotedMessage"]["videoMessage"]["caption"]) {
												new_scheme_data["reply_to_message"]["caption"] = element["quotedMessage"]["videoMessage"]["caption"];
												delete element["quotedMessage"]["videoMessage"]["caption"];
											}
											new_scheme_data["reply_to_message"]["video"] = element["quotedMessage"]["videoMessage"];

										}
										if (element["quotedMessage"]["pollCreationMessage"] && typeof element["quotedMessage"]["pollCreationMessage"] == "object") {
											new_scheme_data["reply_to_message"]["poll"] = element["quotedMessage"]["pollCreationMessage"];
										}
										if (element["quotedMessage"]["documentMessage"] && typeof element["quotedMessage"]["documentMessage"] == "object") {
											new_scheme_data["reply_to_message"]["document"] = element["quotedMessage"]["documentMessage"];
										}
										if (element["quotedMessage"]["audioMessage"] && typeof element["quotedMessage"]["audioMessage"] == "object") {
											new_scheme_data["reply_to_message"]["audio"] = element["quotedMessage"]["audioMessage"];
										}
										if (element["quotedMessage"]["stickerMessage"] && typeof element["quotedMessage"]["stickerMessage"] == "object") {
											new_scheme_data["reply_to_message"]["sticker"] = element["quotedMessage"]["stickerMessage"];
										}
										if (element["quotedMessage"]["contactMessage"] && typeof element["quotedMessage"]["contactMessage"] == "object") {
											new_scheme_data["reply_to_message"]["contact"] = element["quotedMessage"]["contactMessage"];
										}
										if (element["quotedMessage"]["liveLocationMessage"] && typeof element["quotedMessage"]["liveLocationMessage"] == "object") {
											if (typeof element["quotedMessage"]["liveLocationMessage"]["caption"] == "string" && element["quotedMessage"]["liveLocationMessage"]["caption"]) {
												new_scheme_data["reply_to_message"]["caption"] = element["quotedMessage"]["liveLocationMessage"]["caption"];
												delete element["quotedMessage"]["liveLocationMessage"]["caption"];
											}
											new_scheme_data["reply_to_message"]["location_live"] = element["quotedMessage"]["liveLocationMessage"];
										}
										if (element["quotedMessage"]["locationMessage"] && typeof element["quotedMessage"]["locationMessage"] == "object") {
											if (typeof element["quotedMessage"]["locationMessage"]["caption"] == "string" && element["quotedMessage"]["locationMessage"]["caption"]) {
												new_scheme_data["reply_to_message"]["caption"] = element["quotedMessage"]["locationMessage"]["caption"];
												delete element["quotedMessage"]["locationMessage"]["caption"];
											}
											new_scheme_data["reply_to_message"]["location"] = element["quotedMessage"]["locationMessage"];
										}
									}

								}
							} catch (e) {

								console.log(JSON.stringify(e, null, 2));
							}
						}
					}
				}
			}
		} catch (e) {
		}


		return {
			"@type": "updateNewMessage",
			"message": new_scheme_data
		};
	}



	reply_markup(data_keyboard) {

		try {
			var keyboards = [];
			if (typeof data_keyboard == "object") {
				if (typeof data_keyboard["inline_keyboard"] == "object") {
					var inline_keyboard = data_keyboard["inline_keyboard"];
					for (var i = 0; i < inline_keyboard.length; i++) {
						var loop_data = inline_keyboard[i];
						if (typeof loop_data == "object") {
							var keyboard_index = (i == 0) ? 1 : (i + 1);
							if (loop_data.length == 1) {
								var json_data = {
									"index": keyboard_index
								};

								if (typeof loop_data[0]["text"] != "string") {
									throw {
										"status_code": 400,
										"status_bool": false,
										"message": "parameters text keyboard harus string"
									};
								}
								if (!loop_data[0]["text"]) {
									throw {
										"status_code": 400,
										"status_bool": false,
										"message": "tolong isi textnya juga dong"
									};
								}
								var json_data_keyboard = {};
								json_data_keyboard["displayText"] = String(loop_data[0]["text"]);
								if (loop_data[0]["url"]) {
									json_data_keyboard["url"] = String(loop_data[0]["url"]);
									json_data["urlButton"] = json_data_keyboard;
								} else if (loop_data[0]["callback_data"]) {
									json_data_keyboard["id"] = 'id-like-buttons-message';
									json_data["quickReplyButton"] = json_data_keyboard;
								} else if (loop_data[0]["phone_number"]) {
									json_data_keyboard["phoneNumber"] = String(loop_data[0]["phone_number"]);
									json_data["callButton"] = json_data_keyboard;
								}
								keyboards.push(json_data);
							} else if (loop_data.length > 1) {
								for (var ii = 0; ii < loop_data.length; ii++) {
									var loop_dataa = loop_data[ii];
									if (typeof loop_dataa == "object") {
										var json_data = {
											"index": keyboard_index
										};

										if (typeof loop_dataa["text"] != "string") {
											throw {
												"status_code": 400,
												"status_bool": false,
												"message": "parameters text keyboard harus string"
											};
										}
										if (!loop_dataa["text"]) {
											throw {
												"status_code": 400,
												"status_bool": false,
												"message": "tolong isi textnya juga dong"
											};
										}
										var json_data_keyboard = {};
										json_data_keyboard["displayText"] = String(loop_dataa["text"]);
										if (loop_dataa["url"]) {
											json_data_keyboard["url"] = String(loop_dataa["url"]);
											json_data["urlButton"] = json_data_keyboard;
										} else if (loop_dataa["callback_data"]) {
											json_data_keyboard["id"] = 'id-like-buttons-message';
											json_data["quickReplyButton"] = json_data_keyboard;
										} else if (loop_dataa["phone_number"]) {
											json_data_keyboard["phoneNumber"] = String(loop_dataa["phone_number"]);
											json_data["callButton"] = json_data_keyboard;
										}
										keyboards.push(json_data);
									}
								}
							}
						}
					}
					return keyboards;
				}
				return undefined;
			} else {
				return undefined;
			}
		} catch (e) {
			return undefined;
		}
	}

	getClient({
		id = "",
		key = "",
		is_from_client = false,
	} = {
			"id": "",
			"key": "",
			"is_from_client": false,
		}) {
		var result = this.whatsapp_clients[id];
		if (result) {
			result["@type"] = "client";
			if (is_from_client) {
				return result;
			}
			if (result["key"] == key) {
				return result;
			} else {
				return {
					"@type": "error",
					"message": "not same"
				};
			}
		}
		return {
			"@type": "error",
			"message": "not_signed"
		};

	}

	async invokeByWaClientData({
		method = "",
		parameters = {},
		waClientData = {
			"id": "",
			"key": "",
		},
	} = {
			method: "",
			parameters: "",
		}
	) {

		var data_client = this.getClient({
			"id": waClientData.id,
			"key": waClientData.key,
		});

		if (data_client["@type"] == "error") {

			return data_client;
		}
		var waClient = data_client["waClient"];
		return await this.invoke({
			method: method,
			parameters: parameters,
			waClient: waClient,
		});
	}


	async invokeRaw({
		method = "",
		parameters = {},
		waClient = makeWASocket(),
	} = {
			method: "",
			parameters: "",
		}) {
		if (typeof parameters != "object") {
			parameters = {};
		}
		if (RegExp("^(setAuthenticationPhoneNumber)$", "i").test(method)) {

			if (typeof parameters["phone_number"] != "string") {
				return {
					"message": "parameters phone_number harus string!"
				};
			}
			if (!parameters["phone_number"]) {
				return {
					"message": "parameters phone_number harus isi!"
				};
			}
			var phoneNumber = parsePhoneNumber(parameters["phone_number"]);
			if (!phoneNumber?.isValid()) {
				return {
					"@type": "error",
					"message": "invalid_phone_number"
				};
			}

			var { registration } = waClient.authState.creds || { registration: {} };

			registration.phoneNumber = phoneNumber.format('E.164');
			registration.phoneNumberCountryCode = phoneNumber.countryCallingCode;
			registration.phoneNumberNationalNumber = phoneNumber.nationalNumber;
			var mcc = PHONENUMBER_MCC[phoneNumber.countryCallingCode];
			if (!mcc) {
				return new Error('Could not find MCC for phone number: ' + registration.phoneNumber + '\nPlease specify the MCC manually.');
			}
			registration.phoneNumberMobileCountryCode = mcc;
			registration.method = "sms";
			try {
				await waClient.requestRegistrationCode(registration);
				// await onUpdate({
				// 	"@type": "updateAuthorizationState",
				// 	"authorization_state": {
				// 		"@type": "authorizationStateWaitCode",
				// 		"phone_number": parameters["phone_number"]
				// 	}
				// }, whatsapp_client.invoke, sock,);
				return {
					"@type": "ok"
				};
			} catch (error) {
				var jsonData = {
					"@type": "error"
				};

				try {
					for (var key in error) {
						if (Object.hasOwnProperty.call(error, key)) {
							var element = error[key];
							jsonData[String(key)] = element;
						}
					}
				} catch (e) {

				}
				return jsonData;
			}

		}
		if (RegExp("^(checkAuthenticationCode)$", "i").test(method)) {

			if (typeof parameters["code"] != "string") {
				return {
					"message": "parameters code harus string!"
				};
			}
			if (!parameters["code"]) {
				return {
					"message": "parameters code harus isi!"
				};
			}

			try {
				var response = await waClient.register(parameters["code"], '').trim().toLowerCase();
				await onUpdate({
					"@type": "updateAuthorizationState",
					"authorization_state": {
						"@type": "authorizationStateReady",
					}
				}, request, sock,);
				console.log(response);
				return {
					"@type": "ok"
				};
			} catch (error) {

				await onUpdate({
					"@type": "updateAuthorizationState",
					"authorization_state": {
						"@type": "authorizationStateWaitPhoneNumber"
					}
				}, whatsapp_client.invoke, sock);

				var jsonData = {
					"@type": "error"
				};

				try {
					for (var key in error) {
						if (Object.hasOwnProperty.call(error, key)) {
							var element = error[key];
							jsonData[String(key)] = element;
						}
					}
				} catch (e) {

				}
				return jsonData;
			}
		}
		if (RegExp("^(updateName)$", "i").test(method)) {
			if (typeof parameters["full_name"] != "string") {
				return {
					"message": "parameters full_name harus string!"
				};
			}
			if (!parameters["full_name"]) {
				return {
					"message": "parameters full_name harus isi!"
				};
			}

			return await waClient.updateProfileName(parameters["full_name"]);
		}
		if (RegExp("^(updateBio)$", "i").test(method)) {
			if (typeof parameters["bio"] != "string") {
				return {
					"message": "parameters bio harus string!"
				};
			}
			if (!parameters["bio"]) {
				return {
					"message": "parameters bio harus isi!"
				};
			}

			return await waClient.updateProfileStatus(parameters["bio"]);
		}
		if (RegExp("^(updateProfilePicture)$", "i").test(method)) {
			if (typeof parameters["bio"] != "string") {
				return {
					"message": "parameters bio harus string!"
				};
			}
			if (!parameters["bio"]) {
				return {
					"message": "parameters bio harus isi!"
				};
			}

			return await waClient.profilePictureUrl(parameters["bio"]);
		}
		if (RegExp("^(blockUser)$", "i").test(method)) {
			if (typeof parameters["user_id"] != "string") {
				return {
					"message": "parameters user_id harus string!"
				};
			}
			if (!parameters["user_id"]) {
				return {
					"message": "parameters user_id harus isi!"
				};
			}

			return await waClient.updateBlockStatus(this.toIdString(parameters["user_id"]), "block");
		}
		if (RegExp("^(unBlockUser)$", "i").test(method)) {
			if (typeof parameters["user_id"] != "string") {
				return {
					"message": "parameters user_id harus string!"
				};
			}
			if (!parameters["user_id"]) {
				return {
					"message": "parameters user_id harus isi!"
				};
			}

			return await waClient.updateBlockStatus(this.toIdString(parameters["user_id"]), "unblock");
		}

		if (RegExp("^(banChatMember)$", "i").test(method)) {
			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}
			if (typeof parameters["user_id"] != "string") {
				return {
					"message": "parameters user_id harus string!"
				};
			}
			if (!parameters["user_id"]) {
				return {
					"message": "parameters user_id harus isi!"
				};
			}

			return await waClient.groupParticipantsUpdate(
				this.toIdString(parameters["chat_id"]),
				[user_id],
				"remove",
			);
		}


		if (RegExp("^(leaveChat)$", "i").test(method)) {
			if (typeof parameters["chat_id"] != "string") {
				return {
					"message": "parameters chat_id harus string!"
				};
			}
			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}

			return await waClient.groupLeave(this.toIdString(parameters["chat_id"]),);
		}

		if (RegExp("^(addChatMember)$", "i").test(method)) {
			if (typeof parameters["chat_id"] != "string") {
				return {
					"message": "parameters chat_id harus string!"
				};
			}
			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}
			if (typeof parameters["user_id"] != "string") {
				return {
					"message": "parameters user_id harus string!"
				};
			}
			if (!parameters["user_id"]) {
				return {
					"message": "parameters user_id harus isi!"
				};
			}

			return await waClient.groupParticipantsUpdate(
				this.toIdString(parameters["chat_id"]),
				[user_id],
				"add",
			);
		}


		if (RegExp("^(deleteMessage)$", "i").test(method)) {
			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}
			if (!parameters["user_id"]) {
				return {
					"message": "parameters user_id harus isi!"
				};
			}

			if (typeof parameters["is_outgoing"] != "boolean") {
				parameters["is_outgoing"] = false;
			}
			if (typeof parameters["message_id"] != "string") {
				return {
					"message": "parameters message_id harus string!"
				};
			}
			if (!parameters["message_id"]) {
				return {
					"message": "parameters message_id harus isi!"
				};
			}

			return await waClient.sendMessage(this.toIdString(parameters["chat_id"]), {
				delete: {
					"remoteJid": this.toIdString(parameters["chat_id"]),
					"participant": this.toIdString(parameters["user_id"]),
					"fromMe": parameters["is_outgoing"],
					"id": parameters["message_id"],
				}
			});

		}
		if (RegExp("^(readMessage)$", "i").test(method)) { 
			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}


			if (typeof parameters["message_id"] != "string") {
				return {
					"message": "parameters message_id harus string!"
				};
			}
			if (!parameters["message_id"]) {
				return {
					"message": "parameters message_id harus isi!"
				};
			}
			var msg_parameters = {

			}; 

			return await waClient.readMessages([{
				...msg_parameters,
				"remoteJid": this.toIdString(parameters["chat_id"]),
				// "participant": this.toIdString(parameters["user_id"]),
				"fromMe": false,
				"id": parameters["message_id"],
			}]);

		}



		if (RegExp("^(joinChatByInviteLink)$", "i").test(method)) {
			if (typeof parameters["invite_link"] != "string") {
				return {
					"message": "parameters invite_link harus string!"
				};
			}
			if (!parameters["invite_link"]) {
				return {
					"message": "parameters invite_link harus isi!"
				};
			}
			return await waClient.groupAcceptInvite(parameters["invite_link"]);
		}

		if (RegExp("^(getMe)$", "i").test(method)) {
			var jsonData = {
				"@type": "user",
			};
			for (var key in waClient.user) {
				if (Object.hasOwnProperty.call(waClient.user, key)) {
					var element = waClient.user[key];
					if (key == "name") {

						jsonData["first_name"] = element
					} else {
						jsonData[key.toString()] = element
					}
				}
			}
			jsonData["type"] = "private";
			jsonData["id"] = this.toIdNumber(jsonData["id"]);
			return jsonData;
		}
		if (RegExp("^(getSupergroup)$", "i").test(method)) {
			if (typeof parameters["supergroup_id"] != "string") {
				return {
					"message": "parameters supergroup_id harus string!"
				};
			}
			if (!parameters["supergroup_id"]) {
				return {
					"message": "parameters supergroup_id harus isi!"
				};
			}
			return await waClient.groupMetadata(parameters["supergroup_id"]);
		}
		
		if (RegExp("^(getChat)$", "i").test(method)) {
			if (!parameters["chat_id"]) {
				return {
					"@type": "error",
				};
			}
			var jsonData = {
				"@type": "chat",
				"id": this.toIdNumber(parameters["chat_id"]),
			};
			if (jsonData["id"] < 0) {
				jsonData["title"] = "";
				jsonData["type"] = "group";
				try {
					var chat_data = await waClient.groupMetadata(this.toIdString(jsonData["id"]));
					jsonData["title"] = chat_data["subject"];
					jsonData["owner_user_id"] = this.toIdNumber(chat_data["owner"]);
					jsonData["description"] = chat_data["desc"];
					jsonData["is_channel"] = chat_data["announce"];
					jsonData["is_restrict"] = chat_data["restrict"];
					jsonData["is_admin"] = false;
					if (jsonData["is_channel"] == true) {
						jsonData["type"] = "channel";
					}
					try {
						for (var index = 0; index < chat_data["participants"].length; index++) {
							var participant = chat_data["participants"][index];
							if (participant["id"] != waClient.user.id.split(':')[0] + '@s.whatsapp.net') {
								continue;
							}
							if (RegExp("admin", "i").test(participant["admin"])) {
								jsonData["is_admin"] = true;
								jsonData["is_restrict"] = false;
							}
						}
					} catch (e) {

					}
				} catch (e) {
				}

			} else {
				jsonData["first_name"] = "";
				jsonData["last_name"] = "";
				jsonData["type"] = "private";
			}
			return jsonData;
		}

		if (RegExp("^(getChatByInviteLink)$", "i").test(method)) {
			return await waClient.groupGetInviteInfo(parameters["invite_link"]);
		}
		if (RegExp("^(sendMessage|sendPhoto|sendVideo|sendAudio|sendContact|sendLocation|sendMessageRaw)$", "i").test(method)) {

			if (!parameters["chat_id"]) {
				return {
					"message": "parameters chat_id harus isi!"
				};
			}
			if (typeof parameters["reply_markup"] == "object") {
				parameters["templateButtons"] = reply_markup(parameters["reply_markup"]);
				delete parameters["reply_markup"];
			}
			if (RegExp("^sendMessageRaw$", "i").test(method)) {

				await waClient.presenceSubscribe(this.toIdString(parameters["chat_id"]));
				await delay(500);
				await waClient.sendPresenceUpdate('composing', this.toIdString(parameters["chat_id"]));
				await delay(2000);
				await waClient.sendPresenceUpdate('paused', this.toIdString(parameters["chat_id"]));

				var result = (await waClient.sendMessage(this.toIdString(parameters["chat_id"]), {
					...parameters
				})).toJSON();

				var jsonData = await this.serialize(result, waClient);

				return jsonData["message"];
			}

			if (RegExp("^sendMessage$", "i").test(method)) {
				if (typeof parameters["text"] != "string") {
					return {
						"message": "parameters text harus isi!"
					};
				}
				if (!parameters["text"]) {
					return {
						"message": "parameters text harus isi!"
					};
				}


				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});

			}

			if (RegExp("^sendPhoto$", "i").test(method)) {
				if (typeof parameters["photo"] != "string") {
					return {
						"message": "Tolong parameters photo harus string"
					};
				}
				if (!parameters["photo"]) {
					return {
						"message": "parameters photo harus isi"
					};
				}
				parameters["image"] = {
					"url": parameters["photo"]
				};
				delete parameters["photo"];


				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});

			}

			if (RegExp("^sendVideo$", "i").test(method)) {
				if (typeof parameters["video"] != "string") {
					return {
						"message": "params is bad"
					};
				}
				if (!parameters["video"]) {
					return {
						"message": "params is bad"
					};
				}
				parameters["video"] = parameters["video"];
				delete parameters["video"];


				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});

			}

			if (RegExp("^sendAudio$", "i").test(method)) {
				if (typeof parameters["audio"] != "string") {
					return {
						"message": "params is bad"
					};
				}
				if (!parameters["audio"]) {
					return {
						"message": "params is bad"
					};
				}
				parameters["audio"] = {
					"url": parameters["audio"],
					"mimetype": "audio/mp3"
				};
				delete parameters["audio"];


				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});
			}

			if (RegExp("^sendContact$", "i").test(method)) {
				parameters["contact"] = {
					"displayName": parameters["name"],
					"contacts": parameters["contacts"]
				};


				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});
			}
			if (RegExp("^sendLocation$", "i").test(method)) {
				parameters["location"] = {
					"degreesLatitude": parameters["latitude"],
					"degreesLongitude": parameters["longitude"]
				};

				return await this.invoke({
					"method": "sendMessageRaw",
					"parameters": parameters,
					"waClient": waClient,
				});
			}

		}

		return {
			"message": `Method not found: ${method}`
		};

	}


	async invoke({
		method = "",
		parameters = {},
		waClient = makeWASocket(),
	} = {

		}) {
		var res = await this.invokeRaw({
			method: method,
			parameters: parameters,
			waClient: waClient,

		});


		if (res){

			return res;
		}

		return {
			"@type": "ok"
		};
	}


	toIdString(data) {
		try {
			if (typeof data == "object") {
				var new_data = data["id"];
				data["id"] = this.toIdString(new_data);
				return data;
			}

			if (data < 0) {
				var res = `${data}@g.us`.replace(RegExp("-100", "i"), "");
				return res;
			} else if (data > 0) {
				return `${data}@s.whatsapp.net`;
			}
		} catch (e) {

		}
		return data;
	}

	toIdNumber(data) {
		try {
			if (typeof data == "object") {
				var new_data = data["id"];
				data["id"] = this.toIdNumber(new_data);

				return data;

			}

			if (typeof data == "string") {
				var new_data = data;
				if (RegExp("@newsletter", "i").test(new_data)) {
					var res = BigInt(`${String(`${data}`).replace(RegExp("(@.*)", "i"), "")}`);
					return res;
					// return Number(String(new_data).replace(RegExp("((:([0-9]+)?)?@.*)", "i"), ""));
				}

				if (RegExp("@g", "i").test(new_data)) {
					var res = BigInt(`-100${String(`${data}`).replace(RegExp("((:([0-9]+)?)?@.*)", "i"), "")}`);
					return res;
					return data;
				}

				return (String(new_data).replace(RegExp("((:([0-9]+)?)?@.*)", "i"), ""));
				// return Number(String(new_data).replace(RegExp("((:([0-9]+)?)?@.*)", "i"), ""));
			}
		} catch (e) {

		}
		return data;
	}


}

module.exports = {
	WhatsappClient
};