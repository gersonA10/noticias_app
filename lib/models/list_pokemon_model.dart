import 'dart:convert';

ListPokemonModel listPokemonModelFromJson(String str) => ListPokemonModel.fromJson(json.decode(str));

String listPokemonModelToJson(ListPokemonModel data) => json.encode(data.toJson());
class ListPokemonModel {
  int count;
  String next;
  dynamic previous;
  List<ListResultModel> results;

  ListPokemonModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ListPokemonModel.fromJson(Map<String, dynamic> json) {
    return ListPokemonModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<ListResultModel>.from(
        json['results'].map((x) => ListResultModel.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toJson()).toList(),
    };
  }
}

class ListResultModel {
  String name;
  String url;

  ListResultModel({
    required this.name,
    required this.url,
  });

  factory ListResultModel.fromJson(Map<String, dynamic> json) {
    return ListResultModel(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}