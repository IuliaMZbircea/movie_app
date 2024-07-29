import '../models/movie_genre.dart';
import '../models/production_company.dart';
import '../models/production_country.dart';
import '../models/spoken_language.dart';
import 'package:hive/hive.dart';

part 'movie_info.g.dart';

@HiveType(typeId: 2)
class MovieInfo {
  @HiveField(0)
  final bool adult;
  @HiveField(1)
  final String backdropPath;
  @HiveField(2)
  final List<MovieGenre> genres;
  @HiveField(3)
  final String homepage;
  @HiveField(4)
  final int id;
  @HiveField(5)
  final String originalLanguage;
  @HiveField(6)
  final String originalTitle;
  @HiveField(7)
  final String overview;
  @HiveField(8)
  final double popularity;
  @HiveField(9)
  final String posterPath;
  @HiveField(10)
  final List<ProductionCompany> productionCompanies;
  @HiveField(11)
  final List<ProductionCountry> productionCountries;
  @HiveField(12)
  final String releaseDate;
  @HiveField(13)
  final int runtime;
  @HiveField(14)
  final List<SpokenLanguage> spokenLanguages;
  @HiveField(15)
  final String status;
  @HiveField(16)
  final String tagline;
  @HiveField(17)
  final String title;
  @HiveField(18)
  final bool video;
  @HiveField(19)
  final double voteAverage;
  @HiveField(20)
  final int voteCount;

  MovieInfo(
      {required this.adult,
      required this.backdropPath,
      required this.genres,
      required this.homepage,
      required this.id,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.productionCompanies,
      required this.productionCountries,
      required this.releaseDate,
      required this.runtime,
      required this.spokenLanguages,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      genres: json['genres'] as List<MovieGenre>,
      homepage: json['homepage'] as String,
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      productionCompanies:
          json['productionCompanies'] as List<ProductionCompany>,
      productionCountries:
          json['productionCountries'] as List<ProductionCountry>,
      releaseDate: json['release_date'] as String,
      runtime: json['runtime'] as int,
      spokenLanguages: json['spokenLanguages'] as List<SpokenLanguage>,
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}
