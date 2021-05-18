import 'package:flutter/material.dart';
import 'package:ilikemovies/movie_home.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange), // tutaj zmienic
        home: MovieHome("I like movies"));
  }
}
