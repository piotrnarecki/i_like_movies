import 'package:flutter/material.dart';
import 'keys.dart';
import 'movie_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_cell.dart';

class MovieHome extends StatefulWidget {
  final String title;

  MovieHome(this.title); // przekazuje tytul z main.dart

  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {

  String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=${AppKeys().imdbKeys}";



  MovieModel movies;

  @override
  void initState(){
    super.initState();
    getMovies();
  }


  Future<void> getMovies()async{ // Future oznacza coś co będzie zwrócone w przyszłości
    var response = await http.get(url);
    if(response.statusCode != 200) {
      return; // tutaj dodać zabespieczenie
       }

      var movieJson = jsonDecode(response.body);

      setState(() {
        movies = MovieModel.fromJson(movieJson);
        print(movies.movies.length);
      });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: movies == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: movies.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCell(movies.movies[index]);
              },
            ),
    );
  }
}
