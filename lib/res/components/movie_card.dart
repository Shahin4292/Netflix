import 'package:flutter/material.dart';
import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String text;

  const MovieCard({super.key, required this.future, required this.text});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context, snapshot){
      var data = snapshot.data!.results;
      return Column(
        spacing: 20,
        children: [
          Text(text,style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );
    });
  }
}
