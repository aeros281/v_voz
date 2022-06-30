import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/forum_list.dart';
import '../state/thread.dart';

class ThreadWidget extends StatefulWidget {
  final int data;

  const ThreadWidget(this.data, {super.key});

  @override
  State<ThreadWidget> createState() => _ThreadWidgetState();
}

class _ThreadWidgetState extends State<ThreadWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Provider.of<ForumListState>(context, listen: false)
                .add(const Forum(2, 'Something'));
          },
          child: const Text('Click!')),
    );
  }
}
