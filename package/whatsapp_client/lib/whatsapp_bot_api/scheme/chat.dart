// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

/// Generated
class Chat extends JsonScheme {
  /// Generated
  Chat(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {"@type": "chat", "id": "", "first_name": "", "type": "private"};
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == chat
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

  /// create [Chat]
  /// Empty
  static Chat empty() {
    return Chat({});
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
  String? get first_name {
    try {
      if (rawData["first_name"] is String == false) {
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set first_name(String? value) {
    rawData["first_name"] = value;
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
  static Chat create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "chat",
    String? id,
    String? first_name,
    String? type,
  }) {
    // Chat chat = Chat({
    final Map chat_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "type": type,
    };

    chat_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (chat_data_create_json.containsKey(key) == false) {
          chat_data_create_json[key] = value;
        }
      });
    }
    return Chat(chat_data_create_json);
  }
}
