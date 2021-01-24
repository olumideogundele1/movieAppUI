import 'package:flutter/material.dart';

import '../constants.dart';

class Genre extends StatelessWidget {
  List<String> genres = ["Action", "Crime", "Comedy","Drama","Animations"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context,index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding / 4),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Text(genres[index],
                  style: TextStyle(fontSize: 16,color: kTextColor.withOpacity(0.5))), );
          }),
    );
  }
}