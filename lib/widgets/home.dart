import 'package:flutter/material.dart';
import 'package:movie_catalog_flutter_app/widgets/watchlist.dart';
import 'movies.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MoviesPage(key: Key("1"), id: "TOP_MOVIES"),
    MoviesPage(key: Key("2"), id: "MOVIES_SOON"),
    MoviesPage(key: Key("3"), id: "IN_THEATER"),
    WatchlistPage(title: "Yeah I am very hyped on movies here.")
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        elevation: 32,
        backgroundColor: Colors.yellow,
        onTap: (value) => onTabTapped(value),
        selectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 14),
        selectedLabelStyle: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(color: Colors.black, size: 12),
        unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 12),
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.auto_awesome), label: "Top Movies"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.av_timer_outlined), label: "Soon"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.theaters_outlined), label: "In theater"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.remove_red_eye_outlined),
              label: "Watchlist"),
        ],
      ),
    );
  }
}
