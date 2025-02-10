import 'package:flutter/material.dart';
import 'package:netflix/res/app_url/app_url.dart';
import 'package:netflix/res/assets/image_path.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: true,
        title: Image.asset(
          ImagePath.logo,
          height: 50,
          width: 120,
        ),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
