import 'dart:convert';
import '../models/movie.dart';

List<Movie> parseMovies(String responseBody) {
  // Decode JSON response body into a List<dynamic>
  final List<dynamic> parsed = jsonDecode(responseBody);

  // Map the List<dynamic> to List<Movie> using Movie.fromJson
  return parsed.map<Movie>((json) => Movie.fromJson(json as Map<String, dynamic>)).toList();
}

const String dummyResponse = '''
[
  {
    "adult": false,
    "backdrop_path": "/assets/empty_movie_poster.png",
    "genre_ids": [14, 10751, 35, 14],
    "id": 765456,
    "original_language": "English",
    "original_title": "Inception",
    "overview": "blablabla",
    "popularity": 5432.453, 
    "poster_path": "/assets/inception.png",
    "release_date": "30.08.2011",
    "title": "Inception",
    "video": false,
    "vote_average": 8.5, 
    "vote_count": 1234
  }
]
''';
