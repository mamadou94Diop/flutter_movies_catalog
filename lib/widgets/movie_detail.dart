import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_catalog_flutter_app/data/model/movies_entity.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context).settings.arguments as MovieEntity;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text(argument.title),
          backgroundColor: Colors.black,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              argument.posterurl,
              fit: BoxFit.cover,
              scale: 0.7,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/not_found.png", fit: BoxFit.fill);
              },
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            //  onPressed: {},
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                child: Column(
                  children: [
                    movieInfo("Duration", argument.movieDuration()),
                    movieInfo(
                        "Genre",
                        argument.genres.reduce(
                            (value, element) => value + " - " + element)),
                    movieInfo("Release Date", argument.releaseDate),
                    movieInfo(
                        "Cast",
                        argument.actors.reduce(
                            (value, element) => value + " - " + element)),
                    Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(argument.storyline,
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                decoration: TextDecoration.none)))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget movieInfo(String label, String info) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            "${label}: ",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
          Expanded(
            child: Text(
              info,
              maxLines: 5,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  decoration: TextDecoration.none),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
