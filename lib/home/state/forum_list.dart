import 'dart:collection';

import 'package:flutter/widgets.dart';

class Forum {
  final num threadId;
  final String text;

  const Forum(this.threadId, this.text);
}

class ForumListState extends ChangeNotifier {
  final List<Forum> _forums = [
    const Forum(1, 'Notifications'),
    const Forum(2, 'Technologies'),
    const Forum(3, 'News'),
  ];

  UnmodifiableListView<Forum> get threads => UnmodifiableListView(_forums);

  void add(Forum thread) {
    _forums.add(thread);
    notifyListeners();
  }

  void removeAll() {
    _forums.clear();
    notifyListeners();
  }
}
