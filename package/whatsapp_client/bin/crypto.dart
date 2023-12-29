import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  print(generateUuid(32));
  Crypto crypto = Crypto(key: "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb");

  var envrypt = crypto.encrypt(data: "sasaa");
  print(envrypt);
  var dnvrypt = crypto.decrypt(
      data_base64:
          "NBChYjW1gR2qnZtXr9XvD12VBmfdKra87zKxV4zai2vK1jzs60e3d4K+YiXbZWoolRn4QjtCp9QvLFNIINuUGPmux1QjEbmvEn9roSJxyOXJygrctYGV6KsvHKAcLJiSw9sauFSwuSbBPzc/Gw4DZ+sxrwHr2T2BeMebgrGIHSIiZnpbTvWx41LdKif413tuGJdt1tdV9qrVw2yVvM6IdNtO9WI5qBRO0PYC1ydgg3RAekM0j2g/3nCfw5Q1Pad2S3AaPIcHV2n9OKWmyDAcew/6TemEuSQbxWjow05Jaf4/x1YSnzMixAOkH9nInVs3");
  print(dnvrypt);
}
