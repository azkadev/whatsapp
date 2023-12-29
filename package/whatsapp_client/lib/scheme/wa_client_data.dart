// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";



class WaClientData extends JsonScheme {

  
  WaClientData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"waClientData","client_token":"","owner_tg_user_id":0,"client_type":"","client_title":"","client_username":"","from_tg_bot_user_id":0,"expire_date":0,"version":""};
  }

  
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


  
  static WaClientData create({

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
Map waClientData_data_create_json = {
  
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
WaClientData waClientData_data_create = WaClientData(waClientData_data_create_json);

return waClientData_data_create;



      }
}