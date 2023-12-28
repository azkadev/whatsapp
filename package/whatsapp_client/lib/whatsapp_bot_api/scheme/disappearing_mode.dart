// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class DisappearingMode extends JsonScheme {
  DisappearingMode(super.rawData);

  static Map get defaultData {
    return {"@type": "disappearingMode", "initiator": "INITIATED_BY_ME"};
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

  String? get initiator {
    try {
      if (rawData["initiator"] is String == false) {
        return null;
      }
      return rawData["initiator"] as String;
    } catch (e) {
      return null;
    }
  }

  static DisappearingMode create({
    String special_type = "disappearingMode",
    String? initiator,
  }) {
    // DisappearingMode disappearingMode = DisappearingMode({
    Map disappearingMode_data_create_json = {
      "@type": special_type,
      "initiator": initiator,
    };

    disappearingMode_data_create_json
        .removeWhere((key, value) => value == null);
    DisappearingMode disappearingMode_data_create =
        DisappearingMode(disappearingMode_data_create_json);

    return disappearingMode_data_create;
  }
}
