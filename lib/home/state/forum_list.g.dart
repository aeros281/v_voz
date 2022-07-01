// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forum _$ForumFromJson(Map<String, dynamic> json) => Forum(
      json['id'] as num,
      json['text'] as String,
    );

Map<String, dynamic> _$ForumToJson(Forum instance) => <String, dynamic>{
      'id': instance.threadId,
      'text': instance.text,
    };

ForumGroup _$ForumGroupFromJson(Map<String, dynamic> json) => ForumGroup(
      json['name'] as String,
      (json['forums'] as List<dynamic>)
          .map((e) => Forum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForumGroupToJson(ForumGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'forums': instance.forums,
    };

ForumData _$ForumDataFromJson(Map<String, dynamic> json) => ForumData(
      (json['forumData'] as List<dynamic>)
          .map((e) => ForumGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForumDataToJson(ForumData instance) => <String, dynamic>{
      'forumData': instance.data,
    };
