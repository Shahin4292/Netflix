import 'package:flutter/material.dart';
import 'package:netflix/model/movie_details_model/movie_details_movie.dart';
import 'package:netflix/res/app_url/app_url.dart';
import 'package:netflix/viewModel/home_controller/home_controller.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  HomeController homeController = HomeController();
  late Future<MovieDetailsModel> movieDetail;

  @override
  void initState() {
    fetchInitialData();
    print("This is movie Id: ${widget.movieId}");
    super.initState();
  }

  fetchInitialData() {
    setState(() {
      movieDetail = homeController.getMovieDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;
                return Container(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage("$imageUrl${movie!.posterPath}"),fit: BoxFit.cover)),
                );
              } else {
                return SizedBox.shrink();
              }
            }));
  }
}
