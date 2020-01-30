import 'package:bshare/model/film.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actor_participation.g.dart';

@JsonSerializable()
class ActorParticipation {
  List<Film> cast;
  List<Film> crew;
  int id;

  ActorParticipation({this.cast, this.crew, this.id});

  ActorParticipation.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = new List<Film>();
      json['cast'].forEach((v) {
        cast.add(new Film.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = new List<Film>();
      json['crew'].forEach((v) {
        crew.add(new Film.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}
