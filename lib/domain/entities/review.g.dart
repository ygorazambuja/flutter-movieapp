// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    author: json['author'] as String,
    content: json['content'] as String,
    id: json['id'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'id': instance.id,
      'url': instance.url,
    };
