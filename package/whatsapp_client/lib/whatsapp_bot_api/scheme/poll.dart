// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "poll_option.dart";
import "context_info.dart";

class Poll extends JsonScheme {
  Poll(super.rawData);

  static Map get defaultData {
    return {
      "@type": "poll",
      "name": "Jjj",
      "options": [
        {"@type": "poll_option", "optionName": "J"}
      ],
      "selectableOptionsCount": 0,
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

  String? get name {
    try {
      if (rawData["name"] is String == false) {
        return null;
      }
      return rawData["name"] as String;
    } catch (e) {
      return null;
    }
  }

  List<PollOption> get options {
    try {
      if (rawData["options"] is List == false) {
        return [];
      }
      return (rawData["options"] as List)
          .map((e) => PollOption(e as Map))
          .toList()
          .cast<PollOption>();
    } catch (e) {
      return [];
    }
  }

  num? get selectableOptionsCount {
    try {
      if (rawData["selectableOptionsCount"] is num == false) {
        return null;
      }
      return rawData["selectableOptionsCount"] as num;
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

  static Poll create({
    String special_type = "poll",
    String? name,
    List<PollOption>? options,
    num? selectableOptionsCount,
    ContextInfo? contextInfo,
  }) {
    // Poll poll = Poll({
    Map poll_data_create_json = {
      "@type": special_type,
      "name": name,
      "options": (options != null) ? options.toJson() : null,
      "selectableOptionsCount": selectableOptionsCount,
      "contextInfo": (contextInfo != null) ? contextInfo.toJson() : null,
    };

    poll_data_create_json.removeWhere((key, value) => value == null);
    Poll poll_data_create = Poll(poll_data_create_json);

    return poll_data_create;
  }
}
