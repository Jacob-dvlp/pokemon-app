import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

class ResponseApi {
  ResponseApi({
    this.pokemon,
  });

  List<Pokemon>? pokemon;

  ResponseApi copyWith({
    List<Pokemon>? pokemon,
  }) =>
      ResponseApi(
        pokemon: pokemon ?? this.pokemon,
      );

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );
}

class Pokemon {
  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.favorite = false});

  int? id;
  String? num;
  String? name;
  String? img;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  bool favorite;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"] ?? '',
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
      );
}
