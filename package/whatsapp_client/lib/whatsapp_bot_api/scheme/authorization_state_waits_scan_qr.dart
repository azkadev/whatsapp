// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

import "client_data.dart";

/// Generated
class AuthorizationStateWaitsScanQr extends JsonScheme {
  /// Generated
  AuthorizationStateWaitsScanQr(super.rawData);

  /// return default data
  ///
  static Map get defaultData {
    return {
      "@type": "authorizationStateWaitsScanQr",
      "qr": "",
      "client": {"@type": "clientData", "id": "", "name": ""}
    };
  }

  /// check data
  /// if raw data
  /// - rawData["@type"] == authorizationStateWaitsScanQr
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

  /// create [AuthorizationStateWaitsScanQr]
  /// Empty
  static AuthorizationStateWaitsScanQr empty() {
    return AuthorizationStateWaitsScanQr({});
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
  String? get qr {
    try {
      if (rawData["qr"] is String == false) {
        return null;
      }
      return rawData["qr"] as String;
    } catch (e) {
      return null;
    }
  }

  /// Generated
  set qr(String? value) {
    rawData["qr"] = value;
  }

  /// Generated
  ClientData get client {
    try {
      if (rawData["client"] is Map == false) {
        return ClientData({});
      }
      return ClientData(rawData["client"] as Map);
    } catch (e) {
      return ClientData({});
    }
  }

  /// Generated
  set client(ClientData value) {
    rawData["client"] = value.toJson();
  }

  /// Generated
  static AuthorizationStateWaitsScanQr create({
    bool schemeUtilsIsSetDefaultData = false,
    String special_type = "authorizationStateWaitsScanQr",
    String? qr,
    ClientData? client,
  }) {
    // AuthorizationStateWaitsScanQr authorizationStateWaitsScanQr = AuthorizationStateWaitsScanQr({
    final Map authorizationStateWaitsScanQr_data_create_json = {
      "@type": special_type,
      "qr": qr,
      "client": (client != null) ? client.toJson() : null,
    };

    authorizationStateWaitsScanQr_data_create_json
        .removeWhere((key, value) => value == null);

    if (schemeUtilsIsSetDefaultData) {
      defaultData.forEach((key, value) {
        if (authorizationStateWaitsScanQr_data_create_json.containsKey(key) ==
            false) {
          authorizationStateWaitsScanQr_data_create_json[key] = value;
        }
      });
    }
    return AuthorizationStateWaitsScanQr(
        authorizationStateWaitsScanQr_data_create_json);
  }
}
