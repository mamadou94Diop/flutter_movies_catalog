import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:movie_catalog_flutter_app/generated/json/base/json_convert_content.dart';
import 'package:movie_catalog_flutter_app/generated/json/movies_entity_helper.dart';
import 'package:movie_catalog_flutter_app/utils/string_utils.dart';

class MovieWrapper with JsonConvert<MovieWrapper> {
  List<MovieEntity> movies;

  MovieWrapper() {
    movies = [];
  }

  List<String> getMoviesGenre() {
    List<String> genres =
        movies.expand((e) => e.genres).toList().toSet().toList();
    genres.sort();
    return genres;
  }
}

class MovieEntity with JsonConvert<MovieEntity> {
  String id;
  String title;
  String year;
  List<String> genres;
  List<int> ratings;
  String poster;
  String contentRating;
  String duration;
  String releaseDate;
  int averageRating;
  String originalTitle;
  String storyline;
  List<String> actors;
  String imdbRating;
  String posterurl;

  double rating() {
    if (ratings.isNotEmpty) {
      return 0.5* ratings.reduce((a, b) => a + b) / (ratings.length);
    } else if (imdbRating.isEmpty) {
      return double.parse(imdbRating);
    } else {
      return 0.0;
    }
  }
  String movieDuration(){
     if (duration.isEmpty){
        return "Unknown";
     } else {
      return formatDuration(duration);
     }
  }
}

Future<MovieWrapper> getMovies(String filename) async {
  String jsonData = await rootBundle.loadString(filename);
  final jsonResult = json.decode(jsonData);
  final movies = toMovieEntityList(jsonResult);
  final movieWrapper = MovieWrapper();
  movieWrapper.movies = movies;

  return movieWrapper;
}

List<MovieEntity> toMovieEntityList(json) {
  List<MovieEntity> movies = [];
  for (var index = 0; index < json.length; index++) {
    final MovieEntity movieEntity =
        movieEntityFromJson(MovieEntity(), json[index]);
    movies.add(movieEntity);
  }
  return movies;
}
