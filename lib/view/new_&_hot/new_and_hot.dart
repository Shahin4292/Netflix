import 'package:flutter/material.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: Text(
              "New & Hot",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Icon(
                Icons.cast,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(height: 27, width: 27, color: Colors.blue)),
              SizedBox(width: 10),
            ],
          ),
        )));
  }
}
