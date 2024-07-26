import 'dart:convert';
import 'package:movie_app/helpers/constants/app_urls.dart';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

List<Movie> parseMovies(String responseBody) {

  final parsed = jsonDecode(responseBody)['results'].cast<Map<String, dynamic>>();
  return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
}



Future<List<Movie>> getMovies() async{
  Uri url = Uri.parse(AppUrls.movieListURL + '1');
  var response = await http.get(url);
  if(response.statusCode == 200){
    return parseMovies(response.body);
  }
  return [];
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
