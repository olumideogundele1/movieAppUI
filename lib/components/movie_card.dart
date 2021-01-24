import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/models/movie.dart';
import 'package:movie_app_ui/screens/home/details/details_screen.dart';

import '../constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:30.0,vertical: 35.0),
      child: InkWell(
        onTap: (){
          return Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailsScreen(movie: movie,);
          }));
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [kDefaultShadow],
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(movie.poster)
                    )
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical:8.0),
              child: Text(movie.title,
                  style:Theme.of(context).textTheme.headline5.copyWith(
                    color: kTextColor.withOpacity(0.7),
                      fontWeight:FontWeight.w600
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                    "assets/icons/star_fill.svg",
                  height: 20,
                ),
                SizedBox(width: 10,),
                Text(movie.rating.toString(),
                  style: Theme.of(context).textTheme.bodyText2,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
