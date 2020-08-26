import 'package:json_annotation/json_annotation.dart';

part 'production_companies.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;
  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}
