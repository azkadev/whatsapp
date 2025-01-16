// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated 
class Photo extends JsonScheme {

  /// Generated
  Photo(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"photo","url":"","mimetype":"image/jpeg","fileSha256":"","fileLength":"9907","height":244,"width":244,"mediaKey":"","fileEncSha256":"","directPath":"/v/t62.7118-24/.enc?ccb=11-4&oh=-uw&oe=64A98F47","mediaKeyTimestamp":"1686254143","jpegThumbnail":"/9j///2c7Z///////////////Zztn/////////////////////9oACAEBAAE//++//+/ACGL/UDxk3xj2zPGAquBiBo9vABFM+/+NB/rH8P//9oACAECAQE/AAf//9oACAEDAQE/AAf/2Q==","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"scansSidecar":"65Rc6/Xd/F/9sRX7FBhUtvmfU6OTWJDwxXdkq+kQt73Ce+7v3QJCAg==","scanLengths":[917,5469,2010,1511],"midQualityFileSha256":"1o/Mh6JtHkvlaRbhGWPPoonzJUNU7iLAFLZY6z3NAK4="};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == photo
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

  

  /// create [Photo]
  /// Empty  
  static Photo empty() {
    return Photo({});
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

  /// Generated
  set url(String? value) {
    rawData["url"] = value;
  }


  /// Generated
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

  /// Generated
  set mimetype(String? value) {
    rawData["mimetype"] = value;
  }


  /// Generated
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

  /// Generated
  set filesha256(String? value) {
    rawData["fileSha256"] = value;
  }


  /// Generated
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

  /// Generated
  set filelength(String? value) {
    rawData["fileLength"] = value;
  }


  /// Generated
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

  /// Generated
  set height(num? value) {
    rawData["height"] = value;
  }


  /// Generated
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

  /// Generated
  set width(num? value) {
    rawData["width"] = value;
  }


  /// Generated
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

  /// Generated
  set mediakey(String? value) {
    rawData["mediaKey"] = value;
  }


  /// Generated
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

  /// Generated
  set fileencsha256(String? value) {
    rawData["fileEncSha256"] = value;
  }


  /// Generated
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

  /// Generated
  set directpath(String? value) {
    rawData["directPath"] = value;
  }


  /// Generated
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

  /// Generated
  set mediakeytimestamp(String? value) {
    rawData["mediaKeyTimestamp"] = value;
  }


  /// Generated
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

  /// Generated
  set jpegthumbnail(String? value) {
    rawData["jpegThumbnail"] = value;
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

  /// Generated
  set scanssidecar(String? value) {
    rawData["scansSidecar"] = value;
  }


  /// Generated
  ///
  /// default:
  /// 
  /// 
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


  /// Generated
  set scanlengths(List<num> value) {
    rawData["scanLengths"] = value;
  }


  /// Generated
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

  /// Generated
  set midqualityfilesha256(String? value) {
    rawData["midQualityFileSha256"] = value;
  }


  /// Generated
  static Photo create({
              bool schemeUtilsIsSetDefaultData = false,

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
final Map photo_data_create_json = {
  
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

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (photo_data_create_json.containsKey(key) == false) {
          photo_data_create_json[key] = value;
        }
      });
    }
return Photo(photo_data_create_json);


      }
}