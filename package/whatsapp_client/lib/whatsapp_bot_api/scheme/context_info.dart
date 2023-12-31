// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "disappearing_mode.dart";

class ContextInfo extends JsonScheme {
  ContextInfo(super.rawData);

  static Map get defaultData {
    return {
      "@type": "contextInfo",
      "expiration": 604800,
      "ephemeralSettingTimestamp": "1675329",
      "disappearingMode": {
        "@type": "disappearingMode",
        "initiator": "INITIATED_BY_ME"
      }
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

  num? get expiration {
    try {
      if (rawData["expiration"] is num == false) {
        return null;
      }
      return rawData["expiration"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get ephemeralSettingTimestamp {
    try {
      if (rawData["ephemeralSettingTimestamp"] is String == false) {
        return null;
      }
      return rawData["ephemeralSettingTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  DisappearingMode get disappearingMode {
    try {
      if (rawData["disappearingMode"] is Map == false) {
        return DisappearingMode({});
      }
      return DisappearingMode(rawData["disappearingMode"] as Map);
    } catch (e) {
      return DisappearingMode({});
    }
  }

  static ContextInfo create({
    String special_type = "contextInfo",
    num? expiration,
    String? ephemeralSettingTimestamp,
    DisappearingMode? disappearingMode,
  }) {
    // ContextInfo contextInfo = ContextInfo({
    Map contextInfo_data_create_json = {
      "@type": special_type,
      "expiration": expiration,
      "ephemeralSettingTimestamp": ephemeralSettingTimestamp,
      "disappearingMode":
          (disappearingMode != null) ? disappearingMode.toJson() : null,
    };

    contextInfo_data_create_json.removeWhere((key, value) => value == null);
    ContextInfo contextInfo_data_create =
        ContextInfo(contextInfo_data_create_json);

    return contextInfo_data_create;
  }
}
