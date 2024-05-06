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

  set seconds(num? value) {
    rawData["seconds"] = value;
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

  set height(num? value) {
    rawData["height"] = value;
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

  set width(num? value) {
    rawData["width"] = value;
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

  String? get jpegthumbnail {
    try {
      if (rawData["jpegThumbnail"] is String == false) {
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

  String? get streamingsidecar {
    try {
      if (rawData["streamingSidecar"] is String == false) {
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
  }) {
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
      "contextInfo": (contextinfo != null) ? contextinfo.toJson() : null,
      "streamingSidecar": streamingsidecar,
    };

    video_data_create_json.removeWhere((key, value) => value == null);
    Video video_data_create = Video(video_data_create_json);

    return video_data_create;
  }
}
