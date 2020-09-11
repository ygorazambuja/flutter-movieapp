// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_star.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestStar _$GuestStarFromJson(Map<String, dynamic> json) {
  return GuestStar(
    id: json['id'] as int,
    name: json['name'] as String,
    creditId: json['credit_id'] as String,
    character: json['character'] as String,
    order: json['order'] as int,
    gender: json['gender'] as int,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$GuestStarToJson(GuestStar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'credit_id': instance.creditId,
      'character': instance.character,
      'order': instance.order,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };
