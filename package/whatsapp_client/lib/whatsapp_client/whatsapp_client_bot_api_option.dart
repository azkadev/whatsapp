import 'package:alfred/alfred.dart';

class WhatsAppClientBotApiOption {
  Alfred? alfred;
  String tokenBot;
  Map<dynamic, dynamic>? clientOption;
  String whatsAppCryptoKey;
  Uri? whatsAppUrlWebhook;
  Uri? urlWaBotApi;
  bool? isInvokeThrowOnError;
  WhatsAppClientBotApiOption({
    this.alfred,
    required this.tokenBot,
    this.clientOption,
    this.whatsAppCryptoKey = "DdtLKPV31OvdT72g",
    this.whatsAppUrlWebhook,
    this.urlWaBotApi,
    this.isInvokeThrowOnError,
  });
}
