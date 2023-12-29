import 'package:alfred/alfred.dart';
import 'package:general_lib/general_lib.dart';
import 'package:whatsapp_client/whatsapp_client.dart';
// import 'package:whatsapp_client/whatsapp_client/whatsapp_client_bot_api_option.dart';

void main(List<String> args) async {
  print("SASLO"); 
  Alfred app = Alfred();


  WhatsAppBotApiServer whatsAppBotApiServer = WhatsAppBotApiServer();

  await whatsAppBotApiServer.runWaBotApi(
    host: "0.0.0.0",
    is_print: false,
    wa_bot_api_port: 9990,
    force_install_script: false,
  );


  WhatsappClient wa = WhatsappClient();
  wa.ensureInitialized(
    whatsAppClientBotApiOption: WhatsAppClientBotApiOption(
      tokenBot: "",
      alfred: app,
    ),
  );

  wa.on(
    event_name: wa.event_update,
    onUpdate: (updateTelegramClient) {
      updateTelegramClient.printPretty();
    },
    onError: (error, stackTrace) {},
  );

  var res = await wa.whatsAppBotApi.initIsolate(
    isCreateclient: true,
  );
  res.printPretty(2);
  await app.listen(8080);
}
