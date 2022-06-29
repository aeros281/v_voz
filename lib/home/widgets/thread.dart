import 'package:flutter/material.dart';

class ThreadWidget extends StatefulWidget {
  final int data;

  const ThreadWidget(this.data, {super.key});

  @override
  State<ThreadWidget> createState() => _ThreadWidgetState();
}

class _ThreadWidgetState extends State<ThreadWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.data.toString(),
              style: const TextStyle(fontSize: 36.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
