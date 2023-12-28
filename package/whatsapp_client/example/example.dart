import 'package:general_lib/extension/dynamic.dart';
import 'package:whatsapp_client/whatsapp_client.dart';

void main(List<String> args) async {
  print("SASLO");
  WhatsAppBotApiServer whatsAppBotApiServer = WhatsAppBotApiServer();
  await whatsAppBotApiServer.runWaBotApi(
    host: "0.0.0.0",
    is_print: true,
    wa_bot_api_port: 9990,
  );
  WhatsAppBotApi wa = WhatsAppBotApi(tokenBot: "");
  await Future.delayed(Duration(seconds: 2));
  var res = await wa.request(
    method: "createClient",
    parameters: {
      "id": "Sas",
      "url": "http://0.0.0.0:8080",
    },
    isInvokeThrowOnError: false,
  );
  res.printPretty(2);
}
