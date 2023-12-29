import 'scheme/scheme.dart';

class UpdateWaData {
  Map rawData;
  UpdateWaData(this.rawData);

  UpdateAuthorizationState get updateAuthorizationState {
    return UpdateAuthorizationState(rawData);
  }

  UpdateNewMessage get updateNewMessage {
    return UpdateNewMessage(rawData);
  }
}

class UpdateWaBot {
  Map<String, dynamic> body;
  Map query;
  String type;
  Uri uri;

  UpdateWaBot({
    required this.uri,
    required this.body,
    required this.query,
    required this.type,
  });
}
