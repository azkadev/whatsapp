// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

 
class Contact extends JsonScheme {

  
  Contact(super.rawData);
   
  static Map get defaultData {
    return {"@type":"contact","displayName":"","vcard":"","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}};
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

  
  set displayname(String? value) {
    rawData["displayName"] = value;
  }


  
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

  
  set vcard(String? value) {
    rawData["vcard"] = value;
  }


  
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


  
  set contextinfo(ContextInfo value) {
    rawData["contextInfo"] = value.toJson();
  }



  
  static Contact create({

    String special_type = "contact",
    String? displayname,
    String? vcard,
      ContextInfo? contextinfo,
})  {
    // Contact contact = Contact({
Map contact_data_create_json = {
  
      "@type": special_type,
      "displayName": displayname,
      "vcard": vcard,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,


};


          contact_data_create_json.removeWhere((key, value) => value == null);
Contact contact_data_create = Contact(contact_data_create_json);

return contact_data_create;



      }
}