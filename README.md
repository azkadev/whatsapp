# Whatsapp client

Whatsapp client menggunakan bahasa code dart bisa berjalan menggunakan puppeteer / native websocket (tanpa puppeteer) dan support multi client tested di bawah


## Pembuat

<!-- global first -->

<h3 align="center">
  Pencipta Library
  <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="28">
</h3>

<!-- Typing SVG by azkadev - https://github.com/azkadev/readme-typing-svg -->
<p align="center">
<a href="https://github.com/azkadev">
        <img src="https://telegra.ph/file/e90bdeab8390b8c0d9df2.png" alt="Specta"
            width="312"
            height="312">
    </a>
</p>

<!-- Social icons section -->
<p align="center">   
  <a href="https://youtube.com/@azkadev">
    <img alt="youtube" title="Follow me on Youtube" src="https://img.shields.io/badge/Youtube-%23E4405F.svg?&style=for-the-badge&logo=youtube&logoColor=white"/>
    </a>
  <a href="https://t.me/azkadevbot?star=ref_readme_general_library">
    <img alt="telegram" title="Follow me on Telegram" src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)"/>
    </a> 
  <a href="https://youtube.com/@azkadev">
    <img alt="Website" title="Follow me on Web" src="https://img.shields.io/badge/Website-%23E4405F.svg?&style=for-the-badge&logo=firefox&logoColor=white"/>
    </a>  
</p>



<p align="center">
  <a href="https://www.youtube.com/@azkadev?sub_confirmation=1">
    <img alt="youtube subscribers" title="Subscribe to my YouTube channel" src="https://custom-icon-badges.demolab.com/youtube/channel/subscribers/UC928-F8HenjZD1zNdMY42vA?color=%23E05D44&label=SUBSCRIBE&logo=video&logoColor=white&style=for-the-badge&labelColor=CE4630"/></a>
  <a href="https://www.youtube.com/@azkadev">
    <img alt="youtube views" title="YouTube views" src="https://custom-icon-badges.demolab.com/youtube/channel/views/UC928-F8HenjZD1zNdMY42vA?color=%23E1AD0E&logo=video&logoColor=white&style=for-the-badge&labelColor=C79600"/></a> 
  <a href="https://github.com/azkadev?tab=repositories&sort=stargazers">
    <img alt="total stars" title="Total stars on GitHub" src="https://custom-icon-badges.demolab.com/github/stars/azkadev?color=55960c&style=for-the-badge&labelColor=488207&logo=star"/></a>
  <a href="https://github.com/azkadev?tab=followers">
    <img alt="followers" title="Follow me on Github" src="https://custom-icon-badges.demolab.com/github/followers/azkadev?color=236ad3&labelColor=1155ba&style=for-the-badge&logo=person-add&label=Follow&logoColor=white"/></a>
</p>

---

## 📑️ Tentang Saya

Saya seorang developer miskin (tidak kaya) 

## 🔗️ Links

#### Docs / Tutorial / Example

1. [GITHUB DOCS](/docs/)
2. [Youtube](https://youtube.com/@azkadev)
3. [Telegram Chat Group Support FREE](https://t.me/DEVELOPER_GLOBAL_PUBLIC)
3. [Telegram Bot Support Berbayar]()
4. [Applikasi Support]()

<!-- global finished -->



## Screenshot

# Feature

1. [x] Multi Client
2. [x] Pretty Update Data

## install

- DART
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
