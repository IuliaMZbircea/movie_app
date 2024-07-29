import 'package:hive/hive.dart';

part 'production_country.g.dart';

@HiveType(typeId: 5)
class ProductionCountry {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  ProductionCountry({required this.id, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
