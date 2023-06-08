import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity( Cast cast) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null 
      ? 'https://image.tmdb.org/t/p/original/${cast.profilePath}'
      : 'https://image.pngaaa.com/169/4811169-small.png', 
    character: cast.character
  );

}