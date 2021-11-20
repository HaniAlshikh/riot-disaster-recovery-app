import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/datatypes/rescue_button.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/widgets/main_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(context, "Disaster Recovery"),
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RescueButton(Status.fine),
              const SizedBox(height: 40),
              RescueButton(Status.help),
            ],
          ),
        )
    );
  }
}