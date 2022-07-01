import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forum_list.g.dart';

@JsonSerializable()
class Forum {
  @JsonKey(name: 'id')
  final num threadId;

  final String text;

  const Forum(this.threadId, this.text);

  // AUTO GENERATE FUNTIONS
  factory Forum.fromJson(Map<String, dynamic> json) => _$ForumFromJson(json);
  Map<String, dynamic> toJson() => _$ForumToJson(this);
}

@JsonSerializable()
class ForumGroup {
  final String name;
  final List<Forum> forums;

  const ForumGroup(this.name, this.forums);

  // AUTO GENERATE FUNTIONS
  factory ForumGroup.fromJson(Map<String, dynamic> json) =>
      _$ForumGroupFromJson(json);
  Map<String, dynamic> toJson() => _$ForumGroupToJson(this);
}

@JsonSerializable()
class ForumData {
  @JsonKey(name: 'forumData')
  final List<ForumGroup> data;

  const ForumData(this.data);

  // AUTO GENERATE FUNTIONS
  factory ForumData.fromJson(Map<String, dynamic> json) =>
      _$ForumDataFromJson(json);
  Map<String, dynamic> toJson() => _$ForumDataToJson(this);
}

class ForumListState extends ChangeNotifier {
  List<ForumGroup> _forums = [];

  ForumListState() {
    rootBundle.loadString('assets/default_forums.json').then((jsonContent) {
      Map<String, dynamic> parsedJson = json.decode(jsonContent);
      _forums = ForumData.fromJson(parsedJson).data;
      notifyListeners();
    });
  }

  UnmodifiableListView<ForumGroup> get forums => UnmodifiableListView(_forums);

  set forums(List<ForumGroup> forums) {
    _forums = forums;
    notifyListeners();
  }

  void removeAll() {
    _forums.clear();
    notifyListeners();
  }
}
