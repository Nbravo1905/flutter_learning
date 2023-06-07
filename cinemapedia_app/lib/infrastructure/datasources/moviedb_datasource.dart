import 'package:cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasource {

  final baseDio = Dio(BaseOptions(
    baseUrl: Environment.theMovieUrl,
    queryParameters: {
      'api_key': Environment.theMovieKey,
      'language': 'es-mx'
    }
  ));

  List<Movie> _jsonToMovies( Map<String, dynamic> json) {

    final movieDbResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDbResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();
   
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await baseDio.get('/movie/now_playing',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    
    final response = await baseDio.get('/movie/popular',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    
    final response = await baseDio.get('/movie/upcoming',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getToRated({int page = 1}) async {
    
    final response = await baseDio.get('/movie/top_rated',
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);
  }



}