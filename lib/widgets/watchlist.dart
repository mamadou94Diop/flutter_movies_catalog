import 'package:flutter/material.dart';

class WatchlistPage extends StatelessWidget {
  final String title;

  WatchlistPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(this.title, style: TextStyle(color: Colors.white),));
  }
}
