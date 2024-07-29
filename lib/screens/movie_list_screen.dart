import 'package:flutter/material.dart';
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          authenticationManager.signOut(context);
        },
        backgroundColor: const Color.fromARGB(66, 223, 39, 39),
        child: const Icon(Icons.logout_rounded),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(173, 238, 238, 238),
        title: const Text(
          'Movies',
          style: TextStyle(
            fontSize: titleFontSize,
            color: Color.fromARGB(255, 35, 34, 34),
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
    );
  }
}
