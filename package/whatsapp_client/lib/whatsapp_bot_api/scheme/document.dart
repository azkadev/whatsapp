// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Document extends JsonScheme {
  Document(super.rawData);

  static Map get defaultData {
    return {
      "@type": "document",
      "url": "",
      "mimetype": "image/jpeg",
      "title": "0.jpeg",
      "fileSha256": "=",
      "fileLength": "79735",
      "pageCount": 0,
      "mediaKey": "",
      "fileName": "0.jpeg",
      "fileEncSha256": "",
      "directPath": "",
      "mediaKeyTimestamp": "",
      "contextInfo": {
        "@type": "contextInfo",
        "expiration": 0,
        "ephemeralSettingTimestamp": "",
        "disappearingMode": {"initiator": "INITIATED_BY_ME"}
      }
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

  String? get title {
    try {
      if (rawData["title"] is String == false) {
        return null;
      }
      return rawData["title"] as String;
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

  num? get pageCount {
    try {
      if (rawData["pageCount"] is num == false) {
        return null;
      }
      return rawData["pageCount"] as num;
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

  String? get fileName {
    try {
      if (rawData["fileName"] is String == false) {
        return null;
      }
      return rawData["fileName"] as String;
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

  static Document create({
    String special_type = "document",
    String? url,
    String? mimetype,
    String? title,
    String? fileSha256,
    String? fileLength,
    num? pageCount,
    String? mediaKey,
    String? fileName,
    String? fileEncSha256,
    String? directPath,
    String? mediaKeyTimestamp,
    ContextInfo? contextInfo,
  }) {
    // Document document = Document({
    Map document_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "title": title,
      "fileSha256": fileSha256,
      "fileLength": fileLength,
      "pageCount": pageCount,
      "mediaKey": mediaKey,
      "fileName": fileName,
      "fileEncSha256": fileEncSha256,
      "directPath": directPath,
      "mediaKeyTimestamp": mediaKeyTimestamp,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
    };

    document_data_create_json.removeWhere((key, value) => value == null);
    Document document_data_create = Document(document_data_create_json);

    return document_data_create;
  }
}
