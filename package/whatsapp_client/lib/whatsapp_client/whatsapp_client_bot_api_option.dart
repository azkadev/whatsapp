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
    required this.alfred,
    required this.tokenBot,
    this.clientOption,
    this.whatsAppCryptoKey = "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb",
    this.whatsAppUrlWebhook,
    this.urlWaBotApi,
    this.isInvokeThrowOnError,
  });
}
