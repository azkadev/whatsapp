// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated 
class Sticker extends JsonScheme {

  /// Generated
  Sticker(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"sticker","url":"","fileSha256":"","fileEncSha256":"","mediaKey":"","mimetype":"","height":0,"width":0,"directPath":"","fileLength":"","mediaKeyTimestamp":"","isAnimated":false,"contextInfo":{"@type":"contextInfo","expiration":0,"ephemeralSettingTimestamp":"","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"stickerSentTs":"1686254514962","isAvatar":false};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == sticker
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

  

  /// create [Sticker]
  /// Empty  
  static Sticker empty() {
    return Sticker({});
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
  bool? get isanimated {
    try {
      if (rawData["isAnimated"] is bool == false){
        return null;
      }
      return rawData["isAnimated"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set isanimated(bool? value) {
    rawData["isAnimated"] = value;
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
  String? get stickersentts {
    try {
      if (rawData["stickerSentTs"] is String == false){
        return null;
      }
      return rawData["stickerSentTs"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set stickersentts(String? value) {
    rawData["stickerSentTs"] = value;
  }


  /// Generated
  bool? get isavatar {
    try {
      if (rawData["isAvatar"] is bool == false){
        return null;
      }
      return rawData["isAvatar"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set isavatar(bool? value) {
    rawData["isAvatar"] = value;
  }


  /// Generated
  static Sticker create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "sticker",
    String? url,
    String? filesha256,
    String? fileencsha256,
    String? mediakey,
    String? mimetype,
    num? height,
    num? width,
    String? directpath,
    String? filelength,
    String? mediakeytimestamp,
    bool? isanimated,
      ContextInfo? contextinfo,
    String? stickersentts,
    bool? isavatar,
})  {
    // Sticker sticker = Sticker({
final Map sticker_data_create_json = {
  
      "@type": special_type,
      "url": url,
      "fileSha256": filesha256,
      "fileEncSha256": fileencsha256,
      "mediaKey": mediakey,
      "mimetype": mimetype,
      "height": height,
      "width": width,
      "directPath": directpath,
      "fileLength": filelength,
      "mediaKeyTimestamp": mediakeytimestamp,
      "isAnimated": isanimated,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,
      "stickerSentTs": stickersentts,
      "isAvatar": isavatar,


};


          sticker_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (sticker_data_create_json.containsKey(key) == false) {
          sticker_data_create_json[key] = value;
        }
      });
    }
return Sticker(sticker_data_create_json);


      }
}