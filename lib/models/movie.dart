import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String originalLanguage;
  @HiveField(3)
  final String originalTitle;
  @HiveField(4)
  final String overview;
  @HiveField(5)
  final double popularity;
  @HiveField(6)
  final String posterPath;
  @HiveField(7)
  final String releaseDate;
  @HiveField(8)
  final String title;
  @HiveField(9)
  final bool video;
  @HiveField(10)
  final double voteAverage;
  @HiveField(11)
  final int voteCount;

  Movie({
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] as bool,
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}
