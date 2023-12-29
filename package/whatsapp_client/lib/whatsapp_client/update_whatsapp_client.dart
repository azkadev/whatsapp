// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'package:whatsapp_client/whatsapp_client/whatsapp_client.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_data.dart';

/// update telegram data
class UpdateWhatsAppClient {
  Map rawData;
  Map query;
  late Uri uri;
  Map client_option;

  WhatsAppClientData whatsappClientData;
  WhatsAppClient wa;
  UpdateWhatsAppClient({
    required this.rawData,
    required Uri tg_uri,
    required this.query,
    required this.client_option,
    required this.whatsappClientData,
    required this.wa,
  }) {
    uri = tg_uri;
  }

  Map tgClientData() {
    if (whatsappClientData.whatsAppClientType ==
        WhatsAppClientType.whats_app_bot_api) {
      return wa.whatsAppBotApi.waClientData(query: query).rawData;
    }
    return client_option;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> updateRaw({
    required bool is_lite,
    required UpdataOptionWhatsAppClient updataOptionWhatsAppClient,
  }) async {
    if (whatsappClientData.whatsAppClientType ==
        WhatsAppClientType.whats_app_bot_api) {
      return rawData;
    }

    return null;
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update_lite async {
    return await updateRaw(
      is_lite: true,
      updataOptionWhatsAppClient: UpdataOptionWhatsAppClient(
        updataMessageWhatsAppClient: UpdataMessageWhatsAppClient(),
      ),
    );
  }

  /// DOCS: https://core.telegram.org/bots/api#update
  Future<Map?> get update async {
    return await updateRaw(
      is_lite: false,
      updataOptionWhatsAppClient: UpdataOptionWhatsAppClient(
        updataMessageWhatsAppClient: UpdataMessageWhatsAppClient(),
      ),
    );
  }
}

class UpdataOptionWhatsAppClient {
  final UpdataMessageWhatsAppClient updataMessageWhatsAppClient;
  UpdataOptionWhatsAppClient({
    required this.updataMessageWhatsAppClient,
  });
}

class UpdataMessageWhatsAppClient {
  final bool bot_is_skip_old_message;
  final bool user_is_skip_old_message;
  late final Duration duration_old_message_skip;
  late final List<String> skip_old_chat_types;
  UpdataMessageWhatsAppClient({
    this.bot_is_skip_old_message = false,
    this.user_is_skip_old_message = true,
    Duration? durationOldMessageSkip,
    List<String>? skipOldChatTypes,
  }) {
    durationOldMessageSkip ??= Duration(seconds: 10);
    skipOldChatTypes ??= ["group", "supergroup", "channel"];

    duration_old_message_skip = durationOldMessageSkip;
    skip_old_chat_types = skipOldChatTypes;
  }
}
