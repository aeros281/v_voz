import 'package:dual_screen/dual_screen.dart';
import 'package:f_voz/home/widgets/thread.dart';
import 'package:f_voz/shared/widgets/list_widget.dart';
import 'package:flutter/material.dart';

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
      startPane: ListWidget(10, (value) {
        widget.selectedValue = value;
        setState(() {});
      }),
      endPane: ThreadWidget(widget.selectedValue),
      paneProportion: 0.3,
      panePriority: MediaQuery.of(context).size.width > 500
          ? TwoPanePriority.both
          : TwoPanePriority.end,
    );
  }
}
