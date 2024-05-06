/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
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

  set special_type(String? value) {
    rawData["@type"] = value;
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

  set url(String? value) {
    rawData["url"] = value;
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

  set mimetype(String? value) {
    rawData["mimetype"] = value;
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

  set title(String? value) {
    rawData["title"] = value;
  }

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

  set filesha256(String? value) {
    rawData["fileSha256"] = value;
  }

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

  set filelength(String? value) {
    rawData["fileLength"] = value;
  }

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

  set pagecount(num? value) {
    rawData["pageCount"] = value;
  }

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

  set mediakey(String? value) {
    rawData["mediaKey"] = value;
  }

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

  set filename(String? value) {
    rawData["fileName"] = value;
  }

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

  set fileencsha256(String? value) {
    rawData["fileEncSha256"] = value;
  }

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

  set directpath(String? value) {
    rawData["directPath"] = value;
  }

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

  set mediakeytimestamp(String? value) {
    rawData["mediaKeyTimestamp"] = value;
  }

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

  set contextinfo(ContextInfo value) {
    rawData["contextInfo"] = value.toJson();
  }

  static Document create({
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
    Map document_data_create_json = {
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
    Document document_data_create = Document(document_data_create_json);

    return document_data_create;
  }
}
