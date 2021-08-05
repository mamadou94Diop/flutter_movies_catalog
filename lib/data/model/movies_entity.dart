import 'package:first_flutter_app/generated/json/base/json_convert_content.dart';
import 'package:first_flutter_app/generated/json/movies_entity_helper.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MovieWrapper with JsonConvert<MovieWrapper> {
  List<MovieEntity> movies;

  MovieWrapper(List<MovieEntity> _movies) {
    movies = _movies;
  }

  List<String> getMoviesGenre() {
    List<String> genres = movies.expand((e) => e.genres).toList().toSet().toList();
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
}

Future<MovieWrapper> getMovies(String filename) async {
  String jsonData = await rootBundle.loadString(filename);
  final jsonResult = json.decode(jsonData);
  final movies = toMovieEntityList(jsonResult);

  return new MovieWrapper(movies);
}

List<MovieEntity> toMovieEntityList(json) {
  var movies = List<MovieEntity>();
  for (var index = 0; index < json.length; index++) {
    var movieEntity = moviesEntityFromJson(MovieEntity(), json[index]);
    movies.add(movieEntity);
  }
  return movies;
}
