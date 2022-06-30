import 'package:flutter/widgets.dart';

class Thread {
  final num threadId;

  const Thread(this.threadId);
}

class ThreadState extends ChangeNotifier {
  Thread _selectedThread = const Thread(-1);

  Thread get selectedThread => _selectedThread;

  set selectedThread(Thread thread) {
    _selectedThread = thread;
    notifyListeners();
  }

  void setSelectedThreadById(num id) {
    _selectedThread = Thread(id);
    notifyListeners();
  }
}
