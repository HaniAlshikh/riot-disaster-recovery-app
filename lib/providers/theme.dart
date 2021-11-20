
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';

class AppTheme {
  static Color bg = Colors.black;
  static Color primary = Color(0xFF3fa788);
  static Color secondary = Color(0xFFbd202c);
  static Color green = primary;
  static Color red = secondary;

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: createMaterialColor(primary),
        accentColor: createMaterialColor(secondary),
        backgroundColor: bg,
      ),
      backgroundColor: bg,
      scaffoldBackgroundColor: bg,
    );
  }

  static ButtonStyle rescueButtonStyle(Status status) {
    Color bgColor = status == Status.fine ? green : red;
    return ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))
        )
    );
  }

}