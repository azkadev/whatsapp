// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "client_data.dart";

 
class AuthorizationStateWaitsScanQr extends JsonScheme {

  
  AuthorizationStateWaitsScanQr(super.rawData);
   
  static Map get defaultData {
    return {"@type":"authorizationStateWaitsScanQr","qr":"","client":{"@type":"clientData","id":"","name":""}};
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

  
  set special_type(String? value) {
    rawData["@type"] = value;
  }


  
  String? get qr {
    try {
      if (rawData["qr"] is String == false){
        return null;
      }
      return rawData["qr"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set qr(String? value) {
    rawData["qr"] = value;
  }


  
  ClientData get client {
    try {
      if (rawData["client"] is Map == false){
        return ClientData({}); 
      }
      return ClientData(rawData["client"] as Map);
    } catch (e) {  
      return ClientData({}); 
    }
  }


  
  set client(ClientData value) {
    rawData["client"] = value.toJson();
  }



  
  static AuthorizationStateWaitsScanQr create({

    String special_type = "authorizationStateWaitsScanQr",
    String? qr,
      ClientData? client,
})  {
    // AuthorizationStateWaitsScanQr authorizationStateWaitsScanQr = AuthorizationStateWaitsScanQr({
Map authorizationStateWaitsScanQr_data_create_json = {
  
      "@type": special_type,
      "qr": qr,
      "client": (client != null)?client.toJson(): null,


};


          authorizationStateWaitsScanQr_data_create_json.removeWhere((key, value) => value == null);
AuthorizationStateWaitsScanQr authorizationStateWaitsScanQr_data_create = AuthorizationStateWaitsScanQr(authorizationStateWaitsScanQr_data_create_json);

return authorizationStateWaitsScanQr_data_create;



      }
}