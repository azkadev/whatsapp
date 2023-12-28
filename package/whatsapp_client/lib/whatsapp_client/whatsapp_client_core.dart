// ignore_for_file: non_constant_identifier_names

import 'package:general_lib/general_lib.dart';
import 'package:universal_io/io.dart';
import 'package:whatsapp_client/whatsapp_bot_api/whatsapp_bot_api.dart';

class WhatsappClient {
  late WhatsAppBotApi whatsAppBotApi;
  EventEmitter event_emitter = EventEmitter();
  String event_update;
  String event_invoke;
  Directory? directory_temp;

  /// return original data json
  WhatsappClient({
    EventEmitter? eventEmitter,
    this.event_invoke = "tg_client_invoke",
    this.event_update = "tg_client_update",
    this.directory_temp,
  }) {
    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }
  }
  void ensureInitialized({
    bool is_init_walib = true,
    bool is_init_whatsapp_bot_api = true,
  }) {
    if (is_init_walib) {}

    if (is_init_whatsapp_bot_api) {
      whatsAppBotApi = WhatsAppBotApi(
        tokenBot: "",
      );
    }
  }
}
