import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class CreatedBy {
  final int id;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String name;
  final int gender;
  @JsonKey(name: 'profile_path')
  final String profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
