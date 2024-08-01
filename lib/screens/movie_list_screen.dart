import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/helpers/constants/app_urls.dart';
import 'package:movie_app/helpers/constants/routes_name.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/profile_screen.dart';
import 'package:movie_app/screens/watchlist_screen.dart';
import '/helpers/constants/constants.dart';
import '/managers/movie_manager.dart';
import '/views/movie_cell_view.dart';
import 'package:http/http.dart' as http;

final movieListProvider = StateProvider<List<Movie>>(((ref) => <Movie>[]));
final selectedMovieProvider = StateProvider<Movie?>((ref) => null);

final movieFetchProvider =
    FutureProvider.family<List<Movie>, int>((ref, start) async {
  Uri url = Uri.parse(AppUrls.movieListURL + start.toString());
  var response = await http.get(url);

  if (response.statusCode == 200) {
    ref
        .read(movieListProvider.notifier)
        .state
        .addAll(parseMovies(response.body));
    return ref.watch(movieListProvider);
  } else {
    return <Movie>[];
  }
});

class MovieListScreen extends ConsumerWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Movie>> movieList = ref.watch(movieFetchProvider(1));
    return Container(
        color: Colors.black,
        child: movieList.when(data: (List<Movie> movies) {
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
                  movieList = ref.watch(movieFetchProvider(2));
                }
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedMovieProvider.notifier).state = item;
                    Navigator.pushNamed(
                      context,
                      movieDetailsRouteName,
                      arguments: {
                        "movieID": item.id,
                      },
                    );
                  },
                  child: MovieCellView(
                    imagePath:
                        'https://image.tmdb.org/t/p/w500${item.posterPath}', // Load from network
                    movieTitle: item.title,
                    movieRating: item.voteAverage.toString(),
                    movieLanguage: item.originalLanguage,
                    movieReleaseDate: item.releaseDate,
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
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const WatchListScreen()),
                          (route) => false),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const MovieListScreen()),
                          (route) => false),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: redColor,
                        size: 35.0,
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ProfileScreen()),
                          (route) => false),
                    )
                  ],
                ),
              ),
            ),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Container();
        }, loading: () {
          return const CircularProgressIndicator();
        }));
  }
}
