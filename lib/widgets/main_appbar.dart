
import 'package:flutter/material.dart';

class MainAppBar extends AppBar {

  static const double heightRation = 0.30;

  MainAppBar(BuildContext ctx, String title, {Key? key}) : super(key: key,
    backgroundColor: Theme.of(ctx).backgroundColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    toolbarHeight: MediaQuery.of(ctx).size.height * heightRation,
    centerTitle: true,
    title: Container(
      height: MediaQuery.of(ctx).size.height * heightRation,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(fit: FlexFit.loose, child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/images/riot.png'),
          )),
          const SizedBox(height: 10),
          const Text('Disaster Recovery'),
        ],
      ),
    ),
  );
}