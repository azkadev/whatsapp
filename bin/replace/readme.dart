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

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      File file_readme = File(path.join(fileSystemEntity.path, "README.md"));

      await file_readme.writeAsString(content_readme);
    }
  }

  print("Finished");
  exit(0);
}

String content_readme = r"""
# Whatsapp client

Whatsapp client menggunakan bahasa code dart bisa berjalan menggunakan puppeteer / native websocket (tanpa puppeteer) dan support multi client tested di bawah


## Screenshot

# To-Do

1. [x] Multi Client
2. [x] Pretty Update Data

## install

```bash
dart pub add whatsapp_client
```


## import library

```dart
import 'package:whatsapp_client/whatsapp_client.dart';
```


## QuickStart

### Whatsapp Client

```dart 

```
""";
