import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/movie_details.dart';
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
      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1Zco_AzlB5030ccqs-SkdHxO_PmzfBw5sjXSKCjfaX46A9-YEg-9_vjqAHsvgQTw3kbw',
    releaseDate: (movieDB.releaseDate != null) 
      ? movieDB.releaseDate
      : null,
    title: movieDB.title,
    video: movieDB.video,
    voteAverage: movieDB.voteAverage,
    voteCount: movieDB.voteCount
  );

  static Movie movieDetailsToEntity( MovieDetails movieDetails ) => Movie(
    adult: movieDetails.adult,
    backdropPath: (movieDetails.backdropPath != '')
      ? 'https://image.tmdb.org/t/p/original/${movieDetails.backdropPath}'
      : 'https://www.google.com/search?q=no+poster+found&oq=no+poster+found&aqs=chrome..69i57.2711j0j4&sourceid=chrome&ie=UTF-8#imgrc=Y3G1MKlRRjE4IM',
    genreIds: movieDetails.genres.map((e) => e.name).toList(),
    id: movieDetails.id,
    originalLanguage: movieDetails.originalLanguage,
    originalTitle: movieDetails.originalTitle,
    overview: movieDetails.overview,
    popularity: movieDetails.popularity,
    posterPath: (movieDetails.posterPath != '')
      ? 'https://image.tmdb.org/t/p/original/${movieDetails.posterPath}'
      : 'https://www.google.com/search?q=no+poster+found&oq=no+poster+found&aqs=chrome..69i57.2711j0j4&sourceid=chrome&ie=UTF-8#imgrc=Y3G1MKlRRjE4IM',
    releaseDate: movieDetails.releaseDate,
    title: movieDetails.title,
    video: movieDetails.video,
    voteAverage: movieDetails.voteAverage,
    voteCount: movieDetails.voteCount
  );
}
