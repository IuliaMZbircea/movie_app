import 'package:flutter/material.dart';
import '/helpers/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class MovieCellView extends StatelessWidget {
  final String imagePath;
  final String movieTitle;
  final String movieRating;
  final String movieLanguage;
  final String movieReleaseDate;

  const MovieCellView({super.key, 
    required this.imagePath,
    required this.movieTitle,
    required this.movieRating,
    required this.movieLanguage,
    required this.movieReleaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      padding: const EdgeInsets.only(top: midSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 100.0),
          initRightSideOfCell(),
        ],
      ),
    );
  }

  Widget initRightSideOfCell() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieTitle,
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: const TextStyle(
                fontSize: titleFontSize, fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(IconData(0xe5f9, fontFamily: 'MaterialIcons'),
            color: Colors.amberAccent,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
              movieRating,style: const TextStyle(fontSize: 15.0),
            ),

          ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(movieLanguage),
          const SizedBox(
            height: 5.0
            ),
            Text(movieReleaseDate)
        ],
      ),
    );
  }
}
