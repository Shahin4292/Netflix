import 'package:flutter/material.dart';
import 'package:netflix/model/upcoming_movie_model/upcoming_movie_model.dart';
import 'package:netflix/res/app_url/app_url.dart';

class MovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String text;

  const MovieCard({super.key, required this.future, required this.text});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingMovieModel>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      // padding: const EdgeInsets.all(3),
                      scrollDirection: Axis.horizontal,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.network(
                            '$imageUrl${data[index].posterPath}',
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    ),
                  )
                ]);
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
