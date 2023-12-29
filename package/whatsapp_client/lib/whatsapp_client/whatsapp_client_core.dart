// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:async';

import 'package:general_lib/general_lib.dart';
import 'package:http/http.dart';
import 'package:universal_io/io.dart';
import 'package:whatsapp_client/whatsapp_bot_api/whatsapp_bot_api.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_bot_api_option.dart';

class WhatsappClient {
  late WhatsAppBotApi whatsAppBotApi;
  EventEmitter event_emitter = EventEmitter();
  String event_update;
  String event_invoke;
  Directory? directory_temp;
  late Client http_client;

  /// return original data json
  WhatsappClient({
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
    whatsAppClientBotApiOption ??= WhatsAppClientBotApiOption(tokenBot: "");
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
        httpClient:http_client,
        urlWaBotApi: whatsAppClientBotApiOption.urlWaBotApi,
        isInvokeThrowOnError: whatsAppClientBotApiOption.isInvokeThrowOnError,
      );
      whatsAppBotApi.initServer();
    }
  }

  /// return original data json
  Listener on({
    required String event_name,
    required FutureOr<dynamic> Function(Object? updateTelegramClient) onUpdate,
    required FutureOr<dynamic> Function(Object error, StackTrace stackTrace) onError,
  }) {
    return event_emitter.on(event_name, null, (ev, context) async {
      try {
        if (ev.eventData is UpdateWaBot) {
          UpdateWaBot updateWaBot = (ev.eventData as UpdateWaBot);
          await onUpdate(updateWaBot.body);
        }
      } catch (e, stack) {
        try {
          await onError(e, stack);
        } catch (e) {}
      }
    });
  }
}
