import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
    return new Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: Icon(Icons.bookmark_add_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Text(argument.title),
              backgroundColor: Colors.black,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  argument.posterurl,
                  fit: BoxFit.cover,
                  scale: 0.5,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/not_found.png",
                        fit: BoxFit.fill);
                  },
                ),
              ),
              leading: IconButton(
                icon: Icon(Platform.isIOS
                    ? Icons.arrow_back_ios_outlined
                    : Icons.arrow_back),
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
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Note: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    decoration: TextDecoration.none),
                              ),
                              Expanded(
                                child: RatingBar.builder(
                                  initialRating: argument.rating(),
                                  direction: Axis.horizontal,
                                  unratedColor: Colors.grey,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 5),
                                  itemCount: 5,
                                  minRating: 0.0,
                                  maxRating: 5.0,
                                  itemBuilder: (context, index) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  allowHalfRating: true,
                                  ignoreGestures: true,
                                  onRatingUpdate: (value) {},
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(argument.storyline,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    decoration: TextDecoration.none)))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
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
