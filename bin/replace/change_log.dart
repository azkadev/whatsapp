// ignore_for_file: non_constant_identifier_names

import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  Directory directory = Directory.current;
  Directory directory_home = Directory(path.join(directory.path));

  File file_readme_home = File(path.join(directory_home.path, "CHANGELOG.md"));
  String readme_home = await file_readme_home.readAsString();
  // await file_readme.writeAsString(content_readme);
  Directory directory_packages = Directory(path.join(directory.path, "package"));

  if (!directory_packages.existsSync()) {
    print("Directory Packages Not Found: ${directory_packages.path}");
    exit(1);
  }

  List<FileSystemEntity> file_system_entity_packages = directory_packages.listSync();

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      File file_readme = File(path.join(fileSystemEntity.path, "CHANGELOG.md"));

      await file_readme.writeAsString(readme_home);
    }
  }

  print("Finished");
  exit(0);
}
