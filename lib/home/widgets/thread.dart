import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/thread.dart';

class ThreadWidget extends StatelessWidget {
  final Widget drawer;
  final num mobileBreakpoint;

  const ThreadWidget(
      {Key? key, required this.drawer, required this.mobileBreakpoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width <= mobileBreakpoint;
    return Scaffold(
      drawer: isMobile ? Drawer(child: drawer) : null,
      appBar: AppBar(
        title: const Text('Thread'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ThreadState>(
              builder: ((context, value, child) {
                return Text(value.selectedThread.threadId.toString(),
                    style: const TextStyle(fontSize: 36.0));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
