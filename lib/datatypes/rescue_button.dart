import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/providers/theme.dart';
import 'package:riot_disaster_recovery_app/util/coap.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';
import 'package:riot_disaster_recovery_app/util/wifi.dart';
import 'package:riot_disaster_recovery_app/widgets/map_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/note_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

class RescueButton extends StatelessWidget {

  Status status;

  RescueButton(this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ElevatedButton(
        child: Text(status.string),
        onPressed: () => _sendStatus(context, status),
        style: AppTheme.rescueButtonStyle(status)
      )
    );
  }

  Future<void> _sendStatus(BuildContext ctx, Status status) async {
    // if (await WiFi().ensureConnected()) {
    //   CoAP().sendStatus(status);
    //   WidgetSwitcher().updateWidget(const MapWidget());
    //   _openNoteDialog(ctx);
    // } else {
    //   print("not connected");
    //   // TODO
    // }
    WidgetSwitcher().updateWidget(const MapWidget());
    _openNoteDialog(ctx);
  }

  void _openNoteDialog(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Theme.of(ctx).backgroundColor,
        context: ctx, builder: (bCtx) {
      return const NoteWidget();
    });
  }
}