// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class ForwardFromChat extends JsonScheme {
  /// Generated
  ForwardFromChat(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "forward_from_chat", "id": "", "type": ""};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == forward_from_chat
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

  /// create [ForwardFromChat]
  /// Empty
  static ForwardFromChat empty() {
    return ForwardFromChat({});
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
  String? get id {
    try {
      if (rawData["id"] is String == false) {
        return null;
      }
      return rawData["id"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set id(String? value) {
    rawData["id"] = value;
  }

  /// Generated
  String? get type {
    try {
      if (rawData["type"] is String == false) {
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set type(String? value) {
    rawData["type"] = value;
  }

  /// Generated
  static ForwardFromChat create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "forward_from_chat",
    String? id,
    String? type,
  }) {
    // ForwardFromChat forwardFromChat = ForwardFromChat({
    final Map forwardFromChat_data_create_json = {
      "@type": special_type,
      "id": id,
      "type": type,
    };

    forwardFromChat_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (forwardFromChat_data_create_json.containsKey(key) == false) {
          forwardFromChat_data_create_json[key] = value;
        }
      });
    }
    return ForwardFromChat(forwardFromChat_data_create_json);
  }
}
