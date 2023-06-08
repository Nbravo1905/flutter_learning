

import 'package:cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  
  final ActorsDataSource dataSource;

  ActorRepositoryImpl(this.dataSource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    
    return dataSource.getActorsByMovie(movieId);
  }

}