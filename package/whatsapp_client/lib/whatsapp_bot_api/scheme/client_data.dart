// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";


 
class ClientData extends JsonScheme {

  
  ClientData(super.rawData);
   
  static Map get defaultData {
    return {"@type":"clientData","id":"","name":""};
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

  
  set name(String? value) {
    rawData["name"] = value;
  }


  
  static ClientData create({

    String special_type = "clientData",
    String? id,
    String? name,
})  {
    // ClientData clientData = ClientData({
Map clientData_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "name": name,


};


          clientData_data_create_json.removeWhere((key, value) => value == null);
ClientData clientData_data_create = ClientData(clientData_data_create_json);

return clientData_data_create;



      }
}