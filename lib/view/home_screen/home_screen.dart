import 'package:flutter/material.dart';
import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';
import 'package:netflix/res/app_url/app_url.dart';
import 'package:netflix/res/assets/image_path.dart';
import 'package:netflix/res/components/movie_card.dart';
import 'package:netflix/viewModel/home_controller/home_controller.dart';

import '../../res/components/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowPlayingFuture;
  late Future<List<dynamic>> _movies;

  @override
  void initState() {
    upcomingFuture = homeController.getUpcomingMovie();
    nowPlayingFuture = homeController.nowPlayingMovie();
    _movies = homeController.topRatedMovieSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: kBackgroundColor,
          title: Image.asset(
            ImagePath.logo,
            height: 50,
            width: 120,
          ),
          actions: [
            InkWell(
                onTap: () {},
                child: Icon(Icons.search, color: Colors.white, size: 25)),
            SizedBox(
              width: 15,
            ),
            Container(
                height: 27,
                width: 27,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blue)),
            SizedBox(
              width: 25,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                CustomCarousel(movies: _movies),
                SizedBox(
                    height: 230,
                    child: MovieCard(
                        future: nowPlayingFuture, text: "Now Playing Movie")),
                SizedBox(
                    height: 230,
                    child: MovieCard(
                        future: upcomingFuture, text: "Upcoming Movie")),
              ],
            ),
          ),
        ));
  }
}
