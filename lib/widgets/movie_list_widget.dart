import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog_flutter_app/data/model/movies_entity.dart';

class MovieListWidget extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListWidget({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: (kIsWeb) ? 6 : 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      scrollDirection: Axis.vertical,
      children: _buildMovieItems(movies, context),
    );
  }

  List<Container> _buildMovieItems(
      List<MovieEntity> movies, BuildContext context) {
    List<Container> cards = [];

    for (int index = 0; index < movies.length; index++) {
      cards.add(Container(
          child: GestureDetector(
        onTap: () =>
            {Navigator.pushNamed(context, "/movie", arguments: movies[index])},
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
          elevation: 8,
          margin: EdgeInsets.all(10),
        ),
      )
          /*  child:*/
          ));
    }
    return cards;
  }
}
