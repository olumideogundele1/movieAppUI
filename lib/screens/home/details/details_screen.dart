import 'package:flutter/material.dart';
import 'package:movie_app_ui/components/details_body.dart';
import 'package:movie_app_ui/models/movie.dart';

class DetailsScreen extends StatelessWidget {
 final  Movie movie;

  const DetailsScreen({Key key, this.movie}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(movie: movie,),
    );
  }
}
