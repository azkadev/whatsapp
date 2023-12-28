// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Audio extends JsonScheme {
  Audio(super.rawData);

  static Map get defaultData {
    return {
      "@type": "audio",
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
        "@type": "contextInfo",
        "expiration": 604800,
        "ephemeralSettingTimestamp": "1675329",
        "disappearingMode": {"initiator": "INITIATED_BY_ME"}
      },
      "waveform": "=="
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

  num? get seconds {
    try {
      if (rawData["seconds"] is num == false) {
        return null;
      }
      return rawData["seconds"] as num;
    } catch (e) {
      return null;
    }
  }

  bool? get ptt {
    try {
      if (rawData["ptt"] is bool == false) {
        return null;
      }
      return rawData["ptt"] as bool;
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

  String? get waveform {
    try {
      if (rawData["waveform"] is String == false) {
        return null;
      }
      return rawData["waveform"] as String;
    } catch (e) {
      return null;
    }
  }

  static Audio create({
    String special_type = "audio",
    String? url,
    String? mimetype,
    String? fileSha256,
    String? fileLength,
    num? seconds,
    bool? ptt,
    String? mediaKey,
    String? fileEncSha256,
    String? directPath,
    String? mediaKeyTimestamp,
    ContextInfo? contextInfo,
    String? waveform,
  }) {
    // Audio audio = Audio({
    Map audio_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": fileSha256,
      "fileLength": fileLength,
      "seconds": seconds,
      "ptt": ptt,
      "mediaKey": mediaKey,
      "fileEncSha256": fileEncSha256,
      "directPath": directPath,
      "mediaKeyTimestamp": mediaKeyTimestamp,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
      "waveform": waveform,
    };

    audio_data_create_json.removeWhere((key, value) => value == null);
    Audio audio_data_create = Audio(audio_data_create_json);

    return audio_data_create;
  }
}
