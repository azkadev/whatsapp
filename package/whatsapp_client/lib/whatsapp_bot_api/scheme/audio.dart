// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated
class Audio extends JsonScheme {
  /// Generated
  Audio(super.rawData);

  /// return default data
  ///
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

  /// check data
  /// if raw data
  /// - rawData["@type"] == audio
  /// if same return true
  bool json_scheme_utils_checkDataIsSameBySpecialType() {
    return rawData["@type"] == defaultData["@type"];
  }

  /// check value data whatever do yout want
  bool json_scheme_utils_checkDataIsSameBuilder({
    required bool Function(Map rawData, Map defaultData) onResult,
  }) {
    return onResult(rawData["@type"], defaultData["@type"]);
  }

  /// create [Audio]
  /// Empty
  static Audio empty() {
    return Audio({});
  }

  /// Generated
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

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
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

  /// Generated
  set url(String? value) {
    rawData["url"] = value;
  }

  /// Generated
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

  /// Generated
  set mimetype(String? value) {
    rawData["mimetype"] = value;
  }

  /// Generated
  String? get filesha256 {
    try {
      if (rawData["fileSha256"] is String == false) {
        return null;
      }
      return rawData["fileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set filesha256(String? value) {
    rawData["fileSha256"] = value;
  }

  /// Generated
  String? get filelength {
    try {
      if (rawData["fileLength"] is String == false) {
        return null;
      }
      return rawData["fileLength"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set filelength(String? value) {
    rawData["fileLength"] = value;
  }

  /// Generated
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

  /// Generated
  set seconds(num? value) {
    rawData["seconds"] = value;
  }

  /// Generated
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

  /// Generated
  set ptt(bool? value) {
    rawData["ptt"] = value;
  }

  /// Generated
  String? get mediakey {
    try {
      if (rawData["mediaKey"] is String == false) {
        return null;
      }
      return rawData["mediaKey"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set mediakey(String? value) {
    rawData["mediaKey"] = value;
  }

  /// Generated
  String? get fileencsha256 {
    try {
      if (rawData["fileEncSha256"] is String == false) {
        return null;
      }
      return rawData["fileEncSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set fileencsha256(String? value) {
    rawData["fileEncSha256"] = value;
  }

  /// Generated
  String? get directpath {
    try {
      if (rawData["directPath"] is String == false) {
        return null;
      }
      return rawData["directPath"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set directpath(String? value) {
    rawData["directPath"] = value;
  }

  /// Generated
  String? get mediakeytimestamp {
    try {
      if (rawData["mediaKeyTimestamp"] is String == false) {
        return null;
      }
      return rawData["mediaKeyTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set mediakeytimestamp(String? value) {
    rawData["mediaKeyTimestamp"] = value;
  }

  /// Generated
  ContextInfo get contextinfo {
    try {
      if (rawData["contextInfo"] is Map == false) {
        return ContextInfo({});
      }
      return ContextInfo(rawData["contextInfo"] as Map);
    } catch (e) {
      return ContextInfo({});
    }
  }

  /// Generated
  set contextinfo(ContextInfo value) {
    rawData["contextInfo"] = value.toJson();
  }

  /// Generated
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

  /// Generated
  set waveform(String? value) {
    rawData["waveform"] = value;
  }

  /// Generated
  static Audio create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "audio",
    String? url,
    String? mimetype,
    String? filesha256,
    String? filelength,
    num? seconds,
    bool? ptt,
    String? mediakey,
    String? fileencsha256,
    String? directpath,
    String? mediakeytimestamp,
    ContextInfo? contextinfo,
    String? waveform,
  }) {
    // Audio audio = Audio({
    final Map audio_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": filesha256,
      "fileLength": filelength,
      "seconds": seconds,
      "ptt": ptt,
      "mediaKey": mediakey,
      "fileEncSha256": fileencsha256,
      "directPath": directpath,
      "mediaKeyTimestamp": mediakeytimestamp,
      "contextInfo": (contextinfo != null) ? contextinfo.toJson() : null,
      "waveform": waveform,
    };

    audio_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (audio_data_create_json.containsKey(key) == false) {
          audio_data_create_json[key] = value;
        }
      });
    }
    return Audio(audio_data_create_json);
  }
}
