import 'dart:convert';

ResponseFavorite responseApiFromJson(String str) =>
    ResponseFavorite.fromJson(json.decode(str));

class ResponseFavorite {
  final bool? favorite;
  final String? name;
  final String? num;

  ResponseFavorite({this.favorite, this.name, this.num});

  Map<String, dynamic> toMap() {
    return {
      'favorite': favorite,
      'name': name,
      'num': num,
    };
  }

  factory ResponseFavorite.fromJson(Map<String, dynamic> json) =>
      ResponseFavorite(
        favorite: json["favorite"],
        name: json["name"],
        num: json["num"]??'',
      );

  String toJson() => json.encode(toMap());
}
