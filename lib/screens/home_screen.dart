import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riot_disaster_recovery_app/datatypes/rescue_button.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/providers/connectivity_provider.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/main_appbar.dart';
import 'package:riot_disaster_recovery_app/widgets/notConnected_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: MainAppBar(context, "Disaster Recovery"),
//         body: WidgetSwitcher.currentWidget // TODO: Animate
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget lastWidget = HomeWidget();

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
        // body: currentWidget() // TODO: Animate
    );
  }

  // Widget currentWidget() {
  //   return Consumer<ConnectivityProvider>(
  //     builder: (consumerContext, model, child) {
  //       if (!model.connected) {
  //         lastWidget = WidgetSwitcher.currentWidget;
  //         WidgetSwitcher.currentWidget = const NotConnectedWidget();
  //       } else if (WidgetSwitcher.currentWidget == const NotConnectedWidget()) {
  //         WidgetSwitcher.currentWidget = lastWidget;
  //       }
  //       print("current widget ${WidgetSwitcher.currentWidget}");
  //       return WidgetSwitcher.currentWidget;
  //       // return const Center(child: CircularProgressIndicator());
  //     },
  //   );
  // }
}