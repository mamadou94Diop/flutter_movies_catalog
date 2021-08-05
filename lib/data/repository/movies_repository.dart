import '../model/movies_entity.dart';

class MovieRepository {
  final Map<String, String> fileNameMap = {
    "TOP_MOVIES": "assets/top_movies.json",
    "MOVIES_SOON": "assets/movies_coming_soon.json",
    "IN_THEATER": "assets/movies_in_theater.json"
  };

  Future<MovieWrapper> movies(String key) {
    return getMovies(fileNameMap[key]);
  }
}
