// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class PollOption extends JsonScheme {

  
  PollOption(super.rawData);
   
  static Map get defaultData {
    return {"@type":"poll_option","optionName":"J"};
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


  
  String? get optionname {
    try {
      if (rawData["optionName"] is String == false){
        return null;
      }
      return rawData["optionName"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set optionname(String? value) {
    rawData["optionName"] = value;
  }


  
  static PollOption create({

    String special_type = "poll_option",
    String? optionname,
})  {
    // PollOption pollOption = PollOption({
Map pollOption_data_create_json = {
  
      "@type": special_type,
      "optionName": optionname,


};


          pollOption_data_create_json.removeWhere((key, value) => value == null);
PollOption pollOption_data_create = PollOption(pollOption_data_create_json);

return pollOption_data_create;



      }
}