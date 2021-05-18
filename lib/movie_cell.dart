import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ilikemovies/movie_detail.dart';
import 'movie_model.dart';

class MovieCell extends StatelessWidget {
  final Movie movie;

  MovieCell(this.movie); // constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      margin: const EdgeInsets.all(20.0),
      child: InkWell(
        radius: 10.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: movie.id,
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(movie.posterPath),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      movie.overview,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.body2,
                    )
                  ],
                ))
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MovieDetail(movie);
          }));
        },
      ),
    );
  }
}
