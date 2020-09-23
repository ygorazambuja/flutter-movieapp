import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable(createFactory: true, createToJson: true, explicitToJson: true)
class Review {
  final String author;
  final String content;
  final String id;
  final String url;

  Review({
    this.author,
    this.content,
    this.id,
    this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  String toString() {
    return 'Review(author: $author, content: $content, id: $id, url: $url)';
  }
}
