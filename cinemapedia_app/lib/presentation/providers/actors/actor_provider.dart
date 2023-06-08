import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/presentation/providers/actors/actor_repository_provider.dart';


final actorProvider = StateNotifierProvider<ActorsNotifier, Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch( actorRepositoryProvider );

  return ActorsNotifier(getActors: actorsRepository.getActorsByMovie);
});



typedef GetActorCallback = Future<List<Actor>>Function(String movieId);

class ActorsNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorCallback getActors;
  
  ActorsNotifier({
    required this.getActors
  }): super({});

  
  Future<void> loadActors( String movieId ) async {
    if( state[movieId] != null ) return;

    final List<Actor> actors = await getActors(movieId);
    state = { ...state, movieId: actors };
    
  }
  
}