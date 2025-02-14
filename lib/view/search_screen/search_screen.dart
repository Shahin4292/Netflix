import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  SearchModel? searchModel;

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
            child: Column(
              children: [
                Container(
                  height: size.width * 0.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ]),
                  child: TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                      } else {}
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
                )
              ],
            ),
          ),
        ));
  }
}
