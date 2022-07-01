import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/settings.dart';
import 'forum_list.dart';

class LeftPanelWidget extends StatelessWidget {
  final bool asDrawer;
  const LeftPanelWidget({Key? key, this.asDrawer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Provider.of<SettingState>(context, listen: false)
                  .toggleDarkMode();
            },
            child: const Text('Dark mode')),
        Expanded(
          child: ForumListWidget(
            asDrawer: asDrawer,
          ),
        ),
      ],
    );
  }
}
