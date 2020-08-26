import 'package:json_annotation/json_annotation.dart';

part 'spoken_languages.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class SpokenLanguages {
  String iso6391;
  String name;
  SpokenLanguages({this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguagesFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguagesToJson(this);
}
