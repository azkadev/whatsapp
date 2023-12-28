// import 'package:database_dart/database_dart.dart';
// import 'package:test/test.dart';

// void main() {
//   test('calculate', () {
//     expect(calculate(), 42);
//   });
// }

// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:io';

import 'package:general_lib/general_lib.dart';

import "package:path/path.dart" as path;

void main() async {
  List<Map<String, dynamic>> datas = [
    {
      "@type": "updateAuthorizationState",
      "authorization_state": {
        "@type": "authorizationStateWaitsScanQr",
        "qr": "",
        "client": {
          "@type": "clientData",
          "id": "",
          "name": "",
        }
      },
    },
    {
      "@type": "updateNewMessage",
      "message": {
        "@type": "message",
        "id": "",
        "from": {
          "@type": "user",
          "id": "0",
          "first_name": "Ttt",
          "type": "private",
        },
        "chat": {
          "id": "",
          "first_name": "",
          "type": "private",
        },
        "is_group": false,
        "is_outgoing": true,
        "date": 1686254058,
        "type": "extendedTextMessage",
        "text": "Dart",
        "is_forward": false,
        "forward_from_chat": {
          "id": "",
          "type": "",
        },
        "photo": {
          "@type": "photo",
          "url": "",
          "mimetype": "image/jpeg",
          "fileSha256": "",
          "fileLength": "9907",
          "height": 244,
          "width": 244,
          "mediaKey": "",
          "fileEncSha256": "",
          "directPath": "/v/t62.7118-24/.enc?ccb=11-4&oh=-uw&oe=64A98F47",
          "mediaKeyTimestamp": "1686254143",
          "jpegThumbnail":
              "/9j///2c7Z///////////////Zztn/////////////////////9oACAEBAAE//++//+/ACGL/UDxk3xj2zPGAquBiBo9vABFM+/+NB/rH8P//9oACAECAQE/AAf//9oACAEDAQE/AAf/2Q==",
          "contextInfo": {
            "expiration": 604800,
            "ephemeralSettingTimestamp": "1675329",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          },
          "scansSidecar":
              "65Rc6/Xd/F/9sRX7FBhUtvmfU6OTWJDwxXdkq+kQt73Ce+7v3QJCAg==",
          "scanLengths": [917, 5469, 2010, 1511],
          "midQualityFileSha256": "1o/Mh6JtHkvlaRbhGWPPoonzJUNU7iLAFLZY6z3NAK4="
        },
        "poll": {
          "@type": "poll",
          "name": "Jjj",
          "options": [
            {
              "@type": "poll_option",
              "optionName": "J",
            },
          ],
          "selectableOptionsCount": 0,
          "contextInfo": {
            "expiration": 604800,
            "ephemeralSettingTimestamp": "1675329",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          }
        },
        "audio": {
          "url": "",
          "mimetype": "audio/mpeg",
          "fileSha256": "",
          "fileLength": "388702",
          "seconds": 12,
          "ptt": false,
          "mediaKey": "+n5o=",
          "fileEncSha256": "CvG4V/+=",
          "directPath": "/v/t62.7114-24/.enc?ccb=11-4&oh=-uQ&oe=64A9B93D",
          "mediaKeyTimestamp": "1686254281",
          "contextInfo": {
            "expiration": 604800,
            "ephemeralSettingTimestamp": "1675329",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          },
          "waveform": "=="
        },
        "contact": {
          "displayName": "",
          "vcard": "",
          "contextInfo": {
            "expiration": 604800,
            "ephemeralSettingTimestamp": "1675329",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          }
        },
        "document": {
          "url": "",
          "mimetype": "image/jpeg",
          "title": "0.jpeg",
          "fileSha256": "=",
          "fileLength": "79735",
          "pageCount": 0,
          "mediaKey": "",
          "fileName": "0.jpeg",
          "fileEncSha256": "",
          "directPath": "",
          "mediaKeyTimestamp": "",
          "contextInfo": {
            "expiration": 0,
            "ephemeralSettingTimestamp": "",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          }
        },
        "sticker": {
          "url": "",
          "fileSha256": "",
          "fileEncSha256": "",
          "mediaKey": "",
          "mimetype": "",
          "height": 0,
          "width": 0,
          "directPath": "",
          "fileLength": "",
          "mediaKeyTimestamp": "",
          "isAnimated": false,
          "contextInfo": {
            "expiration": 0,
            "ephemeralSettingTimestamp": "",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          },
          "stickerSentTs": "1686254514962",
          "isAvatar": false
        },
        "video": {
          "url": "",
          "mimetype": "video/mp4",
          "fileSha256": "iU/=",
          "fileLength": "109192",
          "seconds": 1,
          "mediaKey": "=",
          "height": 960,
          "width": 720,
          "fileEncSha256": "riTIeO+UouBo/=",
          "directPath": "/v",
          "mediaKeyTimestamp": "1686254486",
          "jpegThumbnail": "/",
          "contextInfo": {
            "expiration": 604800,
            "ephemeralSettingTimestamp": "1675329",
            "disappearingMode": {"initiator": "INITIATED_BY_ME"}
          },
          "streamingSidecar": "",
        },
        "isBaileys": true
      }
    },
  ];

  await jsonToScripts(datas,
      directory: Directory(path.join(
          Directory.current.path, "lib", "whatsapp_bot_api", "scheme")));
}
