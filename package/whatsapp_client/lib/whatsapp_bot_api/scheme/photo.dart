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

import "context_info.dart";

 
class Photo extends JsonScheme {

  
  Photo(super.rawData);
   
  static Map get defaultData {
    return {"@type":"photo","url":"","mimetype":"image/jpeg","fileSha256":"","fileLength":"9907","height":244,"width":244,"mediaKey":"","fileEncSha256":"","directPath":"/v/t62.7118-24/.enc?ccb=11-4&oh=-uw&oe=64A98F47","mediaKeyTimestamp":"1686254143","jpegThumbnail":"/9j///2c7Z///////////////Zztn/////////////////////9oACAEBAAE//++//+/ACGL/UDxk3xj2zPGAquBiBo9vABFM+/+NB/rH8P//9oACAECAQE/AAf//9oACAEDAQE/AAf/2Q==","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"scansSidecar":"65Rc6/Xd/F/9sRX7FBhUtvmfU6OTWJDwxXdkq+kQt73Ce+7v3QJCAg==","scanLengths":[917,5469,2010,1511],"midQualityFileSha256":"1o/Mh6JtHkvlaRbhGWPPoonzJUNU7iLAFLZY6z3NAK4="};
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


  
  String? get url {
    try {
      if (rawData["url"] is String == false){
        return null;
      }
      return rawData["url"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set url(String? value) {
    rawData["url"] = value;
  }


  
  String? get mimetype {
    try {
      if (rawData["mimetype"] is String == false){
        return null;
      }
      return rawData["mimetype"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set mimetype(String? value) {
    rawData["mimetype"] = value;
  }


  
  String? get filesha256 {
    try {
      if (rawData["fileSha256"] is String == false){
        return null;
      }
      return rawData["fileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set filesha256(String? value) {
    rawData["fileSha256"] = value;
  }


  
  String? get filelength {
    try {
      if (rawData["fileLength"] is String == false){
        return null;
      }
      return rawData["fileLength"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set filelength(String? value) {
    rawData["fileLength"] = value;
  }


  
  num? get height {
    try {
      if (rawData["height"] is num == false){
        return null;
      }
      return rawData["height"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set height(num? value) {
    rawData["height"] = value;
  }


  
  num? get width {
    try {
      if (rawData["width"] is num == false){
        return null;
      }
      return rawData["width"] as num;
    } catch (e) {
      return null;
    }
  }

  
  set width(num? value) {
    rawData["width"] = value;
  }


  
  String? get mediakey {
    try {
      if (rawData["mediaKey"] is String == false){
        return null;
      }
      return rawData["mediaKey"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set mediakey(String? value) {
    rawData["mediaKey"] = value;
  }


  
  String? get fileencsha256 {
    try {
      if (rawData["fileEncSha256"] is String == false){
        return null;
      }
      return rawData["fileEncSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set fileencsha256(String? value) {
    rawData["fileEncSha256"] = value;
  }


  
  String? get directpath {
    try {
      if (rawData["directPath"] is String == false){
        return null;
      }
      return rawData["directPath"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set directpath(String? value) {
    rawData["directPath"] = value;
  }


  
  String? get mediakeytimestamp {
    try {
      if (rawData["mediaKeyTimestamp"] is String == false){
        return null;
      }
      return rawData["mediaKeyTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set mediakeytimestamp(String? value) {
    rawData["mediaKeyTimestamp"] = value;
  }


  
  String? get jpegthumbnail {
    try {
      if (rawData["jpegThumbnail"] is String == false){
        return null;
      }
      return rawData["jpegThumbnail"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set jpegthumbnail(String? value) {
    rawData["jpegThumbnail"] = value;
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



  
  String? get scanssidecar {
    try {
      if (rawData["scansSidecar"] is String == false){
        return null;
      }
      return rawData["scansSidecar"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set scanssidecar(String? value) {
    rawData["scansSidecar"] = value;
  }


  
  List<num> get scanlengths {
    try {
      if (rawData["scanLengths"] is List == false){
        return [];
      }
      return (rawData["scanLengths"] as List).cast<num>();
    } catch (e) {
      return [];
    }
  }


  
  set scanlengths(List<num> value) {
    rawData["scanLengths"] = value;
  }


  
  String? get midqualityfilesha256 {
    try {
      if (rawData["midQualityFileSha256"] is String == false){
        return null;
      }
      return rawData["midQualityFileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  
  set midqualityfilesha256(String? value) {
    rawData["midQualityFileSha256"] = value;
  }


  
  static Photo create({

    String special_type = "photo",
    String? url,
    String? mimetype,
    String? filesha256,
    String? filelength,
    num? height,
    num? width,
    String? mediakey,
    String? fileencsha256,
    String? directpath,
    String? mediakeytimestamp,
    String? jpegthumbnail,
      ContextInfo? contextinfo,
    String? scanssidecar,
      List<num>? scanlengths,
    String? midqualityfilesha256,
})  {
    // Photo photo = Photo({
Map photo_data_create_json = {
  
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": filesha256,
      "fileLength": filelength,
      "height": height,
      "width": width,
      "mediaKey": mediakey,
      "fileEncSha256": fileencsha256,
      "directPath": directpath,
      "mediaKeyTimestamp": mediakeytimestamp,
      "jpegThumbnail": jpegthumbnail,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,
      "scansSidecar": scanssidecar,
      "scanLengths": scanlengths,
      "midQualityFileSha256": midqualityfilesha256,


};


          photo_data_create_json.removeWhere((key, value) => value == null);
Photo photo_data_create = Photo(photo_data_create_json);

return photo_data_create;



      }
}