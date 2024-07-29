import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movie_genre.dart';
import 'package:movie_app/models/movie_info.dart';
import 'package:movie_app/models/production_company.dart';
import 'package:movie_app/models/production_country.dart';
import 'package:movie_app/models/spoken_language.dart';

class HiveManager {

  static final instance = HiveManager._internal();
  late Box<Movie> movieBox;

  factory HiveManager(){
    return instance;
  }
  HiveManager._internal();

  Future<void> initHiveManager() async {
  
    Hive.registerAdapter(MovieGenreAdapter());
    Hive.registerAdapter(MovieInfoAdapter());
    Hive.registerAdapter(MovieAdapter());
    Hive.registerAdapter(ProductionCompanyAdapter());
    Hive.registerAdapter(ProductionCountryAdapter());
    Hive.registerAdapter(SpokenLanguageAdapter());
 

    movieBox = await Hive.openBox('movies');

  }
}


//Now we have the adapters registered and the box is open
//This means that everytime we call movieBox we can read and write from the movie list