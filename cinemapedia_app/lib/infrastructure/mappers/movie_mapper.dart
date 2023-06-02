import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie movieDBToEntity(MovieMovieDB movieDB) => Movie(
    adult: movieDB.adult,
    backdropPath: (movieDB.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/original/${movieDB.backdropPath}'
      : 'https://www.google.com/search?q=no+poster+found&oq=no+poster+found&aqs=chrome..69i57.2711j0j4&sourceid=chrome&ie=UTF-8#imgrc=Y3G1MKlRRjE4IM',
    genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
    id: movieDB.id,
    originalLanguage: movieDB.originalLanguage,
    originalTitle: movieDB.originalTitle,
    overview: movieDB.overview,
    popularity: movieDB.popularity,
    posterPath: (movieDB.posterPath != '')
      ? 'https://image.tmdb.org/t/p/original/${movieDB.posterPath}'
      : 'no-poster',
    releaseDate: movieDB.releaseDate,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );
}
