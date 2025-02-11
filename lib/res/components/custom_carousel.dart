import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/top_rated_tv_series_movie_model/top_rated_tv_series_movie_model.dart';

class CustomCarousel extends StatelessWidget {
  final TopRatedTvSeriesMovieModel data;

  const CustomCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
        width: size.width,
        height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
        child: CarouselSlider.builder(
            itemCount: data.results.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var url = data.results[index].posterPath.toString();
            },
            options: CarouselOptions()));
  }
}
