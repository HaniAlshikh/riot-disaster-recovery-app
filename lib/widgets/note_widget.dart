import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/util/coap.dart';
import 'package:riot_disaster_recovery_app/util/wifi.dart';
import 'package:riot_disaster_recovery_app/widgets/map_widget.dart';
import 'package:riot_disaster_recovery_app/widgets/widget_switcher.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({Key? key}) : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  final noteController = TextEditingController();

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text('we received your request', style: theme.textTheme.headline6),
          Icon(Icons.check_rounded, size: 100, color: theme.colorScheme.primary),
          const SizedBox(height: 20),
          const Text('would you like to add a note?'),
          const SizedBox(height: 20),
          Expanded(child: TextField(
              controller: noteController, expands: true, maxLines: null,
              decoration: const InputDecoration(filled: true, fillColor: Colors.white10))
          ),
          Row(children: [
            Expanded(child: ElevatedButton(
                onPressed: () {_sendNote(context, noteController.text);},
                child: const Text('done'))),
          ])
        ],
      ),
    );
  }

  Future<void> _sendNote(BuildContext ctx, String note) async {
    Navigator.pop(context);
    WidgetSwitcher().updateWidget(const MapWidget());
  }
}