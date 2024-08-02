import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/helpers/constants/routes_name.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/profile_screen.dart';
import 'package:movie_app/screens/watchlist_screen.dart';
import '/helpers/constants/constants.dart';
import '../providers/movie_list_provider.dart';
import '/views/movie_cell_view.dart';



class MovieListScreen extends ConsumerWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int page = 1;
    AsyncValue<List<Movie>> movieList = ref.watch(movieFetchProvider(page));
    return Container(
      color: Colors.black,
      child: movieList.when(
        data: (List<Movie> movies) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: appBarColor,
              title: const Text(
                movieListScreenTitle,
                style: TextStyle(
                  fontSize: titleFontSize,
                  color: redColor,
                ),
              ),
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                var item = movies[index];
               
                if (index == movies.length - 1) {
                  ref.watch(movieFetchProvider(page++));
                }
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedMovieProvider.notifier).state = item;
                    Navigator.pushNamed(
                      context,
                      movieDetailsRouteName,
                      arguments: {
                        "id": item.id,
                      },
                    );
                  },
                  child: MovieCellView(
                    imagePath:
                        'https://image.tmdb.org/t/p/w500${item.posterPath}',
                    movieTitle: item.title,
                    movieRating: item.voteAverage.toString(),
                    movieLanguage: item.originalLanguage,
                    movieReleaseDate: item.releaseDate,
                    movieId: item.id,
                  ),
                );
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
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WatchlistScreen(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MovieListScreen(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: redColor,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}