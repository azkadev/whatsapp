// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "context_info.dart";

/// Generated
class Document extends JsonScheme {
  /// Generated
  Document(super.rawData);

  /// return default data
  ///
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

  /// check data
  /// if raw data
  /// - rawData["@type"] == document
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

  /// create [Document]
  /// Empty
  static Document empty() {
    return Document({});
  }

  /// Generated
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

  /// Generated
  set special_type(String? value) {
    rawData["@type"] = value;
  }

  /// Generated
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

  /// Generated
  set url(String? value) {
    rawData["url"] = value;
  }

  /// Generated
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

  /// Generated
  set mimetype(String? value) {
    rawData["mimetype"] = value;
  }

  /// Generated
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

  /// Generated
  set title(String? value) {
    rawData["title"] = value;
  }

  /// Generated
  String? get filesha256 {
    try {
      if (rawData["fileSha256"] is String == false) {
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
      if (rawData["fileLength"] is String == false) {
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
  num? get pagecount {
    try {
      if (rawData["pageCount"] is num == false) {
        return null;
      }
      return rawData["pageCount"] as num;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set pagecount(num? value) {
    rawData["pageCount"] = value;
  }

  /// Generated
  String? get mediakey {
    try {
      if (rawData["mediaKey"] is String == false) {
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
  String? get filename {
    try {
      if (rawData["fileName"] is String == false) {
        return null;
      }
      return rawData["fileName"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set filename(String? value) {
    rawData["fileName"] = value;
  }

  /// Generated
  String? get fileencsha256 {
    try {
      if (rawData["fileEncSha256"] is String == false) {
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
      if (rawData["directPath"] is String == false) {
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
      if (rawData["mediaKeyTimestamp"] is String == false) {
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
  ContextInfo get contextinfo {
    try {
      if (rawData["contextInfo"] is Map == false) {
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
  static Document create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "document",
    String? url,
    String? mimetype,
    String? title,
    String? filesha256,
    String? filelength,
    num? pagecount,
    String? mediakey,
    String? filename,
    String? fileencsha256,
    String? directpath,
    String? mediakeytimestamp,
    ContextInfo? contextinfo,
  }) {
    // Document document = Document({
    final Map document_data_create_json = {
      "@type": special_type,
      "url": url,
      "mimetype": mimetype,
      "title": title,
      "fileSha256": filesha256,
      "fileLength": filelength,
      "pageCount": pagecount,
      "mediaKey": mediakey,
      "fileName": filename,
      "fileEncSha256": fileencsha256,
      "directPath": directpath,
      "mediaKeyTimestamp": mediakeytimestamp,
      "contextInfo": (contextinfo != null) ? contextinfo.toJson() : null,
    };

    document_data_create_json.removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (document_data_create_json.containsKey(key) == false) {
          document_data_create_json[key] = value;
        }
      });
    }
    return Document(document_data_create_json);
  }
}
