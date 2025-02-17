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
                return Stack(
                  children: [
                    Container(
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage("$imageUrl${movie!.posterPath}"),
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
                );
              } else {
                return SizedBox.shrink();
              }
            }));
  }
}
