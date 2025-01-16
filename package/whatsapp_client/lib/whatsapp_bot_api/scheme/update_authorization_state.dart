// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "authorization_state_waits_scan_qr.dart";

/// Generated 
class UpdateAuthorizationState extends JsonScheme {

  /// Generated
  UpdateAuthorizationState(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"updateAuthorizationState","authorization_state":{"@type":"authorizationStateWaitsScanQr","qr":"","client":{"@type":"clientData","id":"","name":""}}};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == updateAuthorizationState
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

  

  /// create [UpdateAuthorizationState]
  /// Empty  
  static UpdateAuthorizationState empty() {
    return UpdateAuthorizationState({});
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
  AuthorizationStateWaitsScanQr get authorization_state {
    try {
      if (rawData["authorization_state"] is Map == false){
        return AuthorizationStateWaitsScanQr({}); 
      }
      return AuthorizationStateWaitsScanQr(rawData["authorization_state"] as Map);
    } catch (e) {  
      return AuthorizationStateWaitsScanQr({}); 
    }
  }


  /// Generated
  set authorization_state(AuthorizationStateWaitsScanQr value) {
    rawData["authorization_state"] = value.toJson();
  }



  /// Generated
  static UpdateAuthorizationState create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "updateAuthorizationState",
      AuthorizationStateWaitsScanQr? authorization_state,
})  {
    // UpdateAuthorizationState updateAuthorizationState = UpdateAuthorizationState({
final Map updateAuthorizationState_data_create_json = {
  
      "@type": special_type,
      "authorization_state": (authorization_state != null)?authorization_state.toJson(): null,


};


          updateAuthorizationState_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (updateAuthorizationState_data_create_json.containsKey(key) == false) {
          updateAuthorizationState_data_create_json[key] = value;
        }
      });
    }
return UpdateAuthorizationState(updateAuthorizationState_data_create_json);


      }
}