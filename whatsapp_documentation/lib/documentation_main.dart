import 'package:flutter/material.dart';
import 'package:general_lib_flutter/widget/widget.dart';
import 'package:documentation/documentation_core.dart';
import 'package:whatsapp_documentation/documentation_data.dart';

// ignore: non_constant_identifier_names
void documentation_main_app(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DocumentationMainApp());
}

class DocumentationMainApp extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  const DocumentationMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        Widget child = MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: DocumentationApp(
            generalLibFlutterApp: generalLibFlutterApp,
            documentationData: documentationData,
          ),
        );

        return child;
      },
    );
  }
}
