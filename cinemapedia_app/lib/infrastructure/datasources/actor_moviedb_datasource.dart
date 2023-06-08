import 'package:cinemapedia_app/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia_app/domain/entities/actor.dart';

class ActorMovieDbDatasource extends ActorsDataSource {

  final baseDio = Dio(BaseOptions(
    baseUrl: Environment.theMovieUrl,
    queryParameters: {
      'api_key': Environment.theMovieKey,
      'language': 'es-mx'
    }
  ));
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    
    final response = await baseDio.get(
      '/movie/$movieId/credits'
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((cast)
      => ActorMapper.castToEntity(cast)
    ).toList();
    
    return actors;
  }



}