import 'package:flutter/material.dart';
import 'movie_model.dart';

class MovieDetail extends StatelessWidget {
  Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: movie.id,
                  child: Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(movie.posterPath),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 16.0),
                Text(movie.overview, style: Theme.of(context).textTheme.subhead)
              ],
            ),
          )
        ],
      ),
    );
  }
}
