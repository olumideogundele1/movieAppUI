import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/components/genre.dart';
import 'package:movie_app_ui/constants.dart';
import 'package:movie_app_ui/models/movie.dart';

class DetailsBody extends StatelessWidget {
  final Movie movie;

  const DetailsBody({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.4,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.4 - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(movie.backdrop)
                    )
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
//                  bottom: 1,
                    child: Container(
                      height: 100,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                        boxShadow: [BoxShadow(offset: Offset(0,5),blurRadius: 50, color: Color(0xFF12153D).withOpacity(0.4))]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/star_fill.svg"),
                              RichText(text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: movie.rating.toString() + "/",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                    )
                                  ),
                                  TextSpan(text: "10\n"),
                                  TextSpan(text: "150,212",style: TextStyle(
                                    color: kTextLightColor
                                  ))
                                ]
                              ))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/icons/star.svg"),
                              SizedBox(height: 10,),
                              Text("Rate This", style: Theme.of(context).textTheme.bodyText2,)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFF51CF66),
                                  borderRadius: BorderRadius.circular(2)
                                ),
                                child: Text("${movie.metascoreRating}",
                                          style: TextStyle(
                                              color: Colors.white.withOpacity(0.8),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                  ),
                              ),
                              SizedBox(height: kDefaultPadding / 4,),
                              Text('Metascore',style: TextStyle(
                                fontSize: 16,fontWeight: FontWeight.w500
                              ),),
                              Text("62 critic review",style: TextStyle(color: kTextLightColor),),
                            ],
                          )
                        ],
                      ),
                    )),
                SafeArea(child: BackButton(color: Colors.white,))
              ],
            ),
          ),
          SizedBox(height: kDefaultPadding / 2,),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: [
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal:10.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title,style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: kDefaultPadding / 2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${movie.year}",style:TextStyle(color: kTextLightColor)),
                            SizedBox(width: kDefaultPadding,),
                            Text("PG-13",style:TextStyle(color: kTextLightColor)),
                            SizedBox(width: kDefaultPadding,),
                            Text("2h 33min",style:TextStyle(color: kTextLightColor)),
                          ]
                        )
                      ],
                    ),
                 ),
                Spacer(),
                SizedBox(
                  height: 64,
                  width: 64,
                  child: FlatButton(
                    onPressed: (){},
                    color: kSecondaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Icon(Icons.add,color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: movie.genre.length,
                  itemBuilder: (context,index) {
                        return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: kDefaultPadding),
                        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding,vertical: kDefaultPadding / 4),
                        decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text(movie.genre[index],
                        style: TextStyle(fontSize: 16,color: kTextColor.withOpacity(0.5))), );
                        }),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:10.0,horizontal: 30.0),
            child: Text('Plot Summary',style:Theme.of(context).textTheme.headline5),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:30.0),
            child: Text(movie.plot,
              style: TextStyle(
                color: Color(0xFF737599)
              )
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical:8.0,horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cast & Crew",style: Theme.of(context).textTheme.headline5,),
                SizedBox(height: kDefaultPadding / 4,),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      itemCount: movie.cast.length,
                      itemBuilder: (context,index){
                        return Container(
                          width: 90,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: kDefaultPadding),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(movie.cast[index]['image'])
                                    )
                                  ),
                                ),
                              SizedBox(height: 12,),
                              Text(movie.cast[index]['orginalName'],
                                  textAlign: TextAlign.center,
                                 // style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: 2,
                              ),
                              SizedBox(height: kDefaultPadding / 2,),
                              Text(movie.cast[index]['movieName'],
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTextLightColor),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
