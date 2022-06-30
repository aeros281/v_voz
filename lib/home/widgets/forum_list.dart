import 'package:f_voz/home/widgets/thread.dart';
import 'package:f_voz/shared/constants.dart';
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
                      var threadId = value.threads[index].threadId;
                      Provider.of<ThreadState>(context, listen: false)
                          .setSelectedThreadById(threadId);
                      if (MediaQuery.of(context).size.width <=
                          PHONE_SCREEN_WIDTH_BREAKPOINT) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThreadWidget()));
                      }
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
