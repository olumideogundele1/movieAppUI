import 'package:flutter/material.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';

import 'categoryLIst.dart';
import 'genre.dart';
import 'movie_carousel.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CategoryList(),
          Genre(),
          MovieCarousel(),
        ],
      ),
    );
  }
}








