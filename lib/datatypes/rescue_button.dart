import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/datatypes/status.dart';
import 'package:riot_disaster_recovery_app/providers/theme.dart';
import 'package:riot_disaster_recovery_app/util/coap.dart';
import 'package:riot_disaster_recovery_app/widgets/note_widget.dart';

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
    CoAP().sendStatus(status);
    // WidgetSwitcher().updateWidget(const MapWidget()); // TODO: can't be supported no internet
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