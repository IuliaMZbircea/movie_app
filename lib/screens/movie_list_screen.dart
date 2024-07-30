import 'package:flutter/material.dart';
import 'package:movie_app/helpers/constants/routes_name.dart';
import '/helpers/constants/constants.dart';
import '/managers/movie_manager.dart';
import '/views/movie_cell_view.dart';
import '../managers/authentication_manager.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreen createState() => _MovieListScreen();
}

AuthenticationManager authenticationManager = AuthenticationManager();

class _MovieListScreen extends State<MovieListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: titleFontSize,
            color: redColor,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getMovies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error!'));
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(child: Text('No Movies Found.'));
          } else {
            var movies = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var item = movies[index];
                return MovieCellView(
                  imagePath:
                      'https://image.tmdb.org/t/p/w500${item.posterPath}', // Load from network
                  movieTitle: item.title,
                  movieRating: item.voteAverage.toString(),
                  movieLanguage: item.originalLanguage,
                  movieReleaseDate: item.releaseDate,
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: appBarColor,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, watchListRouteName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, movieListRouteName),
              ),
              IconButton(
                icon: const Icon(
                  Icons.account_circle_outlined,
                  color: redColor,
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushNamed(context, signOutRouteName),
              )
            ],
          ),
        ),
      ),
    );
  }
}
