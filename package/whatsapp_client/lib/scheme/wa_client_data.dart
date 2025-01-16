// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


/// Generated 
class WaClientData extends JsonScheme {

  /// Generated
  WaClientData(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"waClientData","client_token":"","owner_tg_user_id":0,"client_type":"","client_title":"","client_username":"","from_tg_bot_user_id":0,"expire_date":0,"version":""};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == waClientData
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

  

  /// create [WaClientData]
  /// Empty  
  static WaClientData empty() {
    return WaClientData({});
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
  String? get client_token {
    try {
      if (rawData["client_token"] is String == false){
        return null;
      }
      return rawData["client_token"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set client_token(String? value) {
    rawData["client_token"] = value;
  }


  /// Generated
  num? get owner_tg_user_id {
    try {
      if (rawData["owner_tg_user_id"] is num == false){
        return null;
      }
      return rawData["owner_tg_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set owner_tg_user_id(num? value) {
    rawData["owner_tg_user_id"] = value;
  }


  /// Generated
  String? get client_type {
    try {
      if (rawData["client_type"] is String == false){
        return null;
      }
      return rawData["client_type"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set client_type(String? value) {
    rawData["client_type"] = value;
  }


  /// Generated
  String? get client_title {
    try {
      if (rawData["client_title"] is String == false){
        return null;
      }
      return rawData["client_title"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set client_title(String? value) {
    rawData["client_title"] = value;
  }


  /// Generated
  String? get client_username {
    try {
      if (rawData["client_username"] is String == false){
        return null;
      }
      return rawData["client_username"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set client_username(String? value) {
    rawData["client_username"] = value;
  }


  /// Generated
  num? get from_tg_bot_user_id {
    try {
      if (rawData["from_tg_bot_user_id"] is num == false){
        return null;
      }
      return rawData["from_tg_bot_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set from_tg_bot_user_id(num? value) {
    rawData["from_tg_bot_user_id"] = value;
  }


  /// Generated
  num? get expire_date {
    try {
      if (rawData["expire_date"] is num == false){
        return null;
      }
      return rawData["expire_date"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set expire_date(num? value) {
    rawData["expire_date"] = value;
  }


  /// Generated
  String? get version {
    try {
      if (rawData["version"] is String == false){
        return null;
      }
      return rawData["version"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set version(String? value) {
    rawData["version"] = value;
  }


  /// Generated
  static WaClientData create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "waClientData",
    String? client_token,
    num? owner_tg_user_id,
    String? client_type,
    String? client_title,
    String? client_username,
    num? from_tg_bot_user_id,
    num? expire_date,
    String? version,
})  {
    // WaClientData waClientData = WaClientData({
final Map waClientData_data_create_json = {
  
      "@type": special_type,
      "client_token": client_token,
      "owner_tg_user_id": owner_tg_user_id,
      "client_type": client_type,
      "client_title": client_title,
      "client_username": client_username,
      "from_tg_bot_user_id": from_tg_bot_user_id,
      "expire_date": expire_date,
      "version": version,


};


          waClientData_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (waClientData_data_create_json.containsKey(key) == false) {
          waClientData_data_create_json[key] = value;
        }
      });
    }
return WaClientData(waClientData_data_create_json);


      }
}