// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class DisappearingMode extends JsonScheme {
  /// Generated
  DisappearingMode(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "disappearingMode", "initiator": "INITIATED_BY_ME"};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == disappearingMode
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

  /// create [DisappearingMode]
  /// Empty
  static DisappearingMode empty() {
    return DisappearingMode({});
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

  /// Generated
  set initiator(String? value) {
    rawData["initiator"] = value;
  }

  /// Generated
  static DisappearingMode create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "disappearingMode",
    String? initiator,
  }) {
    // DisappearingMode disappearingMode = DisappearingMode({
    final Map disappearingMode_data_create_json = {
      "@type": special_type,
      "initiator": initiator,
    };

    disappearingMode_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (disappearingMode_data_create_json.containsKey(key) == false) {
          disappearingMode_data_create_json[key] = value;
        }
      });
    }
    return DisappearingMode(disappearingMode_data_create_json);
  }
}
