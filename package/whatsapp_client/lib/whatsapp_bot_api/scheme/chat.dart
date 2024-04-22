// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class Chat extends JsonScheme {

  
  Chat(super.rawData);
   
  static Map get defaultData {
    return {"@type":"chat","id":"","first_name":"","type":"private"};
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


  
  String? get id {
    try {
      if (rawData["id"] is String == false){
        return null;
      }
      return rawData["id"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set id(String? value) {
    rawData["id"] = value;
  }


  
  String? get first_name {
    try {
      if (rawData["first_name"] is String == false){
        return null;
      }
      return rawData["first_name"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set first_name(String? value) {
    rawData["first_name"] = value;
  }


  
  String? get type {
    try {
      if (rawData["type"] is String == false){
        return null;
      }
      return rawData["type"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set type(String? value) {
    rawData["type"] = value;
  }


  
  static Chat create({

    String special_type = "chat",
    String? id,
    String? first_name,
    String? type,
})  {
    // Chat chat = Chat({
Map chat_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "first_name": first_name,
      "type": type,


};


          chat_data_create_json.removeWhere((key, value) => value == null);
Chat chat_data_create = Chat(chat_data_create_json);

return chat_data_create;



      }
}