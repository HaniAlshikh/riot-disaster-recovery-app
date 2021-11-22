import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/datatypes/rescue_button.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/widgets/main_appbar.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context, "Disaster Recovery"),
        body: WidgetSwitcher.currentWidget // TODO: Animate
    );
  }
}