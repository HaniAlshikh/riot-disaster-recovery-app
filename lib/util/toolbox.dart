import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void openScreen(BuildContext ctx, Widget screen) {
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) {
        return screen;
      }), (Route<dynamic> route) => false
  );
}

Future<String> getDeviceID() async {
  String id = "null";
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      id = build.androidId;
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      id = data.identifierForVendor;
    }
  } on PlatformException {
    print('Failed to get platform version');
    id = const Uuid().v4();
  }

  id = sha256.convert(utf8.encode(id)).toString().substring(0, 14);
  return id;
}

Future<LocationData> getDeviceLocation() async {
  Location location = Location();
  return await location.getLocation();
}

// TODO: how hard could it be to flip a bit flutter?? still not working
String macToIpv6(String mac) {
  print("Test $mac");
  var macOctets = mac.split(":");
  print("Test $macOctets");
  macOctets.insert(3,'fe');
  macOctets.insert(3,'ff');
  
  var num = int.parse(macOctets[0], radix: 16).toRadixString(2);
  print(num);
  var bitsList = num.split('');
  bitsList[bitsList.length - 2] = bitsList[bitsList.length - 2] == "0" ? "1" : "0";
  num = bitsList.join('');
  print(num);
  macOctets[0] = int.parse(num).toString();

  return "fe80::${macOctets[0]}${macOctets[1]}:${macOctets[2]}${macOctets[3]}:${macOctets[4]}${macOctets[5]}:${macOctets[6]}${macOctets[7]}";
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}