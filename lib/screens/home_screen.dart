import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riot_disaster_recovery_app/providers/connectivity_provider.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/main_appbar.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget lastWidget = const HomeWidget();

  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
    WidgetSwitcher().addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context, "Disaster Recovery"),
        body: WidgetSwitcher.currentWidget // TODO: Animate
    );
  }
}