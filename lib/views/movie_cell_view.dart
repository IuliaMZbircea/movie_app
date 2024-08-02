// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/providers/watchlist_provider.dart';
import '/helpers/constants/constants.dart';
import 'package:intl/intl.dart';

class MovieCellView extends ConsumerWidget {
  final String imagePath;
  final String movieTitle;
  final String movieRating;
  final String movieLanguage;
  final String movieReleaseDate;
  final int movieId;

   const MovieCellView({
    super.key,
    required this.imagePath,
    required this.movieTitle,
    required this.movieRating,
    required this.movieLanguage,
    required this.movieReleaseDate,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    double _width = size.width / 2.8;
    double _height = size.height / 3.8;


    return Container(
      color: Colors.black,
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
            child: initRightSideOfCell(ref),
          ),
        ],
      ),
    );
  }

  Widget initRightSideOfCell(WidgetRef ref) {
    

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
            color: redColor,
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
            const SizedBox(width: 4.0),
            Text(
              formattedRating,
              style: const TextStyle(fontSize: 18.0, color: redColor),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          'Original Language: $movieLanguage',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: redColor),
        ),
        

        const SizedBox(height: 4.0),
        Text(
          'Released: $formattedDate',
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: redColor),
        ),
        Consumer(
          builder: (context, ref, child) {
            final isFavourite = ref.watch(watchlistProvider).contains(movieId);
            return FloatingActionButton(
              onPressed: () {
                ref.read(watchlistProvider.notifier).toggleWatchlist(movieId);
              },
              backgroundColor: Colors.black,
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
