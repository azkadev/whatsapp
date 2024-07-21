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
  late final  WhatsAppBotApi whatsAppBotApi;
   EventEmitter event_emitter = EventEmitter();
  final String event_update;
  final String event_invoke;
  final Directory? directory_temp;
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
    whatsAppClientBotApiOption ??= WhatsAppClientBotApiOption(tokenBot: "", serverUniverseNative: null);
    if (is_init_walib) {}

    if (is_init_whatsapp_bot_api) {
      whatsAppBotApi = WhatsAppBotApi(
        tokenBot: whatsAppClientBotApiOption.tokenBot,
        clientOption: whatsAppClientBotApiOption.clientOption,
        serverUniverseNative: whatsAppClientBotApiOption.serverUniverseNative,
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
  EventEmitterListener on({
    required String event_name,
    required FutureOr<dynamic> Function(UpdateWhatsAppClient updateWhatsAppClient) onUpdate,
    required FutureOr<dynamic> Function(Object error, StackTrace stackTrace) onError,
  }) {
    return event_emitter.on(event_name, null, (ev, context) async {
      try {
        if (ev.eventData is UpdateWaBot) {
          final UpdateWaBot updateWaBot = (ev.eventData as UpdateWaBot);
          final WaClientData waClientData = whatsAppBotApi.waClientData(query: updateWaBot.query);
          await onUpdate(
            UpdateWhatsAppClient(
              uri: updateWaBot.uri,
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
  FutureOr<Map> invokeRaw({
    required Map parameters,
    required WhatsAppClientData whatsAppClientData,
    required bool is_form,
    required String? urlApi,
    required String? clientType,
    required void Function(int bytes, int bytess)? onUploadProgress,
    required bool isVoid,
    required Duration? delayDuration,
    required Duration? invokeTimeOut,
    required String? extra,
    required bool? isAutoGetChat,
    required bool isInvokeThrowOnError,
    required bool isAutoExtendMessage,
    required Uri? urlWaBotApi,
    required Client? httpClient,
  }) async {
    if (whatsAppClientData.whatsAppClientType == WhatsAppClientType.whats_app_bot_api) {
      parameters["@token"] = whatsAppClientData.whats_app_token_bot;
      Map respond = await whatsAppBotApi.request(
        tokenBot: whatsAppClientData.whats_app_token_bot,
        parameters: parameters,
        isInvokeThrowOnError: isInvokeThrowOnError,
        urlWaBotApi: urlWaBotApi,
        httpClient: httpClient,
      );
      return respond;
    }

    return {"@type": "error", "code": 500, "message": "whatsapp_client_type_not_found"};
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
    return await invokeRaw(
      parameters: parameters,
      whatsAppClientData: whatsAppClientData,
      is_form: is_form,
      urlApi: urlApi,
      clientType: clientType,
      onUploadProgress: onUploadProgress,
      isVoid: isVoid,
      delayDuration: delayDuration,
      invokeTimeOut: invokeTimeOut,
      extra: extra,
      isAutoGetChat: isAutoGetChat,
      isInvokeThrowOnError: isInvokeThrowOnError,
      isAutoExtendMessage: isAutoExtendMessage,
      urlWaBotApi: urlWaBotApi,
      httpClient: httpClient,
    );
  }

  /// return original data json
  FutureOr<Map> request({
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
    return await invoke(
      parameters: parameters,
      whatsAppClientData: whatsAppClientData,
      is_form: is_form,
      urlApi: urlApi,
      clientType: clientType,
      onUploadProgress: onUploadProgress,
      isVoid: isVoid,
      delayDuration: delayDuration,
      invokeTimeOut: invokeTimeOut,
      extra: extra,
      isAutoGetChat: isAutoGetChat,
      isInvokeThrowOnError: isInvokeThrowOnError,
      isAutoExtendMessage: isAutoExtendMessage,
      urlWaBotApi: urlWaBotApi,
      httpClient: httpClient,
    );
  }
}
