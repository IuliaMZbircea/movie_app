import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import 'package:movie_app/screens/movie_list_screen.dart';

class MovieDetailsScreen extends ConsumerWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final selectedMovie = ref.watch(selectedMovieProvider);

    double _width = size.width;
    double _height = size.height / 3;

    double rating =
        double.tryParse(selectedMovie!.voteAverage.toString()) ?? 0.0;
    String formattedRating = NumberFormat('0.00').format(rating);

    DateTime parsedDate = DateTime.parse(selectedMovie.releaseDate);
    String formattedDate = DateFormat('yyy').format(parsedDate);

    // ignore: unnecessary_null_comparison
    if (selectedMovie == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Details'),
        ),
        body: const Center(
          child: Text('No movie selected'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 11, 11, 11),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: _width,
                    height: _height,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${selectedMovie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: _height / 2.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.95),
                          Colors.transparent
                        ],
                        stops: const [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(width: 8.0),
                  Text(
                    selectedMovie.title,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: movieTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
           
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    IconData(0xe5f9, fontFamily: 'MaterialIcons'),
                    color: Colors.amberAccent,
                  ),
                  const SizedBox(width: 5.0),
                  Text(formattedRating,
                      style: const TextStyle(
                          fontSize: movieRatingFontSize,
                          color: Color.fromARGB(255, 197, 197, 197))),
                  const SizedBox(width: 5.0),
                  Text('(${selectedMovie.voteCount})',
                      style: const TextStyle(
                          fontSize: movieVoteCountFontSize,
                          color: Color.fromARGB(255, 197, 197, 197))),
                  const SizedBox(width: 15.0),
                  const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: movieFavouriteIconSize,
                  ),
                ],
              ),
            ),
           
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(formattedDate,
                      style: const TextStyle(
                          fontSize: movieOverviewFontSize,
                          color: Color.fromARGB(255, 197, 197, 197))),
                const SizedBox(width: 8.0),
                selectedMovie.adult ?
                  const Icon(
                    Icons.explicit_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ) : const Icon(
                    Icons.explicit_outlined,
                    color: Colors.black,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(selectedMovie.overview,
                  style: const TextStyle(
                      fontSize: movieOverviewFontSize,
                      color: Color.fromARGB(255, 197, 197, 197))),
            ),
            
          ],
        ),
      ),
    );
  }
}
