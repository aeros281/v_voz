import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/forum_list.dart';
import '../state/thread.dart';

typedef ItemSelectedCallback = void Function(int value);

class ForumList extends StatelessWidget {
  const ForumList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForumListState>(
      builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.threads.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: InkWell(
                    onTap: () {
                      Provider.of<ThreadState>(context, listen: false)
                          .setSelectedThreadById(value.threads[index].threadId);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          value.threads[index].text.toString(),
                          style: const TextStyle(fontSize: 22.0),
                        )),
                  ),
                ),
              );
            });
      },
    );
  }
}
