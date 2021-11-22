import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/widgets/googleMaps_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';


class MapWidget extends StatelessWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: GoogleMapsWidget())
            ),
            // Flexible(fit: FlexFit.loose, child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 30),
            //   child: ClipRRect(
            //       borderRadius: BorderRadius.circular(15),
            //       child: MapSample())
            // )),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: ElevatedButton(onPressed: () =>  WidgetSwitcher().updateWidget(HomeWidget()), child: const Text('update status'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),)),
            ])
          ],
        ),
        // ),
    );
  }
}