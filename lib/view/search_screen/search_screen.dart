import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/model/movie_recommendation/movie_recommendation.dart';
import 'package:netflix/res/app_url/app_url.dart';
import 'package:netflix/res/assets/image_path.dart';
import 'package:netflix/viewModel/home_controller/home_controller.dart';

import '../../model/search_model/search_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  HomeController homeController = HomeController();
  late Future<MovieRecommendationModel> popularMovie;
  SearchModel? searchModel;

  void search(String query) {
    homeController.getSearchMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    popularMovie = homeController.getPopularMovie();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                      } else {
                        search(searchController.text);
                      }
                    },
                    controller: searchController,
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.white),
                    decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: size.width * .05,
                          color: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.cancel_outlined,
                          size: size.width * .05,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                        ),
                        hintText: "Search"),
                  ),
                  searchController.text.isEmpty
                      ? FutureBuilder<MovieRecommendationModel>(
                          future: popularMovie,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var data = snapshot.data?.results;
                              return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Search Movie",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: data!.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          spacing: 15,
                                          children: [
                                            Container(
                                              height: 150,
                                              width: 120,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Image.network(
                                                '$imageUrl${data[index].backdropPath}',
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                data[index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    )
                                  ]);
                            } else {
                              return const SizedBox.shrink();
                            }
                          })
                      : searchModel == null
                          ? SizedBox.shrink()
                          : GridView.builder(
                              shrinkWrap: true,
                              itemCount: searchModel!.results.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      mainAxisSpacing: 15,
                                      crossAxisSpacing: 5,
                                      childAspectRatio: 1.2 / 2),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                        height: 130,
                                        width: 120,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            "$imageUrl${searchModel?.results[index].backdropPath}",
                                          )),
                                        )),
                                    Text(searchModel!.results[index].title,overflow: TextOverflow.ellipsis,)
                                  ],
                                );
                              })
                ],
              ),
            ),
          ),
        ));
  }
}
