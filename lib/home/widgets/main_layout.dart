import 'package:f_voz/home/widgets/thread.dart';
import 'package:f_voz/shared/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main layout')),
      body: OrientationBuilder(builder: ((context, orientation) {
        isLargeScreen = MediaQuery.of(context).size.width > 600;

        return Row(
          children: [
            Expanded(
                child: ListWidget(10, (value) {
              if (isLargeScreen) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Scaffold(
                      appBar: AppBar(title: const Text('Thread')),
                      body: ThreadWidget(value));
                })));
              }
            })),
            isLargeScreen
                ? Expanded(child: ThreadWidget(selectedValue))
                : Container(),
          ],
        );
      })),
    );
  }
}
