// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "poll_option.dart";
import "context_info.dart";

/// Generated 
class Poll extends JsonScheme {

  /// Generated
  Poll(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"poll","name":"Jjj","options":[{"@type":"poll_option","optionName":"J"}],"selectableOptionsCount":0,"contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == poll
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

  

  /// create [Poll]
  /// Empty  
  static Poll empty() {
    return Poll({});
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
  String? get name {
    try {
      if (rawData["name"] is String == false){
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set name(String? value) {
    rawData["name"] = value;
  }

  /// Generated
  List<PollOption> get options {
    try {
      if (rawData["options"] is List == false){
        return [];
      }
      return (rawData["options"] as List).map((e) => PollOption(e as Map)).toList().cast<PollOption>();
    } catch (e) {
      return [];
    }
  }


  /// Generated
  set options(List<PollOption> values) {
    rawData["options"] = values.map((value) => value.toJson()).toList();
  }



  /// Generated
  num? get selectableoptionscount {
    try {
      if (rawData["selectableOptionsCount"] is num == false){
        return null;
      }
      return rawData["selectableOptionsCount"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set selectableoptionscount(num? value) {
    rawData["selectableOptionsCount"] = value;
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
  static Poll create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "poll",
    String? name,
      List<PollOption>? options,
    num? selectableoptionscount,
      ContextInfo? contextinfo,
})  {
    // Poll poll = Poll({
final Map poll_data_create_json = {
  
      "@type": special_type,
      "name": name,
      "options": (options != null)? options.toJson(): null,
      "selectableOptionsCount": selectableoptionscount,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,


};


          poll_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (poll_data_create_json.containsKey(key) == false) {
          poll_data_create_json[key] = value;
        }
      });
    }
return Poll(poll_data_create_json);


      }
}