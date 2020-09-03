import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class Network {
  final String name;
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @JsonKey(name: 'origin_country')
  final String originCountry;

  Network({
    this.name,
    this.id,
    this.logoPath,
    this.originCountry,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
