import 'package:first_flutter_app/data/model/movies_entity.dart';
import 'package:first_flutter_app/data/repository/movies_repository.dart';
import 'package:flutter/material.dart';
import 'chip_filters.dart';

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

class MoviesState extends State<MoviesPage> {
  MovieRepository m = MovieRepository();
  List<MovieEntity> _movies = List();
  List<MovieEntity> _moviesResult = List();
  List<String> _genders = List();

  _filterByGender(List<String> gendersSelected) {
    setState(() {
      if (gendersSelected.isEmpty) {
        _moviesResult = _movies;
      } else {
        _moviesResult = _movies.where((movie) =>
                movie.genres.any((gender) => gendersSelected.contains(gender)))
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
    return Container(
        alignment: Alignment.topLeft,
        child: Column(children: [
          SizedBox(
            height: 50,
            child: ChipFiltersWidget(
              filters: _genders,
              onFilterChanged: (value) {
                _filterByGender(value);
              },
            ),
          ),
          Expanded(child: MovieWidget(movies: _moviesResult)),
        ]));
  }
}

class MovieWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieWidget({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      scrollDirection: Axis.vertical,
      children: _buildMovieItems(movies),
    );
  }

  List<Container> _buildMovieItems(List<MovieEntity> movies) {
    List<Container> cards = List();

    for (int index = 0; index < movies.length; index++) {
      cards.add(Container(
          child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          movies[index].posterurl,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset("assets/not_found.png", fit: BoxFit.fill);
          },
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 24,
        margin: EdgeInsets.all(10),
      )));
    }
    return cards;
  }
}
