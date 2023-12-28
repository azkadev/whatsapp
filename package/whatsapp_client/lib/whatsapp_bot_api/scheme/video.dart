// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Video extends JsonScheme {
  Video(super.rawData);

  static Map get defaultData {
    return {
      "@type": "video",
      "url": "",
      "mimetype": "video/mp4",
      "fileSha256": "iU/=",
      "fileLength": "109192",
      "seconds": 1,
      "mediaKey": "=",
      "height": 960,
      "width": 720,
      "fileEncSha256": "riTIeO+UouBo/=",
      "directPath": "/v",
      "mediaKeyTimestamp": "1686254486",
      "jpegThumbnail": "/",
      "contextInfo": {
        "@type": "contextInfo",
        "expiration": 604800,
        "ephemeralSettingTimestamp": "1675329",
        "disappearingMode": {"initiator": "INITIATED_BY_ME"}
      },
      "streamingSidecar": ""
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

  num? get seconds {
    try {
      if (rawData["seconds"] is num == false) {
        return null;
      }
      return rawData["seconds"] as num;
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

  String? get streamingSidecar {
    try {
      if (rawData["streamingSidecar"] is String == false) {
        return null;
      }
      return rawData["streamingSidecar"] as String;
    } catch (e) {
      return null;
    }
  }

  static Video create({
    String special_type = "video",
    String? url,
    String? mimetype,
    String? fileSha256,
    String? fileLength,
    num? seconds,
    String? mediaKey,
    num? height,
    num? width,
    String? fileEncSha256,
    String? directPath,
    String? mediaKeyTimestamp,
    String? jpegThumbnail,
    ContextInfo? contextInfo,
    String? streamingSidecar,
  }) {
    // Video video = Video({
    Map video_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "fileSha256": fileSha256,
      "fileLength": fileLength,
      "seconds": seconds,
      "mediaKey": mediaKey,
      "height": height,
      "width": width,
      "fileEncSha256": fileEncSha256,
      "directPath": directPath,
      "mediaKeyTimestamp": mediaKeyTimestamp,
      "jpegThumbnail": jpegThumbnail,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
      "streamingSidecar": streamingSidecar,
    };

    video_data_create_json.removeWhere((key, value) => value == null);
    Video video_data_create = Video(video_data_create_json);

    return video_data_create;
  }
}
