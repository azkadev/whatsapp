// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

 
class Sticker extends JsonScheme {

  
  Sticker(super.rawData);
   
  static Map get defaultData {
    return {"@type":"sticker","url":"","fileSha256":"","fileEncSha256":"","mediaKey":"","mimetype":"","height":0,"width":0,"directPath":"","fileLength":"","mediaKeyTimestamp":"","isAnimated":false,"contextInfo":{"@type":"contextInfo","expiration":0,"ephemeralSettingTimestamp":"","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"stickerSentTs":"1686254514962","isAvatar":false};
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

  
  set isanimated(bool? value) {
    rawData["isAnimated"] = value;
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

  
  set stickersentts(String? value) {
    rawData["stickerSentTs"] = value;
  }


  
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

  
  set isavatar(bool? value) {
    rawData["isAvatar"] = value;
  }


  
  static Sticker create({

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
Map sticker_data_create_json = {
  
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
Sticker sticker_data_create = Sticker(sticker_data_create_json);

return sticker_data_create;



      }
}