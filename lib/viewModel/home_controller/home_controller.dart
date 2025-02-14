import 'dart:convert';
import 'dart:math';

import 'package:netflix/model/search_model/search_model.dart';
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

  Future<SearchModel> getSearchMovie(String searchText) async {
    String bab = "https://api.themoviedb.org/3/search/movie?api_key=8f70539a3d9d0d870609558f7a991e62&query=harry";
    // String keys =
    //     "https://api.themoviedb.org/3/search/movie?query=harry&api_key=8f70539a3d9d0d870609558f7a991e62";
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint$key";
    print("search url : $url");
    final response = await http.get(Uri.parse(bab), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFkbWluQGdtYWlsLmNvbSIsInJvbGUiOiJBRE1JTiIsIl9pZCI6IjY3MjQ1M2I2ZGU0Y2JjNGU1YWUwYjBlMiIsImlhdCI6MTczODQxMTg1MiwiZXhwIjoxNzM5Mjc1ODUyfQ.K5iTqmOIw6sGEuZpBm0UtwJgjabUliiLTOHi0HfhU08"
    });
    final data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      print("success");
      return SearchModel.fromJson(data);
    }
    throw Exception("Failed to search movies");
  }
}
