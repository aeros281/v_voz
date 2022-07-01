import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/forum_list.dart';
import '../state/thread.dart';

typedef ItemSelectedCallback = void Function(int value);

class ForumListWidget extends StatelessWidget {
  final bool asDrawer;
  const ForumListWidget({Key? key, this.asDrawer = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ForumListState>(
      builder: (context, value, child) {
        return Material(
          child: ListView.builder(
              itemCount: value.forums.length,
              itemBuilder: (context, index) {
                return ForumGroupWidget(
                  asDrawer: asDrawer,
                  forumGroup: value.forums[index],
                );
              }),
        );
      },
    );
  }
}

class ForumGroupWidget extends StatelessWidget {
  final bool asDrawer;
  final ForumGroup forumGroup;
  const ForumGroupWidget({
    Key? key,
    required this.asDrawer,
    required this.forumGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forumGroup.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Divider(),
          ListView.builder(
            itemCount: forumGroup.forums.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  var threadId = forumGroup.forums[index].threadId;
                  Provider.of<ThreadState>(context, listen: false)
                      .setSelectedThreadById(threadId);
                  if (asDrawer) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  forumGroup.forums[index].text,
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            },
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }
}
