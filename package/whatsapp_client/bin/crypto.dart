import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  print(generateUuid(16));
  Crypto crypto = Crypto(key: "DdtLKPV31OvdT72g");

  var envrypt = crypto.encrypt(data: "sasaa");
  print(envrypt);
  var dnvrypt = crypto.decrypt(
    data_base64:
        "NBChYjW1gR2qnZtXr9XvD13wUy3SWsOz8H+wcYvAljCmnWjhpjnFTqDDZlHsbiIivASzYF5E89tiZWF/cqSkdQ==",
  );
  print(dnvrypt);
}
