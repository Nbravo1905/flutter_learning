


import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  
  static String theMovieKey = dotenv.env['THE_MOVIEDB_KEY'] ?? '';
  static String theMovieUrl = dotenv.env['THE_MOVIEDB_URL'] ?? '';

}