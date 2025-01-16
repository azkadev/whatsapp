// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated 
class Video extends JsonScheme {

  /// Generated
  Video(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"video","url":"","mimetype":"video/mp4","fileSha256":"iU/=","fileLength":"109192","seconds":1,"mediaKey":"=","height":960,"width":720,"fileEncSha256":"riTIeO+UouBo/=","directPath":"/v","mediaKeyTimestamp":"1686254486","jpegThumbnail":"/","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"streamingSidecar":""};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == video
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

  

  /// create [Video]
  /// Empty  
  static Video empty() {
    return Video({});
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
  num? get seconds {
    try {
      if (rawData["seconds"] is num == false){
        return null;
      }
      return rawData["seconds"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set seconds(num? value) {
    rawData["seconds"] = value;
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
  String? get streamingsidecar {
    try {
      if (rawData["streamingSidecar"] is String == false){
        return null;
      }
      return rawData["streamingSidecar"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set streamingsidecar(String? value) {
    rawData["streamingSidecar"] = value;
  }


  /// Generated
  static Video create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "video",
    String? url,
    String? mimetype,
    String? filesha256,
    String? filelength,
    num? seconds,
    String? mediakey,
    num? height,
    num? width,
    String? fileencsha256,
    String? directpath,
    String? mediakeytimestamp,
    String? jpegthumbnail,
      ContextInfo? contextinfo,
    String? streamingsidecar,
})  {
    // Video video = Video({
final Map video_data_create_json = {
  
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": filesha256,
      "fileLength": filelength,
      "seconds": seconds,
      "mediaKey": mediakey,
      "height": height,
      "width": width,
      "fileEncSha256": fileencsha256,
      "directPath": directpath,
      "mediaKeyTimestamp": mediakeytimestamp,
      "jpegThumbnail": jpegthumbnail,
      "contextInfo": (contextinfo != null)?contextinfo.toJson(): null,
      "streamingSidecar": streamingsidecar,


};


          video_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (video_data_create_json.containsKey(key) == false) {
          video_data_create_json[key] = value;
        }
      });
    }
return Video(video_data_create_json);


      }
}