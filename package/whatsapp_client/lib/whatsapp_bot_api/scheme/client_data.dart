// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class ClientData extends JsonScheme {
  ClientData(super.rawData);

  static Map get defaultData {
    return {"@type": "clientData", "id": "", "name": ""};
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

  String? get name {
    try {
      if (rawData["name"] is String == false) {
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  static ClientData create({
    String special_type = "clientData",
    String? id,
    String? name,
  }) {
    // ClientData clientData = ClientData({
    Map clientData_data_create_json = {
      "@type": special_type,
      "id": id,
      "name": name,
    };

    clientData_data_create_json.removeWhere((key, value) => value == null);
    ClientData clientData_data_create = ClientData(clientData_data_create_json);

    return clientData_data_create;
  }
}
