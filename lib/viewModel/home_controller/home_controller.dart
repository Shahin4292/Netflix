import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';

import '../../res/app_url/app_url.dart';

var key = '?api_key=$apiKey';
late String endPoint;

class HomeController {
  Future<UpcomingMovieModel> getUpcomingMovie() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";
  }
}
