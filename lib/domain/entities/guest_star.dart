import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';

part 'guest_star.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class GuestStar extends Cast {
  @override
  final int id;

  @override
  final String name;
  @JsonKey(name: 'credit_id')
  @override
  final String creditId;
  @override
  final String character;
  @override
  final int order;
  @override
  final int gender;
  @JsonKey(name: 'profile_path')
  @override
  final String profilePath;

  GuestStar({
    this.id,
    this.name,
    this.creditId,
    this.character,
    this.order,
    this.gender,
    this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) =>
      _$GuestStarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GuestStarToJson(this);

  @override
  String toString() {
    return 'GuestStar(id: $id, name: $name, creditId: $creditId, character: $character, order: $order, gender: $gender, profilePath: $profilePath)';
  }
}
