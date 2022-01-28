import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:cbor/cbor.dart';
import 'package:coap/coap.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';
import 'package:wifi_iot/wifi_iot.dart';

import '../config/coap_config_all.dart';

class WiFi {
  
  final ssid = 'TestAccessPoint';
  final pass = 'TestPassword';
  final security = NetworkSecurity.WPA;
  final platform = const MethodChannel('inet.flutter.dev/wifi');

  static final WiFi _wifi = WiFi._internal();
  WiFi._internal();

  factory WiFi() {
    return _wifi;
  }

  Future<bool> ensureConnected() async {
    if (!await isConnected()) {
      // return await connect(); TODO: doesn't work without DHCP server
    }
    return true;
  }

  Future<bool> connect() async {
    if (!await WiFiForIoTPlugin.isEnabled()) {
      await WiFiForIoTPlugin.setEnabled(true, shouldOpenSettings: true);
    }

    await WiFiForIoTPlugin.forceWifiUsage(true);
    return await WiFiForIoTPlugin.connect(ssid,
        password: pass,
        security: security);
  }

  Future<bool> isConnected() async {
    var connected = await WiFiForIoTPlugin.isConnected();
    String? currentSsid;
    if (connected) currentSsid = await WiFiForIoTPlugin.getSSID();
    // TODO ping to check reachability
    return connected && currentSsid == ssid;
  }
}
