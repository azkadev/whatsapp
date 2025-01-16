// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "disappearing_mode.dart";

/// Generated 
class ContextInfo extends JsonScheme {

  /// Generated
  ContextInfo(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"@type":"disappearingMode","initiator":"INITIATED_BY_ME"}};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == contextInfo
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

  

  /// create [ContextInfo]
  /// Empty  
  static ContextInfo empty() {
    return ContextInfo({});
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
  num? get expiration {
    try {
      if (rawData["expiration"] is num == false){
        return null;
      }
      return rawData["expiration"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set expiration(num? value) {
    rawData["expiration"] = value;
  }


  /// Generated
  String? get ephemeralsettingtimestamp {
    try {
      if (rawData["ephemeralSettingTimestamp"] is String == false){
        return null;
      }
      return rawData["ephemeralSettingTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set ephemeralsettingtimestamp(String? value) {
    rawData["ephemeralSettingTimestamp"] = value;
  }


  /// Generated
  DisappearingMode get disappearingmode {
    try {
      if (rawData["disappearingMode"] is Map == false){
        return DisappearingMode({}); 
      }
      return DisappearingMode(rawData["disappearingMode"] as Map);
    } catch (e) {  
      return DisappearingMode({}); 
    }
  }


  /// Generated
  set disappearingmode(DisappearingMode value) {
    rawData["disappearingMode"] = value.toJson();
  }



  /// Generated
  static ContextInfo create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "contextInfo",
    num? expiration,
    String? ephemeralsettingtimestamp,
      DisappearingMode? disappearingmode,
})  {
    // ContextInfo contextInfo = ContextInfo({
final Map contextInfo_data_create_json = {
  
      "@type": special_type,
      "expiration": expiration,
      "ephemeralSettingTimestamp": ephemeralsettingtimestamp,
      "disappearingMode": (disappearingmode != null)?disappearingmode.toJson(): null,


};


          contextInfo_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (contextInfo_data_create_json.containsKey(key) == false) {
          contextInfo_data_create_json[key] = value;
        }
      });
    }
return ContextInfo(contextInfo_data_create_json);


      }
}