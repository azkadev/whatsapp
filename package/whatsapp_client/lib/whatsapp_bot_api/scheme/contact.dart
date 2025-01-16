// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated 
class Contact extends JsonScheme {

  /// Generated
  Contact(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"contact","displayName":"","vcard":"","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == contact
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

  

  /// create [Contact]
  /// Empty  
  static Contact empty() {
    return Contact({});
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
  String? get displayname {
    try {
      if (rawData["displayName"] is String == false){
        return null;
      }
      return rawData["displayName"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set displayname(String? value) {
    rawData["displayName"] = value;
  }


  /// Generated
  String? get vcard {
    try {
      if (rawData["vcard"] is String == false){
        return null;
      }
      return rawData["vcard"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set vcard(String? value) {
    rawData["vcard"] = value;
  }


  /// Generated
  ContextInfo get contextinfo {
    try {
      if (rawData["contextInfo"] is Map == false){
        return ContextInfo({}); 
      }
      return ContextInfo(rawData["contextInfo"] as Map);
    } catch (e) {  
      return ContextInfo({}); 
    }
  }


  /// Generated
  set contextinfo(ContextInfo value) {
    rawData["contextInfo"] = value.toJson();
  }



  /// Generated
  static Contact create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "contact",
    String? displayname,
    String? vcard,
      ContextInfo? contextinfo,
})  {
    // Contact contact = Contact({
final Map contact_data_create_json = {
  
      "@type": special_type,
      "displayName": displayname,
      "vcard": vcard,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,


};


          contact_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (contact_data_create_json.containsKey(key) == false) {
          contact_data_create_json[key] = value;
        }
      });
    }
return Contact(contact_data_create_json);


      }
}