import 'package:flutter/material.dart';
import '/helpers/constants/constants.dart';
import '/managers/movie_manager.dart';
import '/views/movie_cell_view.dart';
import '../models/movie.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreen createState() => _MovieListScreen();
}

class _MovieListScreen extends State<MovieListScreen> {

  List<Movie> movies = parseMovies(dummyResponse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading : true,
        backgroundColor: Color.fromARGB(179, 42, 22, 138),
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: titleFontSize,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: movies.length,
        itemBuilder: (context, index){
          var item = movies[index];
          return MovieCellView(
            imagePath: item.posterPath,
            movieTitle: item.title,
            movieRating: item.voteAverage.toString(),
            movieLanguage: item.originalLanguage,
            movieReleaseDate: item.releaseDate,

          );
        }
      ),
    );
  }
}