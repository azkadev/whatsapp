// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class ForwardFromChat extends JsonScheme {
  ForwardFromChat(super.rawData);

  static Map get defaultData {
    return {"@type": "forward_from_chat", "id": "", "type": ""};
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

  static ForwardFromChat create({
    String special_type = "forward_from_chat",
    String? id,
    String? type,
  }) {
    // ForwardFromChat forwardFromChat = ForwardFromChat({
    Map forwardFromChat_data_create_json = {
      "@type": special_type,
      "id": id,
      "type": type,
    };

    forwardFromChat_data_create_json.removeWhere((key, value) => value == null);
    ForwardFromChat forwardFromChat_data_create =
        ForwardFromChat(forwardFromChat_data_create_json);

    return forwardFromChat_data_create;
  }
}
