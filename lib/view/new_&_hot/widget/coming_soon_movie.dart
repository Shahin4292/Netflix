import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovie extends StatelessWidget {
  final String imageUrl;
  final String overView;
  // final String logoUrl;
  final String month;
  final String day;

  const ComingSoonMovie(
      {super.key,
      required this.imageUrl,
      required this.overView,
      // required this.logoUrl,
      required this.month,
      required this.day});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      child: Row(
        children: [
          Column(
            children: [
              Text(month,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(day,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            children: [
              Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imageUrl)))),
              // Row(
              //   children: [
              //     SizedBox(
              //         height: size.height * 0.2,
              //         width: size.width * 0.5,
              //         child: CachedNetworkImage(
              //             imageUrl: logoUrl, alignment: Alignment.centerLeft)),
              //   ],
              // ),
              Text(overView,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            ],
          ))
        ],
      ),
    );
  }
}
