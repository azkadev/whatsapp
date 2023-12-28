// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

class PollOption extends JsonScheme {
  PollOption(super.rawData);

  static Map get defaultData {
    return {"@type": "poll_option", "optionName": "J"};
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

  String? get optionName {
    try {
      if (rawData["optionName"] is String == false) {
        return null;
      }
      return rawData["optionName"] as String;
    } catch (e) {
      return null;
    }
  }

  static PollOption create({
    String special_type = "poll_option",
    String? optionName,
  }) {
    // PollOption pollOption = PollOption({
    Map pollOption_data_create_json = {
      "@type": special_type,
      "optionName": optionName,
    };

    pollOption_data_create_json.removeWhere((key, value) => value == null);
    PollOption pollOption_data_create = PollOption(pollOption_data_create_json);

    return pollOption_data_create;
  }
}
