import 'dart:convert';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app/helpers/constants/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/managers/hive_manager.dart';
import '../models/movie.dart';

List<Movie> parseMovies(String responseBody) {
  final parsed =
      jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();

  List<Movie> movies =
      parsed.map<Movie>((json) => Movie.fromJson(json)).toList();

//add movies in local db based on uniqueness over ID by overwritting if the movie already exists.
  for (var movie in movies) {
    HiveManager.instance.movieBox.put(movie.id, movie);
  }
  
  return movies;
}

Future<List<Movie>> getMovies({int page = 1}) async {
  Uri url = Uri.parse(AppUrls.movieListURL + page.toString());
  bool hasInternetConnection = await InternetConnectionChecker().hasConnection;

  if (hasInternetConnection) {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return parseMovies(response.body);
    } else {
      return <Movie>[];
    }
  } else {
    List<Movie> listMovies = HiveManager.instance.movieBox.values.toList();
    return listMovies;
  }
}








// const String dummyResponse = '''
// [
//   {
//     "adult": false,
//     "backdrop_path": "./assets/empty_movie_poster.png",
//     "genre_ids": [14, 10751, 35, 14],
//     "id": 765456,
//     "original_language": "English",
//     "original_title": "Inception",
//     "overview": "blablabla",
//     "popularity": 5432.453, 
//     "poster_path": "./assets/inception.png",
//     "release_date": "30.07.2010",
//     "title": "Inception",
//     "video": false,
//     "vote_average": 8.8, 
//     "vote_count": 1234
//   },
//   {
//     "adult": false,
//     "backdrop_path": "./assets/littleMissSunshine.png",
//     "genre_ids": [14, 10751, 35, 14],
//     "id": 765456,
//     "original_language": "English",
//     "original_title": "Little Miss Sunshine",
//     "overview": "blablabla",
//     "popularity": 5432.453, 
//     "poster_path": "./assets/littleMissSunshine.png",
//     "release_date": "05.01.2007",
//     "title": "Little Miss Sunshine",
//     "video": false,
//     "vote_average": 7.8, 
//     "vote_count": 1234
//   },
//   {
//     "adult": false,
//     "backdrop_path": "./assets/lordOfWar.png",
//     "genre_ids": [14, 10751, 35, 14],
//     "id": 765456,
//     "original_language": "English",
//     "original_title": "Lord Of War",
//     "overview": "blablabla",
//     "popularity": 5432.453, 
//     "poster_path": "./assets/lordOfWar.png",
//     "release_date": "16.09.2005",
//     "title": "Lord Of War",
//     "video": false,
//     "vote_average": 7.6, 
//     "vote_count": 1234
//   },
//   {
//     "adult": false,
//     "backdrop_path": "./assets/clueless.png",
//     "genre_ids": [14, 10751, 35, 14],
//     "id": 765456,
//     "original_language": "English",
//     "original_title": "Clueless",
//     "overview": "blablabla",
//     "popularity": 5432.453, 
//     "poster_path": "./assets/clueless.png",
//     "release_date": "19.07.1995",
//     "title": "Clueless",
//     "video": false,
//     "vote_average": 6.9, 
//     "vote_count": 1234
//   },{
//     "adult": false,
//     "backdrop_path": "./assets/shawshankRedemption.png",
//     "genre_ids": [14, 10751, 35, 14],
//     "id": 765456,
//     "original_language": "English",
//     "original_title": "Shawshank Redemption",
//     "overview": "blablabla",
//     "popularity": 5432.453, 
//     "poster_path": "./assets/shawshankRedemption.png",
//     "release_date": "14.10.1994",
//     "title": "Shawshank Redemption",
//     "video": false,
//     "vote_average": 9.3, 
//     "vote_count": 1234
//   }
// ]
// ''';
