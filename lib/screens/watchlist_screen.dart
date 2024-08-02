import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/helpers/constants/strings-en.dart';
import 'package:movie_app/providers/watchlist_provider.dart';
import 'package:movie_app/screens/movie_list_screen.dart';
import 'package:movie_app/screens/profile_screen.dart';
import 'package:movie_app/helpers/constants/constants.dart';
import '../providers/movie_list_provider.dart';

class WatchlistScreen extends ConsumerWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlist = ref.watch(watchlistProvider);
    final movies = ref.watch(movieListProvider);

    final watchlistMovies =
        movies.where((movie) => watchlist.contains(movie.id)).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: const Text(
          watchListScreenTitle,
          style: TextStyle(color: redColor),
        ),
        iconTheme: const IconThemeData(
            color: Colors.white), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const MovieListScreen()),
            (route) => false),
        backgroundColor: redColor,
        child: const Icon(
          Icons.add,
          color: appBarColor,
        ),
      ),
      body: watchlistMovies.isEmpty
          ? const Center(
              child: Text(
                'No movies in your watchlist',
                style:
                    TextStyle(color: Colors.white), 
              ),
            )
          : ListView.builder(
              itemCount: watchlistMovies.length,
              itemBuilder: (context, index) {
                final movie = watchlistMovies[index];
                double rating =
                    double.tryParse(movie.voteAverage.toString()) ?? 0.0;
                String formattedRating = NumberFormat('0.00').format(rating);
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    movie.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber, 
                        size: 20.0, 
                      ),
                      const SizedBox(
                          width: 4.0),
                      Text(
                        formattedRating,
                        style: const TextStyle(
                            color: Colors
                                .white70), 
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      ref.read(watchlistProvider).contains(movie.id)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      ref
                          .read(watchlistProvider.notifier)
                          .toggleWatchlist(movie.id);
                    },
                  ),
                  onTap: () {
                    ref.read(selectedMovieProvider.notifier).state = movie;
                    Navigator.pushNamed(context, '/movie_details');
                  },
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
                  Icons.favorite,
                  color: Colors.white, 
                  size: 35.0,
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const WatchlistScreen()),
                    (route) => false),
              ),
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  color: redColor, 
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
