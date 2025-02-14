import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({
    super.key,
    required Future<List> movies,
  }) : _movies = movies;

  final Future<List> _movies;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No movies found.'));
        }

        final movies = snapshot.data!;

        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 230,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                initialPage: 0,
              ),
              items: movies.map((movie) {
                final imageUrl = 'https://image.tmdb.org/t/p/w500${movie['poster_path']}';
                return Container(
                  margin: EdgeInsets.only(right: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover,)
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}