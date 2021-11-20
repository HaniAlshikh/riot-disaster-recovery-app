import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riot_disaster_recovery_app/providers/theme.dart';
import 'package:riot_disaster_recovery_app/screens/home_screen.dart';
import 'package:wifi_iot/wifi_iot.dart';

void main() {
  // TODO: support landscapeMode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Disaster Recovery',
        // TODO: support Light/Dark themes
        theme: AppTheme.theme,
        home: const HomeScreen()
    );
  }

  void connect() {
    WiFiForIoTPlugin.connect('TestAccessPoint',
        password: 'TestPassword',
        joinOnce: false,
        security: NetworkSecurity.WPA);
  }
}
