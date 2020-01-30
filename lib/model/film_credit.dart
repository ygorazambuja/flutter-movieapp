import 'package:bshare/provider/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film_credit.g.dart';

@JsonSerializable()
class FilmCredit {
  int id;
  List<Cast> cast;
  List<Crew> crew;

  FilmCredit({this.id, this.cast, this.crew});

  FilmCredit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = new List<Cast>();
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = new List<Crew>();
      json['crew'].forEach((v) {
        crew.add(new Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Cast {
  @JsonKey(name: 'cast_id')
  int castId;
  String character;
  @JsonKey(name: 'credit_key')
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  @JsonKey(name: 'profile_path')
  String profilePath;

  Cast(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.order,
      this.profilePath});

  Cast.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    if (json['profile_path'] != null) {
      profilePath = '$IMAGE_BASE_URL${json['profile_path']}';
    } else {
      profilePath =
          'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg';
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cast_id'] = this.castId;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['name'] = this.name;
    data['order'] = this.order;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

@JsonSerializable()
class Crew {
  @JsonKey(name: 'credit_id')
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  @JsonKey(name: 'profile_path')
  String profilePath;

  Crew(
      {this.creditId,
      this.department,
      this.gender,
      this.id,
      this.job,
      this.name,
      this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    creditId = json['credit_id'];
    department = json['department'];
    gender = json['gender'];
    id = json['id'];
    job = json['job'];
    name = json['name'];
    if (json['profile_path'] != null) {
      profilePath = '$IMAGE_BASE_URL${json['profile_path']}';
    } else {
      profilePath =
          'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['credit_id'] = this.creditId;
    data['department'] = this.department;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['job'] = this.job;
    data['name'] = this.name;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
