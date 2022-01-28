import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:riot_disaster_recovery_app/providers/connectivity_provider.dart';
import 'package:riot_disaster_recovery_app/providers/theme.dart';
import 'package:riot_disaster_recovery_app/screens/home_screen.dart';

void main() {
  // TODO: support landscapeMode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // TODO: if needed otherwise make it stateless
    // WidgetSwitcher().addListener(() {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ConnectivityProvider(), child: const HomeScreen())
      ],
      child: MaterialApp(
          title: 'Disaster Recovery',
          // TODO: support Light/Dark themes
          theme: AppTheme.theme,
          home: const HomeScreen()
      ),
    );
  }
}