import 'package:hive/hive.dart';

part 'production_company.g.dart';

@HiveType(typeId: 4)
class ProductionCompany {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  ProductionCompany({required this.id, required this.name});

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
