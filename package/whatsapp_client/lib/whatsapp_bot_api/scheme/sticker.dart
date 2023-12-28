// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Sticker extends JsonScheme {
  Sticker(super.rawData);

  static Map get defaultData {
    return {
      "@type": "sticker",
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
        "@type": "contextInfo",
        "expiration": 0,
        "ephemeralSettingTimestamp": "",
        "disappearingMode": {"initiator": "INITIATED_BY_ME"}
      },
      "stickerSentTs": "1686254514962",
      "isAvatar": false
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get url {
    try {
      if (rawData["url"] is String == false) {
        return null;
      }
      return rawData["url"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileSha256 {
    try {
      if (rawData["fileSha256"] is String == false) {
        return null;
      }
      return rawData["fileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileEncSha256 {
    try {
      if (rawData["fileEncSha256"] is String == false) {
        return null;
      }
      return rawData["fileEncSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get mediaKey {
    try {
      if (rawData["mediaKey"] is String == false) {
        return null;
      }
      return rawData["mediaKey"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get mimetype {
    try {
      if (rawData["mimetype"] is String == false) {
        return null;
      }
      return rawData["mimetype"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get height {
    try {
      if (rawData["height"] is num == false) {
        return null;
      }
      return rawData["height"] as num;
    } catch (e) {
      return null;
    }
  }

  num? get width {
    try {
      if (rawData["width"] is num == false) {
        return null;
      }
      return rawData["width"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get directPath {
    try {
      if (rawData["directPath"] is String == false) {
        return null;
      }
      return rawData["directPath"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileLength {
    try {
      if (rawData["fileLength"] is String == false) {
        return null;
      }
      return rawData["fileLength"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get mediaKeyTimestamp {
    try {
      if (rawData["mediaKeyTimestamp"] is String == false) {
        return null;
      }
      return rawData["mediaKeyTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  bool? get isAnimated {
    try {
      if (rawData["isAnimated"] is bool == false) {
        return null;
      }
      return rawData["isAnimated"] as bool;
    } catch (e) {
      return null;
    }
  }

  ContextInfo get contextInfo {
    try {
      if (rawData["contextInfo"] is Map == false) {
        return ContextInfo({});
      }
      return ContextInfo(rawData["contextInfo"] as Map);
    } catch (e) {
      return ContextInfo({});
    }
  }

  String? get stickerSentTs {
    try {
      if (rawData["stickerSentTs"] is String == false) {
        return null;
      }
      return rawData["stickerSentTs"] as String;
    } catch (e) {
      return null;
    }
  }

  bool? get isAvatar {
    try {
      if (rawData["isAvatar"] is bool == false) {
        return null;
      }
      return rawData["isAvatar"] as bool;
    } catch (e) {
      return null;
    }
  }

  static Sticker create({
    String special_type = "sticker",
    String? url,
    String? fileSha256,
    String? fileEncSha256,
    String? mediaKey,
    String? mimetype,
    num? height,
    num? width,
    String? directPath,
    String? fileLength,
    String? mediaKeyTimestamp,
    bool? isAnimated,
    ContextInfo? contextInfo,
    String? stickerSentTs,
    bool? isAvatar,
  }) {
    // Sticker sticker = Sticker({
    Map sticker_data_create_json = {
      "@type": special_type,
      "url": url,
      "fileSha256": fileSha256,
      "fileEncSha256": fileEncSha256,
      "mediaKey": mediaKey,
      "mimetype": mimetype,
      "height": height,
      "width": width,
      "directPath": directPath,
      "fileLength": fileLength,
      "mediaKeyTimestamp": mediaKeyTimestamp,
      "isAnimated": isAnimated,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
      "stickerSentTs": stickerSentTs,
      "isAvatar": isAvatar,
    };

    sticker_data_create_json.removeWhere((key, value) => value == null);
    Sticker sticker_data_create = Sticker(sticker_data_create_json);

    return sticker_data_create;
  }
}
