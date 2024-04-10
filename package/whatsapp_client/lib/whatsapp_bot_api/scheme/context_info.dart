/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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