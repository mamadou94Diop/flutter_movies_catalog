import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog_flutter_app/data/model/movies_entity.dart';
import 'package:movie_catalog_flutter_app/data/repository/movies_repository.dart';
import 'chip_filters.dart';
import 'movie_list_widget.dart';

class MoviesPage extends StatefulWidget {
  final String id;

  MoviesPage({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MoviesState();
  }
}

class MoviesState extends State<MoviesPage>
    with AutomaticKeepAliveClientMixin<MoviesPage> {
  MovieRepository m = MovieRepository();
  List<MovieEntity> _movies = [];
  List<MovieEntity> _moviesResult = [];
  List<String> _genders = [];

  _filterByGenre(List<String> genresSelected) {
    setState(() {
      if (genresSelected.isEmpty) {
        _moviesResult = _movies;
      } else {
        _moviesResult = _movies
            .where((movie) =>
                movie.genres.any((genre) => genresSelected.contains(genre)))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    m.movies(widget.id).then((value) => {
          if (mounted)
            {
              setState(() => {
                    this._genders = value.getMoviesGenre(),
                    this._movies = value.movies,
                    this._moviesResult = value.movies,
                  })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        alignment: Alignment.topLeft,
        child: Column(children: [
          SizedBox(
            height: 50,
            child: ChipFiltersWidget(
              filters: _genders,
              onFilterChanged: (value) {
                _filterByGenre(value);
              },
            ),
          ),
          Expanded(child: MovieListWidget(movies: _moviesResult)),
        ]));
  }

  @override
  bool get wantKeepAlive => true;
}
