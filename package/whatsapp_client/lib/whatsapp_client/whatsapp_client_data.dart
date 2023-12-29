// ignore_for_file: constant_identifier_names, non_constant_identifier_names

enum WhatsAppClientType {
  whats_app_bot_api,
  walib,
}

class WhatsAppClientData {
  String whats_app_token_bot;
  WhatsAppClientType whatsAppClientType;
  WhatsAppClientData({
    required this.whats_app_token_bot,
    required this.whatsAppClientType,
  });

  static whatsAppBotApi({
    required String token_bot,
  }) {
    return WhatsAppClientData(
      whats_app_token_bot: token_bot,
      whatsAppClientType: WhatsAppClientType.whats_app_bot_api,
    );
  }
}
