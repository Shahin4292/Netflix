import 'dart:convert';

import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
import '../../model/top_rated_tv_series_movie_model/top_rated_tv_series_movie_model.dart';
import '../../res/app_url/app_url.dart';

var key = '?api_key=$apiKey';
late String endPoint;

class HomeController {
  Future<UpcomingMovieModel> getUpcomingMovie() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return UpcomingMovieModel.fromJson(data);
    }
    throw Exception("Failed to load upcoming movie");
  }

  Future<UpcomingMovieModel> nowPlayingMovie() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return UpcomingMovieModel.fromJson(data);
    }
    throw Exception("Failed to load now playing movie");
  }

  Future<List<dynamic>> topRatedMovieSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  // Future<TopRatedTvSeriesModel> topRatedMovieSeries() async {
  //   endPoint = "tv/top_rated";
  //   final url = "$baseUrl$endPoint$key";
  //   final response = await http.get(Uri.parse(url));
  //   final data = jsonDecode(response.body);
  //   print(data);
  //   if (response.statusCode == 200) {
  //     return TopRatedTvSeriesModel.fromJson(data);
  //   }
  //   throw Exception("Failed to load tv series");
  // }
}
