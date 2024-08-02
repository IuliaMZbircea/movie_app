
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/helpers/constants/app_urls.dart';
import 'package:movie_app/managers/movie_manager.dart';
import 'package:movie_app/models/movie.dart';
import 'package:http/http.dart' as http;

final movieListProvider = StateProvider<List<Movie>>(((ref) => <Movie>[]));
final selectedMovieProvider = StateProvider<Movie?>((ref) => null);


final movieFetchProvider =
    FutureProvider.family<List<Movie>, int>((ref, page) async {
  Uri url = Uri.parse(AppUrls.movieListURL + page.toString());
  var response = await http.get(url);

  if (response.statusCode == 200) {
    ref
        .read(movieListProvider.notifier)
        .state
        .addAll(parseMovies(response.body) as Iterable<Movie>);
    return ref.watch(movieListProvider);
  } else {
    return <Movie>[];
  }
});