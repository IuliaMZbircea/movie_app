// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieInfoAdapter extends TypeAdapter<MovieInfo> {
  @override
  final int typeId = 2;

  @override
  MovieInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieInfo(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      genres: (fields[2] as List).cast<MovieGenre>(),
      homepage: fields[3] as String,
      id: fields[4] as int,
      originalLanguage: fields[5] as String,
      originalTitle: fields[6] as String,
      overview: fields[7] as String,
      popularity: fields[8] as double,
      posterPath: fields[9] as String,
      productionCompanies: (fields[10] as List).cast<ProductionCompany>(),
      productionCountries: (fields[11] as List).cast<ProductionCountry>(),
      releaseDate: fields[12] as String,
      runtime: fields[13] as int,
      spokenLanguages: (fields[14] as List).cast<SpokenLanguage>(),
      status: fields[15] as String,
      tagline: fields[16] as String,
      title: fields[17] as String,
      video: fields[18] as bool,
      voteAverage: fields[19] as double,
      voteCount: fields[20] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MovieInfo obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genres)
      ..writeByte(3)
      ..write(obj.homepage)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalTitle)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.posterPath)
      ..writeByte(10)
      ..write(obj.productionCompanies)
      ..writeByte(11)
      ..write(obj.productionCountries)
      ..writeByte(12)
      ..write(obj.releaseDate)
      ..writeByte(13)
      ..write(obj.runtime)
      ..writeByte(14)
      ..write(obj.spokenLanguages)
      ..writeByte(15)
      ..write(obj.status)
      ..writeByte(16)
      ..write(obj.tagline)
      ..writeByte(17)
      ..write(obj.title)
      ..writeByte(18)
      ..write(obj.video)
      ..writeByte(19)
      ..write(obj.voteAverage)
      ..writeByte(20)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
