/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names, empty_catches

import 'dart:async';

import 'package:http/http.dart';
import 'package:universal_io/io.dart';

import 'wa_bot_api_script.dart';
import "package:path/path.dart" as path;

import "package:packagex/shell/shell.dart";

enum WhasAppBotApiScriptLanguageCodeType {
  js,
  dart,
}

class WhatsAppBotApiServer {
  WhatsAppBotApiServer();

  Future<void> installBotApiScript({
    required Directory directory_target,
    bool force_install_script = true,
    WhasAppBotApiScriptLanguageCodeType whasAppBotApiScriptLanguageCodeType =
        WhasAppBotApiScriptLanguageCodeType.js,
  }) async {
    return await installBotApiScriptJs(
      directory_target: directory_target,
      force_install_script: force_install_script,
      whasAppBotApiScriptLanguageCodeType: whasAppBotApiScriptLanguageCodeType,
    );
  }

  Future<Process> runWaBotApi({
    required String host,
    required int wa_bot_api_port,
    String app_name = "Whatsapp Client",
    String? workingDirectory,
    String? database_directory,
    bool is_print = false,
    bool force_install_script = true,
    bool is_delete_script_after_run = true,
    WhasAppBotApiScriptLanguageCodeType whasAppBotApiScriptLanguageCodeType =
        WhasAppBotApiScriptLanguageCodeType.js,
  }) async {
    return await runWaBotApiJs(
      host: host,
      wa_bot_api_port: wa_bot_api_port,
      app_name: app_name,
      workingDirectory: workingDirectory,
      database_directory: database_directory,
      is_print: is_print,
      force_install_script: force_install_script,
      is_delete_script_after_run: is_delete_script_after_run,
      whasAppBotApiScriptLanguageCodeType: whasAppBotApiScriptLanguageCodeType,
    );
  }

  Future<void> installBotApiScriptJs({
    required Directory directory_target,
    bool force_install_script = true,
    WhasAppBotApiScriptLanguageCodeType whasAppBotApiScriptLanguageCodeType =
        WhasAppBotApiScriptLanguageCodeType.js,
  }) async {
    bool is_not_found_folder = true;
    if (directory_target.existsSync() == false) {
      await directory_target.create(recursive: true);
      is_not_found_folder = true;
    } else {
      is_not_found_folder = false;
    }
    if (!Directory(path.join(directory_target.path, "node_modules"))
        .existsSync()) {
      is_not_found_folder = true;
    }
    bool is_update_node_module = false;
    for (var waBotApiScript in waBotApiScripts) {
      File file =
          File(path.join(directory_target.path, waBotApiScript.file_name));
      if (file.existsSync()) {
        if (waBotApiScript.file_name == "package.json") {
          String data = await file.readAsString();
          if (data != waBotApiScript.script) {
            is_update_node_module = true;
          }
        }
        if (force_install_script) {
          await file.writeAsString(waBotApiScript.script);
        }
      } else {
        await file.writeAsString(waBotApiScript.script);
      }
    }

    if (is_not_found_folder) {
      await shell(
        executable: "npm",
        arguments: [
          "install",
          "-g",
          "npm@latest",
        ],
        workingDirectory: directory_target.path,
        runInShell: false,
        onStdout: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stdout.add(data);
        },
        onStderr: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stderr.add(data);
        },
      );
      await shell(
        executable: "npm",
        arguments: [
          "install",
        ],
        workingDirectory: directory_target.path,
        runInShell: false,
        onStdout: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stdout.add(data);
        },
        onStderr: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stderr.add(data);
        },
      );
    }

    if (is_update_node_module) {
      await shell(
        executable: "npm",
        arguments: [
          "install",
        ],
        workingDirectory: directory_target.path,
        runInShell: false,
        onStdout: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stdout.add(data);
        },
        onStderr: (data, executable, arguments, workingDirectory, environment,
            includeParentEnvironment, runInShell, mode) {
          stderr.add(data);
        },
      );
    }
  }

  Future<Process> runWaBotApiJs({
    required String host,
    required int wa_bot_api_port,
    String app_name = "Whatsapp Client",
    String whatsapp_client_crypto_key = "RfWdLKwNkMQ4BtMb0TXr0bY0vqM7QuYb",
    String? workingDirectory,
    String? database_directory,
    bool is_print = false,
    bool force_install_script = true,
    bool is_delete_script_after_run = true,
    WhasAppBotApiScriptLanguageCodeType whasAppBotApiScriptLanguageCodeType =
        WhasAppBotApiScriptLanguageCodeType.js,
  }) async {
    workingDirectory ??= path.join(Directory.current.path, "whatsapp-bot-api");

    await installBotApiScript(
      directory_target: Directory(workingDirectory),
      force_install_script: force_install_script,
      whasAppBotApiScriptLanguageCodeType: whasAppBotApiScriptLanguageCodeType,
    );

    database_directory ??= path.join(workingDirectory, "db_wa");
    List<String> arguments = [
      "server.js",
      "--port",
      "${wa_bot_api_port}",
      "--host",
      host,
      "--app_name",
      app_name,
      "--database_directory",
      database_directory,
    ];

    // bun server.js --port 9990 --host 0.0.0.0 --app_name Whatsapp Client --database_directory /home/galaxeus/Documents/hexaminate/app/azkadev_whatsapp_bot/whatsapp-bot-api/db_wa
    // "node ${arguments.join(" ")}".printPretty();

    Process shell_wa_bot = await Process.start(
      "node",
      arguments,
      workingDirectory: Directory(workingDirectory).path,
      environment: {
        "whatsapp_client_crypto_key": whatsapp_client_crypto_key,
      },
    );
    StreamSubscription<List<int>>? stderr_wa;
    StreamSubscription<List<int>>? stdout_wa;
    if (is_print) {
      stderr_wa = shell_wa_bot.stderr.listen((event) {
        try {
          stderr.add(event);
        } catch (e) {}
      });
      // shell_wa_bot
      stdout_wa = shell_wa_bot.stdout.listen((event) {
        try {
          stdout.add(event);
        } catch (e) {}
      });
    }
    Completer completer = Completer();
    Timer.periodic(Duration(seconds: 2), (timer) async {
      try {
        await get(Uri.parse("http://${host}:${wa_bot_api_port}"));

        completer.complete(true);
        if (is_delete_script_after_run) {
          try {
            File file = File(path.join(workingDirectory!, "server.js"));
            if (file.existsSync()) {
              await file.delete(recursive: true);
            }
          } catch (e) {}
        }
      } catch (e) {
        if (e is ClientException) {
          if (e.message == "Connection refused") {
            timer.cancel();
            if (stderr_wa != null) {
              await stderr_wa.cancel();
            }
            if (stdout_wa != null) {
              await stdout_wa.cancel();
            }
            shell_wa_bot.kill(ProcessSignal.sigkill);
            await runWaBotApi(
              host: host,
              wa_bot_api_port: wa_bot_api_port,
              app_name: app_name,
              workingDirectory: workingDirectory,
              whasAppBotApiScriptLanguageCodeType:
                  whasAppBotApiScriptLanguageCodeType,
              is_delete_script_after_run: is_delete_script_after_run,
              is_print: is_print,
              database_directory: database_directory,
              force_install_script: force_install_script,
            );
          }
        }
      }
    });
    await completer.future;
    return shell_wa_bot;
  }
}
