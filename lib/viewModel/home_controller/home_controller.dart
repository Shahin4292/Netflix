import 'dart:convert';

import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
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
}
