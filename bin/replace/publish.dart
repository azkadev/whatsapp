// ignore_for_file: non_constant_identifier_names

import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  Directory directory = Directory.current;
  Directory directory_packages = Directory(path.join(directory.path, "package"));

  if (!directory_packages.existsSync()) {
    print("Directory Packages Not Found: ${directory_packages.path}");
    exit(1);
  }

  List<FileSystemEntity> file_system_entity_packages = directory_packages.listSync();
  String contents = """
# /bin/sh

"""
      .trim();

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      contents += "\n";
      contents += """
cd ${fileSystemEntity.path}
dart pub publish -f
""".trim();
      contents += "\n";
    }
  }

  File file = File(path.join(directory.path, "publish.sh"));

  await file.writeAsString(contents);

  exit(0);
}
