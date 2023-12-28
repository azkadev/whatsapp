// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Photo extends JsonScheme {
  Photo(super.rawData);

  static Map get defaultData {
    return {
      "@type": "photo",
      "url": "",
      "mimetype": "image/jpeg",
      "fileSha256": "",
      "fileLength": "9907",
      "height": 244,
      "width": 244,
      "mediaKey": "",
      "fileEncSha256": "",
      "directPath": "/v/t62.7118-24/.enc?ccb=11-4&oh=-uw&oe=64A98F47",
      "mediaKeyTimestamp": "1686254143",
      "jpegThumbnail":
          "/9j///2c7Z///////////////Zztn/////////////////////9oACAEBAAE//++//+/ACGL/UDxk3xj2zPGAquBiBo9vABFM+/+NB/rH8P//9oACAECAQE/AAf//9oACAEDAQE/AAf/2Q==",
      "contextInfo": {
        "@type": "contextInfo",
        "expiration": 604800,
        "ephemeralSettingTimestamp": "1675329",
        "disappearingMode": {"initiator": "INITIATED_BY_ME"}
      },
      "scansSidecar":
          "65Rc6/Xd/F/9sRX7FBhUtvmfU6OTWJDwxXdkq+kQt73Ce+7v3QJCAg==",
      "scanLengths": [917, 5469, 2010, 1511],
      "midQualityFileSha256": "1o/Mh6JtHkvlaRbhGWPPoonzJUNU7iLAFLZY6z3NAK4="
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get url {
    try {
      if (rawData["url"] is String == false) {
        return null;
      }
      return rawData["url"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get mimetype {
    try {
      if (rawData["mimetype"] is String == false) {
        return null;
      }
      return rawData["mimetype"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileSha256 {
    try {
      if (rawData["fileSha256"] is String == false) {
        return null;
      }
      return rawData["fileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileLength {
    try {
      if (rawData["fileLength"] is String == false) {
        return null;
      }
      return rawData["fileLength"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get height {
    try {
      if (rawData["height"] is num == false) {
        return null;
      }
      return rawData["height"] as num;
    } catch (e) {
      return null;
    }
  }

  num? get width {
    try {
      if (rawData["width"] is num == false) {
        return null;
      }
      return rawData["width"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get mediaKey {
    try {
      if (rawData["mediaKey"] is String == false) {
        return null;
      }
      return rawData["mediaKey"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get fileEncSha256 {
    try {
      if (rawData["fileEncSha256"] is String == false) {
        return null;
      }
      return rawData["fileEncSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get directPath {
    try {
      if (rawData["directPath"] is String == false) {
        return null;
      }
      return rawData["directPath"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get mediaKeyTimestamp {
    try {
      if (rawData["mediaKeyTimestamp"] is String == false) {
        return null;
      }
      return rawData["mediaKeyTimestamp"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get jpegThumbnail {
    try {
      if (rawData["jpegThumbnail"] is String == false) {
        return null;
      }
      return rawData["jpegThumbnail"] as String;
    } catch (e) {
      return null;
    }
  }

  ContextInfo get contextInfo {
    try {
      if (rawData["contextInfo"] is Map == false) {
        return ContextInfo({});
      }
      return ContextInfo(rawData["contextInfo"] as Map);
    } catch (e) {
      return ContextInfo({});
    }
  }

  String? get scansSidecar {
    try {
      if (rawData["scansSidecar"] is String == false) {
        return null;
      }
      return rawData["scansSidecar"] as String;
    } catch (e) {
      return null;
    }
  }

  List<num> get scanLengths {
    try {
      if (rawData["scanLengths"] is List == false) {
        return [];
      }
      return (rawData["scanLengths"] as List).cast<num>();
    } catch (e) {
      return [];
    }
  }

  String? get midQualityFileSha256 {
    try {
      if (rawData["midQualityFileSha256"] is String == false) {
        return null;
      }
      return rawData["midQualityFileSha256"] as String;
    } catch (e) {
      return null;
    }
  }

  static Photo create({
    String special_type = "photo",
    String? url,
    String? mimetype,
    String? fileSha256,
    String? fileLength,
    num? height,
    num? width,
    String? mediaKey,
    String? fileEncSha256,
    String? directPath,
    String? mediaKeyTimestamp,
    String? jpegThumbnail,
    ContextInfo? contextInfo,
    String? scansSidecar,
    List<num>? scanLengths,
    String? midQualityFileSha256,
  }) {
    // Photo photo = Photo({
    Map photo_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": fileSha256,
      "fileLength": fileLength,
      "height": height,
      "width": width,
      "mediaKey": mediaKey,
      "fileEncSha256": fileEncSha256,
      "directPath": directPath,
      "mediaKeyTimestamp": mediaKeyTimestamp,
      "jpegThumbnail": jpegThumbnail,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
      "scansSidecar": scansSidecar,
      "scanLengths": scanLengths,
      "midQualityFileSha256": midQualityFileSha256,
    };

    photo_data_create_json.removeWhere((key, value) => value == null);
    Photo photo_data_create = Photo(photo_data_create_json);

    return photo_data_create;
  }
}
