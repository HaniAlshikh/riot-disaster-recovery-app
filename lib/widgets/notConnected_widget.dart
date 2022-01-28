import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/widgets/googleMaps_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/home_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';


class NotConnectedWidget extends StatelessWidget {
  const NotConnectedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 250, color: theme.colorScheme.secondary),
            Text('please insure you are connected', style: theme.textTheme.headline6),
            const SizedBox(height: 10),
            Text('open the settings and keep looking for TestAccessPoint once a baloon is near you it should show up',
                textAlign: TextAlign.center,
                style: theme.textTheme.caption),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(child: ElevatedButton(
                onPressed: () =>  WidgetSwitcher().updateWidget(const HomeWidget()), child: const Text('Check again'),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),)),
            ])
          ],
        ),
    );
  }
}