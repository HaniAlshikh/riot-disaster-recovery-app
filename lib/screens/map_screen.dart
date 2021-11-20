

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';
import 'package:riot_disaster_recovery_app/widgets/main_appbar.dart';
import 'package:riot_disaster_recovery_app/widgets/map_widget.dart';

import 'home_screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context, "Disaster Recovery"),
      body: Container(
        margin: const EdgeInsets.all(30),
        // child: DefaultTextStyle(
        //   style: const TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('last updated: 3 min ago'),
              const SizedBox(height: 10),
              Expanded(child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MapSample())
              ),
              // Flexible(fit: FlexFit.loose, child: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 30),
              //   child: ClipRRect(
              //       borderRadius: BorderRadius.circular(15),
              //       child: MapSample())
              // )),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(child: ElevatedButton(onPressed: () => openScreen(context, HomeScreen()), child: const Text('update status'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),)),
              ])
            ],
          ),
        // ),
      ),
    );
  }
}