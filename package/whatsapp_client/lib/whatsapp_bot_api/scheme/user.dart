// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class User extends JsonScheme {
  User(super.rawData);

  static Map get defaultData {
    return {"@type": "user", "id": "0", "first_name": "Ttt", "type": "private"};
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

  static User create({
    String special_type = "user",
    String? id,
    String? first_name,
    String? type,
  }) {
    // User user = User({
    Map user_data_create_json = {
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "type": type,
    };

    user_data_create_json.removeWhere((key, value) => value == null);
    User user_data_create = User(user_data_create_json);

    return user_data_create;
  }
}
