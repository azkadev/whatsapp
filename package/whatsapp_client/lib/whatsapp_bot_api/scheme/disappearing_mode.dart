// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class DisappearingMode extends JsonScheme {

  
  DisappearingMode(super.rawData);
   
  static Map get defaultData {
    return {"@type":"disappearingMode","initiator":"INITIATED_BY_ME"};
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


  
  String? get initiator {
    try {
      if (rawData["initiator"] is String == false){
        return null;
      }
      return rawData["initiator"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set initiator(String? value) {
    rawData["initiator"] = value;
  }


  
  static DisappearingMode create({

    String special_type = "disappearingMode",
    String? initiator,
})  {
    // DisappearingMode disappearingMode = DisappearingMode({
Map disappearingMode_data_create_json = {
  
      "@type": special_type,
      "initiator": initiator,


};


          disappearingMode_data_create_json.removeWhere((key, value) => value == null);
DisappearingMode disappearingMode_data_create = DisappearingMode(disappearingMode_data_create_json);

return disappearingMode_data_create;



      }
}