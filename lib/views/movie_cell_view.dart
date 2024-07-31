// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/screens/movie_details_screen.dart';
import '/helpers/constants/constants.dart';
import 'package:intl/intl.dart';

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
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 2.8;
    double _height = size.height / 3.8;
    return Container(
      height: _height,
      padding: const EdgeInsets.only(top: midSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _width,
            height: _height,
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
    final ValueNotifier<bool> _isFavourite = ValueNotifier<bool>(false);

    //format date
    DateTime parsedDate = DateTime.parse(movieReleaseDate);
    String formattedDate = DateFormat('d MMM yyy').format(parsedDate);

    //format rating
    double rating = double.tryParse(movieRating) ?? 0.0;
    String formattedRating = NumberFormat('0.00').format(rating);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieTitle,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: movieFontSize,
            fontWeight: FontWeight.w500,
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
              formattedRating,
              style: const TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Text(
          'Original Language: $movieLanguage',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5.0),
        Text(
          'Release Date: $formattedDate',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5.0),
        ValueListenableBuilder<bool>(
          valueListenable: _isFavourite,
          builder: (context, isFavourite, child) {
            return FloatingActionButton(
              onPressed: () {
                _isFavourite.value = !_isFavourite.value;
              },
              backgroundColor: Colors.white,
              foregroundColor: isFavourite ? Colors.red : appBarColor,
              shape: const CircleBorder(),
              tooltip: 'Add to watchlist',
              elevation: 0.0,
              highlightElevation: 0.0,
              child: Icon(
                isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
                color: isFavourite
                    ? Colors.red
                    : const Color.fromARGB(255, 98, 98, 98),
              ),
            
            );
          },
        ),
      ],
    );
  }
}
