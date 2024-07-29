import 'package:hive/hive.dart';

part 'spoken_language.g.dart';

@HiveType(typeId: 6)
class SpokenLanguage {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  SpokenLanguage({required this.id, required this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
