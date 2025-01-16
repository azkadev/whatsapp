// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


/// Generated 
class ClientData extends JsonScheme {

  /// Generated
  ClientData(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"clientData","id":"","name":""};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == clientData
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

  

  /// create [ClientData]
  /// Empty  
  static ClientData empty() {
    return ClientData({});
  }

  

  /// Generated
  String? get special_type {
    try {
      if (rawData["@type"] is String == false){
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
      if (rawData["id"] is String == false){
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
  String? get name {
    try {
      if (rawData["name"] is String == false){
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set name(String? value) {
    rawData["name"] = value;
  }


  /// Generated
  static ClientData create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "clientData",
    String? id,
    String? name,
})  {
    // ClientData clientData = ClientData({
final Map clientData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "name": name,


};


          clientData_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (clientData_data_create_json.containsKey(key) == false) {
          clientData_data_create_json[key] = value;
        }
      });
    }
return ClientData(clientData_data_create_json);


      }
}