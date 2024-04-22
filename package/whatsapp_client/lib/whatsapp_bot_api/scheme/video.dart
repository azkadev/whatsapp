// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

 
class Video extends JsonScheme {

  
  Video(super.rawData);
   
  static Map get defaultData {
    return {"@type":"video","url":"","mimetype":"video/mp4","fileSha256":"iU/=","fileLength":"109192","seconds":1,"mediaKey":"=","height":960,"width":720,"fileEncSha256":"riTIeO+UouBo/=","directPath":"/v","mediaKeyTimestamp":"1686254486","jpegThumbnail":"/","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"streamingSidecar":""};
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

  
  set seconds(num? value) {
    rawData["seconds"] = value;
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

  
  set streamingsidecar(String? value) {
    rawData["streamingSidecar"] = value;
  }


  
  static Video create({

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
Map video_data_create_json = {
  
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
Video video_data_create = Video(video_data_create_json);

return video_data_create;



      }
}