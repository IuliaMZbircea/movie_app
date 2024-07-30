import 'package:flutter/material.dart';
import '/helpers/constants/constants.dart';

class MovieCellView extends StatelessWidget {
  final String imagePath;
  final String movieTitle;
  final String movieRating;
  final String movieLanguage;
  final String movieReleaseDate;

  const MovieCellView({
    super.key, 
    required this.imagePath,
    required this.movieTitle,
    required this.movieRating,
    required this.movieLanguage,
    required this.movieReleaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      padding: const EdgeInsets.only(top: midSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170,
            height: 350,
            child: Image.network(imagePath, fit: BoxFit.cover),
          ),
          const SizedBox(width: midSpace),
          Expanded(
            child: initRightSideOfCell(),
          ),
        ],
      ),
    );
  }

  Widget initRightSideOfCell() {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieTitle,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: titleFontSize, fontWeight: FontWeight.w500
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            const Icon(
              IconData(0xe5f9, fontFamily: 'MaterialIcons'),
              color: Colors.amberAccent,
            ),
            const SizedBox(width: 5.0),
            Text(
              movieRating,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Text(
          movieLanguage,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5.0),
        Text(
          movieReleaseDate,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
