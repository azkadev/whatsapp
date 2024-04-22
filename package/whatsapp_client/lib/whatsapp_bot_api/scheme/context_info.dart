// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "disappearing_mode.dart";

 
class ContextInfo extends JsonScheme {

  
  ContextInfo(super.rawData);
   
  static Map get defaultData {
    return {"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"@type":"disappearingMode","initiator":"INITIATED_BY_ME"}};
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

  
  set expiration(num? value) {
    rawData["expiration"] = value;
  }


  
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

  
  set ephemeralsettingtimestamp(String? value) {
    rawData["ephemeralSettingTimestamp"] = value;
  }


  
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


  
  set disappearingmode(DisappearingMode value) {
    rawData["disappearingMode"] = value.toJson();
  }



  
  static ContextInfo create({

    String special_type = "contextInfo",
    num? expiration,
    String? ephemeralsettingtimestamp,
      DisappearingMode? disappearingmode,
})  {
    // ContextInfo contextInfo = ContextInfo({
Map contextInfo_data_create_json = {
  
      "@type": special_type,
      "expiration": expiration,
      "ephemeralSettingTimestamp": ephemeralsettingtimestamp,
      "disappearingMode": (disappearingmode != null)?disappearingmode.toJson(): null,


};


          contextInfo_data_create_json.removeWhere((key, value) => value == null);
ContextInfo contextInfo_data_create = ContextInfo(contextInfo_data_create_json);

return contextInfo_data_create;



      }
}