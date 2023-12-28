// ignore_for_file: non_constant_identifier_names, unused_import
import "json_dart.dart";
// import "dart:convert";

import "authorization_state_waits_scan_qr.dart";

class UpdateAuthorizationState extends JsonScheme {
  UpdateAuthorizationState(super.rawData);

  static Map get defaultData {
    return {
      "@type": "updateAuthorizationState",
      "authorization_state": {
        "@type": "authorizationStateWaitsScanQr",
        "qr": "",
        "client": {"@type": "clientData", "id": "", "name": ""}
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

  AuthorizationStateWaitsScanQr get authorization_state {
    try {
      if (rawData["authorization_state"] is Map == false) {
        return AuthorizationStateWaitsScanQr({});
      }
      return AuthorizationStateWaitsScanQr(
          rawData["authorization_state"] as Map);
    } catch (e) {
      return AuthorizationStateWaitsScanQr({});
    }
  }

  static UpdateAuthorizationState create({
    String special_type = "updateAuthorizationState",
    AuthorizationStateWaitsScanQr? authorization_state,
  }) {
    // UpdateAuthorizationState updateAuthorizationState = UpdateAuthorizationState({
    Map updateAuthorizationState_data_create_json = {
      "@type": special_type,
      "authorization_state":
          (authorization_state != null) ? authorization_state.toJson() : null,
    };

    updateAuthorizationState_data_create_json
        .removeWhere((key, value) => value == null);
    UpdateAuthorizationState updateAuthorizationState_data_create =
        UpdateAuthorizationState(updateAuthorizationState_data_create_json);

    return updateAuthorizationState_data_create;
  }
}
