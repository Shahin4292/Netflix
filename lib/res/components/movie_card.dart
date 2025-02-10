import 'package:flutter/material.dart';
import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';
import 'package:netflix/res/app_url/app_url.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String text;

  const MovieCard({super.key, required this.future, required this.text});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          var data = snapshot.data!.results;
          return Column(
            spacing: 20,
            children: [
              Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                    final dataVar = data[index].posterPath;
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network("$imageUrl$dataVar"),
                      );
                    }),
              )
            ],
          );
        });
  }
}
