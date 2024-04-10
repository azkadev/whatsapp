/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:async';

import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:universal_io/io.dart';
import 'package:whatsapp_client/scheme/wa_client_data.dart';
import 'package:whatsapp_client/whatsapp_bot_api/whatsapp_bot_api.dart';
import 'package:whatsapp_client/whatsapp_client/update_whatsapp_client.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_bot_api_option.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_data.dart';

class WhatsAppClient {
  late WhatsAppBotApi whatsAppBotApi;
  EventEmitter event_emitter = EventEmitter();
  String event_update;
  String event_invoke;
  Directory? directory_temp;
  late Client http_client;

  /// return original data json
  WhatsAppClient({
    EventEmitter? eventEmitter,
    this.event_invoke = "wa_client_invoke",
    this.event_update = "wa_client_update",
    this.directory_temp,
    Client? httpClient,
  }) {
    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }
    if (httpClient != null) {
      http_client = httpClient;
    } else {
      http_client = Client();
    }
  }
  void ensureInitialized({
    bool is_init_walib = true,
    bool is_init_whatsapp_bot_api = true,
    WhatsAppClientBotApiOption? whatsAppClientBotApiOption,
  }) {
    whatsAppClientBotApiOption ??=
        WhatsAppClientBotApiOption(tokenBot: "", alfred: null);
    if (is_init_walib) {}

    if (is_init_whatsapp_bot_api) {
      whatsAppBotApi = WhatsAppBotApi(
        tokenBot: whatsAppClientBotApiOption.tokenBot,
        clientOption: whatsAppClientBotApiOption.clientOption,
        alfred: whatsAppClientBotApiOption.alfred,
        whatsAppCryptoKey: whatsAppClientBotApiOption.whatsAppCryptoKey,
        eventEmitter: event_emitter,
        event_invoke: event_invoke,
        event_update: event_update,
        whatsAppUrlWebhook: whatsAppClientBotApiOption.whatsAppUrlWebhook,
        httpClient: http_client,
        urlWaBotApi: whatsAppClientBotApiOption.urlWaBotApi,
        isInvokeThrowOnError: whatsAppClientBotApiOption.isInvokeThrowOnError,
      );
      whatsAppBotApi.initServer();
    }
  }

  Future<void> autoSetData(UpdateWhatsAppClient updateWhatsAppClient) async {}

  /// return original data json
  Listener on({
    required String event_name,
    required FutureOr<dynamic> Function(
            UpdateWhatsAppClient updateWhatsAppClient)
        onUpdate,
    required FutureOr<dynamic> Function(Object error, StackTrace stackTrace)
        onError,
  }) {
    return event_emitter.on(event_name, null, (ev, context) async {
      try {
        if (ev.eventData is UpdateWaBot) {
          UpdateWaBot updateWaBot = (ev.eventData as UpdateWaBot);
          WaClientData waClientData =
              whatsAppBotApi.waClientData(query: updateWaBot.query);
          await onUpdate(
            UpdateWhatsAppClient(
              tg_uri: updateWaBot.uri,
              rawData: updateWaBot.body,
              query: updateWaBot.query,
              client_option: {},
              wa: this,
              whatsappClientData: WhatsAppClientData(
                whatsAppClientType: WhatsAppClientType.whats_app_bot_api,
                whats_app_token_bot: waClientData.client_token ?? "",
              ),
            ),
          );
        }
      } catch (e, stack) {
        try {
          await onError(e, stack);
        } catch (e) {}
      }
    });
  }

  /// return original data json
  FutureOr<Map> invoke({
    required Map parameters,
    required WhatsAppClientData whatsAppClientData,
    bool is_form = false,
    String? urlApi,
    String? clientType,
    void Function(int bytes, int bytess)? onUploadProgress,
    bool isVoid = false,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    String? extra,
    bool? isAutoGetChat,
    bool isInvokeThrowOnError = true,
    bool isAutoExtendMessage = false,
    Uri? urlWaBotApi,
    Client? httpClient,
  }) async {
    if (whatsAppClientData.whatsAppClientType ==
        WhatsAppClientType.whats_app_bot_api) {
      Map respond = await whatsAppBotApi.request(
        parameters["@type"],
        tokenBot: whatsAppClientData.whats_app_token_bot,
        parameters: parameters,
        isInvokeThrowOnError: isInvokeThrowOnError,
        urlWaBotApi: urlWaBotApi,
        httpClient: httpClient,
      );
      return respond;
    }

    return {
      "@type": "error",
      "code": 500,
      "message": "whatsapp_client_type_not_found"
    };
  }
}
