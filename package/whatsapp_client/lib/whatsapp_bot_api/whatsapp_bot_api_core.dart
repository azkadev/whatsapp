// ignore_for_file: empty_catches

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
// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

// import '';
import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:server_universe/native/native.dart';
import 'package:whatsapp_client/scheme/scheme.dart';
import 'package:whatsapp_client/whatsapp_bot_api/whatsapp_bot_api_update.dart';

class WhatsAppBotApi {
  bool is_invoke_throw_on_error = true;

  late String token_bot;
  ServerUniverseNative? serverUniverseNative;
  bool is_init_server = false;
  Uri whatsapp_url_webhook = Uri.parse("http://0.0.0.0:8080/wa/webhook");
  Crypto whats_app_crypto = Crypto(key: "");
  Client http_client = Client();

  EventEmitter event_emitter = EventEmitter();
  List state_data = [];
  String event_invoke = "invoke";
  String event_update = "update";
  Uri url_wa_bot_api = Uri.parse("http://0.0.0.0:9990/api");

  WhatsAppBotApi({
    required String tokenBot,
    Map? clientOption,
    this.serverUniverseNative,
    String whatsAppCryptoKey = "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb",
    EventEmitter? eventEmitter,
    this.event_invoke = "invoke",
    this.event_update = "update",
    Uri? whatsAppUrlWebhook,
    Client? httpClient,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
  }) {
    if (httpClient != null) {
      http_client = httpClient;
    }
    whats_app_crypto.defaultKey = whatsAppCryptoKey;
    if (whatsAppUrlWebhook != null) {
      whatsapp_url_webhook = whatsAppUrlWebhook;
    }

    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }
    token_bot = tokenBot;
    if (httpClient != null) {
      http_client = httpClient;
    }
    if (urlWaBotApi != null) {
      url_wa_bot_api = urlWaBotApi;
    }
    if (isInvokeThrowOnError != null) {
      is_invoke_throw_on_error = isInvokeThrowOnError;
    }
  }

  void initServer() {
    if (serverUniverseNative != null) {
      if (Dart.isWeb == false) {
        if (is_init_server == false) {
          is_init_server = true;

          serverUniverseNative!.post(whatsapp_url_webhook.path, (HttpRequest req, HttpResponse res) async {
            try {
              Map query = (req.uri.queryParameters).clone();
              Map<String, dynamic> body = ((await req.bodyAsJsonMap));

              try {
                query["wa-client"] = req.uri.query.replaceAll(RegExp("^(wa=)"), "");
              } catch (e) {}

              event_emitter.emit(
                eventName: event_update,
                value: UpdateWaBot(
                  uri: req.uri,
                  body: body,
                  query: query,
                  type: "glx",
                ),
              );
              return {"@type": "ok"};
            } catch (e) {
              return {
                "@type": "ok",
              };
            }
          });
        }
      }
    }
  }

  WaClientData waClientData({
    required Map query,
  }) {
    try {
      if (query["wa"] is String == false) {
        query["wa"] = "";
      }
      Map decyprt = json.decode(whats_app_crypto.decrypt(data_base64: (query["wa"] as String).replaceAll(RegExp("([ ])"), "")));
      return WaClientData(decyprt);
    } catch (e) {
      if (query["wa-client"] is String == false) {
        query["wa-client"] = "";
      }
      Map decyprt = json.decode(whats_app_crypto.decrypt(data_base64: (query["wa-client"] as String).replaceAll(RegExp("([ ])"), "")));
      return WaClientData(decyprt);
    }
  }

  Future<Map> initIsolate({
    String? tokenBot,
    String? idClient,
    bool isCreateclient = true,
    Map? user,
    int owner_tg_user_id = 0,
    int from_tg_bot_user_id = 0,
    int expire_date = 0,
    String type_bot = "glx",
    String? path,
    String version = "regular",
    Iterable<String>? pathSegments,
  }) async {
    tokenBot ??= token_bot;
    user ??= {};
    idClient ??= generateUuid(10);
    Map client_data = {
      "client_token": tokenBot,
      "client_type": type_bot,
      "client_title": user["first_name"],
      "client_username": user["username"],
      "expire_date": expire_date,
      "version": version,
      "owner_tg_user_id": owner_tg_user_id,
      "from_tg_bot_user_id": from_tg_bot_user_id,
    };
    String? query_telegram_webhook = whats_app_crypto.encryptMapToBase64(data: client_data);
    Map result_webhook = await request(
      parameters: {
        "@type": (isCreateclient) ? "createClient" : "setWebhook",
        "id": idClient,
        "url": whatsapp_url_webhook.replace(
          path: path,
          pathSegments: pathSegments,
          queryParameters: {
            "wa": query_telegram_webhook,
          },
        ).toString()
      },
      tokenBot: tokenBot,
    );

    Map new_scheme = {
      "webhook": result_webhook,
      "user": user,
      "client_data": client_data,
    };

    return new_scheme;
  }

  Future<Map> initIsolateNewClient({
    required String tokenBot,
    String? idClient,
    bool isCreateclient = false,
    Map? user,
    int owner_tg_user_id = 0,
    int from_tg_bot_user_id = 0,
    int expire_date = 0,
    String type_bot = "glx",
    String? path,
    String version = "regular",
    Iterable<String>? pathSegments,
  }) async {
    return await initIsolate(
      tokenBot: tokenBot,
      idClient: idClient,
      isCreateclient: isCreateclient,
      user: user,
      owner_tg_user_id: owner_tg_user_id,
      from_tg_bot_user_id: from_tg_bot_user_id,
      expire_date: expire_date,
      type_bot: type_bot,
      path: path,
      version: version,
      pathSegments: pathSegments,
    );
  }

  EventEmitterListener on(String type_update, FutureOr<dynamic> Function(UpdateWaBot updateWaBot) callback) {
    return event_emitter.on(
      eventName: type_update,
      onCallback: (_, update) async {
        try {
          if (update is UpdateWaBot) {
            // UpdateWaBot updateApi = ev.eventData as UpdateWaBot;
            await callback(update);
            return;
          }
        } catch (e) {}
      },
    );
  }

  void emit(String type_update, UpdateWaBot updateWaBot) {
    return event_emitter.emit(eventName: type_update, value: updateWaBot);
  }

  Future<Map> invokeRaw({
    required Map parameters,
    required String? tokenBot,
    required Uri? urlWaBotApi,
    required bool? isInvokeThrowOnError,
    required Client? httpClient,
  }) async {
    httpClient ??= http_client;
    isInvokeThrowOnError ??= is_invoke_throw_on_error;
    urlWaBotApi ??= url_wa_bot_api;
    tokenBot ??= token_bot;
    parameters["@token"] = tokenBot;
    String body = json.encode(parameters);
    Response response = await httpClient.post(
      urlWaBotApi,
      headers: {
        'Accept': 'application/json',
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
      body: body,
    );
    dynamic data_result = (json.decode(response.body));

    Map result = {};
    if (data_result is Map) {
      result = data_result;
    } else if (data_result is List) {
      result["result"] = data_result;
    }
    if (response.statusCode != 200) {
      if (isInvokeThrowOnError) {
        throw result;
      }
    }
    return result;
  }

  Future<Map> invoke({
    required Map parameters,
    String? tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) async {
    return await invokeRaw(
      parameters: parameters,
      tokenBot: tokenBot,
      urlWaBotApi: urlWaBotApi,
      isInvokeThrowOnError: isInvokeThrowOnError,
      httpClient: httpClient,
    );
  }

  Future<Map> request({
    required Map parameters,
    String? tokenBot,
    Uri? urlWaBotApi,
    bool? isInvokeThrowOnError,
    Client? httpClient,
  }) async {
    return await invoke(
      parameters: parameters,
      tokenBot: tokenBot,
      urlWaBotApi: urlWaBotApi,
      isInvokeThrowOnError: isInvokeThrowOnError,
      httpClient: httpClient,
    );
  }
}
