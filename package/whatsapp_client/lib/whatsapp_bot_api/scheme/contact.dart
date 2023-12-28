// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "context_info.dart";

class Contact extends JsonScheme {
  Contact(super.rawData);

  static Map get defaultData {
    return {
      "@type": "contact",
      "displayName": "",
      "vcard": "",
      "contextInfo": {
        "@type": "contextInfo",
        "expiration": 604800,
        "ephemeralSettingTimestamp": "1675329",
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

  String? get displayName {
    try {
      if (rawData["displayName"] is String == false) {
        return null;
      }
      return rawData["displayName"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get vcard {
    try {
      if (rawData["vcard"] is String == false) {
        return null;
      }
      return rawData["vcard"] as String;
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

  static Contact create({
    String special_type = "contact",
    String? displayName,
    String? vcard,
    ContextInfo? contextInfo,
  }) {
    // Contact contact = Contact({
    Map contact_data_create_json = {
      "@type": special_type,
      "displayName": displayName,
      "vcard": vcard,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
    };

    contact_data_create_json.removeWhere((key, value) => value == null);
    Contact contact_data_create = Contact(contact_data_create_json);

    return contact_data_create;
  }
}
