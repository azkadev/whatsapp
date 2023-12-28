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
