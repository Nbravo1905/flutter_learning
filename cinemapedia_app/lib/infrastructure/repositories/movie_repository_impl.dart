import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/repositories/movies_repository.dart';

import 'package:cinemapedia_app/domain/entities/movie.dart';


class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    
    return datasource.getNowPlaying(page: page);

  }

}