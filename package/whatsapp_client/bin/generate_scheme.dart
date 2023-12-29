import 'package:general_lib/general_lib.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  List<Map> datas = [
    {
      "@type": "waClientData",
      "client_token": "",
      "owner_tg_user_id": 0,
      "client_type": "",
      "client_title": "",
      "client_username": "",
      "from_tg_bot_user_id": 0,
      "expire_date": 0,
      "version": "",
    }
  ];

  await jsonToScripts(
    datas,
    directory: Directory(
      join(Directory.current.path, "lib", "scheme")
    ),
  );
}
