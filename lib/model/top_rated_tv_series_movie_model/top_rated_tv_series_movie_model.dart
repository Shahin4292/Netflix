// To parse this JSON data, do
//
//     final topRatedTvSeriesModel = topRatedTvSeriesModelFromJson(jsonString);

import 'dart:convert';

TopRatedTvSeriesModel topRatedTvSeriesModelFromJson(String str) => TopRatedTvSeriesModel.fromJson(json.decode(str));

String topRatedTvSeriesModelToJson(TopRatedTvSeriesModel data) => json.encode(data.toJson());

class TopRatedTvSeriesModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  TopRatedTvSeriesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedTvSeriesModel.fromJson(Map<String, dynamic> json) => TopRatedTvSeriesModel(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  DateTime firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    firstAirDate: DateTime.parse(json["first_air_date"]),
    name: json["name"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
    "name": name,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalLanguage {
  EN,
  ES,
  JA
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ja": OriginalLanguage.JA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
