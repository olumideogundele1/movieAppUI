import 'package:flutter/material.dart';

import 'categoryLIst.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CategoryList(),
        Genre()
      ],
    );
  }
}

class Genre extends StatelessWidget {
  List<String> genres = ["Action", "Crime", "Comedy","Drama"]
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


