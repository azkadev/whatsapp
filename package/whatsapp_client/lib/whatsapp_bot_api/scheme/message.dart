// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "user.dart";
import "chat.dart";
import "forward_from_chat.dart";
import "photo.dart";
import "poll.dart";
import "audio.dart";
import "contact.dart";
import "document.dart";
import "sticker.dart";
import "video.dart";

/// Generated 
class Message extends JsonScheme {

  /// Generated
  Message(super.rawData);
  
  /// return default data
  /// 
  static Map get defaultData {
    return {"@type":"message","id":"","from":{"@type":"user","id":"0","first_name":"Ttt","type":"private"},"chat":{"@type":"chat","id":"","first_name":"","type":"private"},"is_group":false,"is_outgoing":true,"date":1686254058,"type":"extendedTextMessage","text":"Dart","is_forward":false,"forward_from_chat":{"@type":"forward_from_chat","id":"","type":""},"photo":{"@type":"photo","url":"","mimetype":"image/jpeg","fileSha256":"","fileLength":"9907","height":244,"width":244,"mediaKey":"","fileEncSha256":"","directPath":"/v/t62.7118-24/.enc?ccb=11-4&oh=-uw&oe=64A98F47","mediaKeyTimestamp":"1686254143","jpegThumbnail":"/9j///2c7Z///////////////Zztn/////////////////////9oACAEBAAE//++//+/ACGL/UDxk3xj2zPGAquBiBo9vABFM+/+NB/rH8P//9oACAECAQE/AAf//9oACAEDAQE/AAf/2Q==","contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"scansSidecar":"65Rc6/Xd/F/9sRX7FBhUtvmfU6OTWJDwxXdkq+kQt73Ce+7v3QJCAg==","scanLengths":[917,5469,2010,1511],"midQualityFileSha256":"1o/Mh6JtHkvlaRbhGWPPoonzJUNU7iLAFLZY6z3NAK4="},"poll":{"@type":"poll","name":"Jjj","options":[{"@type":"poll_option","optionName":"J"}],"selectableOptionsCount":0,"contextInfo":{"@type":"contextInfo","expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}},"audio":{"@type":"audio","url":"","mimetype":"audio/mpeg","fileSha256":"","fileLength":"388702","seconds":12,"ptt":false,"mediaKey":"+n5o=","fileEncSha256":"CvG4V/+=","directPath":"/v/t62.7114-24/.enc?ccb=11-4&oh=-uQ&oe=64A9B93D","mediaKeyTimestamp":"1686254281","contextInfo":{"expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"waveform":"=="},"contact":{"@type":"contact","displayName":"","vcard":"","contextInfo":{"expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}}},"document":{"@type":"document","url":"","mimetype":"image/jpeg","title":"0.jpeg","fileSha256":"=","fileLength":"79735","pageCount":0,"mediaKey":"","fileName":"0.jpeg","fileEncSha256":"","directPath":"","mediaKeyTimestamp":"","contextInfo":{"expiration":0,"ephemeralSettingTimestamp":"","disappearingMode":{"initiator":"INITIATED_BY_ME"}}},"sticker":{"@type":"sticker","url":"","fileSha256":"","fileEncSha256":"","mediaKey":"","mimetype":"","height":0,"width":0,"directPath":"","fileLength":"","mediaKeyTimestamp":"","isAnimated":false,"contextInfo":{"expiration":0,"ephemeralSettingTimestamp":"","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"stickerSentTs":"1686254514962","isAvatar":false},"video":{"@type":"video","url":"","mimetype":"video/mp4","fileSha256":"iU/=","fileLength":"109192","seconds":1,"mediaKey":"=","height":960,"width":720,"fileEncSha256":"riTIeO+UouBo/=","directPath":"/v","mediaKeyTimestamp":"1686254486","jpegThumbnail":"/","contextInfo":{"expiration":604800,"ephemeralSettingTimestamp":"1675329","disappearingMode":{"initiator":"INITIATED_BY_ME"}},"streamingSidecar":""},"isBaileys":true};
  }

  /// check data 
  /// if raw data 
  /// - rawData["@type"] == message
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

  

  /// create [Message]
  /// Empty  
  static Message empty() {
    return Message({});
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

  /// Generated
  set id(String? value) {
    rawData["id"] = value;
  }


  /// Generated
  User get from {
    try {
      if (rawData["from"] is Map == false){
        return User({}); 
      }
      return User(rawData["from"] as Map);
    } catch (e) {  
      return User({}); 
    }
  }


  /// Generated
  set from(User value) {
    rawData["from"] = value.toJson();
  }



  /// Generated
  Chat get chat {
    try {
      if (rawData["chat"] is Map == false){
        return Chat({}); 
      }
      return Chat(rawData["chat"] as Map);
    } catch (e) {  
      return Chat({}); 
    }
  }


  /// Generated
  set chat(Chat value) {
    rawData["chat"] = value.toJson();
  }



  /// Generated
  bool? get is_group {
    try {
      if (rawData["is_group"] is bool == false){
        return null;
      }
      return rawData["is_group"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_group(bool? value) {
    rawData["is_group"] = value;
  }


  /// Generated
  bool? get is_outgoing {
    try {
      if (rawData["is_outgoing"] is bool == false){
        return null;
      }
      return rawData["is_outgoing"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_outgoing(bool? value) {
    rawData["is_outgoing"] = value;
  }


  /// Generated
  num? get date {
    try {
      if (rawData["date"] is num == false){
        return null;
      }
      return rawData["date"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set date(num? value) {
    rawData["date"] = value;
  }


  /// Generated
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

  /// Generated
  set type(String? value) {
    rawData["type"] = value;
  }


  /// Generated
  String? get text {
    try {
      if (rawData["text"] is String == false){
        return null;
      }
      return rawData["text"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set text(String? value) {
    rawData["text"] = value;
  }


  /// Generated
  bool? get is_forward {
    try {
      if (rawData["is_forward"] is bool == false){
        return null;
      }
      return rawData["is_forward"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set is_forward(bool? value) {
    rawData["is_forward"] = value;
  }


  /// Generated
  ForwardFromChat get forward_from_chat {
    try {
      if (rawData["forward_from_chat"] is Map == false){
        return ForwardFromChat({}); 
      }
      return ForwardFromChat(rawData["forward_from_chat"] as Map);
    } catch (e) {  
      return ForwardFromChat({}); 
    }
  }


  /// Generated
  set forward_from_chat(ForwardFromChat value) {
    rawData["forward_from_chat"] = value.toJson();
  }



  /// Generated
  Photo get photo {
    try {
      if (rawData["photo"] is Map == false){
        return Photo({}); 
      }
      return Photo(rawData["photo"] as Map);
    } catch (e) {  
      return Photo({}); 
    }
  }


  /// Generated
  set photo(Photo value) {
    rawData["photo"] = value.toJson();
  }



  /// Generated
  Poll get poll {
    try {
      if (rawData["poll"] is Map == false){
        return Poll({}); 
      }
      return Poll(rawData["poll"] as Map);
    } catch (e) {  
      return Poll({}); 
    }
  }


  /// Generated
  set poll(Poll value) {
    rawData["poll"] = value.toJson();
  }



  /// Generated
  Audio get audio {
    try {
      if (rawData["audio"] is Map == false){
        return Audio({}); 
      }
      return Audio(rawData["audio"] as Map);
    } catch (e) {  
      return Audio({}); 
    }
  }


  /// Generated
  set audio(Audio value) {
    rawData["audio"] = value.toJson();
  }



  /// Generated
  Contact get contact {
    try {
      if (rawData["contact"] is Map == false){
        return Contact({}); 
      }
      return Contact(rawData["contact"] as Map);
    } catch (e) {  
      return Contact({}); 
    }
  }


  /// Generated
  set contact(Contact value) {
    rawData["contact"] = value.toJson();
  }



  /// Generated
  Document get document {
    try {
      if (rawData["document"] is Map == false){
        return Document({}); 
      }
      return Document(rawData["document"] as Map);
    } catch (e) {  
      return Document({}); 
    }
  }


  /// Generated
  set document(Document value) {
    rawData["document"] = value.toJson();
  }



  /// Generated
  Sticker get sticker {
    try {
      if (rawData["sticker"] is Map == false){
        return Sticker({}); 
      }
      return Sticker(rawData["sticker"] as Map);
    } catch (e) {  
      return Sticker({}); 
    }
  }


  /// Generated
  set sticker(Sticker value) {
    rawData["sticker"] = value.toJson();
  }



  /// Generated
  Video get video {
    try {
      if (rawData["video"] is Map == false){
        return Video({}); 
      }
      return Video(rawData["video"] as Map);
    } catch (e) {  
      return Video({}); 
    }
  }


  /// Generated
  set video(Video value) {
    rawData["video"] = value.toJson();
  }



  /// Generated
  bool? get isbaileys {
    try {
      if (rawData["isBaileys"] is bool == false){
        return null;
      }
      return rawData["isBaileys"] as bool;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set isbaileys(bool? value) {
    rawData["isBaileys"] = value;
  }


  /// Generated
  static Message create({
              bool schemeUtilsIsSetDefaultData = false,

    String special_type = "message",
    String? id,
      User? from,
      Chat? chat,
    bool? is_group,
    bool? is_outgoing,
    num? date,
    String? type,
    String? text,
    bool? is_forward,
      ForwardFromChat? forward_from_chat,
      Photo? photo,
      Poll? poll,
      Audio? audio,
      Contact? contact,
      Document? document,
      Sticker? sticker,
      Video? video,
    bool? isbaileys,
})  {
    // Message message = Message({
final Map message_data_create_json = {
  
      "@type": special_type,
      "id": id,
      "from": (from != null)?from.toJson(): null,
      "chat": (chat != null)?chat.toJson(): null,
      "is_group": is_group,
      "is_outgoing": is_outgoing,
      "date": date,
      "type": type,
      "text": text,
      "is_forward": is_forward,
      "forward_from_chat": (forward_from_chat != null)?forward_from_chat.toJson(): null,
      "photo": (photo != null)?photo.toJson(): null,
      "poll": (poll != null)?poll.toJson(): null,
      "audio": (audio != null)?audio.toJson(): null,
      "contact": (contact != null)?contact.toJson(): null,
      "document": (document != null)?document.toJson(): null,
      "sticker": (sticker != null)?sticker.toJson(): null,
      "video": (video != null)?video.toJson(): null,
      "isBaileys": isbaileys,


};


          message_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (message_data_create_json.containsKey(key) == false) {
          message_data_create_json[key] = value;
        }
      });
    }
return Message(message_data_create_json);


      }
}