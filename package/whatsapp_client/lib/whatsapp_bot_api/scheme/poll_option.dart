// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class PollOption extends JsonScheme {
  /// Generated
  PollOption(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "poll_option", "optionName": "J"};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == poll_option
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

  /// create [PollOption]
  /// Empty
  static PollOption empty() {
    return PollOption({});
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
  String? get optionname {
    try {
      if (rawData["optionName"] is String == false) {
        return null;
      }
      return rawData["optionName"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set optionname(String? value) {
    rawData["optionName"] = value;
  }

  /// Generated
  static PollOption create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "poll_option",
    String? optionname,
  }) {
    // PollOption pollOption = PollOption({
    final Map pollOption_data_create_json = {
      "@type": special_type,
      "optionName": optionname,
    };

    pollOption_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (pollOption_data_create_json.containsKey(key) == false) {
          pollOption_data_create_json[key] = value;
        }
      });
    }
    return PollOption(pollOption_data_create_json);
  }
}
