// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class Chat extends JsonScheme {
  Chat(super.rawData);

  static Map get defaultData {
    return {"@type": "chat", "id": "", "first_name": "", "type": "private"};
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

  static Chat create({
    String special_type = "chat",
    String? id,
    String? first_name,
    String? type,
  }) {
    // Chat chat = Chat({
    Map chat_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "type": type,
    };

    chat_data_create_json.removeWhere((key, value) => value == null);
    Chat chat_data_create = Chat(chat_data_create_json);

    return chat_data_create;
  }
}
