/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "poll_option.dart";
import "context_info.dart";

 
class Poll extends JsonScheme {

  
  Poll(super.rawData);
   
  static Map get defaultData {
    return {"@type":"poll","name":"Jjj","options":[{"@type":"poll_option","optionName":"J"}],"selectableOptionsCount":0,"contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}};
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


  
  set options(List<PollOption> values) {
    rawData["options"] = values.map((value) => value.toJson()).toList();
  }



  
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

  
  set selectableoptionscount(num? value) {
    rawData["selectableOptionsCount"] = value;
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



  
  static Poll create({

    String special_type = "poll",
    String? name,
      List<PollOption>? options,
    num? selectableoptionscount,
      ContextInfo? contextinfo,
})  {
    // Poll poll = Poll({
Map poll_data_create_json = {
  
      "@type": special_type,
      "name": name,
      "options": (options != null)? options.toJson(): null,
      "selectableOptionsCount": selectableoptionscount,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,


};


          poll_data_create_json.removeWhere((key, value) => value == null);
Poll poll_data_create = Poll(poll_data_create_json);

return poll_data_create;



      }
}