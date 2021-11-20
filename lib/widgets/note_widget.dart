import 'package:flutter/material.dart';
import 'package:riot_disaster_recovery_app/screens/map_screen.dart';
import 'package:riot_disaster_recovery_app/util/toolbox.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key}) : super(key: key);

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
          const Expanded(
              child: TextField(expands: true, maxLines: null,
                  decoration: InputDecoration(filled: true, fillColor: Colors.white10))
          ),
          Row(children: [
            Expanded(child: ElevatedButton(
                onPressed: () => openScreen(context, MapScreen()),
                child: Text('done'))),
          ])
        ],
      ),
    );
  }
}