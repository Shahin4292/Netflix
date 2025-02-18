import 'package:flutter/material.dart';
import 'package:netflix/model/movie_details_model/movie_details_movie.dart';
import 'package:netflix/model/movie_recommendation/movie_recommendation.dart';
import 'package:netflix/res/app_url/app_url.dart';
import 'package:netflix/viewModel/home_controller/home_controller.dart';

import '../../res/assets/image_path.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  HomeController homeController = HomeController();
  late Future<MovieDetailsModel> movieDetail;
  late Future<MovieRecommendationModel> movieRecommendations;

  @override
  void initState() {
    fetchInitialData();
    print("This is movie Id: ${widget.movieId}");
    super.initState();
  }

  fetchInitialData() {
    setState(() {
      movieDetail = homeController.getMovieDetails(widget.movieId);
      movieRecommendations =
          homeController.getMovieRecommendation(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
                future: movieDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final movie = snapshot.data;
                    String genreText =
                        movie!.genres.map((genre) => genre.name).join(', ');
                    return Column(
                      spacing: 20,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 350,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "$imageUrl${movie!.posterPath}"),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                top: 20,
                                left: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Icon(Icons.arrow_back_ios_new),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 15,
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  movie.releaseDate.year.toString(),
                                  style: TextStyle(
                                      // fontSize: 22,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  genreText,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                              ],
                            ),
                            Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ],
                        ),
                        FutureBuilder(
                            future: movieRecommendations,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final movie = snapshot.data;
                                return movie!.results.isEmpty
                                    ? Text("Something went wrong")
                                    : Column(
                                        spacing: 20,
                                        children: [
                                          Text("More Like This"),
                                          GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: movie.results.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 15,
                                                      crossAxisSpacing: 5,
                                                      childAspectRatio:
                                                          1.2 / 2),
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    height: 130,
                                                    width: 120,
                                                    margin: EdgeInsets.only(
                                                        right: 15),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                "$imageUrl${movie.results[index].posterPath}"))));
                                              }),
                                        ],
                                      );
                              }
                              return SizedBox();
                            })
                      ],
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                }),
          ),
        ));
  }
}
