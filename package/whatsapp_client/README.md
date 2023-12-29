# Whatsapp client

Whatsapp client menggunakan bahasa code dart bisa berjalan menggunakan puppeteer / native websocket (tanpa puppeteer) dan support multi client tested di bawah


## Screenshot

# To-Do

1. [x] Multi Client
2. [x] Pretty Update Data

## install

```bash
dart pub add whatsapp_client
```


## import library

```dart
import 'package:whatsapp_client/whatsapp_client.dart';
```

## QuickStart

### Whatsapp Client

```dart 
// ignore_for_file: unused_local_variable

import 'package:alfred/alfred.dart';
import 'package:general_lib/general_lib.dart';
import 'package:whatsapp_client/whatsapp_client.dart';
import 'package:whatsapp_client/whatsapp_client/whatsapp_client_data.dart';

void main(List<String> args) async {
  print("WHATSAPP CLIENT");
  Alfred app = Alfred(
    logLevel: LogType.error,
  );

  WhatsAppBotApiServer whatsAppBotApiServer = WhatsAppBotApiServer();
  await whatsAppBotApiServer.runWaBotApi(
    host: "0.0.0.0",
    is_print: false,
    wa_bot_api_port: 9990,
    force_install_script: false,
  );

  WhatsAppClient wa = WhatsAppClient();
  wa.ensureInitialized(
    whatsAppClientBotApiOption: WhatsAppClientBotApiOption(
      tokenBot: "",
      alfred: app,
    ),
  );

  wa.on(
    event_name: wa.event_update,
    onUpdate: (updateWhatsAppClient) {
      Map update = updateWhatsAppClient.rawData;

      WhatsAppClientData whatsAppClientData = updateWhatsAppClient.whatsappClientData;
      if (update["@type"] == "updateAuthorizationState") {

      }
    },
    onError: (error, stackTrace) {},
  );

  var res = await wa.whatsAppBotApi.initIsolate(
    isCreateclient: true,
  );
  res.printPretty(2);
  await app.listen(8080);
}
```
