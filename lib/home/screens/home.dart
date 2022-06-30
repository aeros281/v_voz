import 'package:dual_screen/dual_screen.dart';
import 'package:f_voz/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/forum_list.dart';
import '../state/thread.dart';
import '../widgets/forum_list.dart';
import '../widgets/thread.dart';

class HomePage extends StatefulWidget {
  var selectedValue = 0;

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ForumListState()),
        ChangeNotifierProvider(create: (context) => ThreadState()),
      ],
      child: TwoPane(
        startPane: const ForumList(),
        endPane: ThreadWidget(widget.selectedValue),
        paneProportion: 0.3,
        panePriority:
            MediaQuery.of(context).size.width > PHONE_SCREEN_WIDTH_BREAKPOINT
                ? TwoPanePriority.both
                : TwoPanePriority.end,
      ),
    );
  }
}
