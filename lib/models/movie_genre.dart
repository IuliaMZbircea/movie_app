import 'package:hive/hive.dart';

part 'movie_genre.g.dart';

@HiveType(typeId: 3)
class MovieGenre {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  MovieGenre({required this.id, required this.name});
}
