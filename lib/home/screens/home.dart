import 'package:dual_screen/dual_screen.dart';
import 'package:f_voz/shared/constants.dart';
import 'package:flutter/material.dart';

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
    return TwoPane(
      startPane: const ForumListWidget(),
      endPane: const ThreadWidget(
        drawer: ForumListWidget(
          asDrawer: true,
        ),
        mobileBreakpoint: PHONE_SCREEN_WIDTH_BREAKPOINT,
      ),
      paneProportion: 0.3,
      panePriority:
          MediaQuery.of(context).size.width > PHONE_SCREEN_WIDTH_BREAKPOINT
              ? TwoPanePriority.both
              : TwoPanePriority.end,
    );
  }
}
