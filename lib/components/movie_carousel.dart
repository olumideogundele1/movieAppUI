import 'package:flutter/material.dart';
import 'package:movie_app_ui/models/movie.dart';

import '../constants.dart';
import 'package:page_indicator/page_indicator.dart';
import 'movie_card.dart';
import 'dart:math' as math;

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {

  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage
    );
//  WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      int nextPage = _pageController.page.round() + 1;

      if (nextPage == list.length) {
        nextPage = 0;
      }
      _pageController
          .animateToPage(nextPage, duration: Duration(milliseconds: 1000), curve: Curves.linear)
          .then((_) => _animateSlider());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageIndicatorContainer(
          length: list.length,
          child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
             physics: ClampingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context,index) => buildMovieCardSlider(index)
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0),
          indicatorSpace: 20,
          indicatorColor: Colors.grey[350],
          indicatorSelectorColor: Colors.grey,
        ),
      ),
    );
  }

  Widget buildMovieCardSlider(int index){
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context,child) {
          double value = 0;
          if(_pageController.position.haveDimensions){
            value = index - _pageController.page;
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
                child: MovieCard(movie: list[index],)),
          );
        },

    );
  } 
}